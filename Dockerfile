ARG BUILD_FROM
FROM $BUILD_FROM
#FROM alpine

#RUN git clone https://github.com/fetzu/teslamate-abrp.git
#RUN apk add --no-cache python3

RUN apk add --no-cache python3
RUN apk add --no-cache py3-pip

#WORKDIR /data

COPY teslamate-abrp/ /
RUN pip install --no-cache-dir -r requirements.txt

#RUN adduser -D toor
#USER toor

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

