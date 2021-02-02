# This docker image is based on the official noetic ros docker file
# https://github.com/osrf/docker_images/blob/df19ab7d5993d3b78a908362cdcd1479a8e78b35/ros/noetic/ubuntu/focal/ros-base/Dockerfile
FROM ros:noetic-ros-core-focal

# install bootstrap tools
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    python3-wstool \ 
    python3-rosinstall-generator \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# Allows debconf to run properly. see https://stackoverflow.com/questions/51023312/docker-having-issues-installing-apt-utils
ARG DEBIAN_FRONTEND=noninteractive

# install ros packages, setup environment
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ros-noetic-desktop-full \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]

# Add ros setup to bashrc and source it
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc \
    && source ~/.bashrc

# install helpful software tools
RUN apt-get update && apt-get install -y \
    vim \
    tmux \
    python3 \
    pylint

# Install commitizen (which requires npm, which requires Node.js)
# see https://github.com/nodesource/distributions/blob/master/README.md
# see https://www.npmjs.com/package/commitizen
RUN curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash - \
    && sudo apt-get install -y nodejs \
    && npm install -g commitizen 
