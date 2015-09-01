### Fluentd-elasticsearch docker image

This container image is to create endpoint to collect logs on your host and send them to elasticsearch.

```
docker run -d -p 24224:24224 -v /data:/fluentd/log -e ES_HOST=localhost -e ES_PORT=9200 fluent/fluentd
```

Default configurations are to:

* listen port `24224` for fluentd forward protocol
* store logs in elasticsearch

## Configurable ENV variables

Environment variable below are configurable to control how to execute fluentd process:

### FLUENTD_OPT

Use this variable to specify other options, like `-v` or `-q`.

### ES_HOST

Elasticsearch host

### ES_PORT

Elasticsearch port