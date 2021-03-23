%{
#include <stdio.h> 
#include <string.h>
int count = 0, count1 = 0;
int nest(char *str, char *sub)
{
	int i, j, l, l1, l2;
	l1 = strlen(str);
	l2 = strlen(sub);
	for (i = 0; i < l1;)
	{
        j = 0;
        count = 0;
        while ((str[i] == sub[j]))
        {
            count++;
            i++;
            j++;
        }
        if (count == l2)
        {
            count1++;                                   
            count = 0;
        }
        else
            i++;
    }    
    return count1;
}
%}

id [a-zA-Z][a-zA-Z0-9]*
num [0-9]*
uop "++"|"--"
bop "<"|">"|"<="|">="|"=="|"!="|"&&"|"||"
n [ \t\n]
%%
for\(({id}=({num}|{id}))?\;{id}{bop}({id}|{num})\;{id}{uop}\){n}+\{(.*\n)*.*\} {count=nest(yytext,"for");}

. {fprintf(yyout,"%s", yytext);}
\n {fprintf(yyout,"\n");} 
%%
int yywrap() {}
int main(){
//char filename[50];
//printf("Enter the filename: \n"); 
//scanf("%s",filename); 
yyin = fopen("test3.c","r"); 
yyout = fopen("forwhile2.txt","w");
//yyin = fp1;
//yyout = fp2;
yylex();
printf(count);
return 0;
}
