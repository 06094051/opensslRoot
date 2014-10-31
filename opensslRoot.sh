#!/bin/bash



##################################################################################################
# Variables
##################################################################################################



##################################################################################################
# Check for the required binaries
##################################################################################################
hash dd 2>/dev/null || { echo >&2 "I require dd but it's not installed.  Aborting."; exit 1; }
hash openssl 2>/dev/null || { echo >&2 "I require openssl but it's not installed.  Aborting."; exit 1; }



##################################################################################################
# Create the root private key and certificate (self-signed)
##################################################################################################
openssl req -config root.cfg -x509 -nodes -sha256 -days 3650 -newkey rsa:4096 -set_serial 1 -keyout root_private.key -out root_certificate.cer

mkdir -p certs crl newcerts
touch index.txt
echo 01 > serial
echo 01 > crlnumber
