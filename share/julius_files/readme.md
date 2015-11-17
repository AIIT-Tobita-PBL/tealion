# 実行方法

展開したフォルダ内で下記のようにコマンドを実行します。

## マイクからの音声を認識
julius -C lifeSound.jconf -input mic

## ファイルから音声を読み込んで認識
julius -C lifeSound.jconf -input rawfile
* 実行後、読み込むファイルを聞かれるのでファイル名を入力
