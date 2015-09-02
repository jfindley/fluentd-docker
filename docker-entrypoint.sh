#!/bin/bash

set -e

if [[ "$1" == -* ]]; then
	set -- fluentd "$@"
fi

sed -i "s|ES_HOST|$ES_HOST|" /etc/fluent/fluent.conf
sed -i "s|ES_PORT|$ES_PORT|" /etc/fluent/fluent.conf

exec "$@" -c /etc/fluent/fluent.conf -p /fluentd/plugins $FLUENTD_OPT