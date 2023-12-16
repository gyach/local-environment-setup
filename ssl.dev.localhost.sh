#!/bin/bash

openssl genrsa -des3 -out ./localhost.root.key.pem 2048

openssl req -x509 -new -nodes -key localhost.root.key.pem -sha256 -days 3650 -out localhost.root.cert.pem -subj "/C=RU/O=Dev Localhost/CN=*.dev.localhost"

openssl genrsa -out _.dev.localhost.key.pem 2048
openssl req -new -key _.dev.localhost.key.pem -extensions v3_ca -out _.dev.localhost.csr -subj "/C=RU/O=Dev Localhost/CN=*.dev.localhost"

echo "basicConstraints=CA:FALSE
subjectAltName=@alt_names
extendedKeyUsage=serverAuth
[alt_names]
DNS.1=*.dev.localhost
" > openssl.ss.cnf

openssl x509 -req -in _.dev.localhost.csr -CA localhost.root.cert.pem -CAkey localhost.root.key.pem -CAcreateserial -extfile openssl.ss.cnf -out _.dev.localhost.cert.pem -days 3650 -sha256
