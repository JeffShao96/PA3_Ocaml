/* PA3 for Cool */
%token <string> CLASS LPAREN RPAREN PLUS TIMES
%token <string,string> INTEGER STRING IDENTIFER TYPE
%token EOL

%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */

%start cool_program             /* the entry point */
%type <FIXME> main
%%

cool_program:class_list   EOF  { $1 }
;

class_list:                   {[]}
  |cool_class SEMI class_list {$1::$3}
  ;
main:
  expr EOL                { $1 }
;
expr:
INT                       { $1 }
| LPAREN expr RPAREN      { $2 }
| expr PLUS expr          { $1 + $3 }
| expr MINUS expr         { $1 - $3 }
| expr TIMES expr         { $1 * $3 }
| expr DIV expr           { $1 / $3 }
| MINUS expr %prec UMINUS { - $2 }
;