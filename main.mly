%{
(* PA3 for Cool *)
(*OCaml Code*)
type identifier = string * string (*here*)
type cool_class =
  | classNoInherits of identifier * (feature list)

and feature =
  | AttributeNoInit of identifier * identifier

cool_program = cool_class list

%}


/*C code here*/

%token <string> CLASS LPAREN RPAREN PLUS TIMES  LBRACE RBRACE COLON
%token <string,string> INTEGER STRING IDENTIFIER TYPE
%token EOL

%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */

%start cool_program_rule             /* the entry point */
%type <cool_program> cool_program_rule
%%

cool_program_rule:class_list   EOF  { $1 }
;

class_list:                   {[]}
  |cool_class SEMI class_list {$1::$3}
  ;

cool_class: CLASS TYPE  LBRACE feature_list RBRACE  {classNoInherits($1::$4)}
          ;
  
feature_list:       {[]}
            |feature SEMI feature_list  {$1::$3}
            ;

feature: IDENTIFIER COLON  TYPE {AttributeNoInit{$1::$3}}
        ;
      
%%
(*OCaml Code*)
let main () = begin
    Printf.printf "Test PASS\n";
end;;
main();;
