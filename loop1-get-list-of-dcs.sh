#!/bin/bash

for domain in $(cat ad-domains.var);do \
        dig $domain NS +short | sort | tee $domain-dcs.mid; \
done

