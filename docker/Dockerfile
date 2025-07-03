FROM debian:stable

# Setup workdir
RUN echo 'PS1="\w\n\$> "' >> /etc/bash.bashrc
RUN apt update
RUN apt install -y git build-essential cmake libsdl2-dev libsdl2-image-dev \
	libsdl2-mixer-dev

WORKDIR /root/
RUN git clone https://github.com/ricardo-ayres/systemshock.git
WORKDIR /root/systemshock/
CMD bash
