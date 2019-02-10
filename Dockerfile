FROM alpine:latest

ENV TERRAFORM_VERSION 0.11.11

RUN apk --update --no-cache add libc6-compat git openssh-client python py-pip python3 && pip install awscli

RUN cd /usr/local/bin && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/bin/sh"]
