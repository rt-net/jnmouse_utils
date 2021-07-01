# Jetson Nano便利ツール集

このページではJetson Nano Mouseをより便利に使うために使うことが出来るツールをメモしています。

※最新の正確な情報についてはリンク先をご覧ください。

## jetson-stats

JetsonのCPUやGPUのステータスを表示するためのツールです。  
バージョン3.xからはroot権限なしでも実行できます。  
JetBot用のイメージではデフォルトでjetson-statsが入っている場合があります。  
（リリース時期によっては1.xの古いバージョンの場合もあります）

* GitHubリポジトリ: https://github.com/rbonghi/jetson_stats

<img src="https://rt-net.github.io/images/jetson-nano/jetson-stats.png" width="500px">

### インストール方法

以下のコマンドを実行します。  
※再起動が必要な場合があります

```
sudo -H pip install -U jetson-stats
```


### 起動方法

以下のコマンドを実行します。

```
jtop
```


