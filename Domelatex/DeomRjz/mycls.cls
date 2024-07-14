%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"  %这段代码提供了模板类
\NeedsTeXFormat{LaTeX2e}[2023/12/11]
\ProvidesClass{mycls}[2023/12/11 v1.0 rjz document class]

                                                                            % 继承的模板类   默认了两个选项  
% \LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}      具体查看 texdoc ctexbook                


%%  这一段定义了一些键值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 键值定义
\RequirePackage{kvoptions}          %定义键hong
\RequirePackage{etoolbox}           
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}     %查阅 texdoc kvoptions
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% %  可选的选项定义
 \DeclareStringOption[blue]{color}                  %颜色主题   1
 \DeclareStringOption[cn]{lang}                     %语言2
 \DeclareStringOption[answer]{result}               % 定理环境隐藏3
 \DeclareStringOption[fancy]{mode}                  % 定理的模式4
 \DeclareStringOption[normal]{device}               %设备5
 \DeclareStringOption[cm]{math}                     % 数学字体6
 \DeclareStringOption[marginfalse]{marginpar}        %旁注7
 \DeclareStringOption[onecol]{toc}                  %目录单双栏8
 \DeclareStringOption{scheme}                       %中文汉化 第一章？？   ctexbook可以直接汉化
 \DeclareStringOption[ctexfont]{chinesefont}%9
 \DeclareBoolOption[false]{usesamecnt}             %%定理的计数器
 \DeclareStringOption[chapter]{thmcnt}            %章节的全局计数器10
 \DeclareStringOption[biber]{bibend}           %参考文献11
 \DeclareStringOption[numeric-comp]{citestyle}
 \DeclareStringOption[numeric]{bibstyle}
 \DeclareStringOption[hang]{titlestyle}[hang]      % 章标题的单双行显示
%%------------color option----------------                    bule
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

%%------------languages option----------------                 cn
\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{it}{\ekv{lang=it}}
\DeclareVoidOption{fr}{\ekv{lang=fr}}
\DeclareVoidOption{nl}{\ekv{lang=nl}}
\DeclareVoidOption{hu}{\ekv{lang=hu}}
\DeclareVoidOption{de}{\ekv{lang=de}}
\DeclareVoidOption{mn}{\ekv{lang=mn}}
\DeclareVoidOption{pt}{\ekv{lang=pt}}
\DeclareVoidOption{jp}{\ekv{lang=jp}}

%------------------scheme-----------option
\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}

%% ---------------result option---------------                 ansewr
% \DeclareVoidOption{answer}{\ekv{result=answer}}
% \DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

%% ---------------mode option---------------                    fancy
% \DeclareVoidOption{fancy}{\ekv{mode=fancy}}
% \DeclareVoidOption{simple}{\ekv{mode=simple}}

%% ---------------device option---------------                 normal
\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

%% ---------------math option---------------                   cm
% \DeclareVoidOption{newtx}{\ekv{math=newtx}}
% \DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
% \DeclareVoidOption{cm}{\ekv{math=cm}}

%% ---------------margin option---------------                 marginfalse
% \DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
% \DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}

%% ---------------toc option---------------                 onecol
% \DeclareVoidOption{onecol}{\ekv{toc=onecol}}
% \DeclareVoidOption{twocol}{\ekv{toc=twocol}}

%% ---------------Chinesefont option---------------                 ctexfont
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

%% ---------------thmcnt option---------------          chapter   thm 计数器
% \DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
% \DeclareVoidOption{section}{\ekv{thmcnt=section}}

%% ---------------bibend option---------------          bibtex
% \DeclareVoidOption{biber}{\ekv{bibend=biber}}
% \DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}


%% ---------------titlestyle option---------------          hang
 \DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
 \DeclareVoidOption{display}{\ekv{titlestyle=display}}

 \newif\ifELEGANT@Hy@later
 \@ifpackagelater{hyperref}{2022/05/16}
   {\ELEGANT@Hy@latertrue}
   {\ELEGANT@Hy@laterfalse}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   加载模板类       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}   %  将选项传递给ctexbook中
% \ProcessKeyvalOptions*\relax                                          %对当前的键值进行解析
% \LoadClass[a4paper,oneside]{ctexbook}                                %加载文档类
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}   %  将选项传递给ctexbook中
\ProcessKeyvalOptions*\relax                                          %对当前的键值进行解析
\LoadClass[a4paper,oneside]{book}                                %加载文档类
% \ProcessOptions*\relax                                      %不能用这个命令他不会解析之前定义的键值，看似有警告，实际已经解析到ctexbook中了、


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                   %包
% \RequirePackage{setspace}
% \RequirePackage{csquotes}
\RequirePackage{graphicx}                      %%图片包           
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}    %%数学排版    提供了一种额外的花体字体，通常用于表示数学中的脚注或其他特殊符号。     提供了一些额外的数学字体，包括数学黑板粗体字母   提供了一系列额外的数学符号，包括各种箭头、关系符号、数学运算符等。
% \providecommand\qed{}
% \renewcommand{\qed}{\hfill\ensuremath{\square}}
\RequirePackage{booktabs}                         %%  是一个用于制作表格的宏包
\RequirePackage{multicol,multirow}               % 实现多栏和多柱表格布局

\RequirePackage{fancyvrb}                  %%自定义环境时实现多功能排版
\RequirePackage{makecell,lipsum,hologo}            % 提供了更灵活的表格单元格格式设置    ，这是一种用于填充文档并测试格式的常用方法。   以便在文档中方便地插入这些标志。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   设置页面布局 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=20.0mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
\ifdefstring{\ELEGANT@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\ELEGANT@device}{pad}{
\geometry{
  paperwidth=10.5in, 
  paperheight=10in,
  margin=16mm,
  headheight=2.17cm,
  footskip=4mm
}}{\relax}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%字体设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{indentfirst,comment}          % 段落的设置  注释设置     ？？
% \ifdefstring{\ELEGANT@math}{mtpro2}{          % 数学字体 mtpro2的选项
%   \let\Bbbk\relax
%   \RequirePackage[lite]{mtpro2}
% }{\relax}

\PassOptionsToPackage{no-math}{fontspec}       %英文主体字体的修改
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage[no-math]{fontspec}
\setmainfont{TeXGyreTermesX}[
  UprightFont = *-Regular ,
  BoldFont = *-Bold ,
  ItalicFont = *-Italic ,
  BoldItalicFont = *-BoldItalic ,
  Extension = .otf ,
  Scale = 1.0]
  
\setsansfont{texgyreheros}[
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  Extension = .otf ,
  Scale = 0.9]

%% 设置英文字体         
	% \RequirePackage{xltxtra} % \XeTeX Logo
	% \setmainfont{Times New Roman}
	% \setsansfont{Arial}
	% \setmonofont{Times New Roman}

                                                      %中文的字体
  \ifdefstring{\ELEGANT@lang}{cn}{
    \ifdefstring{\ELEGANT@chinesefont}{founder}{
      \RequirePackage[UTF8, scheme=plain, fontset=none]{ctex}
      \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
      \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
      \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
      \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
      \setCJKfamilyfont{zhhei}{FZHei-B01}
      \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
      \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
      \newcommand*{\songti}{\CJKfamily{zhsong}}
      \newcommand*{\heiti}{\CJKfamily{zhhei}}
      \newcommand*{\kaishu}{\CJKfamily{zhkai}}
      \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
    
    \ifdefstring{\ELEGANT@chinesefont}{nofont}{
      \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
      \xeCJKsetup{AutoFakeBold=true}
      }{\relax}
  
    \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
      \RequirePackage[UTF8,scheme=plain,zihao=-4]{ctex}
      \xeCJKsetup{AutoFakeBold=true}
      % \let\songti\relax              %让宋体休息  重新定义中文字体格式
      % \let\heiti\relax
      % \let\kaishu\relax
      % \newCJKfontfamily\songti{SimSun.ttc}[AutoFakeSlant,AutoFakeBold={2}]
      % \newCJKfontfamily\kaishu{SimKai.ttf}[AutoFakeSlant,AutoFakeBold={2}]
      % \newCJKfontfamily\heiti{SimHei.ttf}[AutoFakeSlant,AutoFakeBold={2}]
      % \setCJKmainfont{SimSun.ttc}[AutoFakeSlant,AutoFakeBold={2}]
      }{\relax}
    
    \AfterEndPreamble{
      \setlength\parindent{2\ccwd}}
  }{\relax}
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  颜色设置  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \RequirePackage{color}
  \RequirePackage[table]{xcolor}
    \ifdefstring{\ELEGANT@color}{green}{
      \definecolor{structurecolor}{RGB}{0,120,2}%
      \definecolor{main}{RGB}{0,120,2}%
      \definecolor{second}{RGB}{230,90,7}%
      \definecolor{third}{RGB}{0,160,152}%
    }{\relax}
    \ifdefstring{\ELEGANT@color}{cyan}{
      \definecolor{structurecolor}{RGB}{31,186,190}%
      \definecolor{main}{RGB}{59,180,5}%
      \definecolor{second}{RGB}{175,153,8}%
      \definecolor{third}{RGB}{244,105,102}%
    }{\relax}
    \ifdefstring{\ELEGANT@color}{blue}{
      \definecolor{structurecolor}{RGB}{60,113,183}
      \definecolor{main}{RGB}{0,166,82}%
      \definecolor{second}{RGB}{255,134,24}%
      \definecolor{third}{RGB}{0,174,247}%
    }{\relax}
    \ifdefstring{\ELEGANT@color}{gray}{
      \definecolor{structurecolor}{RGB}{150,150,150}
      \definecolor{main}{RGB}{150,150,150}%
      \definecolor{second}{RGB}{150,150,150}%
      \definecolor{third}{RGB}{150,150,150}%
    }{\relax}
    \ifdefstring{\ELEGANT@color}{black}{
      \definecolor{structurecolor}{RGB}{0,0,0}
      \definecolor{main}{RGB}{0,0,0}%
      \definecolor{second}{RGB}{0,0,0}%
      \definecolor{third}{RGB}{0,0,0}%
    }{\relax}
%%%%%%%%%  自定义颜色 %%%%%%%%%%%%%

%green color
\definecolor{structure1}{RGB}{0,120,2}%
\definecolor{main1}{RGB}{0,120,2}%
\definecolor{second1}{RGB}{230,90,7}%
\definecolor{third1}{RGB}{0,160,152}%
%cyan color
\definecolor{structure2}{RGB}{31,186,190}%
\definecolor{main2}{RGB}{59,180,5}%
\definecolor{second2}{RGB}{175,153,8}%
\definecolor{third2}{RGB}{244,105,102}%
%blue color
\definecolor{structure3}{RGB}{60,113,183}
\definecolor{main3}{RGB}{0,166,82}%
\definecolor{second3}{RGB}{255,134,24}%
\definecolor{third3}{RGB}{0,174,247}%
% gray color
\definecolor{structure4}{RGB}{150,150,150}
\definecolor{main4}{RGB}{150,150,150}%
\definecolor{second4}{RGB}{150,150,150}%
\definecolor{third4}{RGB}{150,150,150}%
% black color
\definecolor{structure5}{RGB}{0,0,0}
\definecolor{main5}{RGB}{0,0,0}%
\definecolor{second5}{RGB}{0,0,0}%
\definecolor{third5}{RGB}{0,0,0}%

% corlor definition
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}
\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%章节设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}
\RequirePackage{apptools}
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}  %%定义了style为行还是display
\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\baselinestretch}{1.3}
  % \titlespacing{\chapter}{0pt}{0pt}{1.3\baselineskip} 
  \titlespacing{\chapter}{0pt}{0pt}{30pt}   
  \titlespacing{\section}{0pt}{20pt}{15pt} 
  \titlespacing{\subsection}{0pt}{15pt}{10pt}  
  \renewcommand{\contentsname}{目录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\partname}{\color{structurecolor}}
  \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \newcommand{\ebibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  \newcommand\figref[1]{\textbf{图}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \newcommand{\authorname}{\citshape 作者：}
  \newcommand{\institutename}{\citshape 组织：}
  \newcommand{\datename}{\citshape 时间：}
  \newcommand{\versionname}{\citshape 版本：}
  \newcommand{\notename}{笔记}
  \renewcommand*{\proofname}{证明}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公设}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例题} %
  \newcommand{\instancename}{示例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{练习} % 练习=习题
  \newcommand{\remarkname}{注}
  \newcommand{\assumptionname}{假设}
  \newcommand{\conclusionname}{结论}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
  \newcommand{\introductionname}{内容提要}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\historyname}{版本更新历史}
  \newcommand{\beforechap}{第}
  \newcommand{\afterchap}{章}
}{\relax}

\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@scheme}{chinese}{
    \newcommand{\xchaptertitle}{第\zhnumber{\arabic{chapter}}章} }{
    \newcommand{\xchaptertitle}{第 \thechapter{} 章}}
% Hyperref 2022/05/16's changelog.txt said
% * nameref is loaded always and earlier (issue#235) 
    \AtBeginDocument{                           %%%%%%%%%%%%% 
      \ifELEGANT@Hy@later
        \patchcmd{\NR@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \else    
        \patchcmd{\Hy@org@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \fi
    }
  }
   {\newcommand{\xchaptertitle}{\chaptername~\thechapter~}}

  \setcounter{secnumdepth}{5}             %\style在前面定义了
  \titleformat{\chapter}[\style]{\bfseries}{
      \filcenter\LARGE\enspace\bfseries{\color{structurecolor} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
      \LARGE\bfseries\color{structurecolor}\filcenter}[]
  \titleformat{\section}[hang]{\bfseries}{
      \Large\bfseries{\color{structurecolor}\thesection}\enspace}{1pt}{%
      \color{structurecolor}\Large\bfseries\filright}
  \titleformat{\subsection}[hang]{\bfseries}{
      \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
      \color{structurecolor}\large\bfseries\filright}
  \titleformat{\subsubsection}[hang]{\bfseries}{
      \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
      \color{structurecolor}\large\bfseries\filright}
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 封面


















% ----- Math option  
 \newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}       %%超链邮箱命令   这个可以放到sty @@@@@@@@@@@@@@@@@@@
\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={ElegantBook},
  colorlinks,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}






\zihao{2}



