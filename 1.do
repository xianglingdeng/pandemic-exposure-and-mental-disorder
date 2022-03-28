use "C:\Users\hjy2dxl\Desktop\2.dta", clear
set more off
gen str30 authoryear=first_author+ " (" +string(year)+")"

foreach var of varlist country gender major_crowd study_type infectious_disease types_of_questionnaire method mental_illness_sub_group {
encode `var', gen(cat`var')
drop `var'
rename cat`var' `var'
}

rename effect_size or
sort year


foreach var of varlist or low high {
gen ln_`var' = ln(`var')
}

set more off

rename mental_illness_sub_group endpoint 
codebook endpoint
metan ln_or ln_low ln_high, random eform null(1) force label(namevar=authoryear) by(endpoint)
metan ln_or ln_low ln_high if endpoint==1, random eform null(1) force label(namevar=authoryear) by(endpoint)
metan ln_or ln_low ln_high if endpoint==2, random eform null(1) force label(namevar=authoryear) by(endpoint)
metan ln_or ln_low ln_high if endpoint==4, random eform null(1) force label(namevar=authoryear) by(endpoint)
metan ln_or ln_low ln_high if endpoint==5, random eform null(1) force label(namevar=authoryear) by(endpoint)

codebook endpoint
* 1  anxiety   2  depression   3  fear   4  posttraumatic stress   5  psychological distress
codebook major_crowd
* 1  general population  2  healthcare workers   3  students

************************************************************************************************
sort major_crowd year
*all 
metan ln_or ln_low ln_high, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if major_crowd==1, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if major_crowd==2, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if major_crowd==3, random eform null(1) force label(namevar=authoryear) by(major_crowd)

*anxiety
metan ln_or ln_low ln_high if endpoint==1 , random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==1 & major_crowd==1, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==1 & major_crowd==2, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==1 & major_crowd==3, random eform null(1) force label(namevar=authoryear) by(major_crowd)

*depression
metan ln_or ln_low ln_high if endpoint==2 , random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==2 & major_crowd==1, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==2 & major_crowd==2, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==2 & major_crowd==3, random eform null(1) force label(namevar=authoryear) by(major_crowd)

*posttraumatic stress 
metan ln_or ln_low ln_high if endpoint==4 , random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==4 & major_crowd==1, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==4 & major_crowd==2, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==4 & major_crowd==3, random eform null(1) force label(namevar=authoryear) by(major_crowd)

*psychological distress
metan ln_or ln_low ln_high if endpoint==5 , random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==5 & major_crowd==1, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==5 & major_crowd==2, random eform null(1) force label(namevar=authoryear) by(major_crowd)
metan ln_or ln_low ln_high if endpoint==5 & major_crowd==3, random eform null(1) force label(namevar=authoryear) by(major_crowd)

************************************************************************************************
sort country year
codebook country
gen country1=country
replace country1=2 if country1> 1

metan ln_or ln_low ln_high, random eform null(1) force label(namevar=authoryear) by(country1)

************************************************************************************************

************************************************************************************************
sort infectious_disease year
*all
metan ln_or ln_low ln_high, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if infectious_disease==1, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if infectious_disease==2, random eform null(1) force label(namevar=authoryear) by(infectious_disease)

*anxiety
metan ln_or ln_low ln_high if endpoint==1 , random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==1 & infectious_disease==1, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==1 & infectious_disease==2, random eform null(1) force label(namevar=authoryear) by(infectious_disease)

*depression
metan ln_or ln_low ln_high if endpoint==2 , random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==2 & infectious_disease==1, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==2 & infectious_disease==2, random eform null(1) force label(namevar=authoryear) by(infectious_disease)

*posttraumatic stress 
metan ln_or ln_low ln_high if endpoint==4 , random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==4 & infectious_disease==1, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==4 & infectious_disease==2, random eform null(1) force label(namevar=authoryear) by(infectious_disease)

*psychological distress
metan ln_or ln_low ln_high if endpoint==5 , random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==5 & infectious_disease==1, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
metan ln_or ln_low ln_high if endpoint==5 & infectious_disease==2, random eform null(1) force label(namevar=authoryear) by(infectious_disease)
*****************************************************************************************

*****************************************************************************************
sort types_of_questionnaire year
metan ln_or ln_low ln_high, random eform null(1) force label(namevar=authoryear) by(types_of_questionnaire)
*****************************************************************************************
sort estimate  year
metan ln_or ln_low ln_high, random eform null(1) force label(namevar=authoryear) by(estimate)

*Preparations
gen logor=ln(or)
gen logul=ln(high)
gen logll=ln(low)
gen selogor=(logul-logll)/(2*1.96)

sort year
metacum logor selogor, random effect(f) eform graph lcols(authoryear) b2title(Odds Ratio)
metacum logor selogor if endpoint==1, random effect(f) eform graph lcols(authoryear) b2title(Odds Ratio)
metacum logor selogor if endpoint==2, random effect(f) eform graph lcols(authoryear) b2title(Odds Ratio)
metacum logor selogor if endpoint==4, random effect(f) eform graph lcols(authoryear) b2title(Odds Ratio)
metacum logor selogor if endpoint==5, random effect(f) eform graph lcols(authoryear) b2title(Odds Ratio)


metainf logor selogor, random eform id(authoryear)
metainf logor selogor if endpoint==1, random eform id(authoryear)
metainf logor selogor if endpoint==2, random eform id(authoryear)
metainf logor selogor if endpoint==4, random eform id(authoryear)
metainf logor selogor if endpoint==5, random eform id(authoryear)


metafunnel logor selogor, xtitle(log(Odds Ratio)) ytitle(Standard error of log(Odds Ratio))
metafunnel logor selogor if endpoint==1, xtitle(log(Odds Ratio)) ytitle(Standard error of log(Odds Ratio))
metafunnel logor selogor if endpoint==2, xtitle(log(Odds Ratio)) ytitle(Standard error of log(Odds Ratio))
metafunnel logor selogor if endpoint==4, xtitle(log(Odds Ratio)) ytitle(Standard error of log(Odds Ratio))
metafunnel logor selogor if endpoint==5, xtitle(log(Odds Ratio)) ytitle(Standard error of log(Odds Ratio))

metabias6 logor selogor, graph(begg)
metabias6 logor selogor if endpoint==1, graph(begg)
metabias6 logor selogor if endpoint==2, graph(begg)
metabias6 logor selogor if endpoint==4, graph(begg)
metabias6 logor selogor if endpoint==5, graph(begg)

metatrim logor selogor, funnel eform
metatrim logor selogor if endpoint==1, funnel eform
metatrim logor selogor if endpoint==2, funnel eform
metatrim logor selogor if endpoint==4, funnel eform
metatrim logor selogor if endpoint==5, funnel eform


