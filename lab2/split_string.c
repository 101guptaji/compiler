#include <stdio.h>
#include <string.h>

int main()
{
	char str[] = "for(i=1;i<=10;i++){ for(j = 0; j < COL; j++) {printf( ""Hello World"");}}return 0; } ";
	int init_size = strlen(str);
	char delim[] = "}";

	char *ptr = strtok(str, "(");
	char *loop="while";
	
	char *init = strtok(NULL, ";");
	char *cond = strtok(NULL, ";");
	char *upd = strtok(NULL, ")");
	printf("%s\n",init);
	printf("%s\n",loop);
	printf("%s\n",cond);
	printf("%s\n",upd);
	char *stmt = strtok(NULL,"}");
	/*while (ptr != NULL)
	{
		strcat(stmt, ptr);
		ptr = strtok(NULL,"}");	
		stmt.append(ptr);
	}*/
	puts(stmt);
	char *comp=" ";
	//comp.append(init);
	//strcat(comp, init);
	//strcat(comp, ";");
	/*strcat(comp, loop);
	strcat(comp, "(");
	strcat(comp, cond);
	strcat(comp, ")");
	strcat(comp, stmt);
	strcat(comp, upd);
	strcat(comp, "}");*/
	puts(comp);
	return 0;
}
