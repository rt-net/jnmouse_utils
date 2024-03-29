[English](README.md) | [日本語](README.ja.md)

# Jetson Nano Mouse用SDカードイメージ

## イメージリスト

* デフォルトユーザは`jetson`、パスワードは`jetson`です。
* SDカードの容量を25GB程度使用しますので64GBのmicroSDカードの使用を推奨します。

| Platform | Board revision | JetPack Version | Download | MD5 Checksum | branch |
| -------- | -------------- | --------------- | -------- |------------- | ------ |
| Jetson Nano (4GB) | `B01` | 4.5.1 |  [jnmouse_jp451_v3.zip](https://drive.google.com/open?id=1-eIXdtrHD8VY3M7C0sCRKE9LNfNPd97h) | `fe63b3db371a8c732c8311252bd268f0` | [`release/jetpack-4.5.1`](https://github.com/rt-net/jnmouse_utils/tree/release/jetpack-4.5.1)
| Jetson Nano (4GB) | `B01` | 4.5.1 |  [jnmouse_jp451_v2.zip](https://drive.google.com/open?id=1eyRdJdVfh4DCkAF1h6J93id33Hyb0Blf) | `53cf9fea7a9748ca36a358ea8ee52c7d` | [`release/jetpack-4.5.1`](https://github.com/rt-net/jnmouse_utils/tree/release/jetpack-4.5.1)
| Jetson Nano (4GB) | `B01` | 4.5.1 |  [jnmouse_jp451_v1.zip](https://drive.google.com/open?id=1txWe7OSPzoAymprqKH0puZkG0RpUIWVL) | `6628fbec144e81b47490be3940276371` | [`release/jetpack-4.5.1`](https://github.com/rt-net/jnmouse_utils/tree/release/jetpack-4.5.1)

※NVIDIA社の[JetPack EULA](https://docs.nvidia.com/jetson/jetpack/eula/)および[License For Customer Use of NVIDIA Software](https://www.nvidia.com/en-us/drivers/nvidia-license/)（[日本語版](https://www.nvidia.com/ja-jp/drivers/nvidia-license/)）を事前にご確認ください。  
イメージ作成途中にEULAへの同意ボタンをクリックしていますので、ダウンロード時点でEULAへ同意されたものとみなされます。  
※各イメージの差分については[CHANGELOG.md](./CHANGELOG.md)をご参照ください。

## 使い方

1. イメージをダウンロードして[balenaEtcher](https://www.balena.io/etcher/)でmicroSDカードに書き込みます
2. microSDカードをJetson Nanoに差し込み、電源を入れて以下のコマンドを実行します
    ```
    cd ~/jnmouse_utils/scripts
    ./configure-jetson.sh
    ./update-qspi.sh
    ```
3. 再起動後、必要に応じてネットワークの設定を行います

## イメージ作成方法

イメージをフルスクラッチで作成したい場合は[README.md](./README.md)をご参照ください。
