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
\RequirePackage{mathtools, thmtools}

%% utility packages
\RequirePackage{mdframed}
\RequirePackage{cancel}
\RequirePackage{lastpage}
\RequirePackage{multicol}
\RequirePackage{color}
\RequirePackage{tikz}
\RequirePackage{hyperref}
\RequirePackage{marginnote}
\RequirePackage{isomath}
\RequirePackage{nicematrix}
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
  linkcolor=blue!50!green,
}

% pset-related environments & commands
\declaretheoremstyle[
  bodyfont=\normalfont,
  spaceabove=1em,
]{exercise}

\declaretheorem[style=exercise]{exercise}

\declaretheoremstyle[
  bodyfont=\normalfont,
  numbered=no,
  spaceabove=1em,
  preheadhook=\vspace*{1em},
]{solution}

\declaretheorem[style=solution, mdframed]{solution}

\declaretheoremstyle[
  spaceabove=1em,
  numbered=no,
  bodyfont=\normalfont,
  headfont=\scshape,
]{minitheorem}

\declaretheorem[style=theorem]{claim}
\declaretheorem[style=theorem]{lemma}
\declaretheorem[style=theorem]{corollary}
\declaretheorem[style=theorem, title=Base case]{basecase}
\declaretheorem[style=theorem, title=Inductive step]{inductivestep}

\newenvironment{preface}{\itshape}{\par\hrulefill}
\newcommand{\comment}[1]{\marginnote{\scriptsize\textcolor{gray}{#1}}}

% math commands
\renewcommand{\vec}{\mathbfit}
\newcommand{\mat}{\mathbf}

%% common blackboard-bold symbols
\newcommand{\ZZ}{\mathbb Z}
\newcommand{\RR}{\mathbb R}
\newcommand{\QQ}{\mathbb Q}
\newcommand{\CC}{\mathbb C}
\newcommand{\KK}{\mathbb K}
\newcommand{\NN}{\mathbb N}
\newcommand{\PP}{\mathbb P}
\newcommand{\VV}{\mathbb V}

% transpose and complement
\newcommand{\T}{\mathsf{T}}
\renewcommand{\complement}{\mathsf{C}}

%% differential operators
\newcommand{\odif}{\mathop{}\! \mathrm d}
\newcommand{\dif}{\odif}
\newcommand{\pdif}{\mathop{}\! \partial}

\newcommand{\od}[3][]{\frac{\odif^{#1} {#2}}{\odif {#3}^{#1}}}
\newcommand{\pd}[3][]{\frac{\pdif^{#1} {#2}}{\pdif {#3}^{#1}}}

%% brackets & delimiters
\newcommand{\abs}[1]{\left\lvert {#1} \right\rvert}
\newcommand{\norm}[1]{\left\lVert {#1} \right\rVert}
\newcommand{\abracket}[1]{\left\langle {#1} \right\rangle}
\newcommand{\inner}{\abracket}
\newcommand{\floor}[1]{\left\lfloor {#1} \right\rfloor}
\newcommand{\ceil}[1]{\left\lceil {#1} \right\rceil}
\newcommand{\paren}[1]{\left( {#1} \right)}
\newcommand{\bracket}[1]{\left[ {#1} \right]}
\newcommand{\curly}[1]{\left\{ {#1} \right\}}
\newcommand{\set}{\curly}
\newcommand{\eval}[1]{\bigg\rvert_{#1}}
\newcommand{\setst}[2]{\set{{#1} \; : \; {#2}}}