module knative.dev/pkg

go 1.13

require (
	cloud.google.com/go v0.45.1
	contrib.go.opencensus.io/exporter/ocagent v0.6.0
	contrib.go.opencensus.io/exporter/prometheus v0.1.0
	contrib.go.opencensus.io/exporter/stackdriver v0.12.9-0.20191108183826-59d068f8d8ff
	contrib.go.opencensus.io/exporter/zipkin v0.1.1
	github.com/blang/semver v3.6.1+incompatible
	github.com/bmizerany/perks v0.0.0-20141205001514-d9a9656a3a4b // indirect
	github.com/davecgh/go-spew v1.1.1
	github.com/dgryski/go-gk v0.0.0-20140819190930-201884a44051 // indirect
	github.com/evanphx/json-patch v4.5.0+incompatible
	github.com/ghodss/yaml v1.0.0
	github.com/go-logr/logr v0.1.0
	github.com/golang/protobuf v1.3.2
	github.com/google/go-cmp v0.3.1
	github.com/google/go-github/v27 v27.0.6
	github.com/google/gofuzz v1.1.0
	github.com/google/mako v0.0.0-20190821191249-122f8dcef9e3
	github.com/google/uuid v1.1.1
	github.com/gorilla/websocket v1.4.0
	github.com/influxdata/tdigest v0.0.0-20181121200506-bf2b5ad3c0a9 // indirect
	github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
	github.com/markbates/inflect v1.0.4
	github.com/openzipkin/zipkin-go v0.2.2
	github.com/prometheus/client_golang v1.0.0
	github.com/prometheus/common v0.6.0
	github.com/spf13/pflag v1.0.5
	github.com/streadway/quantile v0.0.0-20150917103942-b0c588724d25 // indirect
	github.com/tsenart/vegeta v12.7.1-0.20190725001342-b5f4fca92137+incompatible
	go.opencensus.io v0.22.2
	go.uber.org/multierr v1.1.0
	go.uber.org/zap v1.9.2-0.20180814183419-67bc79d13d15
	golang.org/x/net v0.0.0-20191004110552-13f9640d40b9
	golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45
	golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e
	gomodules.xyz/jsonpatch/v2 v2.0.1
	google.golang.org/api v0.15.0
	google.golang.org/grpc v1.24.0
	gopkg.in/yaml.v2 v2.2.8
	k8s.io/api v0.16.7
	k8s.io/apiextensions-apiserver v0.16.7
	k8s.io/apimachinery v0.16.7
	k8s.io/client-go v11.0.1-0.20190805182717-6502b5e7b1b5+incompatible
	k8s.io/code-generator v0.16.7
	k8s.io/gengo v0.0.0-20190822140433-26a664648505
	k8s.io/klog v1.0.0
	k8s.io/test-infra v0.0.0-20191212060232-70b0b49fe247
	knative.dev/test-infra v0.0.0-20200225011009-908ad6cdb8e4
)

replace (
	github.com/prometheus/client_golang => github.com/prometheus/client_golang v0.9.2
	k8s.io/client-go => k8s.io/client-go v0.16.7
)
