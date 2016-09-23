#
# Logentries DataHub 1.2.0.700
#

FROM java:openjdk-8-jre
MAINTAINER omgapuppy

# Copy files
COPY data/ /

# Define working entrypoint and ports.

ENTRYPOINT ["/usr/bin/java", "-Xmx1g", "-jar", "/usr/share/datahub/datahub.jar", "-l", "/etc/datahub"]
EXPOSE 10000 10000/udp 4242