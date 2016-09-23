#
# Logentries DataHub 1.2.0.700
#

FROM ubuntu:14.04
MAINTAINER omgapuppy

# Install Java and.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get install -y software-properties-common python-software-properties && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \

# Cleanup
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ARG DEBIAN_FRONTEND="noninteractive"

# Copy files
COPY data/ /

# Define working entrypoint and ports.

ENTRYPOINT ["java", "-Xmx1g", "-jar", "/usr/share/datahub/datahub.jar", "-l", "/etc/datahub"]
EXPOSE 10000 10000/udp 4242