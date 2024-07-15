%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    必要说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[2024/5/10]                                           
\ProvidesClass{DemoRjz}[2024/5/10 v1.0.1 rjz document class]
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     包放这里%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{kvoptions} 
\RequirePackage{etoolbox}
\RequirePackage{indentfirst}     
\RequirePackage{amssymb,amsmath,amsthm,amsfonts,bm,xfrac}                                  %数学类宏包

\RequirePackage{cite}


% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}                                                           %文档继承项

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         键值族名%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 定义的键值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption[ctexfont]{chinesefont}
\DeclareStringOption[cn]{lang}
\DeclareStringOption[normal]{device}
\DeclareStringOption[hang]{titlestyle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%键值的选项            并传递选项 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    中文类ctex 并设置字体，未完成%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%v  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \ifdefstring{\ELEGANT@lang}{cn}{ 
  % \RequirePackage[UTF8, scheme=plain, fontset=none]{ctex}
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
  

      
%% 设置英文字体         
  \RequirePackage{xltxtra} % \XeTeX Logo
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Times New Roman}
  \relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                    纸张大小设置  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 关键字  常用名称%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdefstring{\ELEGANT@lang}{cn}{
%   \renewcommand{\baselinestretch}{1.3}
    \renewcommand{\contentsname}{目~录}   %重命名目录
    % \renewcommand{\contentsname}{\textcolor{structurecolor}{\Large\bfseries 目~录}}
%   \renewcommand{\figurename}{图}
%   \renewcommand{\tablename}{表}
%   \renewcommand{\partname}{\color{structurecolor}}
%   \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
%   \renewcommand{\listfigurename}{插图目录}
%   \renewcommand{\listtablename}{表格目录}
%   \renewcommand{\bibname}{参考文献}
%   \newcommand{\ebibname}{参考文献}
    \renewcommand{\appendixname}{附录}
    \renewcommand{\chaptername}{第~\zhnumber{\thechapter}~章}
    \newcommand{\chinesechapter}[1]{第~\zhnumber{#1}~章}        %%设置目录章节的标签名
%   \renewcommand{\appendixtocname}{附录}
%   \renewcommand{\indexname}{索\hspace{2em}引}
%   \newcommand\figref[1]{\textbf{图}~\ref{#1}}
%   \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
   \newcommand{\citshape}{\kaishu}
   \newcommand{\cnormal}{\kaishu}
   \newcommand{\authorname}{\citshape 作者：}
   \newcommand{\institutename}{\citshape 组织：}
   \newcommand{\datename}{\citshape 时间：}
   \newcommand{\versionname}{\citshape 版本：}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          颜色定义 未完成  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[table]{xcolor}
\RequirePackage{makecell}
\definecolor{structurecolor}{RGB}{60,113,183}%       蓝色主色
\definecolor{myorange}{RGB}{255,134,24}%  
\definecolor{mygreen}{RGB}{0,166,82}%  
\definecolor{myorange1}{RGB}{230,90,7}%  
\definecolor{mypurple}{RGB}{138,43,226}%  
\definecolor{myorange2}{RGB}{255,128,0}%
\definecolor{myred}{RGB}{255,69,0}%
\definecolor{mybule}{RGB}{51,169,201}%
\definecolor{myred1}{RGB}{255,210,230}%
\definecolor{myred2}{RGB}{186,105,200}%
\definecolor{mycover}{RGB}{135,200,235}%

\newcommand{\setchaptercolor}{\color{structurecolor}}  %% 三级标题的颜色设置
\newcommand{\setsectioncolor}{\color{myorange}}
\newcommand{\setsubsectioncolor}{\color{mygreen}}
\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 章节设置 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \RequirePackage[titles]{tocloft}         % #################
\usepackage{hyperref}                    % #################
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}
\RequirePackage{apptools}
\RequirePackage{titletoc}   %% 这个可以设置目录和章节样式

\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

\ifdefstring{\ELEGANT@lang}{cn}{\newcommand{\xchaptername}{第\zhnumber{\thechapter}章}}{\relax}
\ifdefstring{\ELEGANT@lang}{en}{\newcommand{\xchaptername}{第{\thechapter}章}}{\relax}


\titleformat{\chapter}[hang]{\setchaptercolor\centering \bfseries \zihao{-2} }  %chapter format
{{\IfAppendix{\appendixname\;\thechapter\;}{\xchaptername}}}{0.5em}{}[]
\titlespacing{\chapter}{0pt}{0.25\baselineskip}{0.8\baselineskip}
\relax

\titleformat{\section}[hang]{ \setsectioncolor\large\bfseries\filright}{{\thesection}}{2pt}{}  % section format
\titlespacing{\section}{0pt}{0.5\baselineskip}{0.4\baselineskip}
\relax

\titleformat{\subsection}[hang]{ \setsubsectioncolor\large\bfseries\filright}{{\thesubsection}}{2pt}{}  %subsection format
\titlespacing{\subsection}{20pt}{0.4\baselineskip}{0.4\baselineskip}
\relax

\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.56}     %% 开始document之后立即执行
\AtBeginDocument{
        \zihao{-4}
        \setlength\parindent{2\ccwd}
      }
      \relax    
% \setstretch{1.78889} % 设置行间距
% \setstretch{1.5} % 设置行间距

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     页眉页脚    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}  %  页眉页脚
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
\fancyfoot[C]{\thepage}\relax
% \renewcommand{\footrulewidth}{2pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    目录  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocloft}
\newcommand{\zjut@content@dot}{\hspace{.5em}\titlerule*[0.5pc]{\zihao{-4} \normalfont{.}} {\normalfont \zihao{-4} \thecontentspage}}
\newcommand{\zjut@content@dott}{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont} {\normalfont \zihao{-4} \bfseries\thecontentspage}}

\renewcommand{\cfttoctitlefont}{\hfill\Huge\bfseries\centering\color{structurecolor}}
\renewcommand{\cftaftertoctitle}{\hfill}   %% 居中

\setcounter{tocdepth}{2}
\titlecontents{section}[4em]{ \hspace{0pt}\vspace{0.2em}}{\contentslabel{2em}}{\hspace*{2em}}{\zjut@content@dot}
\titlecontents{subsection}[5em]{ \hspace{0pt}\vspace{0em}}{\contentslabel{2em}}{\hspace*{2em}}{\zjut@content@dot}

\titlecontents{chapter} % 适用于章节
  [1em] % 缩进量
  {\bfseries \songti} % 章节标题的字体
  % { \thecontentslabel \hspace{2pt}}%
   {\ifnum\value{chapter}>0 附~录~\thecontentslabel \else \chinesechapter{\thecontentslabel} \fi \hspace{2pt}}%
  % {\iftoggle{appendix}{附~录~\thecontentslabel}{\chinesechapter{\thecontentslabel}} \hspace{2pt}} % 章节编号前的额外内容
  {\hspace*{2em}} % 章节编号前的额外内容
  {\zjut@content@dott} % 章节标题和页码之间的分隔符






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  目录222



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   封面  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reference: 
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\RequirePackage{graphicx} % 用于插入图片
\RequirePackage{mwe}
\RequirePackage{stackengine}
\graphicspath{{Figure/Cover/}{Figure/Sys/}{Figure/User/}}      %%设置图片的路径

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

\title{\LaTeX 模板\_电工实习错题集}
\subtitle{自定义\LaTeX 模板 }
\author{任建泽}
\date{中国科学院宁波材料技术与工程研究所 2024/7/14}
\institute{浙江工业大学 \&  宁波材料技术与工程研究所}
\version{v1.0.0}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 这个命令可以设置封面的格式
\newcommand\makecover{
	% \setstretch{1.78889} % 设置行间距
	\newpage
	\cleardoublepage
	\thispagestyle{empty}
	\pdfbookmark[0]{封面}{cover}           %将封面也至于这个之中
  \newgeometry{margin = 0in}
  \parindent=0pt
		\begin{figure}[t]                   %%学校封面的图片
		\centering
		{\centering\includegraphics[trim={0 0 0 0},clip,width=\linewidth,height=0.5\textheight]{cover16.png}}
		\end{figure}
     
    % \colorbox{structurecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
    % \colorbox{mycover}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
    \noindent
    \colorbox{mycover}{%                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 标题所在位置
        \vspace{-2em}  \vspace{-2em}
        \makebox[\linewidth][c]{%
            \vspace{0.1em} % 可选：设置顶部间距
            \parbox[b][0.05\textheight][c]{\dimexpr\linewidth-2em}{% 
                \centering % 水平居中
                \textbf{\Huge \@title} % 设置文字内容和样式
                \vspace{0.3em} % 可选：设置底部间距
            }%
        }%
    }                 
    % \parbox{0.8\textwidth}{
    %   \vspace{1em}
    %   \hspace{2em}
    %   \bfseries\Huge  总部要求不是预估
    %     % \ifcsname @title\endcsname \@title \fi
    %   \par}         %%  标题设置

    \vspace{2em}
    \begin{minipage}[c]{0.67\linewidth}
        {\color{darkgray}\bfseries\Large
          \ifcsname @subtitle\endcsname \hspace{2em} \@subtitle\\[2ex]\fi}                 %%子标题
        \color{gray}\normalsize
        {
          % \renewcommand{\arraystretch}{1.618}
          \renewcommand{\arraystretch}{0.9668}
          \hspace{6em}
          % \begin{tabular}{l}
          %   %  \ifcsname @author\endcsname \authorname \@author\\\fi
          %   \ifx\@author\empty\else\authorname\cnormal\@author\\ \fi
          %   \ifcsname @institute\endcsname \institutename \cnormal\@institute\\ \fi         %% 机构
          %   % \ifcsname @date\endcsname  \@date\\\fi
          %   \ifx\@date\empty\else\datename\cnormal\@date \\ \fi                               %% 日期
          %   \ifcsname @version\endcsname \cnormal\versionname\@version\\ \fi                 %% 版本
          %   \ifcsname @bioinfo\endcsname \cnormal\@bioinfo\\ \fi                             %% 自定义
          % \end{tabular}}
          \begin{tabular}{l}
            \ifx\@author\empty\else  \authorname \cnormal \@author\\ \fi    %作者
            \ifcsname @institute\endcsname  \institutename \cnormal\@institute\\ \fi      %% 机构
            \ifx\@date\empty\else \datename\cnormal\@date \\ \fi                                 %% 日期
            \ifcsname @version\endcsname \cnormal\versionname\@version\\ \fi  \\                 %% 版本
            \ifcsname @bioinfo\endcsname  \cnormal\@bioinfo\\ \fi                             %% 自定义
          \end{tabular}}
    \end{minipage}

	  %   \begin{center}                                        %论文和标题
		% {\heiti \zihao{0} 硕士学位论文}\\
		% \vspace{60pt}
		% {\heiti \zihao{3} 4PPR柔性并联机构静力学建模和控制方法研究}		
		% \vspace{100pt}
	  %   % \bfseries                        %%    封面信息加粗
    %        \kaishu\zihao{3}                      %姓名信息
		% 	\begin{tabular}{r p{3mm} c}
		% 	作 者 姓 名    &  & 任~~~~建~~~~泽
		% 	\\
		% 	指导教师      &  & 姚建华\quad 教\quad 授
		% 	\\
		% 	第二导师 &  & 张~~~~驰\quad 研~~究~~员
		% 	\\
		% 	学科专业 &  & 机~~~~械
		% 	\\
		% 		学位类型  &  & 专业硕士
		% 	\\
		% 	培养类别  &  &  全日制专业学位硕士
		% 	\\  
		% 	所在学院  &  &  机械工程学院
		% \end{tabular}
    % \end{center}
	 \vspace{30pt}
     {\bfseries \kaishu\zihao{3}
     \setlength{\parindent}{220pt}  \par 提交日期：2024年05月}
    % \setstretch{1.3541667} % 设置行间距       这里要重新定义行距        %%把行距改回来
    \restoregeometry
}{\relax}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  后置包 放前面出现问题，三线表不显示线 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  功能包最好放在导言区
\RequirePackage{booktabs} 
\relax







 %% 导言区之后立即执行                                                       
 \AfterEndPreamble{    
                           
  }\relax           %%这里其实就是多余的，因为只对中文模板进行了设置









