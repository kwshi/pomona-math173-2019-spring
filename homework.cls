\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2018/12/26 Math 173 homework class]

\LoadClass[twoside]{article}

% load packages
%% basic packages
\RequirePackage[ascii]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}

%% for document setup
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titling}

%% fonts and text styles
\RequirePackage{lmodern}
\RequirePackage{parskip}

%% math
\RequirePackage{
  amsmath,
  amsthm,
  amssymb,
  amsfonts,
}
\RequirePackage{dsfont}
\RequirePackage{mathrsfs}
\RequirePackage{mathtools, thmtools}

\renewcommand{\mathbb}{\mathds}

%% utility packages
\RequirePackage{mdframed}
\RequirePackage{cancel}
\RequirePackage{lastpage}
\RequirePackage{multicol}
\RequirePackage{color}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{hyperref}
\RequirePackage{marginnote}
\RequirePackage{isomath}
\RequirePackage{centernot}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[inline]{enumitem}
\RequirePackage{fancyref}

% document setup
%% page dimensions
\geometry{
  top=.5in,
  bottom=.75in,
  right=1in,
  left=1in,
  headheight=3em,
  headsep=1em,
  marginparwidth=1.125in,
  marginparsep=.125in,
  includeheadfoot,
}

%% document metadata
\newcommand{\thecourse}{Math 173}
\newcommand{\theterm}{Spring 2019}
\newcommand{\thecoauthor}{}
\newcommand{\coauthor}[1]{\renewcommand{\thecoauthor}{#1}}
\newcommand{\homework}[1]{\newcommand{\thehomework}{#1}}

%% page decoration
\fancypagestyle{first}{
  \fancyhf{}
  \chead{
    \textbf{Homework \thehomework}\\
    {\small\textsc{\thecourse{} -- \theterm}}\\
    {\small\textsc{due at the beginning of class on \underline{\thedate}}}
  }
  \rhead{\mbox{\small\theauthor}\\\mbox{\small\thecoauthor}\\}
  \lhead{{\small\textsc{\thepage\ of \pageref{LastPage}}}\\\mbox{}\\}
  \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{rest}{
  \fancyhf{}
  \chead{\small\textsc{\thecourse{} -- \theterm}}
  \rhead{\small\theauthor}
  \lhead{\small\textsc{\thepage\ of \pageref{LastPage}}}
  \renewcommand{\headrulewidth}{0pt}
}

\pagestyle{rest}
\thispagestyle{first}

%% list styles
\setlist[enumerate, 1]{label=(\roman*)}

%% hyperlink styles
\hypersetup{
  colorlinks=true,
  urlcolor=blue!50!green,
  linkcolor=black,
}

%% mdframed styles
\mdfdefinestyle{solution}{
  skipabove=.5em,
  skipbelow=.5em,
}

\mdfdefinestyle{book}{
  hidealllines=true,
  backgroundcolor=lightgray!25,
  innertopmargin=.5em,
  innerbottommargin=.5em,
  skipabove=.5em,
  skipbelow=.5em,
}

\mdfdefinestyle{quote}{
  hidealllines=true,
  leftline=true,
  linecolor=lightgray!50,
  linewidth=.25em,
  innerrightmargin=0pt,
  rightmargin=0pt,
  skipabove=.5em,
  skipbelow=.5em,
}


% pset-related environments & commands
\declaretheoremstyle[
  headfont=\bfseries,
  notefont=\bfseries,
  bodyfont=\normalfont,
  notebraces={}{},
  headformat=\NAME\NOTE,
  mdframed={style=book},
  postheadhook={\setlist[enumerate, 2]{label=(\alph*)}},
]{book}

\declaretheoremstyle[
  spaceabove=1em,
  numbered=yes,
  bodyfont=\normalfont,
  headfont=\bfseries,
]{theorem}

\declaretheoremstyle[
  spaceabove=1em,
  numbered=no,
  bodyfont=\normalfont,
  headfont=\scshape,
]{minitheorem}

\declaretheorem[style=book, name=Theorem]{booktheorem}
\declaretheorem[style=book, name=Example]{bookexample}
\declaretheorem[style=book, name=Corollary]{bookcorollary}

\declaretheorem[style=theorem]{claim}
\declaretheorem[style=theorem]{theorem}
\declaretheorem[style=theorem]{lemma}
\declaretheorem[style=theorem]{corollary}
\declaretheorem[style=minitheorem, title=Base case]{basecase}
\declaretheorem[style=minitheorem, title=Inductive step]{inductivestep}

\newmdenv[style=solution]{solution}
\newmdenv[style=book]{book}
\renewmdenv[style=quote]{quote}

%% standalone problem environment: obsolete but kept for backwards-compatibility
\newenvironment{problem}[1][]{\par\hspace{-1in}\makebox[1in]{\hfill#1\quad}\ignorespaces}{}

\newenvironment{preface}{\itshape}{\par\hrulefill}
\newcommand{\comment}[1]{\marginnote{\scriptsize\textcolor{gray}{#1}}}

\newcommand{\bookfigure}[3]{\booklabel{#1}{#2}\par{\textbf{Figure #2} {#3}}\par}

\newcommand{\booklabel}[2]{\@bsphack \protected@write \@auxout {}{\string \newlabel {#1}{{{{#2}}}{\thepage}{}{}{}}}\@esphack}

% list settings
%% iff proof
\newcommand*{\iffenum}[1]{\expandafter\@iffenum\csname c@#1\endcsname}
\newcommand*{\@iffenum}[1]
{\ifcase#1\or{\(\implies\)}\or{\(\impliedby\)}\else\@ctrerr\fi}

\AddEnumerateCounter{\iffenum}{\@iffenum}{\(\Rightarrow\)}
\newlist{iffproof}{enumerate}{1}
\setlist[iffproof]{label=\iffenum*, leftmargin=3em}

\newcommand*{\subsetenum}[1]{\expandafter\@subsetenum\csname c@#1\endcsname}
\newcommand*{\@subsetenum}[1]
{\ifcase#1\or{\(\subset\)}\or{\(\supset\)}\else\@ctrerr\fi}

\AddEnumerateCounter{\subsetenum}{\@subsetenum}{\(\subset\)}

\newlist{seteqproof}{enumerate}{1}
\setlist[seteqproof]{label=\subsetenum*}


%% for problem statements
\newlist{problems}{description}{2}

\setlist[problems, 1]{
  leftmargin=0in,
  labelwidth=1in,
  align=right,
  labelsep=1em,
  labelindent=!,
}

%% subproblems
\setlist[enumerate, 1]{label=(\alph*)}
\setlist[enumerate, 2]{label=(\roman*)}

% tikz settings
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{backgrounds}
\usepgfplotslibrary{groupplots}
\usepgfplotslibrary{fillbetween}

% math commands

%% vector and matrix bold fonts
\renewcommand{\vec}{\mathbfit}
\newcommand{\mat}{\mathbf}

%% linear algebra operators
\DeclareMathOperator{\adj}{adj}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\col}{col}
\DeclareMathOperator{\row}{row}
\DeclareMathOperator{\cols}{cols}
\DeclareMathOperator{\rows}{rows}
\DeclareMathOperator{\colspace}{colspace}
\DeclareMathOperator{\rowspace}{rowspace}
\DeclareMathOperator{\nullspace}{null}
\DeclareMathOperator*{\spn}{span}
\DeclareMathOperator*{\lspan}{span}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\trace}{tr}
\DeclareMathOperator{\ran}{ran}

\let\Re\relax
\DeclareMathOperator{\Re}{Re}

\let\Im\relax
\DeclareMathOperator{\Im}{Im}

\newcommand{\Vspace}{\mathcal{V}}
\newcommand{\Uspace}{\mathcal{U}}
\newcommand{\Wspace}{\mathcal{W}}

\newcommand{\conj}{\overline}

%% special operators and relations
\newcommand{\defeq}{\stackrel{\mathrm{def}}{=}}

%% common blackboard-bold symbols
\newcommand{\ZZ}{\mathbb Z}
\newcommand{\RR}{\mathbb R}
\newcommand{\QQ}{\mathbb Q}
\newcommand{\CC}{\mathbb C}
\newcommand{\KK}{\mathbb K}
\newcommand{\NN}{\mathbb N}
\newcommand{\PP}{\mathbb P}
\newcommand{\UU}{\mathbb U}
\newcommand{\VV}{\mathbb V}
\newcommand{\WW}{\mathbb W}
\newcommand{\FF}{\mathbb F}

% transpose and complement
\newcommand{\T}{\mathsf{T}}
\newcommand{\transpose}{\intercal}
\newcommand{\M}{\mathsf{M}}
\renewcommand{\complement}{\mathsf{C}}

%% differential operators
\newcommand{\odif}{\mathop{}\! \mathrm d}
\newcommand{\dif}{\odif}
\newcommand{\pdif}{\mathop{}\! \partial}

\newcommand{\od}[3][]{\frac{\odif^{#1} {#2}}{\odif {#3}^{#1}}}
\newcommand{\pd}[3][]{\frac{\pdif^{#1} {#2}}{\pdif {#3}^{#1}}}

%% brackets & delimiters
\newcommand{\abs}[1]{\lvert {#1} \rvert}
\newcommand{\norm}[1]{\lVert {#1} \rVert}
\newcommand{\abracket}[1]{\langle {#1} \rangle}
\newcommand{\inner}{\abracket}
\newcommand{\floor}[1]{\lfloor {#1} \rfloor}
\newcommand{\ceil}[1]{\lceil {#1} \rceil}
\newcommand{\paren}[1]{( {#1} )}
\newcommand{\bracket}[1]{[ {#1} ]}
\newcommand{\curly}[1]{\{ {#1} \}}
\newcommand{\set}{\curly}
\newcommand{\setst}[2]{\set{{#1} \; : \; {#2}}}

\newcommand{\Abs}[1]{\left\lvert {#1} \right\rvert}
\newcommand{\Norm}[1]{\left\lVert {#1} \right\rVert}
\newcommand{\Abracket}[1]{\left\langle {#1} \right\rangle}
\newcommand{\Inner}{\Abracket}
\newcommand{\Floor}[1]{\left\lfloor {#1} \right\rfloor}
\newcommand{\Ceil}[1]{\left\lceil {#1} \right\rceil}
\newcommand{\Paren}[1]{\left( {#1} \right)}
\newcommand{\Bracket}[1]{\left[ {#1} \right]}
\newcommand{\Curly}[1]{\left\{ {#1} \right\}}
\newcommand{\Set}{\Curly}
\newcommand{\Setst}[2]{\Set{{#1} \; : \; {#2}}}

\newcommand{\eval}{\bigg\rvert}
