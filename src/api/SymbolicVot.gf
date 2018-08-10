--# -path=.:../votic:../common:../abstract:../prelude

resource SymbolicVot = Symbolic with 
  (Symbol = SymbolVot),
  (Grammar = GrammarVot) ;
