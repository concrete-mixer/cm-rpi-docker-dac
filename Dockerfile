FROM resin/rpi-raspbian:jessie-20160831

RUN apt-get update && \
	apt-get -qy install \
        alsa-utils \
        bison \
        build-essential \
        flex \
        git \
        libasound2-dev \
        libav-tools \
        libjack-jackd2-0 \
        libmp3lame0 \
        libpulse0 \
        libsamplerate0 \
        libsndfile1-dev \
        libtwolame0 \
        make \
        python-dev \
        python-pip \
        virtualenv

RUN git clone https://github.com/ccrma/chuck.git
RUN cd chuck/src && make linux-alsa && sudo make install && cd -

RUN git clone https://github.com/ccrma/chugins.git
RUN cd chugins && make linux-alsa && sudo make install && cd -

RUN git clone https://github.com/concrete-mixer/concrete-mixer.git
RUN cd /concrete-mixer \
    && virtualenv venv \
    && . venv/bin/activate \
    && pip install -r requirements.txt

COPY concrete.conf /concrete-mixer/concrete.conf

EXPOSE 2424

CMD cd /concrete-mixer && /bin/bash ./init.sh
