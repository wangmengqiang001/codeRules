---
title: 设置SonarQube规则
date: 2021-08-10 08:30:00 +0800
categories: [日志, 使用说明]
tags: [使用说明]     # TAG names should always be lowercase
---
## 配置SonarQube规则
在部署和启动SonarQube后，可以从[下载](/posts/download)选择要使用的规则

![SonarQube规则](/assets/img/rules/sq/allRules.jpg)

在SonarQube的**质量配置**页面中，通过"创建"或"恢复"导入选择的规则
![SonarQube配置规则](/assets/img/rules/sq/createRules.jpg)

在创建页面中要按照工具类型选择配置文件，可以分别对应选择CheckStyle及FindBugs的规则文件
![创建配置规则](/assets/img/rules/sq/newRules.png)

而对于规则全集中则是CheckStyle和FindBugs的规则集的混合，如果选择它可以使用“**恢复**”，这和在"创建"中分别选择"30条CheckStyle规则","341条FindBugs规则"的结果是一样的(事实上全集就是这样合成出来的)。



## 配置Sonarlint
首先要已经完成在Eclipse中安装了SonarLint插件。在待扫描的项目上选择Project->Properties, 然后选择SonarLint, 如下图

![SonarLint link](/assets/img/rules/sq/lintLink.png)
点击链接
![SonarCloud](/assets/img/rules/sq/qubeCloud.png)
选择Connect to a server
![SonarCloud](/assets/img/rules/sq/sonarServerUrl.png)
然后输入SonarQube Server的地址，之后选择认证的方式，并选择Server上对应的项目
![Sonar Token](/assets/img/rules/sq/sonarToken.png)

在Server上对应的项目上，通过**项目配置**--> **质量配置** 选择上自定义的规则集。
![Project Rule](/assets/img/rules/sq/sonarProjectRule.png)
