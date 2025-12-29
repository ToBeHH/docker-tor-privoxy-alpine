FROM alpine:3.23

EXPOSE 8118 9050 9029 9030 53

# Install basic packages
RUN apk --update add privoxy tor runit tini 
# Install obfsproxy and nyx
RUN set -xe \
    && apk add --no-cache build-base python3 python3-dev py3-pip \
    && pip install --break-system-packages obfsproxy nyx \
    && apk del build-base python3-dev py3-pip

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
