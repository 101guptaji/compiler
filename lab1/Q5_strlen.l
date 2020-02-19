/* To identify set of strings having 3 to 5 alphabets.*/
%{ 
int c3 = 0;
int c4 = 0;
int c5 = 0;
%}
%%
[a-zA-Z]{3} {printf("%s: is a string of length 3\n",yytext);c3++;}
[a-zA-Z]{4} {printf("%s: is a string of length 4\n",yytext);c4++;}
[a-zA-Z]{5} {printf("%s: is a string of length 5\n",yytext);c5++;}
[a-zA-Z]{6}+ {}
. {}
\n { return 0;} 
%%
int yywrap() {}
int main(){
printf("Enter any string or text:"); 
yylex();
printf("\nNo. of strings of 3 length : %d",c3);
printf("\nNo. of strings of 4 length : %d",c4);
printf("\nNo. of strings of 5 length : %d\n",c5);
return 0;
}
