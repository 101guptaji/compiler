%{
#include<stdio.h>
#include<string.h>


typedef struct stack{
    char *update;
    int value;
	struct stack *next;
}stack;

stack* top(  stack* head);
stack* push(  stack* head, char *update, int value);
stack* pop(  stack* head);
stack* create(FILE *yyout,char *arr,   stack* head,int value);
stack* delete(FILE *yyout,  stack *head);
void rm_while(FILE *yyout,  char *arr );
stack *head = NULL;

%}


%%
for([ ]*\n?)*[(](([^(])*\n?)*[)]([ ]*\n?)*[{] {head = create(yyout,yytext,head,0);}
for([ ]*\n?)*[(](([^(])*\n?)*[)]([ ]*\n?)* {head = create(yyout,yytext,head,1);}
do([^{]*\n?)*[{] {fprintf(yyout,"while(1){ "); }
do([^{]*\n?)* {fprintf(yyout,"while(1){ "); }
[}]([^}]*\n?)*while([^(]*\n?)*[(]([^)]*\n?)*[)]([ ]*\n?)*[;] {rm_while(yyout,yytext);}
[}] {head=delete(yyout,head);}
[{] {fprintf(yyout,"{ ");head=push(head,NULL,0);}
.   {fprintf(yyout,"%s",yytext);}
\n  {fprintf(yyout,"\n");}
%%
stack* create(FILE *yyout, char *arr,   stack *head, int value){
    //fprintf(yyout,"{");
    int i = 0;

    while(arr[i] != '('){i++;}
    i++;
    while(arr[i]==' '||arr[i]=='\n'){i++;}

        while(arr[i]!=';'){
            fprintf(yyout,"%c",arr[i]);
            i++;
        }
        fprintf(yyout,";");
    	i++;

    while(arr[i]==' '||arr[i]=='\n'){i++;}
    fprintf(yyout,"\nwhile(");
    if(arr[i]!=';'){
        while(arr[i]!=';'){
            fprintf(yyout,"%c",arr[i]);
            i++;
        }
    }
    else{
        fprintf(yyout,"1");
    }
    fprintf(yyout,"){\n");
    i++;
    while(arr[i]==' '||arr[i]=='\n'){i++;}

    char *update = NULL;
    if(arr[i]!=')'){
        update = (char*)malloc(10*sizeof(char));
        int j = 0;
        while(arr[i]!=')'){
            if(arr[i] != ' ' && arr[i] != '\n'){
                update[j] = arr[i];
                j++;
            }
            i++;
        }
        update[j] = '\0';
    }
    head = push(head,update,value);
    return head;
}



stack* top(  stack* head){
    return head;
}

stack* push(  stack *head, char *update, int value){
      stack* temp = (stack*)malloc(sizeof(stack));
    temp->update = update;
    temp->value = value;
    temp->next = head;
    return temp;
}

stack* pop(  stack* head){
    if(head == NULL){
        return NULL;
    }
    return head->next;
}



stack* delete(FILE *yyout,  stack *head){

    if(top(head)->update!=NULL){
        fprintf(yyout,"%s;\n",top(head)->update);
    }

    fprintf(yyout,"}\n");
	while(head->value==1){
    		head = pop(head);
		if(top(head)->update!=NULL){
        fprintf(yyout,"%s;\n",top(head)->update);
    }
	head = pop(head);
	 fprintf(yyout,"}\n");
   }
    return head;
}

void rm_while(FILE *yyout,char *arr){
    int i = 0;

    while(arr[i] != '('){i++;}
    i++;

    while(arr[i] == ' '){i++;}
    fprintf(yyout,"if(!(");
    while(arr[i] != ')'){
            fprintf(yyout,"%c",arr[i]);
        i++;
    }
    fprintf(yyout,"))\nbreak;\n}");


}

int yywrap(){}
int main() {

    yyin=fopen("test3.c","r");
    yyout=fopen("output.c","w");
    yylex();
    printf("open output.c file\n");
}
