--# -path=.:alltenses:prelude

resource CombinatorsVot = Combinators with 
  (Cat = CatVot),
  (Structural = StructuralVot),
  (Constructors = ConstructorsVot) ;
