#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
${DIR}/jnmouse-setup-jetpack-4-5-1.sh 2>&1 | tee ~/jetson-create-sdcard-image.log