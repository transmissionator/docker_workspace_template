FROM archlinux/base

LABEL maintainer="someone@transmission.ninja"

# Install general dependencies
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm \
    i3status i3-gaps ttf-dejavu termite dmenu picom feh \
    netcat iproute2 iputils coreutils procps-ng grep awk git sudo \
    tigervnc xorg-server xorg-apps xorg-server-xvfb xorg-xinit

# Add blackarch repo
RUN cd /tmp && curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh

# Install some additional tools
RUN pacman -S --noconfirm python nmap epiphany vim openvpn

# Add user
RUN useradd -m transmission

WORKDIR /home/transmission/

# add some system files
ADD picom.conf .picom.conf
ADD i3_config .config/i3/config
ADD blackarch.jpg Pictures/blackarch.jpg

# tigervnc setup
EXPOSE 5901
ADD xstartup .vnc/xstartup
RUN chmod +x .vnc/xstartup
RUN printf 'YOUR-PASSWORD-HERE\nYOUR-PASSWORD-HERE\nn\n' | vncserver && vncserver -kill :1

CMD ["bash","-c","vncserver"]
