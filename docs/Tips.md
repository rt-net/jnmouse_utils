
# Jetson Nanoの設定メモ

このページではJetson Nano Mouseの開発中に便利だった設定等をメモしています。

## `dmesg`のログについて

```
tegra-i2c 7000c400.i2c: no acknowledge from address 0x3c
```
と`dmesg`のログに残ることがあります。  
JetBotにはIPアドレス等ロボットの状態を表示するディスプレイつけますが、そのディスプレイと通信できなかったときにエラーが記録されます。  
（Jetson Nano Mouseにはロボットの状態を表示するディスプレイはありません）

以下のコマンドでロボットの状態を表示するディスプレイとの通信を停止できます。

```
$ sudo systemctl stop jetbot_stats.service
```

以下のコマンドでロボットの状態を表示するディスプレイと通信するためのサービスの自動起動を無効化できます。

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