FROM fedora:22
MAINTAINER James Findley

RUN dnf -y install \
          git \
          ruby \
          gcc \
          gcc-c++ \
          kernel-devel \
          ruby-devel \
          openssl \
          make \
          tzdata \
          ruby \
          ruby-devel \
          rubygems \
          rubygem-uuidtools

RUN useradd fluent -d /home/fluent -m -U
RUN chown -R fluent:fluent /home/fluent

RUN mkdir -p /etc/fluent
RUN mkdir -p /etc/fluent/plugin

RUN chown -R fluent:fluent /etc/fluent

USER fluent
WORKDIR /home/fluent

RUN gem install fluentd -v 0.12.15
RUN gem install fluent-plugin-elasticsearch -v 1.0.0

COPY fluent.conf /etc/fluent/fluent.conf
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD /home/fluent/bin/fluentd
