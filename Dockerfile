FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Returns the latest available package versions
RUN apt-get update && apt-cache madison \
    python3-oslo.log \
    python3-openstacksdk \
    python3-openstackclient \
    python3-barbicanclient \
    python3-glanceclient \
    python3-neutronclient \
    python3-novaclient \
    python3-octaviaclient \
    python3-swiftclient \
    && apt-get clean \
    && rm-rf /var/apt/lists/*

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-oslo.log=4.6.1-0ubuntu1 \
    python3-openstacksdk=0.61.0-0ubuntu1 \
    python3-openstackclient=5.8.0-0ubuntu1 \
    python3-barbicanclient=5.2.0-0ubuntu1 \
    python3-glanceclient=1:3.6.0-0ubuntu1 \
    python3-neutronclient=7.8.0-0ubuntu1 \
    python3-novaclient=2:17.6.0-0ubuntu1 \
    python3-octaviaclient=2.5.0-0ubuntu1 \
    python3-swiftclient=1:3.13.1-0ubuntu1 \
    && apt-get clean \
    && rm-rf /var/apt/lists/*

CMD ["/bin/bash"]
