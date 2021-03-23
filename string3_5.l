/* identify and count 3,4,5 length strings*/
%{ 
int count3 = 0;
int count4 = 0;
int count5 = 0;
%}
%%
[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] {}
[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] {printf("%s: is a 5 length string\n",yytext);count5++;}
[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] {printf("%s: is a 4 length string\n",yytext);count4++;}
[a-zA-Z][a-zA-Z][a-zA-Z] {printf("%s: is a 3 length string\n",yytext);count3++;}
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
printf("\nNo. of 3 length strings: %d",count3);
printf("\nNo. of 4 length strings: %d",count4);
printf("\nNo. of 5 length strings: %d",count5);
return 0;
}