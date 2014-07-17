FROM hyleung/jenkins-agent
MAINTAINER H.Y. Leung <hy.leung@gmail.com>

#Install curl
RUN apt-get install -y curl

#Download the Android sdk into a temp directory
RUN curl http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz -o /tmp/android-sdk.tgz

#Android is compile for 32-bit systems, install the 32-bit versions of dependencies
# http://askubuntu.com/questions/147400/problems-with-eclipse-and-android-sdk

RUN apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0

#Unzip
RUN tar zvxf /tmp/android-sdk.tgz -C /usr/local
RUN chown -R root:root /usr/local/android-sdk-linux
RUN chmod g+w -R /usr/local/android-sdk-linux

#Install the SDK tools

RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter 1,2,3,4


