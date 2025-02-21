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
% ****(OPTION)**** 
% lang: babel lang pass through
\DeclareOptionX{langs}{%
    \PassOptionsToPackage{#1}{babel}%
    %\PassOptionsToClass{#1}{scrartcl}%
}
% ****(OPTION)****
% icons: contact icon [yes|no] [DEFAULT: no] 
\newcommand{\settingIcons}{no}
\DeclareOptionX{icons}{\renewcommand{\settingIcons}{yes}}
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
    top=1.5cm,
    bottom=2cm
}
%% --------------------------------------------------- %%
%% ------------------- Font/Color -------------------- %%
%% --------------------------------------------------- %%
\RequirePackage{FiraSans}
\setmainfont{FiraSans}
\newfontfamily\firasans{FiraSans}
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
\RequirePackage{fontawesome5}
\RequirePackage{ragged2e}
\RequirePackage{realboxes}
%% --------------------------------------------------- %%
%% -------------- Custom Logic commands -------------- %%
%% --------------------------------------------------- %%
% Switch implementation
\newcommand{\ifequals}[3]{\ifthenelse{\equal{#1}{#2}}{#3}{}}
\newcommand{\ifnotequals}[3]{\ifthenelse{\equal{#1}{#2}}{}{#3}}
\newcommand{\case}[2]{#1 #2} % Dummy, so \renewcommand has something to overwrite...
\newenvironment{switch}[1]{\renewcommand{\case}{\ifequals{#1}}}{}
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
}%
\newcommand{\addlangtokeyword}[3]{\@namedef{\string#1#2}{#3}}%
\makeatother%
\IfFileExists{cv_keywords.tex}{\input{cv_keywords.tex}}{}%T
%% --------------------------------------------------- %%
%% ------------------- CV Settings ------------------- %%
%% --------------------------------------------------- %%
% TODO: Command to create contact info command
% ======================
% \newContactInfo[link]{name}{icon}
% leave icon empty if you don't have icons enabled anyway
% ======================
\newcommand{\newContactInfo}[3][]{%
    \expandafter\newcommand\csname print#2\endcsname{?}%
    % branch on link argument
    \ifthenelse{\equal{#1}{}}{%
        % there is no link
        \expandafter\newcommand\csname #2\endcsname[1]{%
            \expandafter\def\csname added#2\endcsname{}
            \expandafter\renewcommand\csname print#2\endcsname{%
                \ifnotequals{\settingIcons}{no}{%
                    \raisebox{-1.2pt}{\ifnotequals{#3}{}{#3}}%
                } ##1%
            }%
        }%
    }{%
        % there is a link
        \expandafter\newcommand\csname #2\endcsname[2]{%
            \expandafter\def\csname added#2\endcsname{}
            \expandafter\renewcommand\csname print#2\endcsname{%
                \ifnotequals{\settingIcons}{no}{%
                    \raisebox{-1.2pt}{\ifnotequals{#3}{}{#3}}%
                } \href{##2}{##1}%
            }%
        }%
    }%
}
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
}%
% Contact Infos
% ======================
% \email{email address}
% ======================
\newContactInfo[link]{mail}{\faEnvelope[regular]}
\newcommand{\printemail}{?}%
\newcommand{\email}[1]{%
    \mail{#1}{mailto:#1}%
}%
% ======================
% \phone{phone number}
% ======================
\newContactInfo{phone}{\faPhone}
% ======================
% \twitter{username}{link}
% ======================
\newContactInfo[link]{twitter}{\faTwitter}
% ======================
% \mastodon{username}{link}
% ======================
\newContactInfo[link]{mastodon}{\faMastodon}
% ======================
% \linkedin{username}{link}
% ======================
\newContactInfo[link]{linkedin}{\faLinkedin}
% ======================
% \xing{username}{link}
% ======================
\newContactInfo[link]{xing}{\faXing}
% ======================
% \github{username}{link}
% ======================
\newContactInfo[link]{github}{\faGithub}
% ======================
% \gitlab{username}{link}
% ======================
\newContactInfo[link]{gitlab}{\faGitlab}
% ======================
% \telegram{username}{link}
% ======================
\newContactInfo[link]{telegram}{\faTelegramPlane}
%
% Print all contact info
% ======================
\newcommand{\printAllContactInfo}{%
    {\renewcommand{\arraystretch}{1.1}%
    \begin{tabular}{l}
        \ifdefined\addedmail%
            \printmail{} \\%
        \fi%
        \ifdefined\addedphone%
            \printphone{} \\%
        \fi%
        \ifdefined\addedlinkedin%
            \printlinkedin{} \\%
        \fi%
        \ifdefined\addedxing%
            \printxing{} \\%
        \fi%
        \ifdefined\addedtwitter%
            \printtwitter{} \\%
        \fi%
        \ifdefined\addedmastodon%
            \printmastodon{} \\%
        \fi%
        \ifdefined\addedgithub%
            \printgithub{} \\%
        \fi%
        \ifdefined\addedgitlab%
            \printgitlab{} \\%
        \fi%
        \ifdefined\addedtelegram%
            \printtelegram{} \\%
        \fi%
        %\vspace*{-\baselineskip}
    \end{tabular}%
    }%
}%

%% --------------------------------------------------- %%
%% --------------------- Styling --------------------- %%
%% --------------------------------------------------- %%
\setlength{\headheight}{0pt}
\setlength{\footheight}{0pt}
\setlength{\parindent}{0pt}
\AtBeginDocument[A]{
    \pagestyle{empty}
    \pagenumbering{gobble}
    \begin{minipage}[t][2.4cm][c]{0.64\textwidth}\vspace{0cm}%
        {
        \fontsize{45}{50}\selectfont
        \printfirstname{}\\[0.12\baselineskip]
        \printlastname{}%
        }
    \end{minipage}%
    \hfill%
    \begin{minipage}[t][2.4cm][c]{0.35\textwidth}\vspace{0cm}%
        \printAllContactInfo{}%
    \end{minipage}
    \vspace{\baselineskip}%
    \hrule%
    \vspace{\baselineskip}%
    \begin{minipage}[t][0pt]{\linewidth}
    %%%% in atenddocuemnt open the two minipages for 2 columns if a command in the meantime requested it (counter)
}
%%%%% Later load packages so \PassOptionToPackage{} can reach them
\RequirePackage{babel}

%% --------------------------------------------------- %%
%% ------------------- CV Commands ------------------- %%
%% --------------------------------------------------- %%
\IfFileExists{cv_commands.tex}{\input{cv_commands.tex}}{}