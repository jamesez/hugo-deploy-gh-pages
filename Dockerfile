FROM debian:buster-slim
LABEL maintainer="Ben Selby <benmatselby@gmail.com>"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	ca-certificates  \
	curl \
	jq \
	tar \
	wget \
	git && \
	wget https://dl.google.com/go/go1.17.5.linux-amd64.tar.gz && \
 	tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz && \
 	rm go1.17.5.linux-amd64.tar.gz && \
 	mv /usr/local/go/bin/* /usr/local/bin && \
	rm -rf /var/lib/apt/lists/*

COPY action.sh /usr/bin/action.sh

ENTRYPOINT ["action.sh"]
