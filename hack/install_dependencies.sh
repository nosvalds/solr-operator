#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

kubebuilder_version=1.0.8
os=$(go env GOOS)
arch=$(go env GOARCH)

# Install Dep
go get -u github.com/golang/dep/cmd/dep

# Install Kustomize
go get -u sigs.k8s.io/kustomize/cmd/kustomize

# Install Kubebuilder
curl -sL https://go.kubebuilder.io/dl/${kubebuilder_version}/${os}/${arch} | tar -xz -C /tmp/
sudo mv /tmp/kubebuilder_${kubebuilder_version}_${os}_${arch} /usr/local/kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin
