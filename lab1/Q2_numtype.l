/* Lex program to Count the Positive numbers, 
	- Negative numbers and Fractions */

%{ 
	
	int p=0; 
	int n=0; 
	int pf=0; 
	int nf=0; 
%} 


%% 

[+]?[0-9]+			{ p++; }
[-][0-9]+			 {n++; }
[+]?[0-9]*.[0-9]+ 		{pf++; }
[-][0-9]*[.][0-9]+	 	{nf++; }
. ;
\n {return 0;}
%% 
int yywrap() { }

int main() 
{ 
	printf("Enter any numbers");
	yylex(); 
	printf("\nNo. of positive numbers: %d", p); 
	printf("\nNo. of Negative numbers: %d", n); 
	printf("\nNo. of Positive numbers in fractions: %d",pf); 
	printf("\nNo. of Negative numbers in fractions: %d\n", nf); 
	return 0; 
} 

