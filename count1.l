%{ 
	int vow=0; 
	int cons =0; 
%} 

%% 
[aeiouAEIOU] {vow++;} 
[a-zA-Z] {cons++;}
\n {return 0;}
%% 
int yywrap() { }
int main() 
{ 
	printf("Enter the string of vowels and consonents:"); 
	yylex(); 
	printf("Number of vowels are: %d\n", vow); 
	printf("Number of consonants are: %d\n", cons); 
	return 0; 
} 

