FROM quay.io/ukhomeofficedigital/openjdk8:v0.1.2

RUN yum install -y \
    wget \
    unzip \
    ruby \
    && yum clean all

# Install activator play
ENV ACTIVATOR_VER 1.3.6
ENV ACTIVATOR_DIR typesafe-activator-${ACTIVATOR_VER}

RUN wget -O ${HOME}/${ACTIVATOR_DIR}.zip \
      https://downloads.typesafe.com/typesafe-activator/1.3.6/${ACTIVATOR_DIR}.zip && \
    cd && unzip ${ACTIVATOR_DIR}.zip && \
    rm ${ACTIVATOR_DIR}.zip

ENV PATH ${HOME}/activator-dist-${ACTIVATOR_VER}:$PATH

RUN curl -sL https://rpm.nodesource.com/setup_5.x | bash - && \
    yum install -y nodejs && \
    yum clean all
