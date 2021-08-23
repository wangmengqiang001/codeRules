---
title: 设置CheckStyle规则
date: 2021-08-10 10:00:00 +0800
categories: [日志,使用说明]
tags: [使用说明]     # TAG names should always be lowercase
---

## 在Eclipse中配置CheckStyle规则  
### 安装插件
 关于eclipse上安装CheckStyle的说明很多，这里强调要注意使用CheckStyle的高版本，不要使用从sourceforge上提供的版本，高版本或者从[Eclipse MarketPlace](http://marketplace.eclipse.org/content/checkstyle-plug) 上获取[![Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client](https://marketplace.eclipse.org/sites/all/themes/solstice/public/images/marketplace/btn-install.svg)](http://marketplace.eclipse.org/marketplace-client-intro?mpc_install=150 "拖拽到运行的Eclipse工作空间中(依赖 Eclipse Marketplace Client)")，或者从本站获得。

### 配置规则

- **为工作空间增加CheckStyle的配置规则**  

在已经安装CheckStyle插件后，在Eclipse中打开Windows-->Preferences-->Checkstyle，如下图所示：
![Preferences](/assets/img/rules/cs/preference.gif)

点击New，在弹出的“Check Configuration Properties”窗口中Type下拉框选择External Configuration File，然后引入我们自定义的配置检查xml文件，Name可以自定义，如下图所示：
![external](/assets/img/rules/cs/external.gif)

除了可以以本地文件的方式配置，还可以通过remote方式配置一个远端的服务器上的规则。在弹出的“Check Configuration Properties”窗口中Type下拉框选择Remote Configuration,然后在Location中填写可访问的URL地址，如果需要认证还要配置认证的凭证信息，如下图：
![remote Configuration](/assets/img/rules/cs/remote.gif)


 点击OK保存，然后我们在前一个界面中就能看到我们刚刚导入的配置了，如下图：
 ![rules](/assets/img/rules/cs/rules.gif)

为方便以后对项目选择导入的规则，可以在列表中选择导入的规则，然后按下Set as Default将它 **设置为缺省规则**

 - **为项目激活规则**  

方法一

选择工作空间中的project, 点击右键，在菜单中选择 CheckStyle -> Activate CheckStyle, 会为项目激活规则，所选用的规则就是设置的缺省规则。
![activate](/assets/img/rules/cs/activateproject.gif)  


方式二

选择工作空间中的project, 在右键菜单中选择Properties或者Project -> Properties, 在项目的Properties窗口中进行设置，除了可以激活规则，还可以为项目选择其它的规则，如下图:
![activeSet](/assets/img/rules/cs/activeset.gif)

激活规则会触发对工程的重新构建，然后可以执行"Check Code with CheckStyle"

## 在IDEA中配置CheckStyle规则
安装好IDEA之后，按快捷键Ctrl+Alt+S,选择Checkstyle项进行配置，如图

![idea](/assets/img/rules/cs/ideaRules.png)  


## 在maven中使用CheckStyle规则
Maven项目在pom.xml中配置maven-checkstyle-plugin插件，绑定到Maven的生命周期，这样在执行mvn compile等命令时自动触发执行检查。
````xml
<build>
        <pluginManagement>
            <plugins>
                <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-checkstyle-plugin</artifactId>
                    <version>3.1.1</version>
                    <dependencies>

                        <dependency>
                            <groupId>com.puppycrawl.tools</groupId>
                            <artifactId>checkstyle</artifactId>
                            <!--指定依赖的checkstyle版本-->
                            <version>8.45</version>
                        </dependency>
                    </dependencies>
                    <!--指定配置文件-->
                    <configuration>
                        <configLocation>checkstyle.xml</configLocation>
                        <encoding>UTF-8</encoding>
                        <consoleOutput>true</consoleOutput>
                        <failsOnError>true</failsOnError>
                        <linkXRef>false</linkXRef>
                    </configuration>
                    <executions>
                        <execution>
                            <id>validate</id>
                            <phase>validate</phase>
                            <goals>
                                <goal>check</goal>
                            </goals>
                        </execution>
                    </executions>
                </plugin>
            </plugins>
        </pluginManagement>
        <plugins>
            <plugin>
               ...
            </plugin>
        </plugins>
    </build>

````

## 推荐参考
1. [eclipse中checkstyle的安装使用][eclipse_install]
2. [Maven项目使用Checkstyle检查代码][maven_checkstyle]

[maven_checkstyle]: https://blog.csdn.net/aouoy/article/details/106916263 "使用Checkstyle检查代码"
[eclipse_install]:https://blog.csdn.net/suchenbin/article/details/83870233 "checkstyle的安装使用"  
