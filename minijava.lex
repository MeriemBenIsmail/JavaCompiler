%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define YYSTYPE char*

int line = 1;
%}

delim                                   ([ \t]|(" "))
bl                                      {delim}+
bl0                                     {delim}*
numberN                                 [0-9]
numberNN                                [1-9]
lettre                                  [a-zA-Z]
COMMENT_LINE                            "//"




%%
{bl}                                    /* pas d'actions */
"\n"                                    line++;

{COMMENT_LINE}         								     printf(" COMMENT ");
"true"                  { printf("LITERAL: \n"); }
"false"                  { printf("LITERAL: \n"); }
"null"                        { printf("LITERAL: \n"); }
"[+-]?([0-9]*\.[0-9]+|[0-9]+)" { printf("LITERAL: \n"); }

"if"           { printf("STATEMENT: \n"); }
"else"           { printf("STATEMENT: \n"); }
"while"           { printf("STATEMENT: \n"); }
"for"           { printf("STATEMENT: \n"); }

"class" { printf("KEYWORD: \n"); }
"public" { printf("KEYWORD: \n"); }
"static" { printf("KEYWORD: \n"); }
"void" { printf("KEYWORD: \n"); }
"main" { printf("KEYWORD: \n"); }
"string" { printf("KEYWORD: \n"); }
"extends" { printf("KEYWORD: \n"); }
"return" { printf("KEYWORD: \n"); }

"=="             { printf("OPERATOR: \n"); }
"!="             { printf("OPERATOR: \n"); }
"<="             { printf("OPERATOR: \n"); }
">="             { printf("OPERATOR: \n"); }
"<|>"             { printf("OPERATOR: \n"); }
"="                           { printf("ASSIGNMENT OPERATOR: \n"); }
"&&"                     { printf("LOGICAL OPERATOR: \n"); }
"!"                           { printf("LOGICAL NOT: \n"); }
"["                           { printf("LEFT BRACKET: \n"); }
"]"                           { printf("RIGHT BRACKET: \n"); }
"("                           { printf("LEFT PARENTHESIS: \n"); }
")"                           { printf("RIGHT PARENTHESIS: \n"); }
"{"                           { printf("LEFT CURLY BRACKET: \n"); }
"}"                           { printf("RIGHT CURLY BRACKET: \n"); }

"System.out.println"          { printf("SYSTEM.OUT.PRINTLN: \n"); }

"[_a-zA-Z][_a-zA-Z0-9]*"      { printf("IDENTIFIER: \n"); }

"/*"                                    {
                                             
                                             int isComment = 1;
                                             char c;
                                             while(isComment) {
                                                  c = input();
                                                  if(c == '*') {
                                                       char ch = input();
                                                       if(ch == '/') {isComment = 0;
                                                       printf("this is a bloc comment: \n");
                                                       }
                                                       else unput(ch);

                                                  }
                                                  else if(c == '\n') line++;
                                                  else if(c == EOF) {
                                                       printf("\nLEXICAL ERROR (line %d): Unterminated comment \n", line);
                                                       isComment = 0;
                                                  }
                                             }
                                        }



%%


int main(int argc, char *argv[])
{
     yyin = fopen(argv[1], "r");
     yylex();
     fclose(yyin);
}

int yywrap()
{
	return(1);
}
