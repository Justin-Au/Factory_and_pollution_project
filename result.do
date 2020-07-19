use "~\test.dta"

global xvar factory farmland p income_mean women_p age65_p senior_uni precp water_temperature ph_value dissolved_oxygen_electrode
/*ln_arsenic ln_copper ln_lead ln_manganese ln_zinc ln_river_pollution_index*/


/***************************************OLS************************************/
foreach y of varlist ln_arsenic ln_copper ln_lead ln_manganese ln_zinc{

	    regress `y' illegal_occupied_area $xvar, robust
	   
}


/***************************************IV*************************************/
reg illegal_occupied_area tot_DPP_elected_2 $xvar, robust

foreach y of varlist ln_arsenic ln_copper ln_lead ln_manganese ln_zinc{

	    ivregress 2sls `y' $xvar (illegal_occupied_area = tot_DPP_elected_2),robust
	   
}
