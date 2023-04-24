FROM alpine:3.7

#EXPOSE 8118 9050
#EXPOSE 7860 8118 9050 
EXPOSE 7860

RUN apk --update add privoxy tor runit tini curl

RUN curl -sSL https://github.com/jpillora/chisel/releases/download/v1.7.6/chisel_1.7.6_linux_amd64.gz | zcat > /bin/chisel
RUN chmod +x /bin/chisel

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
