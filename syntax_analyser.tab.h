
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PUBLIC = 258,
     STATIC = 259,
     CLASS = 260,
     VOID = 261,
     MAIN = 262,
     EXTENDS = 263,
     RETURN = 264,
     SOP = 265,
     LENGTH = 266,
     THIS = 267,
     NEW = 268,
     IF = 269,
     ELSE = 270,
     WHILE = 271,
     INTEGER = 272,
     STRING = 273,
     BOOLEAN = 274,
     DATATYPE = 275,
     OPENPARENT = 276,
     CLOSEPARENT = 277,
     OPENSQRBRACK = 278,
     CLOSESQRBRACK = 279,
     OPENBRAC = 280,
     CLOSEBRAC = 281,
     AND = 282,
     OR = 283,
     DOT = 284,
     SEMICOLON = 285,
     COMMA = 286,
     DOUBLEQUOTE = 287,
     SINGLEQUOTE = 288,
     PLUS = 289,
     MINUS = 290,
     MULTIPLY = 291,
     NOT = 292,
     EQUAL = 293,
     DIV = 294,
     COMPOP = 295,
     BOOLVALUE = 296,
     INTEGERVALUE = 297,
     IDENT = 298
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


