% workout.cls was written by Michael Giancola (mjgiancola@wpi.edu)
% It was designed for creating visually pleasing and and easy to read swimming workouts.
% It is provided without license, so feel free to use it so long as you credit me somewhere in the document.

\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{workout}
\RequirePackage[english]{babel}
\RequirePackage{titlesec}
\RequirePackage{geometry}
\RequirePackage{hyperref}

\pagenumbering{gobble}
\newgeometry{left=0.75in,right=0.75in,top=0.5in,bottom=0.5in}

% Formats a swim for an itemized set
\newcommand{\sitem}{\item[\{] \iswim}

% Defines the standard itemized item marker to be a dash
\def\labelitemi{--}

\newlength\mystoreparindent
\newenvironment{myparindent}[1]{
  \setlength{\mystoreparindent}{\the\parindent}
  \setlength{\parindent}{#1}
}
{\setlength{\parindent}{\mystoreparindent}}

\titleformat{\section}         % Customise the \section command
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading

% For the header for a section of a workout
% <Section Name> <# of Yards> <Est. Time>
\newcommand{\setsection}[3]{
	\begin{center}
	\noindent\rule{15cm}{0.4pt} % Draws a line above the section
	\end{center}
	\section[#1]{\textbf{#1} \hfill #2 \hfill #3}
}

% A set that is repeated multiple times
% Parameter is # of repetitions
\newenvironment{itemizedset}[1]{
	\noindent#1x \{
	\begin{itemize}{}{}} {\end{itemize}}

% An individual swim
% <Distance(s)> <Description> <Time>
\newcommand{\swim}[3]{
\begin{myparindent}{0pt}
	#1 \hfill #2 \hfill #3\\
\end{myparindent}
}

% Same as \swim; use within itemize-like environments
\newcommand{\iswim}[3]{
\begin{myparindent}{0pt}
	#1 \hfill #2 \hfill #3
\end{myparindent}
}