ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-em
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:latest-em
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-preview
# ARG IMAGE=localhost/intersystems/irishealth-community-arm64:2025.1.0.223.0
# ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:latest-preview
FROM $IMAGE 

USER root

# ENV ISC_DATA_DIRECTORY=/volumes/IRIS

RUN apt-get update && apt-get install -y \
	nano \
	python3-venv \
    tzdata \
    sudo \
    fontconfig \
    xfonts-75dpi \
    xfonts-base \
    wget && \
    rm -rf /var/lib/apt/lists/* && \
    ARCH=$(dpkg --print-architecture) && \
    case "$ARCH" in \
        i386)   URL="https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_i386.deb" ;; \
        amd64)  URL="https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb" ;; \
        arm64)  URL="https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_arm64.deb" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
        esac &&\
    wget -q -O /tmp/wkhtmltox.deb $URL && \
    dpkg -i /tmp/wkhtmltox.deb || apt-get install -f -y && \
    rm /tmp/wkhtmltox.deb && \
    /bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
    sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER} 
    # mkdir -p $ISC_DATA_DIRECTORY && chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_MGRUSER} $ISC_DATA_DIRECTORY

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
    python3 -m pip install -r requirements.txt && \
    python3 -m pip install python_fhir_converter-0.4.5-py3-none-any.whl && \
    iris start IRIS && \
    iris merge IRIS merge.cpf && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly 
    # python3 -m pip install --target /usr/irissys/mgr/python -r requirements.txt && \
    # python3 -m pip install --target /usr/irissys/mgr/python python_fhir_converter-0.4.5-py3-none-any.whl 

ENV PATH="/home/irisowner/py_venv/bin:$PATH"