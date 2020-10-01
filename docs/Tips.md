
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