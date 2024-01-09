cd "/Users/rohanjha/Documents/Cal/Econ_191/exploring_data"
eststo clear
import delimited using all_states_w_inflation.csv, clear
save all_states_w_inflation.dta, replace
use all_states_w_inflation.dta
eststo: ivprobit wage_increase_indicator privunionmembers prop_rep state_inf (change_prop_not_on_strike_indica = instrument_calc), twostep asis first vce(twostep)
import delimited using all_states_no_inflation.csv, clear
save all_states_no_inflation.dta, replace
use all_states_no_inflation.dta
eststo: ivprobit wage_increase_indicator privunionmembers prop_rep us_inf (change_prop_not_on_strike_indica = instrument_calc), twostep asis first vce(twostep)
import delimited using all_states_no_poli.csv, clear
save all_states_no_poli.dta, replace
use all_states_no_inflation.dta
eststo: ivprobit wage_increase_indicator privunionmembers us_inf (change_prop_not_on_strike_indica = instrument_calc), twostep asis first vce(twostep)

esttab
