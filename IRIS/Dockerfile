ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-em
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:latest-em
FROM $IMAGE as builder

USER root

# i386
# RUN apt update && apt install -y fontconfig xfonts-75dpi xfonts-base && rm -rf /var/lib/apt/lists/* \
#   && wget -q -O /tmp/wkhtmltox https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_i386.deb \
#   && dpkg -i /tmp/wkhtmltox \
#   && rm /tmp/wkhtmltox

#AMD64
# RUN apt update && apt install -y fontconfig xfonts-75dpi xfonts-base && rm -rf /var/lib/apt/lists/* \
#   && wget -q -O /tmp/wkhtmltox https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
#   && dpkg -i /tmp/wkhtmltox \
#   && rm /tmp/wkhtmltox

# ARM64
RUN apt update && apt install -y fontconfig xfonts-75dpi xfonts-base && rm -rf /var/lib/apt/lists/* \
  && wget -q -O /tmp/wkhtmltox https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_arm64.deb \
  && dpkg -i /tmp/wkhtmltox \
  && rm /tmp/wkhtmltox

USER irisowner  
COPY .iris_init /home/irisowner/.iris_init

WORKDIR /home/irisowner/dev

RUN --mount=type=bind,src=.,dst=. \
    pip3 install -r requirements.txt && \
    iris start IRIS && \
    iris merge IRIS merge.cpf && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly 

FROM $IMAGE as final
ADD --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} https://github.com/grongierisc/iris-docker-multi-stage-script/releases/latest/download/copy-data.py /home/irisowner/dev/copy-data.py
#ADD https://github.com/grongierisc/iris-docker-multi-stage-script/releases/latest/download/copy-data.py /home/irisowner/dev/copy-data.py

RUN --mount=type=bind,source=/,target=/builder/root,from=builder \
    cp -f /builder/root/usr/irissys/iris.cpf /usr/irissys/iris.cpf && \
    python3 /home/irisowner/dev/copy-data.py -c /usr/irissys/iris.cpf -d /builder/root/