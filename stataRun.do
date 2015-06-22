clear

//set working directory
cd ""

//set path to partdata.dta
use ""

//setting panel identifiers
xtset modelindicator date, monthly

set more off

//no lag, fixed effects
xtreg lnsales taxrelief epact cashforclunkers import prodstop priusad m1-m132, fe r
outreg2 using part_reg1, drop(m1-m132) word replace
xtreg lnsales taxrelief epact cashforclunkers import prodstop priusad lnunemp lnunemph m1-m132, fe r
outreg2 using part_reg1, drop(m1-m132) word
xtreg lnsales taxrelief epact cashforclunkers import prodstop priusad lnincome lnincomeh m1-m132, fe r
outreg2 using part_reg1, drop(m1-m132) word
xtreg lnsales taxrelief epact cashforclunkers import prodstop priusad lninterest lninteresth m1-m132, fe r
outreg2 using part_reg1, drop(m1-m132) word
xtreg lnsales taxrelief epact cashforclunkers import prodstop priusad lngas6 lngas6h m1-m132, fe r
outreg2 using part_reg1, drop(m1-m132) word
xtreg lnsales taxrelief epact cashforclunkers import prodstop priusad lnunemp lnunemph lngas6 lngas6h m1-m132, fe r
outreg2 using part_reg1, drop(m1-m132) word

clear

//set working directory
cd ""

//set path to data.dta
use ""

//setting panel identifiers
xtset modelindicator date, monthly

set more off

//lag, gmm
xtivreg2 lnsales taxrelief epact cashforclunkers prodstop priusad nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg3, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word replace
xtivreg2 lnsales taxrelief epact cashforclunkers prodstop priusad lnunemp lnunemph nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg3, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epact cashforclunkers prodstop priusad lnincome lnincomeh nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg3, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epact cashforclunkers prodstop priusad lninterest lninteresth nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg3, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epact cashforclunkers prodstop priusad lngas6 lngas6h nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg3, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epact cashforclunkers prodstop priusad lnunemp lnunemph lngas6 lngas6h nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg3, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(1-6).lnsales) word

//lag, gmm, epact bin
xtivreg2 lnsales taxrelief epactlow epacthigh cashforclunkers prodstop priusad nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg5, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word replace
xtivreg2 lnsales taxrelief epactlow epacthigh cashforclunkers prodstop priusad lnunemp lnunemph nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg5, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epactlow epacthigh cashforclunkers prodstop priusad lnincome lnincomeh nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg5, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epactlow epacthigh cashforclunkers prodstop priusad lninterest lninteresth nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg5, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epactlow epacthigh cashforclunkers prodstop priusad lngas6 lngas6h nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg5, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(7-12).lnsales) word
xtivreg2 lnsales taxrelief epactlow epacthigh cashforclunkers prodstop priusad lnunemp lnunemph lngas6 lngas6h nosale m1-m132 (l.lnsales l.lnsalesh=l2.lnsales l2.lnsalesh l3.lnsales l3.lnsalesh l4.lnsales l4.lnsalesh l5.lnsales l5.lnsalesh l12.lnsales l12.lnsalesh), gmm2s robust fe
outreg2 using full_reg5, drop(m1-m132) addstat(Hansen J Stat, e(jp)) addtext(Instruments, l(1-6).lnsales) word
