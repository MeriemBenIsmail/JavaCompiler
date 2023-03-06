%{
     int line = 1;
%}

delim                                   ([ \t]|(" "))
bl                                      {delim}+
bl0                                     {delim}*
numberN                                 [0-9]
numberNN                                [1-9]
lettre                                  [a-zA-Z]

openParentheses                         (\()
closeParentheses                        (\))
openSquareBrackets                      (\[)
closeSquareBrackets                     (\])
openBraces                              (\{)
closeBraces                             (\})
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

"public"                                {printf("KEYWORD \n");}
"static"                                {printf("KEYWORD \n");}
"class"                                 {printf("KEYWORD \n");}
"void"                                  {printf("KEYWORD \n");}
"main"                                  {printf("KEYWORD \n");}
"extends"                               {printf("KEYWORD \n");}
"return"                                {printf("KEYWORD \n");}
"System.out.println"                    {printf("KEYWORD \n");}
"length"                                {printf("KEYWORD \n");}
"this"                                  {printf("KEYWORD \n");}
"new"                                   {printf("KEYWORD \n");}

"if"                                    {printf("STATEMENT \n");}
"else"                                  {printf("STATEMENT \n");}
"while"                                 {printf("STATEMENT \n");}

"int"                                   {printf("DATA TYPE \n");}
"String"                                {printf("DATA TYPE \n");}
{dataType}                              {printf("DATA TYPE \n");}

{openParentheses}                       {printf("OPEN PARANTHESES \n");}
{closeParentheses}                      {printf("CLOSE PARANTHESES \n");}
{openSquareBrackets}                    {printf("OPEN SQUARE BRACKETS \n");}
{closeSquareBrackets}                   {printf("CLOSE SQUARE BRACKETS \n");}
{openBraces}                            {printf("OPEN BRACES \n");}
{closeBraces}                           {printf("CLOSE BRACES \n");}

"&&"                                    {printf("LOGICAL OPERATOR: \n");}
"||"                                    {printf("LOGICAL OPERATOR: \n");}

"."                                     {printf("PUNCTUATION: \n");}
";"                                     {printf("SEMI COL: \n");}
","                                     {printf("COL: \n");}


"+"                                     {printf("ARITH OPERATOR: \n");}
"-"                                     {printf("ARITH OPERATOR: \n");}
"*"                                     {printf("ARITH OPERATOR: \n");}
"!"                                     {printf("ARITH OPERATOR: \n");}
"="                                     {printf("ASSIGNMENT OPERATOR: \n");}
"\/"                                    {printf("ARITH OPERATOR: \n");}

"<"|">"|"<="|">="|"=="|"!="             {printf("COMP OPERATOR: \n");}



{booleanLiteral}                        {printf("BOOL LITERAL: \n");}
{integerLiteral}                        {printf("INTEGER LITERAL \n");}
{identifier}                            {printf("IDENTIFIER \n");}
{illegalIdentifier}                     { printf("\nLEXICAL ERROR on character %d (line %d): Illegal Identifier\n\n", yytext[0], line);   }

\/\/.*                                  {   /* skip */   }

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