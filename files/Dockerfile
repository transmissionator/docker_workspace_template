FROM archlinux/base

LABEL maintainer="someone@transmission.ninja"

# Install general dependencies
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm \
    i3status i3-gaps ttf-dejavu termite dmenu picom feh \
    netcat iproute2 iputils coreutils procps-ng grep awk git \
    tigervnc xorg-server xorg-apps xorg-server-xvfb xorg-xinit

# Add blackarch repo
RUN cd /tmp && curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh

# Install some additional tools
RUN pacman -S --noconfirm python nmap epiphany vim openvpn

# add some system files
ADD compton.conf /root/.picom.conf
ADD i3_config /root/.config/i3/config
ADD blackarch.jpg /root/Pictures/blackarch.jpg

# tigervnc setup
WORKDIR /root/
EXPOSE 5901
ADD xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup
RUN printf 'YOUR-PASSWORD-HERE\nYOUR-PASSWORD-HERE\nn\n' | vncserver && vncserver -kill :1

CMD ["bash","-c","vncserver"]
