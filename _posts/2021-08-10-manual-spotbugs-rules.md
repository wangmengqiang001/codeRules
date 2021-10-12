---
title: 设置SpotBugs规则
date: 2021-08-10 09:00:00 +0800
categories: [日志,使用说明]
tags: [使用说明]     # TAG names should always be lowercase
---

## 在Eclipse中设置SpotBugs规则
### 安装插件
 SpotBugs是FindBugs的继承者，其插件安装方法可参考eclipse上安装FindBugs的说明，差别点只是安装的路径不同，可以从[Eclipse MarketPlace](https://marketplace.eclipse.org/content/spotbugs-eclipse-plugin) 上获取[![Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client](https://marketplace.eclipse.org/sites/all/themes/solstice/public/images/marketplace/btn-install.svg)](http://marketplace.eclipse.org/marketplace-client-intro?mpc_install=3519199 "拖拽到运行的Eclipse工作空间中(依赖 Eclipse Marketplace Client)")，或者从[SpotBugs官网](https://spotbugs.readthedocs.io/en/latest/eclipse.html)，及本站获得。  

 ### 配置规则  
 如下图，在Eclipse中打开Windows-->Preferences-->Java中打开SpotBugs,在窗口中添加要包含的规则。
![Eclipse 中配置SpotBugs规则](/assets/img/rules/sb/eclipseRules.jpg)

## 在IDEA中设置SpotBugs规则
IDEA 中安装spotbugs插件的过程请参考下面的推荐参考。
配置规则的配置方法类似于Eclipse, 也是在Filter中增加自定义的需要包含的规则，如下图
![IDEA 配置规则](/assets/img/rules/sb/ideaRules.jpg)

## 在maven中使用SpotBugs规则
在pom文件中做如下配置，引用自定义的规则集

````xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
...
  <reporting>
  <plugins>
  <plugin>
    <groupId>com.github.spotbugs</groupId>
    <artifactId>spotbugs-maven-plugin</artifactId>
    <version>4.2.1-SNAPSHOT</version>
    <configuration>
        <includeFilterFile>spotbugs-include.xml</includeFilterFile>
    </configuration>
  </plugin>
  </plugins>
  </reporting>
...
</project>
````

## 推荐参考
1. [FindBugs的安装及使用方法][eclipse_install]
2. [IDEA spotbugs使用][idea_install]
3. [Using the SpotBugs Maven Plugin][using_maven]
4. [Filter bugs to report][maven_filter]

[eclipse_install]:https://www.cnblogs.com/thomasyang-blogs/p/7657252.html "FindBugs的安装及使用方法"
[idea_install]:https://www.cnblogs.com/xiang--liu/p/13637154.html "IDEA spotbugs使用"
[using_maven]:https://spotbugs.readthedocs.io/en/latest/maven.html#using-the-spotbugs-maven-plugin "Using the SpotBugs Maven Plugin"
[maven_filter]:https://spotbugs.github.io/spotbugs-maven-plugin/usage.html "Filter bugs to report"
