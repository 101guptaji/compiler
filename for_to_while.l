/*Lex program to covert for loop into while loop
without changing the meaning of the program. */


%{

#include<stdio.h>
#include<string.h>
#include<ctype.h>
 
	char ipfile[20];
	char line[20];

%}

sp "."
ext [a-zA-Z]+
funend ")"

op "++"|"--"
rop "<"|">"|"<="|">="|"=="|"!="
id [a-zA-Z][a-zA-Z0-9]*
no [0-9]*
pp [\n\t" "]

%%

({sp}{ext})?\>		{ fprintf(yyout, "%s", yytext); }
({rop}({id}|{no}))?\;	;
({no}|{id}|{pp}|{funend})?\;	{ fprintf(yyout, "%s", yytext); }

for\(({id}=({no}|{id}))?\;	{fprintf(yyout, "while(");}
{id}{rop}({id}|{no})	{ fprintf(yyout, "%s" ")" ,yytext);}
{id}{op}  		{ strcpy(line, yytext);}
({op})?\)		;
({id}\")?\)		{ fprintf(yyout, "%s", yytext); }
(\()?\)			{ fprintf(yyout, "%s" , yytext); }

\n	{ fprintf(yyout, "\n"); }
\t	{ fprintf(yyout, "\t"); } 
\{	{ fprintf(yyout, "%s", yytext); }
\.	{ fprintf(yyout, "%s", line); }  
\}	{ fprintf(yyout, "%s" ";" "\n" "\t" "}", line); }
{id}{pp}*{no}\;{pp}*\} { fprintf(yyout, "%s" , yytext); }

%% 

int yywrap() 
{ 
    return 1; 
} 
  
/* driver section */
int main() 
{ 
        extern FILE *yyin, *yyout; 

	printf("Enter the filename: \n"); 
	scanf("%s",ipfile);
   	yyin=fopen(ipfile, "r"); 
   
   	yyout=fopen("output.c", "w");
	
        yylex();

return 0;
} 
