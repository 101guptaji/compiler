/* identify keywods and identifiers in c language*/
%%
auto|break|case|char|const|continue|default|do|double|else|enum {printf("%s<KW>", yytext);}
extern|float|for|goto|if|int|long|register|return|short|signed|sizeof {printf("%s<KW>", yytext);}
static|struct|switch|typedef|union|unsigned|void|volatile|while {printf("%s<KW>", yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s<ID>", yytext);}
. {printf("%s", yytext);}
\n {printf("\n");} 
%%
int yywrap() {}
int main(){
FILE *fp;
char filename[50]; 
//printf("Enter the filename: \n"); 
//scanf("%s",filename); 
fp = fopen("test1.c","r"); 
yyin = fp;
yylex();
return 0;
}
