FROM debian

RUN DEBIAN_FRONTEND=noninteractive \
    apt update -y && \
    apt install -y tidy wget gawk libhtml-parser-perl

COPY functions.sh /etc/functions.sh

RUN wget -O /usr/local/bin/trans git.io/trans && \
    chmod +x /usr/local/bin/trans && \
    echo "source /etc/functions.sh" >> $HOME/.bashrc

