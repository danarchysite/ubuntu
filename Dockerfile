# ------------------------------------------------------------------------------
# \\\\\\\\\\\\\\\\\\\\\\\\\\\ \m/ dAnarchy.site \m/ ////////////////////////////
# ------------------------------------------------------------------------------
#
# - build the image:
# > docker build -t danarchy/ubuntu:latest .
#
# - run a container named as image
# > docker run -t -i -h image --name image --rm -e ENV_USER_UID=`id -u` danarchy/ubuntu:latest /bin/bash -l
#
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////////////

FROM ubuntu:18.04

MAINTAINER danarchy.site <dnrk@protonmail.com>

RUN apt update
RUN apt install -y rsync tmux python python3 wget curl git vim htop rclone

RUN wget https://yt-dl.org/downloads/latest/youtube-dl \
       -O /usr/local/bin/youtube-dl && \
       chmod a+rx /usr/local/bin/youtube-dl

COPY dotfiles/ /opt/dotfiles/
RUN ls -lsa /opt/dotfiles/
RUN find /opt/dotfiles/ -type f -maxdepth 1 -exec ln -s {} ~root/ \; > /dev/null 2>&1
RUN ln -s /opt/dotfiles/.vim ~root/
RUN echo ". /opt/dotfiles/.danarchy" >> /root/.profile

RUN echo "root:toor" | chpasswd

COPY entrypoint /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]