FROM ubuntu:latest
ARG COOKIE
WORKDIR /slippi
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip wget libao-dev libasound2-dev libavcodec-dev libavformat-dev libbluetooth-dev libenet-dev libgtk2.0-dev liblzo2-dev libminiupnpc-dev libopenal-dev libpulse-dev libreadline-dev libsfml-dev libsoil-dev libsoundtouch-dev libswscale-dev libusb-1.0-0-dev libwxbase3.0-dev libwxgtk3.0-gtk3-dev libxext-dev libxrandr-dev portaudio19-dev zlib1g-dev libudev-dev libevdev-dev libmbedtls-dev libcurl4-openssl-dev libegl1-mesa-dev libpng-dev qtbase5-private-dev libxxf86vm-dev x11proto-xinerama-dev
RUN pip3 install melee
COPY . .
RUN xauth add ${COOKIE}
RUN xauth list
RUN wget https://github.com/project-slippi/Ishiiruka/releases/download/v2.3.1/Slippi_Online-x86_64.AppImage
RUN chmod +x Slippi_Online-x86_64.AppImage
RUN ./Slippi_Online-x86_64.AppImage --appimage-extract
RUN mkdir -p /root/.config/SlippiOnline/Config
RUN cp Dolphin.ini /root/.config/SlippiOnline/Config/Dolphin.ini
EXPOSE 8887
CMD python3 /slippi/example.py -e /slippi/squashfs-root/usr/bin/ --iso /slippi/iso/smash.iso -p 1 -o 2 -d
