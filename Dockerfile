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
          rubygems

RUN useradd fluent -d /home/fluent -m -U
RUN chown -R fluent:fluent /home/fluent

RUN mkdir -p /fluentd/log
RUN mkdir -p /fluentd/etc
RUN mkdir -p /fluentd/plugins

RUN chown -R fluent:fluent /fluentd

USER fluent
WORKDIR /home/fluent

RUN gem install fluentd -v 0.12.15

COPY fluent.conf /fluentd/etc/
COPY plugins/* /fluentd/plugins/
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD fluentd
