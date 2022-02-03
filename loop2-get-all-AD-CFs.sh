#!/bin/bash
for domain in $(cat ad-domains.var); do \
	dnscmd.exe $(cat $domain-dcs.mid|shuf|head -1) /EnumZones \
		| grep Forwarder \
		|awk {'print $1'} \
		| tee $domain-fwdzones.mid ; \
done
