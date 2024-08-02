# DemoRjz

## Q1目录中章节和附录冲突问题？

暂时无法解决

```latex
\titlecontents{chapter}     % 适用于章节
  [1em]                     % 缩进量
  {\bfseries \songti}       % 章节标题的字体
  % { \thecontentslabel \hspace{2pt}}%
  {\ifnum\value{chapter}>0 附~录~\thecontentslabel \else \chinesechapter{\thecontentslabel} \fi \hspace{2pt}}%
  % {\iftoggle{appendix}{附~录~\thecontentslabel}{\chinesechapter{\thecontentslabel}} \hspace{2pt}} % 章节编号前的额外内容
  {\hspace*{2em}} % 章节编号前的额外内容
  {\zjut@content@dott} % 章节标题和页码之间的分隔符
```

> 处于目录页无法判断`chapter`的计数器值，该值始终为0；



## Q2模板中参考文献倒叙的问题

使用`bibtex`编译参考文献导致参考文献序号倒叙，引入`biblatex`宏包的时候需要设置以下选项；

```latex
 \RequirePackage[
  backend=\ELEGANT@bibend,
  citestyle=\ELEGANT@citestyle,
  bibstyle=\ELEGANT@bibstyle,
  sorting=none      %% 发现的bug 解决倒叙问题
  ]{biblatex}
```

