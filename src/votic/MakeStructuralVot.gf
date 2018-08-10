resource MakeStructuralVot = open CatVot, ParadigmsVot, MorphoVot, Prelude in {

oper 
  mkConj : Str -> Str -> ParadigmsVot.Number -> Conj = \x,y,n -> 
    {s1 = x ; s2 = y ; n = n ; lock_Conj = <>} ;
  mkSubj : Str -> Subj = \x -> 
    {s = x ; lock_Subj = <>} ;
  mkIQuant : Str -> IQuant = \s ->
    {s = \\n,c => s ; lock_IQuant = <>} ; ----

}
