<div align="right">
  <a href="README.md#readme">EN</a> |
  <a href="./docs/README.zh-CN.md">Chirpy Jekyll Theme</a>
</div>

<div align="center">
  <h1>Chirpy Code Rules</h1>
  <p>
    <a href="https://rubygems.org/gems/jekyll-theme-chirpy">
    <img alt="Gem Version" src="https://img.shields.io/gem/v/jekyll-theme-chirpy?color=brightgreen"></img>
  </a>
    <a href="https://github.com/wangmengqiang001/codeRules/actions?query=branch%3Amaster+event%3Apush">
    <img alt="Build Status" src="https://github.com/cotes2020/jekyll-theme-chirpy/workflows/build/badge.svg?branch=master&event=push"></img>
  </a>
    <a href="#">
    <img alt="Codacy Badge" src="https://api.codacy.com/project/badge/Grade/8220b926db514f13afc3f02b7f884f4b"></img>
  </a>
    <a href="#">
    <img alt="GitHub license" src="https://img.shields.io/github/license/cotes2020/jekyll-theme-chirpy.svg"></img>
  </a>
    <a href="#">
    <img alt="996.icu" src="https://img.shields.io/badge/link-996.icu-%23FF4D5B.svg"></img>
  </a>
  </p>
</div>

代码规范、代码检测工具和规则文件、及相关工具的使用说. 本站点内容是基于[Jekyll](https://jekyllrb.com/) 及 [Chirpy Jekyll Theme](https://github.com/cotes2020/jekyll-theme-chirpy)  


内容
--

- 代码规范
- 代码检测工具
- 规则配置文件
- 代码检测工具的使用方法


## 前提准备

在本地安装Ruby,Gem等比较繁琐，相关步骤参见 [Jekyll Docs](https://jekyllrb.com/docs/installation/)，有容器的环境建议使用jekyll镜像，以下的说是针对使用容器的情况.

下载代码
--------
```console
git clone https://github.com/wangmengqiang001/codeRules.git

chmod a+w codeRules
mkdir bundles
```

执行jekyll构建
--------------
```console
docker run --rm --name jbuild -it -v $PWD/codeRules:/srv/jekyll \
-v $PWD/bundles:/usr/local/bundle \
 jekyll/jekyll jekyll build

```

运行jekyll服务
--------------
```console
docker run --rm --name jserver -it -p 8260:4000 \
-v $PWD/codeRules:/srv/jekyll \
-v $PWD/bundles:/usr/local/bundle \
 jekyll/jekyll jekyll  server -H 0.0.0.0
 ```
 构建运行镜像
 -----
将Jekyll构建后产生的_site及可供静态下载的内容通过nginx进行发布

 待续....
