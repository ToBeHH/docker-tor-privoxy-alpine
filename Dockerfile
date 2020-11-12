FROM alpine:3.12

EXPOSE 8118 9050 9029 9030 53

# Install basic packages
RUN apk --update add privoxy tor runit tini 
# Install obfsproxy and nyx
RUN set -xe \
    && apk add --no-cache build-base curl python3 python3-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip install obfsproxy nyx \
    && apk del build-base curl python3-dev

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
