FROM centos:7

MAINTAINER 1000kit <docker@1000kit.org>

LABEL Vendor="1000kit" \
      License=GPLv3 \
      Version=1.0.0


# Install packages necessary to run EAP
RUN  yum update -y \
   && yum -y install xmlstarlet saxon augeas bsdtar tar unzip curl wget less dos2unix gettext \
   && yum clean all

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)

RUN groupadd -r tkit -g 1000 \
 && useradd -l -u 1000 -r -g tkit -m -d /home/tkit -s /bin/bash -c "tkit user" tkit \
 && chmod -R 755 /home/tkit \
 && mkdir /opt/tkit \
 && chown -R tkit:tkit /opt/tkit \
 && chmod 755 /opt/tkit \
 && echo 'tkit ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

## install GOSU
RUN curl -L https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 -o /usr/sbin/gosu \
	&& chmod 0755 /usr/sbin/gosu ; chmod 755 /usr/sbin/gosu ; chmod u+s /usr/sbin/gosu \
	&& echo "testing gosu with tkit ..." \
	&& /usr/sbin/gosu tkit echo " gosu installed and works"
	 


# Set the working directory to tkit user home directory
WORKDIR /opt/tkit
    
# Specify the user which should be used to execute all commands below
USER tkit

#end
