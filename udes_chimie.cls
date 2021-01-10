% @Author: flea2306
% @Date: 2017-10-10
% @Version: 1.0
% @Last modified by: Alexandre Fleury
% @Last modified time: 2017-10-17
%
% udes_chimie class.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{udes_chimie}[2017/10/17 Formatting docs for UdeS Department of Chemistry]

% The class udes_chimie inherits from the book class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

% PDF/A-1b compliances.
%\RequirePackage[a-1b]{pdfx}

% Encoding (best to choose UTF-8).
\RequirePackage[utf8]{inputenc}

% Font package (é, à, etc.).
\RequirePackage[T1]{fontenc}

% Font choices.
\RequirePackage{mathpazo} % Math font
\RequirePackage{times} % Text font

% Math packages.
\RequirePackage{amsfonts} % Add math fonts
\RequirePackage{amsmath} % Add math environments
\RequirePackage{mathrsfs} % Add some math fonts to certain characters

\RequirePackage{bm} % Bold greek characters

% French packages.
\RequirePackage{babel}
\RequirePackage[babel=true,protrusion=compatibility]{microtype}

% Figure packages.
\RequirePackage{graphicx} % Adding figures
\RequirePackage{fancybox} % Macros for float environment
\graphicspath{{Figures/}}

% Page layout.
\RequirePackage[includefoot]{geometry}
\RequirePackage{setspace}
\setlength{\parindent}{0em} % Remove paragraph indentation
\geometry{letterpaper,lmargin=2.5cm,rmargin=1.5cm,tmargin=2.5cm,bmargin=1.5cm}
\setlength{\parskip}{2ex plus 0.5ex minus 0.2ex} % Vertical space between paragraph

% Miscellaneous.
\RequirePackage{url}
\RequirePackage{multirow} % Table cells merging
\RequirePackage{booktabs} % Beautify tables with \toprule, etc
\RequirePackage[format=hang,margin=5mm,font=normalsize,labelfont=bf,labelsep=period]{caption} % Modification of the descriptions of figures and tables
\RequirePackage{tocbibind} % Show ToC, LoF, LoT and bibliography in ToC
\RequirePackage{csquotes} % \enquote command
\RequirePackage{pgf} % PGF graphs
\RequirePackage{multicol}

% Equation number between brackets [].
\RequirePackage{mathtools}
\newtagform{brackets}{[}{]}
\usetagform{brackets}
\newcommand\itsym{$\bullet$} % List symbol

% Continuous numering of figures and tables.
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% Bibliography.
\RequirePackage[backend=biber, sorting=none, maxnames=3, style=chem-acs, doi=false, isbn=false, url=false, defernumbers=true]{biblatex}
\renewcommand{\mkbibbrackets}[1]{\mkbibparens{#1}} % Citations between ()
\DefineBibliographyExtras{french}{\restorecommand\mkbibnamefamily} % Last name in normal mode (in french, last name are in small caps by default)

%----------------- Colors -----------------
% Define a custom color set.
\RequirePackage{xcolor} % svgnames,x11names options has been removed
\definecolor{tenPercentGrey}{gray}{0.9}
\definecolor{White}{gray}{0.9}
\definecolor{Black}{gray}{0.0}
%------------------------------------------

%------------------ Blank page ------------------
\RequirePackage{afterpage}%
\newcommand\blankpage{%
\null
\thispagestyle{empty}%
\addtocounter{page}{-1}%
\newpage}
%------------------------------------------------

%----------------------------- Table -----------------------------
\RequirePackage{array} % Array functions
% Column with width specified as an argument.
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}} % Left-align column
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}  % Centered-align column
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}} % Right-align column
\RequirePackage{dcolumn} % Alignment on decimal point
%-----------------------------------------------------------------

%---------------------- Headers and footers ----------------------
%RequirePackage[plainheadsepline,nouppercase]{scrpage2}
\pagestyle{plain}
%\renewcommand{\chaptermark}[1]{\markboth{{\thechapter. #1}}{}}
%\renewcommand{\sectionmark}[1]{}
%-----------------------------------------------------------------

%---------------------- Titles format ----------------------
\RequirePackage{titlesec}
\RequirePackage{titletoc}

% Chapters
\titleformat{\chapter}[block]{\bfseries\color{Black}}{} {14pt} {\LARGE\filcenter}
%\titleformat{\chapter}[display]{\bfseries\color{Black}}{\filcenter\enspace \Large\chaptername\space\thechapter} {14pt} {\LARGE\filcenter}
\titlespacing*{\chapter}{0pt}{-45pt}{20pt}
%\titlespacing*{\tableofcontents}{0pt}{-50pt}{20pt}

% Sections
\titleformat{\section}[block]{\vspace{0mm plus 2cm}\addpenalty{-1000}\color{black}\Large\bfseries}{\thesection}{1em}{}[{\color{Black}\titlerule[0.5pt]}]

% Subsections
\titleformat{\subsection}[block]{\addpenalty{-500}\large\bfseries}{\thesubsection}{1em}{}

% Subsubsections
\titleformat{\subsubsection}[block]{\penalty-500\vspace{0pt plus 2pt}{}\bfseries}{\thesubsubsection}{}{}[\vspace{-14pt}]
%-----------------------------------------------------------

%------------------------- Table of contents -------------------------
% Write "Chapitre" before chapter names in ToC.
\RequirePackage[titles]{tocloft}
%\renewcommand{\cftchapfont}{\bfseries}
%\renewcommand{\cftchappagefont}{\bfseries}
%\renewcommand{\cftchappresnum}{CHAPITRE }
%\renewcommand{\cftchapaftersnum}{:}
%\renewcommand{\cftchapnumwidth}{7em}
%\renewcommand\cftchapdotsep{\cftdotsep}
%\makeatletter
%\newcommand*\updatechaptername{%
%\addtocontents{toc}{\protect\renewcommand*\protect\cftchappresnum{ANNEXE }}
%}
%\newcommand*\updatechapnumwidth{%
%\addtocontents{toc}{\protect\renewcommand*\protect\cftchapnumwidth{6.2em}}
%}
%\makeatother

% Vertical spacing between ToC element.
\renewcommand{\cftchapafterpnum}{\vspace{-2ex}}
\renewcommand{\cftsecafterpnum}{\vspace{-2.5ex}}
\renewcommand{\cftsubsecafterpnum}{\vspace{-2.5ex}}
\renewcommand{\cftfigafterpnum}{\vspace{-2ex}}
\renewcommand{\cfttabafterpnum}{\vspace{-2ex}}
%---------------------------------------------------------------------

%---------- Listings (code) ----------
\RequirePackage{courier}
\RequirePackage{listings}
\lstset{
backgroundcolor=\color{tenPercentGrey}, %
basicstyle=\color{Black}\ttfamily{}\footnotesize, %
numbers=left, %
stepnumber=1, %
frame=tb, %
captionpos=b, %
lineskip=\smallskipamount{}, %
aboveskip=\bigskipamount{}, %
belowskip=\medskipamount{}, %
commentstyle=\itshape\small{}, %
tabsize=2, %
breakatwhitespace=True, %
breaklines=true, %
rulecolor=\color{Black!30}, %
showspaces=false, %
showstringspaces=false, %
showtabs=false, %
}
%-------------------------------------

% Rename title section in french.
\addto\captionsfrench{%
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Tableau}
\renewcommand{\chaptername}{Chapitre}
\renewcommand{\contentsname}{Table des matières}
\renewcommand{\listtablename}{Liste des tableaux}
\renewcommand{\listfigurename}{Liste des figures}
}

\setlength\bibitemsep{0em} % Space between citations in bibliography

\endinput
