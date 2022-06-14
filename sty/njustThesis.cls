%%%%% ==========================================================================================
%%
%%     This is file `njustThesis.cls'
%%     
%%%%% ==========================================================================================
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%%%% ==========================================================================================
%%%%% ******************************** Version Information *************************************
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sty/njustThesis}[2022/02/22 v2.2.2 Document Class for the Degree Papers of NJUST]
%%%%% ==========================================================================================
%%%%% ******************************** Declare Options *****************************************
%% end-user parameters, each option is declared by one declare option command
% turn on/off Copyright
\newif\ifNJUST@typeinfo\NJUST@typeinfotrue
\newif\ifNJUST@typeinfo\NJUST@typeinfofalse
\DeclareOption{draftinfo}{\NJUST@typeinfotrue}
\DeclareOption{notypeinfo}{\NJUST@typeinfofalse}
%% 把没有定义的选项传递给底层的文档类，在这里为ctexbook。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
%% terminates all options processing
\ProcessOptions\relax
%%%%% ==========================================================================================
%%%%% ******************************** LoadClass Information ***********************************
\LoadClass[a4paper, zihao=-4, UTF8, AutoFakeBold]{ctexbook}
%%%%% ==========================================================================================
%%%%% ******************************** Package Information *************************************
%% page packages
\RequirePackage{fancyhdr}
\RequirePackage{lastpage,geometry,titlesec}
%% math packages(amsthm)
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,wasysym}
%% graphics packages
\RequirePackage{graphicx,float,psfrag,flafter,subfigure} 
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
\RequirePackage{tabularx}
\RequirePackage{makeidx}
\RequirePackage{glossaries}
\RequirePackage{ifthen}
\RequirePackage[perpage,symbol*]{footmisc}
%%%%% ==========================================================================================
%%%%% ********************************* Load *.Cfg *********************************************
\input{sty/njustThesis.cfg}
%%%%% ==========================================================================================
%%%%% ******************************** Page Layout *********************************************
%% 行间距，对不同尺寸的字体都会按同样的比例因子1.38放大行间距，使得全文排版能协调一致。
\renewcommand*{\baselinestretch}{1.38}
\oddsidemargin 0 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 0 true cm
\fi
\textheight 24 true cm
\textwidth 16 true cm
\topmargin -0.6 true cm
\headheight 15pt
\footskip 32 pt
%%%%% ==========================================================================================
%%%%% ****************************** Some Style Control Commands *******************************
%%
%% redefine \cleardoublepage to handle both one-side and two-side modes
\def\cleardoublepage{%
  \clearpage%
  \if@twoside%
    \ifodd\c@page%
      % do nothing
    \else%
      \thispagestyle{empty}%
      \hbox{}%
      \newpage%
      \if@twocolumn%
        \hbox{}%
        \newpage%
      \fi%
    \fi%
  \fi}%
%% space used in items title
\newcommand\NJUSTspace{\protect\quad\protect\quad}
%% underline
\def\NJUST@underline[#1]#2{%
  \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\NJUSTunderline{\@ifnextchar[\NJUST@underline\CJKunderline}
%%%%% ==========================================================================================
%%%%% **************************** Chinese Title-page Items ************************************
%% predefine all the items which will be used later
%%%%% ------------------------------------------------------------------------------------------
%% header
\newcommand\classification[1]{\def\NJUST@value@classification{#1}}
\newcommand\UDC[1]{\def\NJUST@value@UDC{#1}}
\newcommand\UDCfootnote[1]{\def\NJUST@value@UDCfootnote{#1}}
\newcommand\confidential[1]{\def\NJUST@value@confidential{#1}}
%%%%% ------------------------------------------------------------------------------------------
%% title & author
\renewcommand\title[2][\NJUST@value@title]{%
  \def\NJUST@value@title{#2}
  \def\NJUST@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\NJUST@value@author{#1}}
\newcommand\titleUpp[1]{\def\NJUST@value@titleUpp{#1}}
\newcommand\titleLow[1]{\def\NJUST@value@titleLow{#1}}
%%%%% ------------------------------------------------------------------------------------------
%% advisor & others
\newcommand\advisor[1]{\def\NJUST@value@advisor{#1}}
\newcommand\advisortitle[1]{\def\NJUST@value@advisortitle{#1}}
\newcommand\coadvisor[1]{\def\NJUST@value@coadvisor{#1}}
\newcommand\coadvisortitle[1]{\def\NJUST@value@coadvisortitle{#1}}
\newcommand\degree[1]{\def\NJUST@value@degree{#1}}
\newcommand\major[1]{\def\NJUST@value@major{#1}}
\newcommand\interest[1]{\def\NJUST@value@interest{#1}}
\newcommand\school[1]{\def\NJUST@value@school{#1}}
%%%%% ------------------------------------------------------------------------------------------
%% about date 
\newcommand\submitdate[1]{\def\NJUST@value@submitdate{#1}}
%%%%% ==========================================================================================
%%%%% ******************************* Make Chinese Title-page **********************************
%% 1. cover page
\renewcommand*{\maketitle}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
%%%%% header------------------------------------------------------------------------------------
    \songti\zihao{5}\NJUST@label@classification~
	\NJUSTunderline[150pt]{\NJUST@value@classification}
		\hfill
	\NJUST@label@confidential~
	\NJUSTunderline[150pt]{\NJUST@value@confidential}\hspace{1.4cm}
   	\vskip 10pt
   	 \NJUST@label@UDC~
      	\NJUSTunderline[143pt]{\NJUST@value@UDC}
            \hfill
      	\NJUSTunderline[0pt]{}
    \vskip 10pt
%%%%% logo--------------------------------------------------------------------------------------
    \parbox[c][4cm][c]{\textwidth}{%
        \centering
        \includegraphics[width=14cm]{img/logo/njust.eps}
    }%
%%%%% title & author----------------------------------------------------------------------------
    \vskip 10pt
        {\bf\kaishu\zihao{-0}\NJUST@label@thesis}
    \vskip \stretch{2}
      {\vskip 10pt 
      \bf\heiti\zihao{-1}\NJUSTunderline[390pt]{~\NJUST@value@titleUpp~}
      \vskip 10pt
                                \NJUSTunderline[390pt]{~\NJUST@value@titleLow~}} \\
      \songti\zihao{-4}{\NJUST@label@titleLab}
    \vskip \stretch{2}
      {\bf\kaishu\zihao{-2}\NJUSTunderline[180pt]{~\NJUST@value@author~}} \\
      \hspace{0.15cm}\songti\zihao{-4}{\NJUST@label@authorLab}
    \vskip \stretch{2}
%%%%% advisor and others------------------------------------------------------------------------
	\normalfont\songti\zihao{4}
	\def\tabcolsep{1pt}
	\def\arraystretch{1.25}
	\begin{tabular}{cc}
      \bf\NJUST@label@advisor   &  \NJUSTunderline[299pt]{{\bf\kaishu\zihao{3}\NJUST@value@advisor} \hspace{4pt} {\kaishu\zihao{4}\NJUST@value@advisortitle}}  \\
      \bf\NJUST@label@coadvisor & \NJUSTunderline[299pt]{{\bf\kaishu\zihao{3}\NJUST@value@coadvisor} \hspace{4pt} {\kaishu\zihao{4}\NJUST@value@coadvisortitle}}  \\
      \bf\NJUST@label@degree    & \NJUSTunderline[299pt]{\bf\kaishu\zihao{3}\NJUST@value@degree}  \\
      \bf\NJUST@label@major    &  \NJUSTunderline[299pt]{\bf\kaishu\zihao{3}\NJUST@value@major}  \\
      \bf\NJUST@label@interest   & \NJUSTunderline[299pt]{\bf\kaishu\zihao{3}\NJUST@value@interest}  \\
      \bf\NJUST@label@submitdate & \NJUSTunderline[299pt]{\bf\rmfamily\zihao{3}\NJUST@value@submitdate}
	\end{tabular}
  \end{center}
%%%%% footnote----------------------------------------------------------------------------------
  \vspace{2em}
  \NJUST@value@UDCfootnote
  \cleardoublepage
}
%%%%% ==========================================================================================
%%%%% **************************** Make Statement Title-page ***********************************
%% 1. statement
\thispagestyle{empty}
\newcommand\statement[1]{%
  \vskip -5pt
    \parbox{\textwidth}{\centering\bf\songti\zihao{3}\NJUST@label@statement}
  \vskip 13pt
    \parbox{\textwidth}{\normalfont\zihao{4}\renewcommand{\baselinestretch}{1.6}\hspace{2em}\zihao{4}#1}
  \vskip 1.8cm
    \parbox{\textwidth}{\noindent{}\zihao{4}\NJUST@label@authorsign\hspace{3.5cm}\NJUST@label@signdate}
  \vskip 4.45cm
}%
%% 2. accredit
\newcommand\accredit[1]{%
    \parbox{\textwidth}{\centering\bf\songti\zihao{3}\NJUST@label@accredit}
  \vskip 1.6cm
    \parbox{\textwidth}{\normalfont\zihao{4}\renewcommand{\baselinestretch}{1.6}\hspace{2em}\zihao{4}#1}%
  \vskip 1.8cm
    \parbox{\textwidth}{\noindent{}\zihao{4}\NJUST@label@authorsign\hspace{3.5cm}\NJUST@label@signdate}%
}%
\clearpage
\if@twoside
    \thispagestyle{empty}
\cleardoublepage
\fi
%%%%% ========================================================================================== 
%%%%% ********************************** Page Setting ******************************************
%% set page style by fancyhdr:
  %% The syntax is: \fancyhead[selectors]{output you want}
  %% E Even page
  %% O Odd page
  %% L Left field
  %% C Center field
  %% R Right field
  %% H Header
  %% F Footer
  %% so [CE,RO] will refer to the center of the even pages and to the right side of the odd pages.
%% configure fancy style
\newcommand\pageDegree[1]{\def\NJUST@value@pageDegree{#1}}
%% change page NO to Roman only for frontmatter 
\renewcommand\frontmatter{\pagenumbering{Roman}}
%%
\fancypagestyle{plain}{
  \fancyhf{}
  %\fancyfoot[R]{\songti\zihao{-5} ~{\thepage}~}
  %\renewcommand{\headrulewidth}{0pt}%
  %\renewcommand{\footrulewidth}{0pt}%
  \fancyhead[LO]{\songti\zihao{-5}\NJUST@value@pageDegree}
  \fancyhead[RO]{\songti\zihao{-5}\NJUST@value@titlemark}
  \fancyhead[LE]{\songti\zihao{-5}\leftmark}
  \fancyhead[RE]{\songti\zihao{-5}\NJUST@value@pageDegree}
  \fancyfoot[RO,LE]{\zihao{-5} ~\thepage~}
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead{} % clear all fields
\fancyhead[LO]{\songti\zihao{-5}\NJUST@value@pageDegree}
\fancyhead[RO]{\songti\zihao{-5}\NJUST@value@titlemark}
\fancyhead[LE]{\songti\zihao{-5}\leftmark}
\fancyhead[RE]{\songti\zihao{-5}\NJUST@value@pageDegree}
\fancyfoot[RO,LE]{\zihao{-5} ~\thepage~}
%%%%% ==========================================================================================
%%%%% **************************** Make Abstract & Keywords ************************************
%% 1. CHN abstract
\newenvironment{abstract}
  {{\centering\Nchapter{\NJUST@label@abstract}}}
  {}
%% 2. CHN kewords
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\bf\songti\zihao{4} \NJUST@label@keywords} #1}
%% 3. Eng abstract
\newenvironment{englishabstract}
  {{\centering\Nchapter{\NJUST@label@englishabstract}}}
  {}
%% 4. Eng keywords
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf\songti\zihao{4} \NJUST@label@englishkeywords} #1}
%%
%% 5. other settings
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1mu\bm{\bm\cdot}\mkern 1mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}%
%%%%% ==========================================================================================
%%%%% *********************************** Make Contents ****************************************
%% 
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    {\centering\chapter*{\contentsname}}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\addtocontents{toc}{\let\string\quad\relax}
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi
}
%%%%% ==========================================================================================
%%%%% *********************************** Make Environments ************************************
%% 0. list of figures, tables and bibtex
%% seperately
\renewcommand*\listoffigures{%
  {\centering
  \chapter*{\listfigurename}%
  \@mkboth{\MakeUppercase\listfigurename}%
          {\MakeUppercase\listfigurename}%
  \@starttoc{lof}%% list of figures
  }
}
%%
\renewcommand*\listoftables{%
  {\centering
  \chapter*{\listtablename}%
  \@mkboth{\MakeUppercase\listtablename}%
          {\MakeUppercase\listtablename}%
  \@starttoc{lot}%% list of tables
  }
}
%% figure and table
\newcommand*\listoffiguresandtables{%
  {\centering
  \chapter*{\NUST@listfiguresandtablesname}%
  \@mkboth{\MakeUppercase\NUST@listfiguresandtablesname}%
          {\MakeUppercase\NUST@listfiguresandtablesname}%
  \@starttoc{lof}%% list of figures
  \bigskip       %% space
  \@starttoc{lot}%% list of tables
  }
}
%% 1. symbol
%\newenvironment{symbolname}
%  {\Nchapter{\NJUST@label@symbolname}}
%% 2. bibliography
\renewenvironment{thebibliography}[1]
     {\Nchapter{\centering\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
%% 3. publications
\newenvironment{publications}[1]
     {{\centering\Nchapter{\NJUST@label@publications}}%
      \@mkboth{\MakeUppercase\NJUST@label@publications}
              {\MakeUppercase\NJUST@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \itemindent -1.5em
            \setlength{\itemsep}{5pt}
	   		\setlength{\parsep}{0pt}
	   		\setlength{\parskip}{0pt}       
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
%% 4. thanks
\renewenvironment{thanks}
  {{\centering\Nchapter{\NJUST@label@thanks}}}
  {}
%%%%% ==========================================================================================
%%%%% ******************************* Public Vars For Thesis ***********************************
\newcounter{nlgcounter} 
\newenvironment{nlglist}{%
\begin{list}{{(\arabic{nlgcounter})}} %
    {
     \usecounter{nlgcounter}
     \setlength{\leftmargin}{0cm}   
     \setlength{\parsep}{\parskip}    
     \setlength{\topsep}{1ex}        
     \setlength{\itemsep}{0.4ex plus 0.5ex}        
     \setlength{\labelsep}{0.3em}     
     \setlength{\itemindent}{46pt}    
     \setlength{\listparindent}{27pt} 
    }}
{\end{list}}  
\renewcommand{\labelenumi}{(\theenumi)}
\endinput
%%%%% ==========================================================================================
%% End of file `njustThesis.cls'.
%%%%% ==========================================================================================