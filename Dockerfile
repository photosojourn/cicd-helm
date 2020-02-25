FROM amazonlinux:latest

RUN yum install -y tar gzip awscli
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x ./aws-iam-authenticator
RUN mkdir -p ~/bin && cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN curl -o helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.14.0-linux-amd64.tar.gz; tar -xzf helm.tar.gz
RUN chmod +x ./linux-amd64/helm
RUN mv ./linux-amd64/helm /usr/local/bin/helm