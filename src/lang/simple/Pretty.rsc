module lang::simple::Pretty

import lang::simple::AST;
import lang::simple::Parse;
import lang::simple::Implode;

import List;

str pretty(Prog p) = 
  "<for (d <- p.defs){>
  '<pretty(d)>
  '<}>
  '<for (e <- p.main){>
  '<pretty(e)>
  '<}>";
  
str pretty(Def d) =
  "define <d.name.name>(<intercalate(", ", [p.name|p<-d.params])>) =
  '  <pretty(d.body)>";
  
str pretty(val(nat(n))) = "<n>";
str pretty(val(string(s))) = quoted(s);
str pretty(val(error(s))) = "error(<quoted(s)>)";
str pretty(evar(var(x))) = x;
str pretty(assign(var(x), e)) = "<x> = <pretty(e)>";
str pretty(call(var(x), es)) = "<x>(<intercalate(", ",[pretty(e)|e<-es])>)";
str pretty(cond(c, t, e)) = "if (<pretty(c)>) then <pretty(t)> else <pretty(e)> end";
str pretty(plus(e1,e2)) = "(<pretty(e1)> + <pretty(e2)>)";
str pretty(seq(e1,e2)) = "(<pretty(e1)>; <pretty(e2)>)";
str pretty(eq(e1,e2)) = "(<pretty(e1)> == <pretty(e2)>)";
str pretty(block(locals, e)) = "{<intercalate(", ", [l.name|l<-locals])> : <pretty(e)>}";

str quoted(s) = "\"<s>\"";

//test bool prettyParse(Prog p) = p == implode(parse(pretty(p)));
