%{
#include<stdio.h>
#include "y.tab.c"
void yyerror (char *s);
int yylex();
%}

%%
("int"|"float"|"char"|"double") 	{if(strcmp(yytext,"int")==0){yylval.num=0;}
                                 else if(strcmp(yytext,"char")==0){yylval.num=1;}
											return key;}
[p][r][i][n][t][f][(].*				{;}
"<"                 					{return lessthan;}
">"                 					{return greaterthan;}
"=="                 				{return equal;}
"!="                 				{return notequal;}
">="                 				{return greatequal;}
"<="                 				{return lessequal;}
"main"               				{return MAIN;}
"if"                 				{return IF;}
"else"               				{return ELSE;}
"break"									{return BREAK;}
"continue" 								{return CONT;}
[#].*										{;}
["]										{;}
[a-zA-Z]*		   					{yylval.id = strdup(yytext); return identifier;}
(["][a-zA-Z]["]) 						{yylval.num = 1; return strv;}
[0-9]+               				{yylval.num = 0; return number;}
[ \t]              					{;}
[-+=;]           	   				{return yytext[0];}
"{"										{return *yytext;}
"}"										{return *yytext;}
[()] 										{return *yytext;}
\n                   				{yylineno++;}
.                    				{ECHO; yyerror ("Unexpected Character...");}

%%
int yywrap (void) 
{
	return 1;
}


