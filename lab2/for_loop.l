%{
#include <stdio.h> 
#include <string.h> 
char *forwhile(char *str)
{	int init_size = strlen(str);
	char delim[] = "}";

	char *ptr = strtok(str, "(");
	char *loop="while";
	
	char *init = strtok(NULL, ";");
	char *cond = strtok(NULL, ";");
	char *upd = strtok(NULL, ")");
	printf("%s\n",init);
	printf("%s\n",loop);
	printf("%s\n",cond);
	printf("%s\n",upd);
	char *stmt = strtok(NULL,"}");
	/*while (ptr != NULL)
	{
		
		ptr = strtok(NULL, delim);	
		strcat(stmt, ptr);
	}*/
	puts(stmt);
	strcat(init, ";\n");
	strcat(init, loop);
	strcat(init, "(");
	strcat(init, cond);
	/*strcat(init, ")\n");
	strcat(init, "{");
	strcat(init, stmt);
	strcat(init, ";");
	strcat(init, upd);
	strcat(init, ";");
	strcat(init, "}");*/
	return init;
}

%}
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]*
uop "++"|"--"
bop "<"|">"|"<="|">="|"=="|"!="|"&&"|"||"
n [ \t\n]
%%
for\(({id}=({num}|{id}))?\;{id}{bop}({id}|{num})\;{id}{uop}\){n}+\{(.*\n)*.*\} {char *ptr = strtok(yytext, "(");
	char *loop="while";
	char *init = strtok(NULL, ";");
	char *cond = strtok(NULL, ";");
	char *upd = strtok(NULL, ")");
	char *stmt = strtok(NULL,"}");
	fprintf(yyout,"%s",init);
	fprintf(yyout,"%s",";\n");
	fprintf(yyout,"%s",loop);
	fprintf(yyout,"%s","(");
	fprintf(yyout,"%s",cond);
	fprintf(yyout,"%s",")\n");
	fprintf(yyout,"%s","{");
	fprintf(yyout,"%s",stmt);
	fprintf(yyout,"%s",upd);
	fprintf(yyout,"%s",";");
	fprintf(yyout,"%s","}");
	ptr = strtok(NULL,"}");
	while (ptr != NULL)
	{
		fprintf(yyout,"%s",ptr);
		fprintf(yyout,"%s","}");
		ptr = strtok(NULL, "}");	
	}//fprintf(yyout,"%s",ptr);
	fprintf(yyout,"%s"," ");}
. {fprintf(yyout,"%s", yytext);}
\n {fprintf(yyout,"\n");} 
%%
int yywrap() {}
int main(){
//char filename[50];
//printf("Enter the filename: \n"); 
//scanf("%s",filename); 
yyin = fopen("test1.c","r"); 
yyout = fopen("forwhile.txt","w");
//yyin = fp1;
//yyout = fp2;
yylex();
return 0;
}
