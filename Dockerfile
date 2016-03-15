FROM centos:7

MAINTAINER 1000kit <docker@1000kit.org>

LABEL Vendor="1000kit"
LABEL License=GPLv3
LABEL Version=1.0.0


# Install packages necessary to run EAP
RUN  yum update -y \
   && yum -y install xmlstarlet saxon augeas bsdtar tar unzip curl wget \
   && yum clean all

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)

RUN groupadd -r tkit -g 1000 \
 && useradd -u 1000 -r -g tkit -m -d /home/tkit -s /sbin/nologin -c "tkit user" tkit \
 && chmod -R 755 /home/tkit \
 && mkdir /opt/tkit \
 && chown -R tkit:tkit /opt/tkit \
 && chmod 755 /opt/tkit

RUN echo 'tkit ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set the working directory to tkit user home directory
WORKDIR /opt/tkit
    
# Specify the user which should be used to execute all commands below
USER tkit

#end
