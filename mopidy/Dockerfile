#this is mine
ARG BUILD_FROM
FROM $BUILD_FROM

RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
       ca-certificates 

# Copy data for add-on

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]




