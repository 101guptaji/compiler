/*count number of consonants and vowels*/
%{ 
int count = 0;
int count1 = 0;
%}
%% 
[AEIOUaeiou] {count++;} 
[A-Za-z]	 {count1++;} 
\n {return 0;} 
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
printf("\nNo. of vowels is: %d",count);
printf("\nNo. of Consonants is: %d",count1);
return 0;
}