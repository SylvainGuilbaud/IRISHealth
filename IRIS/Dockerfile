ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-em
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:latest-em
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-preview
# ARG IMAGE=localhost/intersystems/irishealth-community-arm64:2025.1.0.223.0
# ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:latest-preview
FROM $IMAGE 

USER root

RUN apt-get update && apt-get install -y \
	nano \
	python3-venv \
    tzdata \
	sudo && \
	/bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
	sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER}

# i386
# RUN apt install -y fontconfig xfonts-75dpi xfonts-base && rm -rf /var/lib/apt/lists/* \
#   && wget -q -O /tmp/wkhtmltox https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_i386.deb \
#   && dpkg -i /tmp/wkhtmltox \
#   && rm /tmp/wkhtmltox

#AMD64
# RUN apt install -y fontconfig xfonts-75dpi xfonts-base && rm -rf /var/lib/apt/lists/* \
#   && wget -q -O /tmp/wkhtmltox https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
#   && dpkg -i /tmp/wkhtmltox \
#   && rm /tmp/wkhtmltox

# ARM64
RUN apt install -y fontconfig xfonts-75dpi xfonts-base && rm -rf /var/lib/apt/lists/* \
  && wget -q -O /tmp/wkhtmltox https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_arm64.deb \
  && dpkg -i /tmp/wkhtmltox \
  && rm /tmp/wkhtmltox

USER ${ISC_PACKAGE_MGRUSER}  
COPY .iris_init /home/irisowner/.iris_init

WORKDIR /home/irisowner/dev

#create Python env
ENV PYTHON_PATH=/usr/irissys/bin/irispython
ENV SRC_PATH=/opt/irisapp
ENV IRISUSERNAME="SuperUser"
ENV IRISPASSWORD="SYS"
ENV IRISNAMESPACE="USER"

RUN --mount=type=bind,src=.,dst=. \
    python3 -m venv ~/py_venv && \
    . ~/py_venv/bin/activate && \
    pip3 install -r requirements.txt && \
    pip3 install python_fhir_converter-0.4.5-py3-none-any.whl && \
    iris start IRIS && \
    iris merge IRIS merge.cpf && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly 

ENV PATH="/home/irisowner/py_venv/bin:$PATH"