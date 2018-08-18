# ------------------------------------------------------------------------------
# \\\\\\\\\\\\\\\\\\\\\\\\\\\ \m/ dAnarchy.site \m/ ////////////////////////////
# ------------------------------------------------------------------------------
#
# - build the image:
# > docker build -t danarchy/ubuntu:latest .
#
# - run a container named as image
# > docker run -t -i -h image --name image --rm -e EUID=`id -u` \
#              danarchy/ubuntu:latest /bin/bash -l
#
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////////////

FROM ubuntu:18.04

MAINTAINER danarchy.site <dnrk@protonmail.com>

RUN apt upgrade
RUN apt install tmux python3 wget curl git vim htop rclone

RUN wget https://yt-dl.org/downloads/latest/youtube-dl \
        -O /usr/local/bin/youtube-dl && 
        chmod a+rx /usr/local/bin/youtube-dl

COPY dotfiles/ /root/
RUN ln -s /root/.bashrc /root/.profile

RUN echo "root:toor" | chpasswd

COPY entrypoint /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]