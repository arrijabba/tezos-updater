FROM tezos/tezos:v9.3

# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less python3 py-pip curl jq && \
	pip install awscli six && \
	rm /var/cache/apk/*
    
COPY ./start-updater.sh /home/tezos/start-updater.sh
RUN chmod 755 /home/tezos/start-updater.sh

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-updater.sh"]
