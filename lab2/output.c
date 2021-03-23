
// C program that uses nested for loop 
// to print a 2D matrix 
  
#include <stdio.h> 
#include <stdlib.h> 
  
#define ROW 3 
#define COL 3 
  
// Driver program 
int main() 
{  
  
    int i, j; 
  
    // Declare the matrix 
    int matrix[ROW][COL] = {  {  1, 2, 3 }
, 
                             {  4, 5, 6 }
, 
                             {  7, 8, 9 }
 }
; 
    printf("Given matrix is \n"); 
  
    // Print the matrix using nested loops 
    i = 0;
while(i < ROW){
 
  
        j = 0;
while(j < COL){
printf("%d ", matrix[i][j]); 
  
         
    j++;
}
i++;
}
 
printf("\n");
i=0;
	while(1){ 	j=0;
		while(1){ 
		printf("%d ", matrix[i][j]);
		j++; 
 		if(!(j<COL))
break;
}
		i++;
		 printf("\n");
	if(!(i<ROW))
break;
}
  
    return 0; 
}
 

