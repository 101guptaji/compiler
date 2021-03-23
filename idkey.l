/* identify keywods and identifiers in c language*/
%{ 
int count = 0;
%}
%%
auto|break|case|char|const|continue|default|do|double|else|enum {printf("%s: is a keyword\n", yytext);}
extern|float|for|goto|if|int|long|register|return|short|signed|sizeof {printf("%s: is a keyword\n", yytext);}
static|struct|switch|typedef|union|unsigned|void|volatile|while {printf("%s: is a keyword\n", yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s: is an identifier\n", yytext);}
. {}
\n {} 
%%
int yywrap() {}
int main(){
FILE *fp;
char filename[50]; 
printf("Enter the filename: \n"); 
scanf("%s",filename); 
fp = fopen(filename,"r"); 
yyin = fp;
yylex();
return 0;
}