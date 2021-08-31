#!/bin/bash -eu

SELECTED_LANG=$(whiptail --menu "Select language. \n言語を選択してください。" 0 0 0 \
0 "English" \
1 "日本語" \
3>&1 1>&2 2>&3) 

MSG="Boot firmware for all Jetson Nano developer kits updated to relocate boot firmware to integrated QSPI-NOR.\n"
# MSG+=$(printf '\e]8;;https://developer.nvidia.com/embedded/linux-tegra-r325\e\\Release note (https://developer.nvidia.com/embedded/linux-tegra-r325)\e]8;;\e\\\n')
MSG+="https://developer.nvidia.com/embedded/linux-tegra-r325\n"
MSG+="This means there are two main affects. \n\n"
MSG+="1. The image on this SD card will no longer work with the Jetson Nano developer kits with the previous QSPI image from JetPack 4.4 and older.\n"
MSG+="2. This Jetson Nano developer kit will no longer work with the image which uses the previous boot firmware.\n\n"
MSG+="You can downgrade the firmware with flashing JetPack 4.4 or older releases using SDK Manager.\n"
MSG+="Do you want to continue?"

if [[ "$SELECTED_LANG" == "1" ]]; then
    MSG="Jetson Nano開発者キットのブートローダ (boot firmware) を\"integrated QSPI-NOR\"に更新します。\n"
    MSG+="これはJetPack 4.5から導入されたものです。\n"
    MSG+="https://developer.nvidia.com/embedded/linux-tegra-r325\n"
    MSG+="以下の2つの影響があります。\n\n"
    MSG+="1. このSDカードのイメージは、JetPack 4.4以前の旧ブートローダを搭載したJetson Nano開発キットでは動作しなくなります\n"
    MSG+="2. このJetson Nano開発キットは、以前のブートローダを使用したイメージでは動作しなくなります\n\n"
    MSG+="SDK Managerを使ってJetPack 4.4以前のバージョンを書き込むことでブートローダは元に戻せます。\n"
    MSG+="処理を続行しますか？"
fi


# echo $MSG
if (whiptail --yesno "$MSG" 0 1); then
    echo "OK"
    echo "will update MinSPI to MaxSPI"
    # Update MinSPI to MaxSPI
    sudo /usr/lib/nvidia/qspi-update/nvqspi-update.sh
else
    echo "nothing to do..."
fi

echo "exit update-qspi.sh"