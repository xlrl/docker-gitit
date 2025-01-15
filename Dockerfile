FROM library/debian:12.8
LABEL description="The gitit server as a Docker image." \
    maintainer="Alexander Mueller <XelaRellum@web.de>"

RUN apt update && apt upgrade -y && \
    apt install -y git gitit=0.15.1.0+dfsg-2+b6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --chown=root:root root /

RUN chmod 755 /var/gitit/run-gitit.sh && \
    adduser --uid 1000 --home /var/gitit --no-create-home --shell /bin/sh gitit && \
    chown gitit:gitit -R /var/gitit

VOLUME ["/gitit"]

EXPOSE 4000

ENTRYPOINT /var/gitit/entrypoint.sh
