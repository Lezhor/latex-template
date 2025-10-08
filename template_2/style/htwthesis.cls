% ======================================================================
%  HTW Thesis Document Class
% ======================================================================
%  Author: Daniil Aragon
%  Date: 2025-10-08
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style/htwthesis}[2025/10/08 HTW Thesis Class]

% ----------------------------------------------------------------------
% Load base class (KOMA-Script)
% ----------------------------------------------------------------------
\LoadClass[
  oneside,
  12pt,
  bibliography=totocnumbered,
  BCOR=5mm,
  numbers=noendperiod
]{scrbook}

% ----------------------------------------------------------------------
% Key-value options for the class
% ----------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=htwthesis,
  prefix=htwthesis@
}

% Define available options
\DeclareStringOption[de]{language} % default: de
\ProcessKeyvalOptions*

% ----------------------------------------------------------------------
% Load main style file
% ----------------------------------------------------------------------
\RequirePackage[language=\htwthesis@language]{style/htwstyle}


% ----------------------------------------------------------------------
% End of class
% ----------------------------------------------------------------------
\endinput
