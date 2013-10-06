Movable Type Open Source Cookbook
=================================

Installs Movable Type Open Source

* Reverse Proxy and Server static contents - Nginx
* Database - MySQL
* PSGI Server - Starman

This cookbook is based on [デザイナー必見！VPSで高速なMovable Type用サーバをゼロから構築する方法(How to setup Movable Type on VPS for Designers)](http://www.skyarc.co.jp/engineerblog/entry/movabletype_psgi_mysql.html).  
Thanks to [@onagatani](https://twitter.com/onagatani) and [SKYARC CO.,Ltd.](http://www.skyarc.co.jp)

How To Use
----------

Create a virtual machine and setup Movable Type Open Source

    > git clone https://github.com/ysasaki/cookbook-movabletype-opensource-standalone mtos
    > vagrant up --provision


SSH Login

    > vagrant ssh

    or

    > vagrant ssh-config | sed 's/default/HOSTNAME/' >> ~/.ssh/config
    > ssh HOSTNAME


Requirements
------------

Platform
--------

* CentOS

Tested on:

* CentOS release 6.4 (Final)

Packages
--------

* `nginx`
* `mysql` - client and server
* `database`
* `yum::epel`
* `simple_iptables`
* `movabletype-opensource` - https://github.com/ysasaki/cookbook-movabletype-opensource.github

Attributes
----------

See roles/mtos-standalone.rb
License and Authors
-------------------

The MIT License (MIT)

Copyright (c) 2013 Yoshihiro Sasaki
