/*check type of number whether it is
       negative or positive*/
%{ 
int count = 0;
int count1 = 0;
%}
%% 
[-][0-9]+ {count++;} 
[0-9]+	 {count1++;}
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
printf("\nNo. of negative numbers is: %d",count);
printf("\nNo. of positive numbers is: %d",count1);
return 0;
}