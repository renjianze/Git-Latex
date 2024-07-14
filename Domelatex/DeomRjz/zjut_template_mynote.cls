%%=============================================================================
%% xmu-thesis-grd.cls for Xiamen University Graduate Thesis
%% modified by Maozhong Fu
%% Version: 2023.1
%% Last update: 2023/2/1
%% Based on BIT-thesis at https://github.com/BIT-thesis/LaTeX-template
%%==============================================================================
%%所需要的包

%  文档说明        加载文档
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{zjut_template}[2021/12/28 v1.2 xmu-thesis-grd document class]
\newif\ifxmu@istwoside\xmu@istwosidetrue
%\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\ifxmu@istwoside
	\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
	\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 需要的包    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{pdfpages}
%\RequirePackage{hyperref}
\RequirePackage{setspace}
%\RequirePackage{graphicx}
\RequirePackage{fontspec}
%\RequirePackage{fancyhdr}
\RequirePackage[%
	paper = a4paper,%
	%top = 3.1cm,%
     top = 2.8cm,%
	bottom = 3cm,%
	left = 2cm,%                %% 左右加宽一点  修改 by任建泽  20230831
	right = 2cm,%
	headsep = 0.54cm,% 
	footskip = 1.2cm%
	]{geometry}

%\RequirePackage{titlesec}%标题定制1
%\RequirePackage{titletoc}%标题定制2
%\RequirePackage{caption2}%标题定制3

\RequirePackage{zhnumber}            %转中文
\RequirePackage{amssymb,amsmath,amsthm,amsfonts,bm,xfrac,fancyhdr}  %数学  页眉页脚
\RequirePackage{ulem,graphicx}        %图片
\RequirePackage{titlesec,titletoc,scrextend}                 %标题
\RequirePackage[titles,subfigure]{tocloft}                   %标题
%\RequirePackage[square,super,comma,sort,compress]{natbib}
%\RequirePackage[CJKbookmarks=true]{hyperref}
\RequirePackage{caption}
\RequirePackage[square,super,comma,sort,compress]{natbib} %原始的格式 文后参考文献有编号 但引文不是作者年份的形式
%\RequirePackage[authoryear,round,semicolon,sort]{natbib}   %作者年份形式 但参考文献没有编号
\RequirePackage[colorlinks,linkcolor=black,anchorcolor=blue,citecolor=black,bookmarksnumbered=true,bookmarksopen=true]{hyperref}
\RequirePackage[sort&compress]{gbt7714}             %gbt7714标准参考文献标准
\bibliographystyle{gbt7714-numerical}               %引用方式为数字引用

%%%%图标测试过的
\RequirePackage[list=off]{bicaption}        %%选项list值为off   在插图目录中就只显示第一个标题        
\RequirePackage[bf]{subfigure}             %%[bf]选项表示加粗
\RequirePackage{float}                     %设置图片浮动位置的宏包
\RequirePackage{multirow}
\RequirePackage{array}         
\RequirePackage{booktabs} 

\usepackage{makecell} 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   绘制封面  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makecover{

	\setstretch{1.78889} % 设置行间距
	\newpage
	\cleardoublepage
	\thispagestyle{empty}
	\pdfbookmark[0]{封面}{cover}

	
		\begin{figure}[htb!]                   %%学校logo
		\centering
		{\centering\includegraphics[trim={0 0 0 0},clip]{mypdf/zjutlog.pdf}}
		\end{figure}
	
	    \begin{center}                                        %论文和标题
		{\heiti \zihao{0} 硕士学位论文}\\
		\vspace{60pt}
		{\heiti \zihao{3} 4PPR柔性并联机构静力学建模和控制方法研究}	
		
		\vspace{100pt}
	    % \bfseries                        %%    封面信息加粗
           \kaishu\zihao{3}                      %姓名信息
			\begin{tabular}{r p{3mm} c}
			作 者 姓 名    &  & 任~~~~建~~~~泽
			\\
			指导教师      &  & 姚建华\quad 教\quad 授
			\\
			第二导师 &  & 张~~~~驰\quad 研~~究~~员
			\\
			学科专业 &  & 机~~~~械
			\\
				学位类型  &  & 专业硕士
			\\
			培养类别  &  &  全日制专业学位硕士
			\\  
			所在学院  &  &  机械工程学院
		\end{tabular}

	\end{center}
	 \vspace{30pt}
     {\bfseries \kaishu\zihao{3}
     \setlength{\parindent}{220pt}  \par 提交日期：2023年06月}
    \setstretch{1.3541667} % 设置行间距       这里要重新定义行距        %%把行距改回来
	

}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     封面之后重新设置行距    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\baselinestretch}{1.3541667}          % 行距 定义了基于word的1.25倍行距    单倍行距=字号*1.3  latex单倍行距 = 字号*1.2
\renewcommand{\baselinestretch}{1.35} 
\zihao{-4}
\setlength{\parindent}{4em}      %%段落首行缩进
\setlength{\parskip}{0em}        %%段落间距0 0表示段落距=行间距
\setlength\cftbeforechapskip{0em}
%\renewcommand{\arraystretch}{0.8}                   % 定义公式间距
%\addtolength{\bibsep}{-0.5em}               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 中英文摘要  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  摘要
\newcommand\keywords[1]{\def\value@keywords{#1}}   %中文关键字
\newcommand\ekeywords[1]{\def\value@ekeywords{#1}} %英文关键字
%% 中文摘要
%中文
\newenvironment{cabstract}{%
   % \pagestyle{xmu@empty}%
  %  \fancyfoot{}%
 
  \phantomsection
  \addcontentsline{toc}{chapter}{摘\quad 要}  %加入目录
    \begin{center}%
       {\heiti\zihao{3}\textbf{摘~~~~要}}%
   \end{center}
    \vspace{1bp}%
   \par%
}{%
    \par%
    \vspace{3bp}%
    \noindent%
   {\heiti\zihao{-4} \textbf{关键词：}}\value@keywords%
    

    \newpage
    %\cleardoublepageKeepPageNum
}

%英文                      摘要格式
\newenvironment{eabstract}{%
  %  \pagestyle{xmu@empty}%                             不要在定义摘要的时候设置页眉页脚    这里的页眉页脚不一样
  
   % \fancyfoot{}%	
   \phantomsection
  \addcontentsline{toc}{chapter}{ABSTRACT}  %加入目录
    
    \begin{center}%
       {\zihao{3}{ABSTRACT}}%
    \end{center}
    \vspace{12bp}%
    \par%
}{%
    \par%%
    \vspace{12bp}%
    \noindent%
    {\zihao{-4}\textbf{KEY WORDS:}}\value@ekeywords%
    
    
     
     
   % \cleardoublepageKeepPageNum
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  中英文字体 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置中文字体
	\let\songti\relax              %让宋体休息  重新定义中文字体格式
	\let\heiti\relax
	\let\kaishu\relax
	\newCJKfontfamily\songti{SimSun.ttc}[AutoFakeSlant,AutoFakeBold={2}]
	\newCJKfontfamily\kaishu{SimKai.ttf}[AutoFakeSlant,AutoFakeBold={2}]
	\newCJKfontfamily\heiti{SimHei.ttf}[AutoFakeSlant,AutoFakeBold={2}]
	\setCJKmainfont{SimSun.ttc}[AutoFakeSlant,AutoFakeBold={2}]
%% 设置英文字体         
	\RequirePackage{xltxtra} % \XeTeX Logo
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setmonofont{Times New Roman}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%设置目录的点的格式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\zjut@content@dot}{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}
%****************************************%%%%%%%%%%%              多级标题重定义    ************%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%章节样式｛Chapter、Section、Subsection｝             设置了目录页的格式  
%****************************************       
%%                                 define chapter style                 %%目录样式需要重新设置
\titleformat{\chapter}[hang]{\centering \heiti \zihao{3} } {第\zhnumber{\thechapter}章} {0.5em}{}{}
\titlespacing{\chapter}{0pt}{0.25\baselineskip}{0.8\baselineskip}
%\titlecontents{chapter}[4em]{\bfseries \hspace{0pt}}{\contentslabel{4em}}{\hspace*{-4em}}{~\titlerule*[0.4pc]{$·$}~\contentspage}
% \titlecontents{chapter}[4em]{\heiti \vspace{-1pt}}{\contentslabel{4em}}{\hspace*{-4em}}{~\titlerule*[0.3pc]{$·$}~\contentspage}
\titlecontents{chapter}[4em]{\heiti \vspace{-1pt}}{\contentslabel{4em}}{\hspace*{-4em}}{\zjut@content@dot}

%%                                 define section style
\titleformat{\section}[hang]{ \heiti \zihao{4} } { \thesection} {0.5em}{}{}
\titlespacing{\section}{0pt}{0.8\baselineskip}{0.4\baselineskip}
% \titlecontents{section}[4em]{ \hspace{0pt}}{\contentslabel{2em}}{\hspace*{2em}}{~\titlerule*[0.3pc]{$·$}~\contentspage}
\titlecontents{section}[4em]{ \hspace{0pt}}{\contentslabel{2em}}{\hspace*{2em}}{\zjut@content@dot}

%%                                 define subsection style
\titleformat{\subsection}[hang]{ \heiti \zihao{-4} } { \thesubsection} {0.5em}{}{}
\titlespacing{\subsection}{0pt}{0.8\baselineskip}{0.4\baselineskip}
% \titlecontents{subsection}[6.5em]{ \hspace{0pt}}{\contentslabel{2.5em}}{\hspace*{2em}}{~\titlerule*[0.3pc]{$·$}~\contentspage}
\titlecontents{subsection}[6.5em]{ \hspace{0pt}}{\contentslabel{2.5em}}{\hspace*{2em}}{\zjut@content@dot}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   页眉页脚设置 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \pagestyle{fancy}
  \fancyhead[CO]{\zihao{5} \songti 滑模控制的记录以及一些应用 }      %奇数页
  \fancyhead[LO]{}
  \fancyhead[RO]{}
 \fancyhead[CE]{\zihao{5} \songti 浙江工业大学}                       %偶数页
  \fancyhead[LE]{}
  \fancyhead[RE]{}
  
  \fancypagestyle{plain}{                          %%目录页和章节页自动调用了plain，设置plain为fancy      如果目录不加就在章节设置
		\pagestyle{fancy}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%图表样式设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figures/Fig_P1}{figures/Fig_P2/}{figures/Fig_P3/}{figures/Fig_P4/}{figures/Fig_P5/}}            %表入径
 
\newcommand{\figref}[1]{图\ref{#1}} %重定义图引用
\newcommand{\tabref}[1]{表\ref{#1}} %重定义表引用
\newcommand{\equref}[1]{式(\ref{#1})} %重定义表引用
\renewcommand {\thefigure} {\thechapter{}-\arabic{figure}}                     %设置了图的标题样式
\captionsetup[figure][bi-first]{labelformat=simple,name=图,labelsep=space,font={bf,small}}
\captionsetup[figure][bi-second]{name=Fig,labelsep=period,font={bf,small},font={bf,small}} 
\captionsetup[figure]{labelformat=simple,name=图,labelsep=space,font=bf,justification=centering}

\renewcommand {\thetable} {\thechapter{}-\arabic{table}}                        %设置了表的标题样式
\captionsetup[table][bi-first]{labelformat=simple,name=表,labelsep=space,font={bf,small}}
\captionsetup[table][bi-second]{name=Table,labelsep=period,font={bf,small}} 

\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}                  %设置了公式编号样式


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%图表目录样式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置图索引样式
\titlecontents{figure}[0em]{ \hspace{0pt}}{\parbox[t]{1.55cm}{\figurename~\thecontentslabel}}{\hspace*{2em}}{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}
\titlecontents{table}[0em]{ \hspace{0pt}}{\parbox[t]{1.55cm}{\tablename~\thecontentslabel}}{\hspace*{2em}}{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}
% \titlecontents{figure}[1em]{\songti\zihao{-4}}
% 	{\parbox[t]{1.55cm}{\figurename~\thecontentslabel}}{\hspace*{-1.5cm}}
% 	{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}

% %% 设置表索引样式
% \titlecontents{table}[1em]{\songti\zihao{-4}}
% 	{\parbox[t]{1.55cm}{\tablename~\thecontentslabel}}{\hspace*{-1.5cm}}
% 	{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%插图表格名称重定义
\renewcommand\contentsname{目录}            %目录标题
\renewcommand\listfigurename{插图目录}      %插图目录
\renewcommand\listtablename{表格目录}       %表格目录
\renewcommand\refname{参考文献}             %参考文献
% \renewcommand\indexname{索引}              %索引
% \renewcommand\figurename{图}               %图名？？  之前设置过了
% \renewcommand\tablename{表}                %之前设置过了
% \renewcommand\abstractname{摘要}           %摘要，没必要在这里设置
% \renewcommand\partname{部分}               %没用
% \renewcommand\appendixname{附录}           %不用这么设置
% \renewcommand\today{\number\year年\number\month月\number\day日} 







\let\cleardoublepage\clearpage 



%% 定义了xmu的styly
%定义新的pagestyle
\def\ps@xmu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfill\small\thepage\hfill}%
  \let\@evenfoot=\@oddfoot
}

\def\ps@xmu@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddhead{
       \vbox{
       \hb@xt@\textwidth{\hfill\small\value@title\hfill} %
       \vskip5pt
       \hbox{\vrule width\textwidth height0.4pt depth0pt}
        }
        }
  \def\@evenhead{
       \vbox{
       \hb@xt@\textwidth{\hfill\small\leftmark\hfill}
       \vskip5pt
       \hbox{\vrule width\textwidth height0.4pt depth0pt}
       }
       %\hbox{\vrule width\textwidth height0.4pt depth0pt}
       }

  \def\@oddfoot{\hfill\small\thepage\hfill}%
  \let\@evenfoot=\@oddfoot
  }

\def\ps@xmu@headings{%
  \def\@oddhead{\vbox to\headheight{%
      \hb@xt@\textwidth{\hfill\small\songti\leftmark\hfill}%
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@evenhead{\vbox to\headheight{%
      \hb@xt@\textwidth{\small\songti%
      \value@title%
      \hfill\leftmark\fi\hfill}%
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@oddfoot{\hfil\small\thepage\hfil}
  \let\@evenfoot=\@oddfoot}



\newcommand \cleardoublepageKeepPageNum{
	\relax 
	\clearpage 
	\if@twoside 
		\ifodd\c@page
			\relax
		\else 
			\thispagestyle{plain}% 		
			\cfoot{\small\thepage}	
			{ \ }
			\newpage
		\fi
	\fi}


%%%%%%%%%%%%%%%%%%%自定义命令  2023 /2/5

\newcommand{\seqution}[2]{             %%单行公式
    \begin{equation}
        #1
        \label{#2}
    \end{equation}
}

\newcommand{\barraytt}[4]{             %2*2小矩阵
  \begin{bmatrix}
  #1 & #2  \\
  #3 & #4  
  \end{bmatrix}}


  \newcommand{\barrayto}[2]{             %2*1小矩阵 用于攥写 2*1大写母的  比较好的
    \begin{bmatrix}
      \\[-1.45em]
      \dfrac{FL^2}{EI}\\[0.8em]
      \dfrac{FL^2}{EI} \\
     \\[-1.45em]
     \end{bmatrix}
  }


  % \newcommand{\barrayto}[2]{             %不太好的
  % \left[\begin{array}{cc}
  %   \\[-0.9em]
  % #1 \\ [0.9em]
  % #2 
  % \\[0.9em]
  % \end{array}\right]}


  % \newcommand{\barraytt}[4]{             %2*2小矩阵
  % \left[ \hspace{-0.1em}\begin{array}{cc}
  % #1 & #2 \\
  % #3 & #4
  % \end{array}\hspace{-0.1em}\right]}