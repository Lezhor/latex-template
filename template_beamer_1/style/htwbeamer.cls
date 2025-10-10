% ======================================================================
%  HTW Thesis Document Class
% ======================================================================
%  Author: Daniil Aragon
%  Date: 2025-10-08
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style/htwbeamer}[2025/10/10 HTW Presentation Class]

% ----------------------------------------------------------------------
% Load base class (Beamer)
% ----------------------------------------------------------------------
\LoadClass{beamer}

% ----------------------------------------------------------------------
% Key-value options for the class
% ----------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=htwpresentation,
  prefix=htwpresentation@
}

% Define available options
\DeclareStringOption[de]{language} % default: German

\ProcessKeyvalOptions*

% ----------------------------------------------------------------------
% Load common HTW style (reused from thesis, adapted for beamer)
% ----------------------------------------------------------------------
\RequirePackage[language=\htwpresentation@language]{style/htwstyle_beamer}

% ----------------------------------------------------------------------
% Default Beamer setup
% ----------------------------------------------------------------------
% Use a clean theme (you can replace this with your own later)
\mode<presentation>{
  \usetheme{Madrid} % or Berlin, Copenhagen, etc.
  \usecolortheme{seagull}
  \setbeamertemplate{navigation symbols}{}
  \setbeamertemplate{footline}[frame number]
  \setbeamercolor{structure}{fg=HTWgreen}
  \setbeamertemplate{itemize item}[triangle]
}

% ----------------------------------------------------------------------
% End of class
% ----------------------------------------------------------------------
\endinput
