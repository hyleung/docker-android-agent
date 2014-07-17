FROM hyleung/jenkins-agent
MAINTAINER H.Y. Leung <hy.leung@gmail.com>

#Install curl
RUN apt-get install -y curl

#Download the Android sdk into a temp directory
RUN curl http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz -o /tmp/android-sdk.tgz

#Unzip
RUN tar zvxf /tmp/android-sdk.tgz -C /usr/local
#Install the SDK components
ENV PATH /usr/local/android-sdk-linux/tools:$PATH

#Install SDK Tools
RUN echo y | android update sdk --no-ui --all --filter 1,2,3,4
