# Concrète Mixer Raspberry Pi Docker image

This repo contains files for a [Docker](https://www.docker.com/) image that installs [Concrète Mixer](https://github.com/concrete-mixer/concrete-mixer) and its dependencies on a [Raspberry Pi](https://www.raspberrypi.org/).

# Prerequisites

A Raspberry Pi, preferably a model 3, preferably running Raspbian (though I _think_ any Linux with systemd should be fine), definitely running Docker.

To run Concrète Mixer in default mode you'll need an internet connection to access the default SoundCloud playlists.

# Installation

Run:

    docker run -d --device=/dev/snd:/dev/snd concretemixer/cm-rpi-dac:latest

Docker will download the image from dockerhub and build and run a new container.

The `--device=/dev/snd:/dev/snd` part of the command makes the pi's sound hardware available to the container, which is essential for Concrète Mixer to run.

All going well, at the end of the process you should hear Concrète Mixer playing through one of your Pi's audio outs.

## Setting the docker container to load on boot

To do this:

1. Clone this repo:

    `git clone https://github.com/concrete-mixer/cm-rpi-docker-dac`

2. Inside the checked out repo, run:

    `sudo cp docker-concrete_mixer_dac.service /etc/systemd/system/`

3. Restart systemd so the new file is detected:

    `systemctl daemon-reload`

4. Enable the service:

    `systemctl enable docker-concrete_mixer_dac.service`

5. Reboot the pi, and Concrète Mixer should start automatically.


# See also

[An internet radio (Icecast2)-enabled Concrète Mixer docker image](https://github.com/concrete-mixer/cm-rpi-docker-internet)
