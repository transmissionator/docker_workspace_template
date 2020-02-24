FROM archlinux/base

LABEL maintainer="someone@transmission.ninja"

# Install general dependencies
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm \
<<<<<<< HEAD
    i3status i3-gaps ttf-dejavu termite dmenu compton feh \
=======
    i3status i3-gaps ttf-dejavu termite dmenu picom feh \
>>>>>>> 17781157886a8a56ffb1c8252c9f89d5fe97dc79
    netcat iproute2 iputils coreutils procps-ng grep awk git sudo \
    tigervnc xorg-server xorg-apps xorg-server-xvfb xorg-xinit

# Add blackarch repo
RUN cd /tmp && curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh

# Install some additional tools
RUN pacman -S --noconfirm python nmap falkon vim openvpn

# Add user
RUN useradd -m transmission

# Add user
RUN useradd -m transmission

WORKDIR /home/transmission/

# add some system files
<<<<<<< HEAD
ADD picom.conf /home/transmission/.config/picom/picom.conf
ADD i3_config /home/transmission/.config/i3/config
ADD blackarch.jpg /home/transmission/Pictures/blackarch.jpg

# tigervnc setup
WORKDIR /home/transmission/
EXPOSE 5901
ADD xstartup /home/transmission/.vnc/xstartup
RUN chmod +x /home/transmission/.vnc/xstartup
=======
ADD picom.conf .picom.conf
ADD i3_config .config/i3/config
ADD blackarch.jpg Pictures/blackarch.jpg

# tigervnc setup
EXPOSE 5901
ADD xstartup .vnc/xstartup
RUN chmod +x .vnc/xstartup
>>>>>>> 17781157886a8a56ffb1c8252c9f89d5fe97dc79
RUN printf 'YOUR-PASSWORD-HERE\nYOUR-PASSWORD-HERE\nn\n' | vncserver && vncserver -kill :1

# CMD ["bash","-c","vncserver"]
