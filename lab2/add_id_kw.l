/* place a marker
<KW> and <ID> with every Keyword and Identifier respectively.*/
%%
auto|break|case|char|const|continue|default|do|double|else|enum 	{printf("%s<KW>", yytext);}
extern|float|for|goto|if|int|long|register|return|short|signed|sizeof	{printf("%s<KW>", yytext);}
static|struct|switch|typedef|union|unsigned|void|volatile|while		{printf("%s<KW>", yytext);}
[a-zA-Z0-9_]*[ ]*[(].* {printf("%s",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s<ID>", yytext);}
. {printf("%s", yytext);}

%%
int yywrap() {}
int main(){
yyin = fopen("test2.c","r"); 
yylex();
return 0;
}
