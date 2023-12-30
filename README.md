# robosys2023ros

## このパッケージについて
このパッケージは、以下の２つのノードで構成されています
* human.py
	* 標準入力から単語を受け取りそれをString型でパブリッシュします。

* parrot.py
	* サブスクライブしたものを標準出力します。また、低い確率で鳴き声を出します。


## インストール方法

このリポジトリーを下記のようにクローンしてください.
```
$ git clone git@github.com:Npaintrobo/robosys2023ros.git
```

## humanノードの使い方
```
$ ros2 run robosys2023ros human
human: aiueo
[INFO] [1703962216.324115819] [human]: Published: aiueo
human: kakikukeko
[INFO] [1703962224.580401522] [human]: Published: kakikukeko
human:
```

## parrotノードの使い方
```
$ ros2 run robosys2023ros parrot
```

## テスト環境

* Ubuntu 22.04 LTS
* ROS2 Humble

## 著作権・ライセンス

* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* © 2023 Shinnosuke Nonaka
