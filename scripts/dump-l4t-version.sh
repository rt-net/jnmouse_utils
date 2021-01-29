#!/bin/bash -eu

L4T=`head -n1 /etc/nv_tegra_release | sed -E "s/# (R[0-9]*) .*REVISION: ([0-9\.]*),.*/\1.\2/g"`

JP="JetPack version unknown or not defined"
if [ "$L4T" == "R32.2.1" ]; then JP="JetPack4.2.2"; fi
if [ "$L4T" == "R32.2.3" ]; then JP="JetPack4.2.3"; fi
if [ "$L4T" == "R32.3.1" ]; then JP="JetPack4.3"; fi
if [ "$L4T" == "R32.4.3" ]; then JP="JetPack4.4"; fi
if [ "$L4T" == "R32.4.4" ]; then JP="JetPack4.4.1"; fi
if [ "$L4T" == "R32.5.0" ]; then JP="JetPack4.5"; fi

echo $L4T, $JP
