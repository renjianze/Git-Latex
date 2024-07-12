%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    必要说明
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[2024/5/10]                                           
\ProvidesClass{DemoRjzV1}[2024/5/10 v1.0.1 rjz document class]
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     包放这里
\RequirePackage{kvoptions} 
\RequirePackage{etoolbox}
\RequirePackage{indentfirst}   
\RequirePackage{amssymb,amsmath,amsthm,amsfonts,bm,xfrac}     

% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}                                                           %文档继承项

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         键值族名
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 定义的键值
\DeclareStringOption[ctexfont]{chinesefont}
\DeclareStringOption[cn]{lang}
\DeclareStringOption[normal]{device}
\DeclareStringOption[hang]{titlestyle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%键值的选项            并传递选项
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}               %chinesefont
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareVoidOption{en}{\ekv{lang=en}}                                  %lang
\DeclareVoidOption{cn}{\ekv{lang=cn}}

\DeclareVoidOption{normal}{\ekv{device=normal}}                        %device
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}                       %titlestyle
\DeclareVoidOption{display}{\ekv{titlestyle=display}}





\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    中文类ctex 并设置字体，未完成
% \ifdefstring{\ELEGANT@lang}{cn}{
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
    }{\relax}
  
                                                          %这段代码设置首行缩进两个字符
\AfterEndPreamble{                                        
  \ifdefstring{\ELEGANT@lang}{cn}{
    \setlength\parindent{2\ccwd} 
  }{\setlength\parindent{2\ccwd}} {\relax} }           %%这里其实就是多余的，因为只对中文模板进行了设置


%% 设置英文字体         
  \RequirePackage{xltxtra} % \XeTeX Logo
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Times New Roman}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                    纸张大小设置
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
}{\relax}


\ifdefstring{\ELEGANT@device}{pad}{
\geometry{
  paperwidth=7.5in, 
  paperheight=10in,
  margin=16mm,
  headheight=2.17cm,
  footskip=4mm
}}{\relax}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 关键字  常用名称
\ifdefstring{\ELEGANT@lang}{cn}{
%   \renewcommand{\baselinestretch}{1.3}
%   \renewcommand{\contentsname}{目录}
%   \renewcommand{\figurename}{图}
%   \renewcommand{\tablename}{表}
%   \renewcommand{\partname}{\color{structurecolor}}
%   \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
%   \renewcommand{\listfigurename}{插图目录}
%   \renewcommand{\listtablename}{表格目录}
%   \renewcommand{\bibname}{参考文献}
%   \newcommand{\ebibname}{参考文献}
    \renewcommand{\appendixname}{附录}
    % \renewcommand{\xchaptername}{第~\zhnumber{\thechapter}~章}
%   \renewcommand{\appendixtocname}{附录}
%   \renewcommand{\indexname}{索\hspace{2em}引}
%   \newcommand\figref[1]{\textbf{图}~\ref{#1}}
%   \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
%   \newcommand{\authorname}{\citshape 作者：}
%   \newcommand{\institutename}{\citshape 组织：}
%   \newcommand{\datename}{\citshape 时间：}
%   \newcommand{\versionname}{\citshape 版本：}
%   \newcommand{\notename}{笔记}
%   \renewcommand*{\proofname}{证明}
%   \newcommand{\definitionname}{定义}
%   \newcommand{\theoremname}{定理}
%   \newcommand{\axiomname}{公理}
%   \newcommand{\postulatename}{公设}
%   \newcommand{\lemmaname}{引理}
%   \newcommand{\propositionname}{命题}
%   \newcommand{\corollaryname}{推论}
%   \newcommand{\examplename}{例题} %
%   \newcommand{\instancename}{示例} %
%   \newcommand{\problemname}{问题} % 问题
%   \newcommand{\exercisename}{练习} % 练习=习题
%   \newcommand{\remarkname}{注}
%   \newcommand{\assumptionname}{假设}
%   \newcommand{\conclusionname}{结论}
%   \newcommand{\solutionname}{解}
%   \newcommand{\propertyname}{性质}
%   \newcommand{\introductionname}{内容提要}
%   \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
%   \newcommand{\updatename}{更新：}
%   \newcommand{\historyname}{版本更新历史}
%   \newcommand{\beforechap}{第}
%   \newcommand{\afterchap}{章}
}{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          颜色定义 未完成 

\RequirePackage[table]{xcolor}
\definecolor{structurecolor}{RGB}{60,113,183}%       蓝色主色
% \definecolor{structurecolor}{RGB}{255,134,24}%       蓝色主色
\definecolor{myorange}{RGB}{255,134,24}%  
\definecolor{mygreen}{RGB}{0,166,82}%  
\definecolor{balckred}{RGB}{199,30,30}%  


\newcommand{\setchaptercolor}{\color{structurecolor}}
\newcommand{\setsectioncolor}{\color{myorange}}
\newcommand{\setsubsectioncolor}{\color{mygreen}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 章节设置

\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}
\RequirePackage{apptools}

\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

\ifdefstring{\ELEGANT@lang}{cn}{\newcommand{\xchaptername}{第\zhnumber{\thechapter}章}}{\relax}
\ifdefstring{\ELEGANT@lang}{en}{\newcommand{\xchaptername}{第{\thechapter}章}}{\relax}

\titleformat{\chapter}[hang]{\setchaptercolor\centering \bfseries \zihao{-2} }  %chapter format
{{\IfAppendix{\appendixname\;\thechapter\;}{\xchaptername}}}{0.5em}{}[]
\titlespacing{\chapter}{0pt}{0.25\baselineskip}{0.8\baselineskip}

\titleformat{\section}[hang]{ \setsectioncolor\large\bfseries\filright}{{\thesection}}{2pt}{}  % section format
\titlespacing{\section}{0pt}{0.5\baselineskip}{0.4\baselineskip}

\titleformat{\subsection}[hang]{ \setsubsectioncolor\large\bfseries\filright}{{\thesubsection}}{2pt}{}  %subsection format
\titlespacing{\subsection}{10pt}{0.4\baselineskip}{0.4\baselineskip}

\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.35} 
% \setstretch{1.78889} % 设置行间距
% \setstretch{1.5} % 设置行间距

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     页眉页脚
\RequirePackage{fancyhdr}  %数学  页眉页脚
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptername\, #1}{}}
% \renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\headrule}{\color{structurecolor}\hrule width\headwidth height\headrulewidth \vskip-\headrulewidth}
\renewcommand{\headrulewidth}{0.3pt}
\fancyhead[R]{\color{structurecolor}\small\kaishu\leftmark}
% \fancyhead[CE]{\zihao{5} \songti 浙江工业大学}   
% \fancyfoot[L]{From: K. Grant}
% \fancyfoot[C]{To: Dean A. Smith}
\fancyfoot[C]{\thepage}
% \renewcommand{\footrulewidth}{2pt}
