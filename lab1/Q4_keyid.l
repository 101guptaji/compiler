/* identify keywods and identifiers in c language*/
%{ 
int count = 0;

%}

%%
auto|break|case|char|const|continue|default|do|double|else|enum |
extern|float|for|goto|if|int|long|register|return|short|signed|sizeof |
static|struct|switch|typedef|union|unsigned|void|volatile|while {printf("%s: is a keyword\n", yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s: is an identifier\n", yytext);}
. {;}
\n {return 0;} 
%%
int yywrap() {}
int main(){
printf("Enter any string:"); 
yylex();
return 0;
}
