#!/bin/bash
for domain in $(cat ad-domains.var); do \
	dnscmd $(cat $domain-dcs.mid|shuf|head -1) /EnumZones \
		| grep Forwarder \
		|awk {'print $1'} \
		| tee $domain-fwdzones.mid ; \
done

#dnscmd $(cat mlid-dcs|shuf|head -1) /EnumZones | grep Forwarder|awk {'print $1'} > mlid-fwdzones
#dnscmd $(cat mfcgd-dcs|shuf|head -1) /EnumZones | grep Forwarder|awk {'print $1'} > mfcgd-fwdzones
#dnscmd $(cat prd-dcs|shuf|head -1) /EnumZones | grep Forwarder|awk {'print $1'} > prd-fwdzones
#dnscmd $(cat manulifeusa-DCs|shuf|head -1) /EnumZones | grep Forwarder|awk {'print $1'} > manulifeUSA-fwdzones
#dnscmd $(cat mlid-dcs2|shuf|head -1) /EnumZones | grep Forwarder|awk {'print $1'} > mlid2-fwdzones
