#!/bin/bash

set -e

if [[ "$1" == -* ]]; then
	set -- fluentd "$@"
fi

sed -i "s|ES_HOST|$ES_HOST|" /fluentd/etc/fluent.conf
sed -i "s|ES_PORT|$ES_PORT|" /fluentd/etc/fluent.conf

exec "$@" -c /fluentd/etc/fluent.conf -p /fluentd/plugins $FLUENTD_OPT