---
title: 设置Find-Sec-Bugs规则
date: 2021-08-10 08:40:00 +0800
categories: [日志,使用说明]
tags: [使用说明]     # TAG names should always be lowercase
---
**注：**
Find-Sec-Bugs中的规则包含了部分的Fortify的规则，使用标准的版本可以检测出XSS,Inject等常见的安全问题，后续我们将基于Find-Sec-Bugs进行开发，加入其它未覆盖的Fortify中的规则。

## 在Eclipse中设置Find-Sec-Bugs规则
把下载到的Find-Sec-Bugs的jar 放置到如下的目录中，Eclipse自动就会发现并加载它
![Eclipse 安装Find-Sec_Bugs](/assets/img/rules/sb/eclipseFb.png)

如果不放在这里则需要在Windows->Preferences->Java->SpotBugs->Plugins and misc. Setting中，进行手动添加的操作。
![Eclipse 安装Find-Sec_Bugs](/assets/img/rules/sb/eclipseFbGUI.png)

## 在IDEA中设置Find-Sec-Bugs规则
从[IDEA 市场](https://plugins.jetbrains.com/plugin/14014-spotbugs/versions)下载的插件看到，SpotBugs插件中已经包含了Find-Sec-Bugs
，如果没有可以参考<sup>[2]</sup>中的内容进行下载和安装。
![IDEA 安装Find-Sec-Bugs](/assets/img/rules/sb/ideaFb.png)

## 推荐参考
1. [eclipse安装findbugs及Find-sec-bugs安全组件][eclipse_install]
2. [idea安装findbugs及Find-sec-bugs安全组件][idea_install]

[eclipse_install]:https://www.cnblogs.com/kingsonfu/p/12420590.html "eclipse安装findbugs及Find-sec-bugs安全组件"
[idea_install]:https://www.cnblogs.com/kingsonfu/p/12419817.html "idea安装findbugs及Find-sec-bugs安全组件"
