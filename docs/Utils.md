# Jetson Nano便利ツール集

このページではJetson Nano Mouseをより便利に使うために使うことが出来るツールをメモしています。

※最新の正確な情報についてはリンク先をご覧ください。

## jetson-stats

JetsonのCPUやGPUのステータスを表示するためのツールです。  
バージョン3.xからはroot権限なしでも実行できます。  
L4Tではデフォルトで1.xの古いjetson-statsが入っている場合があります。

* GitHubリポジトリ: https://github.com/rbonghi/jetson_stats

```
sudo -H pip install -U jetson-stats
```
