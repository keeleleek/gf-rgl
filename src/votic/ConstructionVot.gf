--# -path=alltenses:.:../abstract:../api:../common

concrete ConstructionVot of Construction = CatVot ** 
  open SyntaxVot, SymbolicVot, ParadigmsVot, (L = LexiconVot), (E = ExtraVot), (R = ResVot), Prelude  in {
flags coding=utf8 ;

lin
  hungry_VP = mkVP have_V2 (lin NP (mkNP (mkPN "kõht tühi"))) ;
  thirsty_VP = mkVP have_V2 (lin NP (mkNP (ParadigmsVot.mkN "janu"))) ;
  tired_VP = mkVP (ParadigmsVot.mkA "väsinud") ;
  scared_VP = mkVP (caseV nominative (mkV "kartma")) ;
  ill_VP = mkVP (mkA "haige") ;
  ready_VP = mkVP (ParadigmsVot.mkA "valmis") ;

  has_age_VP card = 
    let n_years_AdA : AdA = lin AdA (mkUtt (lin NP (mkNP <lin Card card : Card> L.year_N)))
    in  mkVP (mkAP n_years_AdA L.old_A) ;

  have_name_Cl x y = mkCl (mkNP (E.GenNP x) L.name_N) (lin NP y) ;
  married_Cl x y = mkCl (mkNP and_Conj (lin NP x) (lin NP y)) (ParadigmsVot.mkAdv "abielus") ;

  what_name_QCl x = mkQCl (mkIComp whatSg_IP) (mkNP (E.GenNP x) L.name_N) ;
  how_old_QCl x = mkQCl (E.ICompAP (mkAP L.old_A)) (lin NP x) ;
  how_far_QCl x = mkQCl (E.IAdvAdv L.far_Adv) (lin NP x) ;

-- some more things
  weather_adjCl ap = mkCl (mkVP (lin AP ap)) ;
   
  is_right_VP = mkVP have_V2 (lin NP (mkNP (ParadigmsVot.mkN "õigus"))) ;
  is_wrong_VP = mkVP (ParadigmsVot.mkV "eksima") ;

  n_units_AP card cn a = mkAP (lin AdA (mkUtt (lin NP (mkNP <lin Card card : Card> (lin CN cn))))) (lin A a) ;

{-
  glass_of_CN  np =  mkCN (lin N2 (mkN2 (mkN "klaas") (mkPrep partitive))) (lin NP np) | mkCN (lin N2 (mkN2 (mkN "klaasitäis") (mkPrep partitive))) (lin NP np) ;


  where_go_QCl np = mkQCl (lin IAdv (ss "kuhu")) (mkCl np (mkVP L.go_V)) ;
  where_come_from_QCl np =  mkQCl (lin IAdv (ss "kust")) (mkCl np (mkVP L.come_V)) ;
  
  go_here_VP = mkVP (mkVP L.go_V) (mkAdv "siia") ;
  come_here_VP = mkVP (mkVP L.come_V) (mkAdv "siia") ;
  come_from_here_VP = mkVP (mkVP L.come_V) (mkAdv "sealt") ;

  go_there_VP = mkVP (mkVP L.go_V) (mkAdv "siia") ;
  come_there_VP = mkVP (mkVP L.come_V) (mkAdv "siia") ;
  come_from_there_VP = mkVP (mkVP L.come_V) (mkAdv "sealt") ;
-}

lincat
  Weekday = {noun : N ; habitual : SyntaxVot.Adv} ;
  Monthday = NP ;
  Month = N ;
  Year = NP ;
lin

  weekdayPunctualAdv w = lin Adv {s = pointWeekday w} ;
  weekdayHabitualAdv w = w.habitual ;
  weekdayLastAdv w = ParadigmsVot.mkAdv ("eelmisel" ++ pointWeekday w) ;
  weekdayNextAdv w = ParadigmsVot.mkAdv ("järgmisel" ++ pointWeekday w) ;

  monthAdv m = SyntaxVot.mkAdv in_Prep (mkNP m) ;
  yearAdv y = SyntaxVot.mkAdv (prePrep nominative "aastal") y ;
----  dayMonthAdv d m = ParadigmsVot.mkAdv (d.s ! R.NPCase R.Nom ++ BIND ++ "." ++ m.s ! R.NCase R.Sg R.Part) ;  
----  monthYearAdv m y = SyntaxVot.mkAdv in_Prep (mkNP (mkNP m) (SyntaxVot.mkAdv (casePrep nominative) y)) ;
----  dayMonthYearAdv d m y = 
----    lin Adv {s = d.s ! R.NPCase R.Nom ++ BIND ++ "." ++ m.s ! R.NCase R.Sg R.Part ++ y.s ! R.NPCase R.Nom} ;  

  intYear = symb ;
  intMonthday = symb ;

oper
  pointWeekday : Weekday -> Str = \w -> (SyntaxVot.mkAdv (casePrep essive) (mkNP w.noun)).s ; 

lincat Language = N ;

--lin InLanguage l = SyntaxVot.mkAdv (mkPrep translative) (mkNP l) ;

lin
  weekdayN w = w.noun ;
  monthN m = m ;
  languageNP l = mkNP l ;
  languageCN l = mkCN l ;

--------------- lexicon of special names

oper mkLanguage : Str -> N = \s -> mkN (s ++ "keel") ;

oper mkWeekday : Str -> Weekday = \d -> 
      lin Weekday {
       noun = mkN d ; 
       habitual = ParadigmsVot.mkAdv (d + "iti") ; --kolmapäeviti
      } ; 


lin monday_Weekday = mkWeekday "esimespäive" ;
lin tuesday_Weekday = mkWeekday "tõinpäive" ;
lin wednesday_Weekday = mkWeekday "kõlmõspäive" ;
lin thursday_Weekday = mkWeekday "nellespäive" ;
lin friday_Weekday = mkWeekday "viijespäive" ;
lin saturday_Weekday = mkWeekday "laukopäive" ;
lin sunday_Weekday = mkWeekday "nätilpäive" ;

lin january_Month = mkN "janvari" ; 
lin february_Month = mkN "fevrali" ;
lin march_Month = mkN "martti" ; 
lin april_Month = mkN "apreli" ;
lin may_Month = mkN "maija" ;
lin june_Month = mkN "juni" ;
lin july_Month = mkN "juli" ;
lin august_Month = mkN "augusti" ;
lin september_Month = mkN "sentäbri" ;
lin october_Month = mkN "oktäbri" ;
lin november_Month = mkN "nojaabri" ;
lin december_Month = mkN "dekabri" ;



lin afrikaans_Language = mkLanguage "afrikaani" ;
lin amharic_Language = mkLanguage "amhara" ;
lin arabic_Language = mkLanguage "araabia" ;
lin bulgarian_Language = mkLanguage "bulgaaria" ;
lin catalan_Language = mkLanguage "katalaani" ;
lin chinese_Language = mkLanguage "hiina" ;
lin danish_Language = mkLanguage "taani" ;
lin dutch_Language = mkLanguage "hollandi" ;
lin english_Language = mkLanguage "inglise" ;
lin estonian_Language = mkLanguage "eesti" ;
lin finnish_Language = mkLanguage "soome" ;
lin french_Language = mkLanguage "prantsuse" ;
lin german_Language = mkLanguage "saksa" ;
lin greek_Language = mkLanguage "kreeka" ;
lin hebrew_Language = mkLanguage "heebrea" ;
lin hindi_Language = mkLanguage "hindi" ;
lin japanese_Language = mkLanguage "jaapani" ;
lin italian_Language = mkLanguage "itaalia" ;
lin latin_Language = mkLanguage "ladina" ;
lin latvian_Language = mkLanguage "läti" ;
lin maltese_Language = mkLanguage "malta" ;
lin nepali_Language = mkLanguage "nepali" ;
lin norwegian_Language = mkLanguage "norra" ;
lin persian_Language = mkLanguage "pärsia" ;
lin polish_Language = mkLanguage "poola" ;
lin punjabi_Language = mkLanguage "pandžabi" ;
lin romanian_Language = mkLanguage "rumeenia" ;
lin russian_Language = mkLanguage "vene" ;
lin sindhi_Language = mkLanguage "sindhi" ;
lin spanish_Language = mkLanguage "hispaania" ;
lin swahili_Language = mkLanguage "suahiili" ;
lin swedish_Language = mkLanguage "rootsi" ;
lin thai_Language = mkLanguage "tai" ;
lin turkish_Language = mkLanguage "türgi" ;
lin urdu_Language = mkLanguage "urdu" ;


}
