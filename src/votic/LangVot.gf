--# -path=.:../abstract:../common:../api:../prelude

-- TODO: include the full GrammarVot
-- The Slash* is currently excluded only for performance reasons.
concrete LangVot of Lang =
  GrammarVot - [Slash2V3,SlashV2A,Slash3V3,SlashV2VNP,SlashVV], ---- to speed up compilation
  LexiconVot
  ,ConstructionVot
  ,DocumentationVot --# notpresent
  ** {

flags startcat = Phr ; unlexer = text ; lexer = finnish ;

} ;
