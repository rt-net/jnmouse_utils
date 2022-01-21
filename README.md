# Jetson Nano Mouseセットアップ情報

Jetson Nano™をJetson Nano Mouse向けにセットアップする際にあると便利な情報やスクリプトをまとめています。

[`setup-scripts`](./setup-scripts)ディレクトリにはJetson Nano Mouse用SDカードイメージ作成スクリプトを公開しています。

## 関連Webページ

* Jetson Nano Mouse製品ページ
    * https://rt-net.jp/products/jetson-nano-mouse
* Jetson Nano Mouse使用方法紹介ブログ「Jetson Nano Mouseを動かしてみよう」
    * https://rt-net.jp/mobility/archives/category/developer/lets-try-jetson-nano-mouse

## Jetson Nano Mouse用GitHubリポジトリ

* Jetson Nano Mouse用デバイスドライバ
    * [rt-net/JetsonNanoMouse](https://github.com/rt-net/JetsonNanoMouse)
* Jetson Nano Mouse用Pythonパッケージ+機械学習・画像処理サンプル（Jupyter Notebook）
    * [rt-net/jnm_jupternotebook](https://github.com/rt-net/jnm_jupyternotebook)
* Jetson Nano Mouse用ROSサンプル
    * [rt-net/jnmouse_ros_examples](https://github.com/rt-net/jnmouse_ros_examples)
* Jetson Nano MouseシミュレータROSパッケージ
    * [rt-net/jnmouse_sim](https://github.com/rt-net/jnmouse_sim)
    * [rt-net/jnmouse_description](https://github.com/rt-net/jnmouse_description)
* Jetson Nano Mouseハードウェア情報リポジトリ
    * [rt-net/JetsonNanoMouse_Hardware](https://github.com/rt-net/JetsonNanoMouse_Hardware)

## Jetson Nano用GitHubリポジトリ

* Jetson Nano 開発者キット B01の2つのCSIカメラを同時に使用するためのROSパッケージ
    * [rt-net/jetson_nano_csi_cam_ros](https://github.com/rt-net/jetson_nano_csi_cam_ros)
* Jetson Nano 開発者キット B01の2つのCSIカメラを同時に使用するためのROSパッケージ（CUDAを使用した高速版）
    * [rt-net/jetson_nano_cuda_csi_cam_ros](https://github.com/rt-net/jetson_nano_cuda_csi_cam_ros)

## Jetson Nano/Jetson Nano Mouse用情報

* [トラブルシューティング](./docs/TroubleShooting.md)
* [設定メモ](./docs/Tips.md)
* [Jetson Nano用ソフトウェア紹介](./docs/Utils.md)
* [Jetson Nano Mouseの使い方紹介ページリスト](./docs/JetsonNanoMouse.md)
* [Jetson Nano Mouse用Jetson Nanoセットアップ方法](https://rt-net.github.io/tutorials/jnmouse/driver/install.html)

## LICENSE

(C) 2020-2022 RT Corporation \<support@rt-net.jp\>

[`scripts`](./scripts)および[`setup-scripts`](./setup-scripts)ディレクトリの中のコードは[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)です。

[`docs`](./docs)ディレクトリ中のドキュメント、本ドキュメントを含むその他のドキュメント、画像に関しては[CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/deed.ja)です。

※本ソフトウェアは基本的にオープンソースソフトウェアとして、ドキュメントはクリエイティブ・コモンズ・ライセンスで、どちらも「AS IS」（現状有姿のまま）で提供しています。  
本ソフトウェアおよびドキュメントに関する無償サポートはありません。  
バグの修正や誤字脱字の修正に関するリクエストは常に受け付けていますが、それ以外の機能追加等のリクエストについては社内のガイドラインを優先します。
