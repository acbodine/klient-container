#!/bin/bash

KONTROL=${KONTROL:-"https://koding.com/kontrol/kite"}

/opt/kite/klient/klient \
    -register \
    -kontrol-url ${KONTROL} \
    -token ${TOKEN}

/opt/kite/klient/klient \
    -kontrol-url ${KONTROL}
