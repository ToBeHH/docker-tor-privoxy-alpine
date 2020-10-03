FROM alpine:3.12

EXPOSE 8118 9050 9029 9030 53

RUN apk --update add privoxy tor runit tini

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
