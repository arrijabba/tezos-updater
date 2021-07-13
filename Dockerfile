FROM tezos/tezos:v10-release_91cd25ba_20210705150731

# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less python3 py-pip curl jq && \
	pip install awscli six && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

COPY ./start-updater.sh /home/tezos/start-updater.sh
RUN chmod 755 /home/tezos/start-updater.sh

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-updater.sh"]
