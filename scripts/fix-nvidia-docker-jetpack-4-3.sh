#!/usr/bin/env bash
set -eu

cd /etc/nvidia-container-runtime/host-files-for-container.d

sudo patch -p0 << EOF
--- tensorrt.csv        2021-04-21 16:05:33.179324839 +0900
+++ patch/tensorrt.csv  2021-04-21 16:07:11.122341036 +0900
@@ -10,4 +10,22 @@ sym, /usr/lib/aarch64-linux-gnu/libnvinf
 sym, /usr/lib/aarch64-linux-gnu/libnvonnxparser.so.6
 sym, /usr/lib/aarch64-linux-gnu/libnvonnxparser_runtime.so.6
 sym, /usr/lib/aarch64-linux-gnu/libnvparsers.so.6
+lib, /usr/include/aarch64-linux-gnu/NvInfer.h
+lib, /usr/include/aarch64-linux-gnu/NvInferRuntime.h
+lib, /usr/include/aarch64-linux-gnu/NvInferRuntimeCommon.h
+lib, /usr/include/aarch64-linux-gnu/NvInferVersion.h
+lib, /usr/include/aarch64-linux-gnu/NvUtils.h
+lib, /usr/include/aarch64-linux-gnu/NvInferPlugin.h
+lib, /usr/include/aarch64-linux-gnu/NvInferPluginUtils.h
+lib, /usr/include/aarch64-linux-gnu/NvCaffeParser.h
+lib, /usr/include/aarch64-linux-gnu/NvUffParser.h
+lib, /usr/include/aarch64-linux-gnu/NvOnnxConfig.h
+lib, /usr/include/aarch64-linux-gnu/NvOnnxParser.h
+dir, /usr/lib/python2.7/dist-packages/tensorrt
+dir, /usr/lib/python2.7/dist-packages/graphsurgeon
+dir, /usr/lib/python2.7/dist-packages/uff
+dir, /usr/lib/python3.6/dist-packages/tensorrt
+dir, /usr/lib/python3.6/dist-packages/graphsurgeon
+dir, /usr/lib/python3.6/dist-packages/uff
 dir, /usr/src/tensorrt
+
EOF
