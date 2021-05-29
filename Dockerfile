FROM ubuntu:20.04

# Fix not able to find entrypoint.sh
WORKDIR /

# Install cron and tzdata for Fixing scheduler timezone
RUN apt-get update -y && apt-get install -y cron && apt-get install -y tzdata

# Fix scheduler timezone
ENV TZ 'Europe/Vienna'
RUN echo $TZ > /etc/timezone && rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
