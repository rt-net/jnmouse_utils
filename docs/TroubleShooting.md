# トラブルシューティング

このページではJetson Nano Mouseの開発中に遭遇したエラー等の不具合への対処方法についてメモしています。

## Jupyter Notebookからカメラに繋がらない

```python
from jnmouse import Camera

camera = Camera.instance(width=300, height=300)
```

でエラーが出る場合があります。

以下のコマンドでJupyter Labの詳細なログを確認できます。  
ここで出力された内容を見て対処します。

```
$ journalctl -u jetbot_jupyter.service 
```

## カメラに繋がらない

```
Error generated. /dvs/git/dirty/git-master_linux/multimedia/nvgstreamer/gst-nvarguscamera/gstnvarguscamerasrc.cpp, execute:543 Failed to create CaptureSession
[ERROR] [1598606645.153198645]: Could not get gstreamer sample.
```

などとカメラに接続できないエラーが出る場合があります。

以下のコマンドで`nvargus-daemon`を再起動することでセッションをリスタートでき、多くの場合カメラに接続できるようになります。

```
$ sudo systemctl restart nvargus-daemon
```

参考：https://github.com/NVIDIA-AI-IOT/jetbot/issues/1

## カーネルのメッセージバッファに`tegra-i2c`のエラーログが複数回出現

`dmesg`でカーネルのメッセージバッファを確認すると
```
tegra-i2c 7000c400.i2c: no acknowledge from address 0x3c
```
と複数回表示されることがあります。  
JetBotにはIPアドレス等ロボットの状態を表示するディスプレイつけますが、そのディスプレイと通信できなかったときにエラーが記録されます。  
（Jetson Nano Mouseにはロボットの状態を表示するディスプレイはありません）

以下のコマンドでロボットの状態を表示するディスプレイとの通信を停止できます。

```
$ sudo systemctl stop jetbot_stats.service
```

さらに以下のコマンドでロボットの状態を表示するディスプレイと通信するためのサービスの自動起動を無効化できます。

```
$ sudo systemctl disable jetbot_stats.service
```

## Jetson-IOでエラーが出る

以下のページをご確認ください。

https://github.com/rt-net/JetsonNanoMouse/wiki/Jetson-IO%E3%81%AE%E8%B5%B7%E5%8B%95%E3%82%A8%E3%83%A9%E3%83%BC%E5%AF%BE%E5%87%A6%E6%96%B9%E6%B3%95