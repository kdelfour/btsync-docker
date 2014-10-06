# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM dockerfile/supervisor
MAINTAINER Kevin Delfour <kevin@delfour.eu>

# ------------------------------------------------------------------------------
# Install base
RUN apt-get update
RUN apt-get install -y curl

# ------------------------------------------------------------------------------
# Install btsync
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

RUN mkdir -p /btsync/.sync
RUN ln -s /btsync/.sync /data 
RUN mkdir -p /var/run/btsync

ADD btsync.conf /btsync/
# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 80
EXPOSE 3369

# ------------------------------------------------------------------------------
# Expose volumes
VOLUME /data

# ------------------------------------------------------------------------------
# Add supervisord conf
ADD conf/startup.conf /etc/supervisor/conf.d/

# Start supervisor, define default command.
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]