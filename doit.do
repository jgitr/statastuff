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


/*
predicts bullshit though, negative min.
thats why we switch to probit
*/

reg arr86 pcnv avgsen tottime ptime86 inc86 i.black i.hispan, robust

predict arr86hat, xb

summarize arr86hat


/*
probit
dont use robust option here, 
because using probit already assumes that we re dealing with heteroscedasticity here
*/

probit arr86 pcnv avgsen tottime ptime86 inc86 i.black i.hispan

display _b[1.black]/_b[1.hispan] 



/*
average partial effects
partial effects at the average

first quitely run regression
*/

qui probit arr86 pcnv avgsen tottime ptime86 inc86 i.black i.hispan
margins, dydx(*) atmeans
