FROM library/alpine:3.19
LABEL description="The gitit server as a Docker image." \
    maintainer="Alexander Mueller <XelaRellum@web.de>"

RUN apk update && apk upgrade && \
    apk add --no-cache cabal g++ git ghc libc-dev libffi-dev musl zlib-dev

COPY --chown=root:root root /

RUN chmod 755 /var/gitit/run-gitit.sh && \
    mkdir /gitit && \
    adduser -D -h /var/gitit -s /bin/false -u 1000 gitit gitit

RUN cabal update && \
    cabal install --global gitit-0.15.1.2

VOLUME ["/gitit/wikidata"]
EXPOSE 4000
ENTRYPOINT ["/var/gitit/run-gitit.sh"]
