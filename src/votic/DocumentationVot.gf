--# -path=.:../abstract:../common

-- documentation of Estonian in Estonian: the default introduced in LangVot

concrete DocumentationVot of Documentation = CatVot ** 
  DocumentationVotFunctor with (Terminology = TerminologyVot) ;
