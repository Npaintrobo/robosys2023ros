# robosys2023ros
[![test](https://github.com/Npaintrobo/robosys2023ros/actions/workflows/test.yml/badge.svg)](https://github.com/Npaintrobo/robosys2023ros/actions/workflows/test.yml)

## このパッケージについて
このパッケージは、以下の２つのノードで構成されています
* human.py
* parrot.py

## 使用方法

このリポジトリーをROS 2ワークスペースのsrc下に下記のようにクローンしてください.
```
$ git clone git@github.com:Npaintrobo/robosys2023ros.git
```

## Humanノード
このノードは,以下の例のように標準入力から行毎に受け取りパブリッシュします.
```
$ ros2 run robosys2023ros human
human: aiueo
[INFO] [1703967235.375534046] [human]: Published: aiueo
human: kakikukeko
[INFO] [1703967239.436444094] [human]: Published: kakikukeko
human: 
```
パブリッシュするトピック
/human_topic 型:String

## parrotノード
このノードは,/human_topicをサブスクライブし標準出力します.また,低確率でparrotの鳴き声を標準出力します.
```
$ ros2 run robosys2023ros parrot
[INFO] [1703967235.374137790] [parrot]: Received: aiueo
[INFO] [1703967239.436754204] [parrot]: Received: kakikukeko
```
サブスクライブするトピック
/human_topic 型:String

## テスト環境
* Ubuntu 22.04 LTS
* ROS 2 Humble Hawksbil

## 著作権・ライセンス
* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* © 2023 Shinnosuke Nonaka
