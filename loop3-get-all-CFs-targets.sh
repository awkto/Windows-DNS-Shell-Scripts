#!/bin/bash


for domain in $(cat ad-domains.var); do \
	#Clear out existing files
	rm $domain-cf-targets.out ; \
	for zone in $(cat $domain-fwdzones.mid); do \
		echo "ZONE "$zone \
	                |tee -a $domain-cf-targets.out; \
	        dnscmd.exe $(cat $domain-dcs.mid|shuf|head -1) /ZoneInfo $zone  \
	                |grep "Master\[" \
	                |awk {'print $8'} \
	                |tr -d 'addr=' \
	                |tee -a $domain-cf-targets.out; \
	done ; \
done

