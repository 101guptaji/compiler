
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
    int matrix[ROW][COL] = { { 1, 2, 3 }, 
                             { 4, 5, 6 }, 
                             { 7, 8, 9 } }; 
    printf("Given matrix is \n"); 
  
    // Print the matrix using nested loops 
    for (i = 0; i < ROW; i++) { 
  
        for (j = 0; j < COL; j++) 
            printf("%d ", matrix[i][j]); 
  
         
    } 
printf("\n");
i=0;
	do
	{	j=0;
		do{
		printf("%d ", matrix[i][j]);
		j++; 
 		}while(j<COL);
		i++;
		 printf("\n");
	}while (i<ROW);
  
    return 0; 
} 

