% ======================================================================
%  HTW Beamer Document Class
% ======================================================================
%  Author: Daniil Aragon
%  Date: 2025-10-08
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style/htwbeamer}[2025/10/15 HTW Beamer Class]

% ----------------------------------------------------------------------
% Load base class (KOMA-Script)
% ----------------------------------------------------------------------
\LoadClass[
  aspectratio=169
]{beamer}

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


\ifthenelse{\boolean{isGerman}}
  {\RequirePackage[ngerman]{babel}}
  {\RequirePackage[english]{babel}}

\RequirePackage{csquotes}
\RequirePackage{graphicx}


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

\definecolor{HTWgreen}{RGB}{118,185,0}
\usecolortheme[named=HTWgreen]{structure}

% \setbeamertemplate{footline}[frame number]  % if you want slide numbers

\setbeamertemplate{logo}{
  \vspace{0.2cm} % move up/down
  \includegraphics[width=1cm]{images/htw_logo_notext.jpg}
  \hspace{0.3cm}  % move right/left
}


\setbeamertemplate{navigation symbols}{} % hides navigation buttons at bottom
\setbeamertemplate{bibliography item}[text]


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
  \newcommand{\BibTitle}{Quellenverzeichnis}
}{
  \newcommand{\BibTitle}{Literature}
}


% ----------------------------------------------------------------------
% Load main style file
% ----------------------------------------------------------------------
% \RequirePackage[language=\htwthesis@language]{style/htwbeamer_style}

% ----------------------------------------------------------------------
% End of class
% ----------------------------------------------------------------------
\endinput
