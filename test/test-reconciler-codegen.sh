#!/usr/bin/env bash

# Copyright 2020 The Knative Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

source $(go mod download -json 2>/dev/null | jq -r 'select(.Path == "knative.dev/test-infra").Dir')/scripts/library.sh

CODEGEN_PKG=$(( go mod download -json || true ) 2>/dev/null | jq -r 'select(.Path == "k8s.io/code-generator").Dir')
KNATIVE_CODEGEN_PKG=$(( go mod download -json || true ) 2>/dev/null | jq -r 'select(.Path == "knative.dev/pkg").Dir')

GENCLIENT_PKG=knative.dev/pkg/test/genclient

echo "Pre-deleting $(dirname $0)/genclient"
rm -rf $(dirname $0)/genclient

header "Test Generated Reconciler Builds."

bash ${CODEGEN_PKG}/generate-groups.sh "deepcopy,client,informer,lister" \
  ${GENCLIENT_PKG} knative.dev/pkg/apis/test \
  "example:v1alpha1" \
  --go-header-file ${REPO_ROOT_DIR}/hack/boilerplate/boilerplate.go.txt

# Knative Injection
bash ${KNATIVE_CODEGEN_PKG}/hack/generate-knative.sh "injection" \
  ${GENCLIENT_PKG} knative.dev/pkg/apis/test \
  "example:v1alpha1" \
  --go-header-file ${REPO_ROOT_DIR}/hack/boilerplate/boilerplate.go.txt

bash ${CODEGEN_PKG}/generate-groups.sh "deepcopy,client,informer,lister" \
  ${GENCLIENT_PKG}/pub knative.dev/pkg/apis/test \
  "pub:v1alpha1" \
  --go-header-file ${REPO_ROOT_DIR}/hack/boilerplate/boilerplate.go.txt

# Knative Injection
bash ${KNATIVE_CODEGEN_PKG}/hack/generate-knative.sh "injection" \
  ${GENCLIENT_PKG}/pub knative.dev/pkg/apis/test \
  "pub:v1alpha1" \
  --go-header-file ${REPO_ROOT_DIR}/hack/boilerplate/boilerplate.go.txt


if ! go build -v $(dirname $0)/genclient/... ; then
    exit 1
fi

echo "Finished, deleting $(dirname $0)/genclient"
rm -rf $(dirname $0)/genclient
