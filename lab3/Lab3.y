%{
void yyerror (char *s);
int yylex();
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include<string.h>
#define INT_MAX 9999999
char s[52][100];
int t[52];
void symbval(char *symbol, int val);  //check the data type of the variable and value and  assign pr change the value to that variable
void symbvalin(char *symbol, int val); //check the previous declaration of the variable and assigning value to that variable
int chectyp(char *symbol); //check for variable whether is declared or not
extern int yylineno;
int cp=0;
%}
			

%union {int num; char *id;}
%start l
%token MAIN
%token key
%token IF
%token ELSE
%token BREAK
%token CONT
%token lessthan greaterthan equal notequal greatequal lessequal
%token exit_command
%token <num> number strv
%token <id> identifier
%type <num> l exp term key
%type <id> assign

%right "then" "else"

%%

l	    	: assign ';'							{;}
		| l assign ';'							{;}
		| BREAK ';'			{printf("Error: Line %d -> 'break' statement not within loop or switch\n",yylineno);} 
		| l BREAK ';'			{printf("Error: Line %d -> 'break' statement not within loop or switch\n",yylineno);}
		| CONT ';'			{printf("Error: Line %d -> 'continue' statement not within loop or switch\n",yylineno);} 
		| l CONT ';'			{printf("Error: Line %d -> 'continue' statement not within loop or switch\n",yylineno);}
      		| stat									{;}
      		| l stat           					{;}
		| fdec      							{;}
		| l fdec									{;}
		| fcall ';'								{;}
		| l fcall ';'							{;}
		| key MAIN '(' ')' '{' l '}' 		{;}
		| l key MAIN '(' ')' '{' l '}'	{;}
	   	| error                       	{;}
	   	;

assign 		: identifier '=' exp  { symbval($1,$3); }
		|key identifier '=' exp{if($4==$1){symbvalin($2,$1);}else{printf("Error: Line %d -> Invalid Entry\n",yylineno);}}
		|key identifier          { symbvalin($2,$1); }
				;

con		: term
		| exp lessthan term
	   	| exp greaterthan term          
		| exp lessequal term				
		| exp greatequal term
		| exp equal  term
		| exp notequal term
		;

exp  		: term         {$$ = $1;}
      		| exp '+' term {if($1==$3){$$=$1;}else{printf("Error: Line %d -> Adding different datatypes\n",yylineno);}}
      		| exp '-' term {if($1==$3){$$=$1;}else{printf("Error: Line %d -> Subtracting different datatypes\n",yylineno);}}
	   	| exp '*' term	{if($1==$3){$$=$1;}else{printf("Error: Line %d -> Multiplying different datatypes\n",yylineno);}}
	   	| exp '/' term {if($1==$3){$$=$1;}else{printf("Error: Line %d -> Dividing different datatypes\n",yylineno);}}
      		;

fcall 		: identifier '(' term ')' 	{if(chectyp($1)!=$3)
													{printf("Error: Line %d ->  Function called with different parameters\n",yylineno);}													}
            ;

fdec  		: key identifier '(' key identifier ')' '{'  stats '}'  {symbvalin($2,$4); }
				;

stat			: IF '(' con ')' stat ELSE stat
        		| IF '(' con ')' stat
        		| '{' stats '}'
        		;

stats  		: assign 	';'  	{;}
        	| exp           	{;}
		|  				{;}
        	;	

term  		: number             {$$ = 0;}
		| identifier			{$$=chectyp($1);} 
      		| strv					{$$=1;}
        		;

%%                 

void symbval(char *sy, int val)
{
	int i,f=0;
   for(i=0;i<cp;i++)
		{
			if(strcmp(sy,s[i])==0)
         {
				f=1;
				t[i]=val;
				break;
  			}
		}

	if(f==0)
		printf("Error: Line %d -> '%s' undeclared\n",yylineno,sy);
	
}
void symbvalin(char *sy, int val)
{
	int i,dec=0;
	for(i=0;i<cp;i++)
	{
		if(strcmp(sy,s[i])==0)
		{
			printf("Error: Line %d -> '%s' is previously declared\n",yylineno,sy);
			dec=1;
         break;
		}
	}
  if(dec==0)
  {   
		strcpy(s[cp],sy);
      t[cp]=val;
      cp++;
  }
}
int chectyp(char *sy)
{
   int i,v=0;
	for(i=0;i<cp;i++)
	{
    	if(strcmp(s[i],sy)==0)
		{
			return t[i];
			v=1;
			break;
		}			
	}
  	if(v==0)
		printf("Error: Line %d -> Variable undeclared!!\n",yylineno);
}


int main (void) 
{
	int i;	
	extern FILE *yyin, *yyout; 
   yyin = fopen("Program.c", "r"); 

	if(!yyparse())
		printf("\n");
	else
		printf("\nParsing failed\n");
	
	fclose(yyin);   
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);}

/*
* Submitted by Himanshu Gupta
*/