#!/bin/bash

set -e

if [[ "$1" == -* ]]; then
	set -- /home/fluent/bin/fluentd "$@"
fi

sed -i "s|ES_HOST|$ES_HOST|" /etc/fluent/fluent.conf
sed -i "s|ES_PORT|$ES_PORT|" /etc/fluent/fluent.conf

su - fluent

exec "$@" -c /etc/fluent/fluent.conf -p /fluentd/plugins $FLUENTD_OPT