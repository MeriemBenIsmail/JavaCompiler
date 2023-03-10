%{
     #include <stdio.h>
     #include <stdlib.h>
     #include <string.h>
     #include "syntax_analyser.tab.h"
     #include <math.h>

     #define YYSTYPE char*

     int line = 1;
%}

%option yylineno
delim                                   ([ \t]|(" "))
bl                                      {delim}+
bl0                                     {delim}*
numberN                                 [0-9]
numberNN                                [1-9]
lettre                                  [a-zA-Z]

openParentheses                         (\()
closeParentheses                        (\))
openSquareBrackets                      (\{)
closeSquareBrackets                     (\})
openBraces                              (\[)
closeBraces                             (\])
COMMENT_LINE                            "//"

identifier                              ([A-Za-z_][A-Za-z0-9_]*)
integerLiteral                          ({numberNN}{numberN}*)
booleanLiteral                          "true"|"false"
illegalIdentifier                       {numberN}({lettre}|{numberN})*

dataType                                {primtiveType}|tableType
primtiveType                            "int"|"bool"|"String"|"byte"|"char"|"short"|"long"|"float"|"double"
tableType                               ({primtiveType}{bl}{openSquareBrackets}{bl0}{closeSquareBrackets})

%%

{bl}                                    /* pas d'actions */
"\n"                                    line++;



"public"                                { return PUBLIC;            }
"static"                                { return STATIC;            }
"class"                                 { return CLASS;             }
"void"                                  { return VOID;              }
"main"                                  { return MAIN;              }
"extends"                               { return EXTENDS;           }
"return"                                { return RETURN;            }
"System.out.println"                    { return SOP;               }
"length"                                { return LENGTH;            }
"this"                                  { return THIS;              }
"new"                                   { return NEW;               }

"if"                                    { return IF;                }
"else"                                  { return ELSE;              }
"while"                                 { return WHILE;             }

"int"                                   { return INTEGER;           }
"String"                                { return STRING;            }
{dataType}                              { return DATATYPE;          }

{openParentheses}                       { return OPENPARENT;        }
{closeParentheses}                      { return CLOSEPARENT;       }
{openSquareBrackets}                    { return OPENSQRBRACK;      }
{closeSquareBrackets}                   { return CLOSESQRBRACK;     }
{openBraces}                            { return OPENBRAC;          }
{closeBraces}                           { return CLOSEBRAC;         }

"&&"                                    { return AND;               }
"||"                                    { return OR;                }

"."                                     { return DOT;               }
";"                                     { return SEMICOLON;         }
","                                     { return COMMA;             }
"\""                                    { return DOUBLEQUOTE;       }
"\'"                                    { return SINGLEQUOTE;       }

"+"                                     { return PLUS;              }
"-"                                     { return MINUS;             }
"*"                                     { return MULTIPLY;          }
"!"                                     { return NOT;               }
"="                                     { return EQUAL;             }
"\/"                                    { return DIV;               }

"<"|">"|"<="|">="|"=="|"!="             { return COMPOP;            }



{booleanLiteral}                        { return BOOLVALUE;         }
{integerLiteral}                        { return INTEGERVALUE;      }
{identifier}                            { return IDENT;             }
{illegalIdentifier}                     { printf("\nLEXICAL ERROR on character %d (line %d): Illegal Identifier\n\n", yytext[0], line);   }


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

int yywrap()
{
	return(1);
}
