本仓库是系列教程[fabric生产环境搭建](http://liwuzhi.art/?p=134)中的项目文件

本项目生产环境是两个组织，三个order和两个peer组成的网络，包括两个独立的CA

整体结构如图:
![](http://liwuzhi.art/wp-content/uploads/2021/10/fabric%E5%8E%9F%E7%90%86.002.png)

目录结构：
* ca。 是fabric-ca在生产环境中的脚本和配置文件
* msp。是搭建fabric-ca生产环境需要的msp文件,由ca生成
* network。是搭建orderer的Raft集群所需脚本和配置文件
* channel。是创建Application Channel的脚本和配置文件
* monitor。是搭建Prometheus+Grafana监控fabric的脚本和配置文件
* cli。fabric工具库，包括discover, configtxgen, peer等工具
* code。智能合约代码


本仓库建议配合教程使用

