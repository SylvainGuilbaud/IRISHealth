ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:latest-em
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:latest-em
FROM $IMAGE as builder

USER root

RUN apt-get update && apt-get install -y \
	nano \
	python3-pip \
	python3-venv \
	sudo && \
	/bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
	sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER}

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

USER ${ISC_PACKAGE_MGRUSER}  
COPY .iris_init /home/irisowner/.iris_init

WORKDIR /home/irisowner/dev

#create Python env
ENV PYTHON_PATH=/usr/irissys/bin/irispython
ENV SRC_PATH=/opt/irisapp
ENV IRISUSERNAME "SuperUser"
ENV IRISPASSWORD "SYS"
ENV IRISNAMESPACE "USER"
#ENV PATH "/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"

# Install Native API
# For now Native API wheel is not embedded in container
# COPY misc/intersystems_irispython-3.2.0-py3-none-any.whl /usr/irissys/dev/python/intersystems_irispython-3.2.0-py3-none-any.whl
# RUN pip3 install /usr/irissys/dev/python/intersystems_irispython-3.2.0-py3-none-any.whl

# Install Jupyter 
RUN pip3 install jupyter
RUN mkdir /home/irisowner/.local/share/jupyter/kernels/irispython
COPY kernels/irispython/* /home/irisowner/.local/share/jupyter/kernels/irispython/
# Install objectscript kernel
RUN mkdir /home/irisowner/.local/share/jupyter/kernels/objectscript
COPY kernels/objectscript/* /home/irisowner/.local/share/jupyter/kernels/objectscript/
COPY entrypoint.sh entrypoint.sh
# Install Native API
# For now Native API wheel is not embedded in container
# COPY python/intersystems_iris-3.5.0-py3-none-any.whl /usr/irissys/dev/python/intersystems_iris-3.5.0-py3-none-any.whl
# RUN pip3 install /usr/irissys/dev/python/intersystems_iris-3.5.0-py3-none-any.whl


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

ENTRYPOINT [ "/tini", "--", "/home/irisowner/dev/entrypoint.sh" ]