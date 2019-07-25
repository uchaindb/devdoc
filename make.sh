
chapters="\
	library/home-首页.md \
	library/01-简介/1-入门指引.md \
	library/01-简介/2-系统架构.md \
	library/01-简介/3-文件结构.md \
	library/01-简介/4-性能说明.md \
	library/01-简介/5-影子方案.md \
	library/01-简介/6-常见问题.md \
	library/01-简介/7-产品蓝图.md \
	library/02-安装/1-更新日志.md \
	library/02-安装/2-配置.md \
	library/02-安装/3-Windows下安装.md \
	library/02-安装/4-Docker下安装.md \
	library/03-SDK/01-API说明.md \
	library/03-SDK/02-创建事务相关API.md \
	library/03-SDK/03-查询相关API.md \
	library/03-SDK/11-nuget程序包.md \
	library/03-SDK/12-npm程序包.md \
	library/04-示例客户端/1-AngularX客户端.md \
	library/05-云服务/1-入门指引.md \
	library/08-案例分析/1-公益数据库.md \
	library/09-使用教程/01-创建数据表.md \
	"

options="metadata.yaml --highlight-style tango"

# pandoc -o full-speed-python.epub $options $chapters
pandoc -o devdoc.pdf -H tex/preamble.tex $options --latex-engine=xelatex $chapters
# pandoc -o devdoc.pdf -H tex/preamble.tex $options $chapters

