FROM alpine:latest

ENV TERRAFORM_VERSION 0.11.11
ENV CREDHUB_CLI_VERSION 2.2.1
ENV JQ_VERSION 1.6

RUN apk --update --no-cache add libc6-compat git openssh-client python py-pip python3 && pip install awscli

RUN cd /usr/local/bin && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN cd /usr/local/bin && \
    wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/credhub-linux-${CREDHUB_CLI_VERSION}.tgz && \
    tar xvf credhub-linux-${CREDHUB_CLI_VERSION}.tgz && \
    rm credhub-linux-${CREDHUB_CLI_VERSION}.tgz

RUN cd /usr/local/bin && \
    wget https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O jq && chmod +x jq

CMD ["/bin/sh"]
