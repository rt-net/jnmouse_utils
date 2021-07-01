
# Jetson Nanoの設定メモ

このページではJetson Nano Mouseの開発中に便利だった設定等をメモしています。

## `jetbot.apps.stats`のプロセスのCPU使用率が高い

JetBotにはIPアドレス等ロボットの状態を表示するディスプレイが搭載されていますが、そのディスプレイと通信できなかったときに[通信ログが記録され続けます](./TroubleShooting.md#カーネルのメッセージバッファにtegra-i2cのエラーログが複数回出現)。  
（Jetson Nano Mouseにはロボットの状態を表示するディスプレイはありません）

以下のコマンドでロボットの状態を表示するディスプレイとの通信を停止できます。

```
$ sudo systemctl stop jetbot_stats.service
```

さらに以下のコマンドでロボットの状態を表示するディスプレイと通信するためのサービスの自動起動を無効化できます。

```
$ sudo systemctl disable jetbot_stats.service
```

## カメラ映像の赤み除去

<img src="https://user-images.githubusercontent.com/3256629/97837878-6d9c8580-1d22-11eb-855d-73a89e8a40d6.png" width="500px">

画像のようにIMX219 169FOVカメラの映像が赤みがかっている場合、
以下のコマンドでカメラパラメータの調整が可能です。

```
$ git clone https://github.com/rt-net/jnmouse_utils
$ ./jnmouse_utils/scripts/update-camera-overrides.sh
```

調整後は以下のようにある程度赤みを除去できます。

<img src="https://user-images.githubusercontent.com/3256629/97837884-6f664900-1d22-11eb-92a7-125bdd624445.png" width="500px">

参考：https://github.com/rt-net/jnmouse_utils/pull/1

## Power Modeの変更

Jetson Nanoは使用するCPUのパフォーマンスを抑えて省電力にする5Wモードと、パフォーマンスを最大限活用するMAXNモードがあります。

MAXNモードを有効化するには下記コマンドを実行します。

```
sudo nvpmodel -m 0
```

5Wモードに戻す場合は下記コマンドを実行します。

```
sudo nvpmodel -m 1
```

参考：https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/power_management_nano.html#wwpID0E0FL0HA

## 自動ソフトウェアアップデートの停止

自動で実施されるソフトウェアアップデートを停止するには以下のコマンドを実行します。

```
$ git clone https://github.com/rt-net/jnmouse_utils
$ ./jnmouse_utils/scripts/disable-auto-apt-upgrade.sh
```

## L4TやJetPackのバージョン確認

L4TやJetPackのバージョンを確認するには以下のコマンドを実行します。

```
$ git clone https://github.com/rt-net/jnmouse_utils
$ ./jnmouse_utils/scripts/dump-l4t-version.sh
```

## ROSのインストール

ROSをインストールするには以下のコマンドを実行します。

```
$ git clone https://github.com/rt-net/jnmouse_utils
$ ./jnmouse_utils/scripts/install-ros-melodic.sh
```
