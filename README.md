# 简介
- 这个项目记录了`Latex`工作文本和`Demo`的制作过程，本项目基于`elegantbook`和各大高校的硕士毕业论文，整理总结编写了一系统模板和实现。

- 本项目源码修改来源于[P1](E:\均胜电子\Latex_RJZ)路径。相关库文件的介绍和模板的使用均来自于此。本文件夹用于后续的`bug`修复和新功能的实现，或者用于特定文本的撰写。所有`Demo_latex`均与[P1](E:\均胜电子\Latex_RJZ)同步。
- 本项目推送至个人`gitee`和`github`仓库，方便后续`worklatex`的同步修改与版本管理。



# 编译

所有源码均用`xelatex`编译，部分项目用`pdflatex`编译。参考文献均使用`bibtex`编译，具体编译流程均在源文件中注释。

部分文件无需参考文件只需要编译两次`xelatex`,或者一次`xelatex`即可。

编译器下载最新的`TexLive`, 可在`cmd`中编译；

```
xelatex Test
bibtex  Test
xelatex Test
xelatex Test
```



编辑器可采用`TexStudio`或者`Vscode+SumatraPDF`,具体配置可见[软件安装](E:\均胜电子\git-home)(即`git-home`中的软件安装，或者移动硬盘中的教程。



# gitignore

`.gitignore`中忽略了所有的编译后的文件，只保留`pdf`文件，使用

`clear_latex.bat`可删除所有的编译文件。



# 文件分类

- `Chapter`文件夹保管章节`.tex`文件，方便管理；

- `.tex`文件中为主源码，大型文本一般不在这个文件中写内容；
- `figures`保存用户图片；
- `.cls`个人模板类文件；
- `.bib`用户参考文献；
- `.bst`参考文献样式。

==并不是所有项目都包含所有文件。==



# 可用模板

- 电工实习错题集
- IEEE模板
- PE模板
- IJIRA模板

