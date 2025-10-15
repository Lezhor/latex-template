% ======================================================================
%  HTW Beamer Document Class
% ======================================================================
%  Author: Daniil Aragon
%  Date: 2025-10-08
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style/htwbeamer}[2025/10/15 HTW Beamer Class]

% ----------------------------------------------------------------------
% Key-value options for the class
% ----------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=htwbeamer,
  prefix=htwbeamer@
}

% Define available options
\DeclareStringOption[de]{language} % default: de
\ProcessKeyvalOptions*

\RequirePackage{ifthen}
\newboolean{isGerman}
\ifthenelse{\equal{\htwbeamer@language}{de}}{\setboolean{isGerman}{true}}{\setboolean{isGerman}{false}}

% ----------------------------------------------------------------------
% Load base class (KOMA-Script)
% ----------------------------------------------------------------------

\LoadClass[
  % handout,
  aspectratio=169
]{beamer}

% --------------------------------------------------------------------
% BASIC SETTINGS
% --------------------------------------------------------------------
\ifthenelse{\boolean{isGerman}}
  {\RequirePackage[ngerman]{babel}}
  {\RequirePackage[english]{babel}}

\RequirePackage{csquotes}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{marvosym}
% \RequirePackage[hyphens]{url}
% \RequirePackage{hyperref}
\RequirePackage{xcolor}
\definecolor{HTWgreen}{RGB}{118,185,0}
\RequirePackage{setspace}
\RequirePackage{microtype}
\RequirePackage{parskip}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{booktabs}
% \RequirePackage{enumitem}
\RequirePackage{subcaption}
\RequirePackage{array}
\RequirePackage{wrapfig}
\RequirePackage{blindtext}


% ----------------------------------------------------------------------
% Beamer Setup
% ----------------------------------------------------------------------

% \usetheme{Antibes}
% \usetheme{Bergen}
% \usetheme{Berkeley}  % Box at top and left
% \usetheme{Berlin}  % Standard (looks better in default color)
% \usetheme{Boadilla}  % No Box at top
% \usetheme{Dresden}  % Like Berlin but less annoying
% \usetheme{Frankfurt}  % Only one shade of Green!
% \usetheme{Hannover}  % Blass
% \usetheme{Madrid}  % Clean Top
% \usetheme{Montpellier}  % Minimalist with colors (lines)
% \usetheme{Pittsburgh}  % No additional stuff (colored headlines) / but headlines are aligned to the right - chnage?
\usetheme{Rochester}  % PERFECT - No additional stuff!
% \usetheme{Singapore}  % Interesting - Pale

\usecolortheme[named=HTWgreen]{structure}

% \setbeamertemplate{footline}[frame number]  % if you want slide numbers

\setbeamertemplate{caption}[numbered]


\setbeamertemplate{logo}{
  \vspace{0.2cm} % move up/down
  \includegraphics[width=1cm]{images/htw_logo_notext.jpg}
  \hspace{0.3cm}  % move right/left
}

\setbeamertemplate{navigation symbols}{} % hides navigation buttons at bottom
\setbeamertemplate{bibliography item}[text]

% --- Force bullet symbols for itemize lists ---
% \setbeamertemplate{items}[default]  % restore base template definitions
% \setbeamertemplate{itemize item}{\raise1pt\hbox{\donotcoloroutermaths$\blacktriangleright$}}
% \setbeamertemplate{itemize subitem}{\raise1pt\hbox{\donotcoloroutermaths$\bullet$}}
% \setbeamertemplate{itemize subsubitem}{\raise1pt\hbox{\donotcoloroutermaths$\blacksquare$}}
% \setbeamercolor{itemize item}{fg=HTWgreen}
% \setbeamercolor{itemize subitem}{fg=HTWgreen}
% \setbeamercolor{itemize subsubitem}{fg=HTWgreen}


% \setbeamertemplate{itemize item}[triangle]
% \setbeamertemplate{itemize subitem}[circle]
% \setbeamertemplate{itemize subsubitem}[square]
% \setbeamercolor{itemize item}{fg=HTWgreen}
% \setbeamercolor{itemize subitem}{fg=HTWgreen}
% \setbeamercolor{itemize subsubitem}{fg=HTWgreen}


% ----------------------------------------------------------------------
% BibLatex
% ----------------------------------------------------------------------
\RequirePackage[
    backend=biber,
    style=numeric,
    citestyle=numeric,
    sorting=none,  % comment back in if you want to sort by order of apperiance / default: sort by authors last name
]{biblatex}

\ifthenelse{\boolean{isGerman}}{
  \DefineBibliographyStrings{ngerman}{
    andothers = {et\addabbrvspace al\adddot},
    bibliography = {Quellenverzeichnis},
  }
}{
  \DefineBibliographyStrings{english}{
    andothers = {et\addabbrvspace al\adddot},
    bibliography = {References},
  }
}

\ifthenelse{\boolean{isGerman}}{
  \newcommand{\TableOfContents}{Inhaltsverzeichnis}
  \newcommand{\BibTitle}{Quellenverzeichnis}
}{
  \newcommand{\TableOfContents}{Table of Contents}
  \newcommand{\BibTitle}{Literature}
}

% --------------------------------------------------------------------
% LISTINGS
% --------------------------------------------------------------------
\RequirePackage{listings}
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{
  backgroundcolor=\color{white},
  basicstyle=\footnotesize,
  breakatwhitespace=true,
  breaklines=true,
  captionpos=b,
  commentstyle=\color{mygreen},
  % deletekeywords={...},  % if certain keys should be ignored in chosen programming language
  escapeinside={\%*}{*)},
  frame=single,
  keepspaces=true,
  keywordstyle=\color{blue},
  language=Python,
  mathescape=true,
  % morekeywords={*,...},  % if certain words should be highlighted as keywords but they aren't by default.
  numbers=left,
  numbersep=5pt,
  numberstyle=\tiny\color{mygray},
  rulecolor=\color{black},
  showstringspaces=false,  % if spaces in strings should be turned to underscores
  stepnumber=1,
  stringstyle=\color{mymauve},
  tabsize=2  % change if you want 4 spaces per tab
}


% ----------------------------------------------------------------------
% Title Page
% ----------------------------------------------------------------------
\newcommand{\@ititle}{tmp}
\newcommand{\@idocumenttype}{}
\newcommand{\@iuniversity}{}
\newcommand{\@ifaculty}{}
\newcommand{\@istudyprogramme}{}
\newcommand{\@isupervisorone}{}
\newcommand{\@isupervisortwo}{}
\newcommand{\@iauthor}{}
\newcommand{\@imatrnr}{}
\newcommand{\@idate}{}

\newcommand{\ititle}[1]{\renewcommand{\@ititle}{#1}}
\newcommand{\idocumenttype}[1]{\renewcommand{\@idocumenttype}{#1}}
\newcommand{\iuniversity}[1]{\renewcommand{\@iuniversity}{#1}}
\newcommand{\ifaculty}[1]{\renewcommand{\@ifaculty}{#1}}
\newcommand{\istudyprogramme}[1]{\renewcommand{\@istudyprogramme}{#1}}
\newcommand{\isupervisorone}[1]{\renewcommand{\@isupervisorone}{#1}}
\newcommand{\isupervisortwo}[1]{\renewcommand{\@isupervisortwo}{#1}}
\newcommand{\iauthor}[1]{\renewcommand{\@iauthor}{#1}}
\newcommand{\imatrnr}[1]{\renewcommand{\@imatrnr}{#1}}
\newcommand{\idate}[1]{\renewcommand{\@idate}{#1}}

\title{\@ititle}
\subtitle{\@idocumenttype}
\author{\@iauthor\ (\@imatrnr)}
\institute{\@iuniversity \\ \@ifaculty \\ \@istudyprogramme}
\date{\@idate}

\newcommand{\makeititle}{%
  \begin{frame}
    \titlepage
  \end{frame}
}


% ----------------------------------------------------------------------
% End of class
% ----------------------------------------------------------------------
\endinput
