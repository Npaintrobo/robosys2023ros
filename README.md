# robosys2023ros

[![test](https://github.com/Npaintrobo/robosys2023ros/actions/workflows/test.yml/badge.svg)](https://github.com/Npaintrobo/robosys2023ros/actions/workflows/test.yml)
## このパッケージについて
このパッケージは、以下の２つのノードで構成されています
* human.py
	* 標準入力から単語を受け取りそれをトピック/human_topicを通じて, String型でパブリッシュします

* parrot.py
	* サブスクライブしたものを標準出力します.また, 低い確率で鳴き声を出します.


## 使用方法

このリポジトリーをROS2ワークスペースのsrc下に下記のようにクローンしてください.
```
$ git clone git@github.com:Npaintrobo/robosys2023ros.git
```

## humanノード
```
$ ros2 run robosys2023ros human
human: aiueo
[INFO] [1703967235.375534046] [human]: Published: aiueo
human: kakikukeko
[INFO] [1703967239.436444094] [human]: Published: kakikukeko
human: 
```

## parrotノード
```
$ ros2 run robosys2023ros parrot
[INFO] [1703967235.374137790] [parrot]: Received: aiueo
[INFO] [1703967239.436754204] [parrot]: Received: kakikukeko
```

## テスト環境

* Ubuntu 22.04 LTS
* ROS2 Humble

## 著作権・ライセンス

* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* © 2023 Shinnosuke Nonaka
