%{
	

#include <stdio.h>	
 			
int yyerror(char const *msg);	
int yylex(void);
extern int yylineno;

%}

%token PUBLIC
%token STATIC
%token CLASS
%token VOID
%token MAIN
%token EXTENDS
%token RETURN
%token SOP
%token LENGTH
%token THIS
%token NEW
%token IF
%token ELSE
%token WHILE
%token INTEGER
%token STRING
%token BOOLEAN
%token DATATYPE
%token OPENPARENT
%token CLOSEPARENT
%token OPENSQRBRACK
%token CLOSESQRBRACK
%token OPENBRAC
%token CLOSEBRAC
%token AND
%token OR
%token DOT
%token SEMICOLON
%token COMMA
%token DOUBLEQUOTE
%token SINGLEQUOTE
%token PLUS
%token MINUS
%token MULTIPLY
%token NOT
%token EQUAL
%token DIV
%token COMPOP
%token BOOLVALUE
%token INTEGERVALUE
%token IDENT

 
%error-verbose
%start program

%%
                                                           
program		                  : MainClass ClassDeclaration
                              |error ClassDeclaration            {yyerror (" main attendu on line : "); YYABORT}
                              |MainClass error        {yyerror ("classe invalide on line : "); YYABORT} 
;


MainClass:
    CLASS IDENT OPENSQRBRACK VarDeclaration PUBLIC STATIC VOID MAIN OPENPARENT STRING OPENBRAC CLOSEBRAC IDENT CLOSEPARENT OPENSQRBRACK Statement CLOSESQRBRACK CLOSESQRBRACK
    { printf("Valid MainClass.\n"); }
    | CLASS IDENT OPENSQRBRACK PUBLIC STATIC VOID MAIN OPENPARENT STRING OPENBRAC CLOSEBRAC IDENT CLOSEPARENT OPENSQRBRACK Statement CLOSESQRBRACK CLOSESQRBRACK
    { printf("Valid MainClass.\n"); }
    
    
;

ClassDeclaration:
    CLASS IDENT OPENSQRBRACK VarDeclaration PUBLIC Type IDENT OPENPARENT Type IDENT CLOSEPARENT OPENSQRBRACK VarDeclaration Statement RETURN Expression SEMICOLON CLOSESQRBRACK CLOSESQRBRACK
    { printf("Valid class.\n"); }
    | CLASS IDENT OPENSQRBRACK PUBLIC Type IDENT OPENPARENT Type IDENT CLOSEPARENT OPENSQRBRACK VarDeclaration Statement  RETURN Expression SEMICOLON CLOSESQRBRACK CLOSESQRBRACK
    { printf("Valid class.\n"); }
;
Type: 
    DATATYPE
    | INTEGER
    | STRING
    | IDENT
;


extends_opt:
    EXTENDS IDENT
    |
    { }
;

VarDeclaration:
    DATATYPE|INTEGER IDENT SEMICOLON
    { printf("Valid VarDeclaration.\n"); }
    
;

MethodDeclaration:
    PUBLIC DATATYPE IDENT OPENPARENT ParamList CLOSEPARENT OPENSQRBRACK VarDeclaration Statement RETURN Expression SEMICOLON CLOSESQRBRACK
    { printf("Valid MethodDeclaration.\n"); }
;

ParamList:
    DATATYPE IDENT COMMA ParamList
    { printf("Valid ParamList.\n"); }
;

Type:
    INTEGER OPENBRAC CLOSEBRAC
    { printf("Valid Type: int[].\n"); }
    | BOOLEAN
    { printf("Valid Type: boolean.\n"); }
    | INTEGER
    { printf("Valid Type: int.\n"); }
    | IDENT
    { printf("Valid Type: identifier.\n"); }
;

Statement:
    OPENSQRBRACK Statement CLOSESQRBRACK
    { printf("Valid Block.\n"); }
    | IF OPENPARENT Expression CLOSEPARENT Statement ELSE Statement
    { printf("Valid If Statement.\n"); }
    | WHILE OPENPARENT Expression CLOSEPARENT Statement
    { printf("Valid While Statement.\n"); }
    | SOP OPENPARENT Expression CLOSEPARENT SEMICOLON
    { printf("Valid System.out.println Statement.\n"); }
    | IDENT EQUAL Expression SEMICOLON
    { printf("Valid Assignment Statement.\n"); }
    | IDENT OPENBRAC Expression CLOSEBRAC EQUAL Expression SEMICOLON
    { printf("Valid Array Assignment Statement.\n"); }
;

Expression:
    Expression AND Expression
    { printf("Valid Logical And Expression.\n"); }
    | OPENPARENT Expression CLOSEPARENT AND Expression 
    { printf("Valid Logical And Expression.\n"); }
    | Expression COMPOP Expression
    { printf("Valid Less Than Expression.\n"); }
    | OPENPARENT Expression COMPOP Expression CLOSEPARENT
    { printf("Valid Logical And Expression.\n"); }
    | Expression PLUS Expression
    { printf("Valid Addition Expression.\n"); }
    | OPENPARENT Expression PLUS Expression CLOSEPARENT
    { printf("Valid Logical And Expression.\n"); }
    | Expression MINUS Expression
    { printf("Valid Subtraction Expression.\n"); }
    | OPENPARENT Expression MINUS Expression CLOSEPARENT
    { printf("Valid Logical And Expression.\n"); }
    | Expression MULTIPLY Expression
    { printf("Valid Multiplication Expression.\n"); }
    |  Expression MULTIPLY OPENPARENT Expression CLOSEPARENT
    { printf("Valid Logical And Expression.\n"); }
    | OPENPARENT Expression CLOSEPARENT MULTIPLY Expression 
    { printf("Valid Logical And Expression.\n"); }
    | OPENPARENT Expression CLOSEPARENT MULTIPLY OPENPARENT Expression CLOSEPARENT
    { printf("Valid Logical And Expression.\n"); }
    | Expression OPENBRAC Expression CLOSEBRAC
    { printf("Valid Array Access Expression.\n"); }
    | Expression DOT LENGTH
    { printf("Valid Array Length Expression.\n"); }
    | Expression DOT IDENT OPENPARENT Expression CLOSEPARENT
    { printf("Valid method call Expression.\n"); }
    | INTEGERVALUE
    { printf("Valid Integer Literal Expression.\n"); }
    | BOOLVALUE
    { printf("Valid Boolean Literal Expression.\n"); }
    | IDENT
    { printf("Valid Identifier Expression.\n"); }
    | THIS
    { printf("Valid 'this' Expression.\n"); }
    | NEW INTEGER OPENBRAC Expression CLOSEBRAC
    { printf("Valid New Integer Array Expression.\n"); }
    | NEW IDENT OPENPARENT CLOSEPARENT
    { printf("Valid New Object Expression.\n"); };
   

%% 

int yyerror(char const *msg) {
	fprintf(stderr, "%s %d\n", msg,yylineno);
	return 0;
}

extern FILE *yyin;

int main()
{
 yyparse();
}

  
                   
