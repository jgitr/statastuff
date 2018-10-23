use "/home/user/Downloads/wagepan.dta"

order id year lwage hours educ exper black married union

reg lwage educ  black hisp exper expersq married union d81-d87

estat hettest

/*
xtset
xtreg
reg ..., re
*/
reg lwage educ  black hisp exper expersq married union d81-d87, cluster(id)




use "/home/user/Downloads/grogger.dta"



