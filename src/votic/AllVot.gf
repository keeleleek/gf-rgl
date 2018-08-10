--# -path=.:../abstract:../common:../prelude:../api

concrete AllVot of AllVotAbs = 
  LangVot, --  - [SlashV2VNP,SlashVV, TFut], ---- to speed up linking; to remove spurious parses
  ExtraVot -- - [ProDrop, ProDropPoss, S_OSV, S_VSO, S_ASV] -- to exclude spurious parses
  ** {} ;
