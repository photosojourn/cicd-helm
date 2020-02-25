FROM amazonlinux:latest

#Install tools inc awscli (used for kubeconfig generation)
RUN yum install -y tar gzip awscli

#aws-iam-authenticator; used for k8s authentication
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator \ 
  && chmod +x ./aws-iam-authenticator \
  && mkdir -p ~/bin && cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

#Latest version of kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl

#And install Helm 3 (so no need for Tiller :tada:)
RUN curl -o helm.tar.gz https://get.helm.sh/helm-v3.1.1-linux-amd64.tar.gz; tar -xzf helm.tar.gz \
  && chmod +x ./linux-amd64/helm \
  && mv ./linux-amd64/helm /usr/local/bin/helm