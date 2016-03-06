FROM alpine
COPY get-pip.py /home/get-pip.py
RUN apk add --update python=2.7.11-r3 \
	&& python /home/get-pip.py \
    && pip install shadowsocks \
    && rm -rf /var/cache/apk/* \
    rm /home/get-pip.py
ENTRYPOINT ["ssserver"]
CMD ["-s","0.0.0.0","-p","425","-k","icanfly","-m","aes-256-cfb"]
