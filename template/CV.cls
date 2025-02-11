%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Latex Class for CV %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% by Sem Klauke, version 2025 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
% Define the Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CV}
%% --------------------------------------------------- %%
%% --------------- Define Class options -------------- %%
%% --------------------------------------------------- %%
\RequirePackage{xifthen}
\RequirePackage{xkeyval}
%%%
% ****(OPTION)**** Font size pass through
% 10pt, 11pt [DEFAULT: 11pt]
\DeclareOptionX{10pt}{\PassOptionsToClass{10pt}{scrartcl}}
\DeclareOptionX{11pt}{\PassOptionsToClass{11pt}{scrartcl}}
% ****(OPTION)**** babel lang pass through
% lang
\DeclareOptionX{langs}{%
    \PassOptionsToPackage{#1}{babel}%
    %\PassOptionsToClass{#1}{scrartcl}%
}
%%% Defaults
\ExecuteOptionsX{11pt}
\ExecuteOptionsX{langs=english}
\ProcessOptionsX
\LoadClass[a4paper]{scrartcl}
%% --------------------------------------------------- %%
%% -------------- Set Dimensions/Border -------------- %%
%% --------------------------------------------------- %%
\RequirePackage{geometry}
\RequirePackage{setspace}
\geometry{
    a4paper,
    left=1cm,
    right=1cm,
    top=2cm,
    bottom=2cm
}
%% --------------------------------------------------- %%
%% ------------------- Font/Color -------------------- %%
%% --------------------------------------------------- %%
\RequirePackage{FiraSans}
\RequirePackage[dvipsnames]{xcolor}
\definecolor{CV_gray}{gray}{0.6}
%% --------------------------------------------------- %%
%% -------------------- Packages --------------------- %%
%% --------------------------------------------------- %%
\RequirePackage[
    hidelinks,
    unicode,
    colorlinks=false
]{hyperref}

%% --------------------------------------------------- %%
%% ---------------- Language Keywords ---------------- %%
%% --------------------------------------------------- %%
\makeatletter
\newcommand{\newkeyword}[1]{%
  \newcommand#1{%
    \@ifundefined{\string#1\languagename}
      {``No def of \texttt{\string#1} for \languagename''}
      {\@nameuse{\string#1\languagename}}%
  }%
}
\newcommand{\addlangtokeyword}[3]{%
  \@namedef{\string#1#2}{#3}}
\makeatother
\IfFileExists{cv_keywords.tex}{\input{cv_keywords.tex}}{}


%% --------------------------------------------------- %%
%% ------------------- CV Settings ------------------- %%
%% --------------------------------------------------- %%
% First & Last Name
% ======================
% \name{firstname}{lastname}
% ======================
\newcommand{\printfirstname}{?}%
\newcommand{\printlastname}{?}%
\newcommand{\printname}{?}%
\newcommand{\name}[2]{%
    \renewcommand{\printfirstname}{#1}%
    \renewcommand{\printlastname}{#2}%
    \renewcommand{\printname}{#1 #2}%
}
% Contact Infos
% ======================
% \email{email address}
% ======================
\newcommand{\printemail}{?}%
\newcommand{\email}[1]{%
    \renewcommand{\printemail}{#1}%
}
% ======================
% \phone{phone number}
% ======================
\newcommand{\printphone}{?}%
\newcommand{\phone}[1]{%
    \renewcommand{\printphone}{#1}%
}
% ======================
% \twitter{username}{link}
% ======================
\newcommand{\printtwitter}{?}%
\newcommand{\twitter}[2]{%
    \renewcommand{\printtwitter}{%
        \href{#2}{Tw: #1}%
    }%
}
% ======================
% \linkedin{username}{link}
% ======================
\newcommand{\printlinkedin}{?}%
\newcommand{\linkedin}[2]{%
    \renewcommand{\printlinkedin}{%
        \href{#2}{in: #1}%
    }%
}
% ======================
% \github{username}{link}
% ======================
\newcommand{\printgithub}{?}%
\newcommand{\github}[2]{%
    \renewcommand{\printgithub}{%
        \href{#2}{GH: #1}%
    }%
}%
%
%
%%%%% Later load packages so \PassOptionToPackage{} can reach them
\RequirePackage{babel}

%% --------------------------------------------------- %%
%% ------------------- CV Commands ------------------- %%
%% --------------------------------------------------- %%
\IfFileExists{cv_commands.tex}{\input{cv_commands.tex}}{}