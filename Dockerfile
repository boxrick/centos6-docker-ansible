FROM centos:centos6

# Update and install openssh
RUN yum update -y
RUN yum install -y openssh-server

### Set up SSH
EXPOSE 22

RUN mkdir /root/.ssh && \
  touch /root/.ssh/authorized_keys && \
  chmod 700 /root/.ssh && \
  chmod 600 /root/.ssh/authorized_keys

RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key

### Add Vagrant
# Add Vagrant key
RUN mkdir -p /root/.ssh && \
    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /root/.ssh/authorized_keys && \
    chmod 700 /root/.ssh && \
    chmod 644 /root/.ssh/authorized_keys

# Set a gross default root password
RUN echo 'root:root' | chpasswd

# Add environment to allow things like PIP to work
ENV LANG C

CMD ["/usr/sbin/sshd", "-D"]
