#!/usr/bin/env bash
#ddev-generated
set -e

# Ensure "dev" (or alternate SOLR_CORENAME) core config is always up to date even after the
# core has been created. This does not execute the first time,
# when solr-precreate has not yet run.
CORENAME=${SOLR_CORENAME:-dev}
CONF_PATH=${SOLR_CONF_PATH:-/solr-conf/conf}
if [ -d /var/solr/data/${CORENAME}/conf ]; then
    if [ -d "${CONF_PATH}" ]; then
        # Copy the configuration files to the Solr core's configuration path
        cp "${CONF_PATH}"/* "/var/solr/data/${CORENAME}/conf"
    fi
fi
