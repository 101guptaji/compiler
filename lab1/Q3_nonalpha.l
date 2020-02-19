/*To find if a character apart from alphabets occurs in a string.*/
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
	printf("Enter any string:"); 
	yylex();
	printf("\nNo. of characters other than alphabets: %d",count);
	return 0;
}
