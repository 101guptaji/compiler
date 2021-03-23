/*count characters other than alphabets*/
%{ 
int count = 0;
%}
%% 
[A-Za-z] {;} 
. {count++;}
\n {return 0;}
%%
int yywrap() {}
int main(){
yylex();
printf("\nNo. of characters other than alphabets: %d",count);
return 0;
}