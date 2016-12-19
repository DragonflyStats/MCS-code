i=20323;
	# Systolic blood pressure measurements made 
		# simultaneously by two observers (J and R) 
		# and an automatic blood pressure measuring
		# machine (S), each making three observations 
		# in quick succession (supplied by Dr E O'Brien)
		
		Bloodmain = matrix(data=c(100, 106, 107, 98, 98, 111, 122, 128, 124, 108, 110, 108, 108, 112, 110, 121, 
		127, 128, 76, 84, 82, 76, 88, 82, 95, 94, 98,108, 104, 104, 110, 100, 106, 127, 127, 135,124, 112, 112, 128, 112, 114, 140, 131, 124,122, 140, 124, 124, 140, 126, 139, 142, 136,116, 108, 102, 118, 110, 102, 122, 112, 112,114, 110, 112, 112, 108, 112, 130, 129, 135,100, 108, 112, 100, 106, 112, 119, 122, 122,108, 92, 100, 108, 98, 100, 126, 113, 111,100, 106, 104, 102, 108, 106, 107, 113, 111,108, 112, 122, 108, 116, 120, 123, 125, 125,112, 112, 110, 114, 112, 110, 131, 129, 122,104, 108, 104, 104, 108, 104, 123, 126, 114,106, 108, 102, 104, 106, 102, 127, 119, 126,122, 122, 114, 118, 122, 114, 142, 133, 137,100, 102, 102, 102, 102, 100, 104, 116, 115,118, 118, 120, 116, 118, 118, 117, 113, 112,140, 134, 138, 138, 136, 134, 139, 127, 113,150, 148, 144, 148, 146, 144, 143, 155, 133,166, 154, 154, 164, 154, 148, 181, 170, 166,148, 156, 134, 136, 154, 132, 149, 156, 140,
		174, 172, 166, 170, 170, 164, 173, 170, 154,174, 166, 150, 174, 166, 154, 160, 155, 170,140, 144, 144, 140, 144, 144, 158, 152, 154,128, 134, 130, 128, 134, 130, 139, 144, 141,
		146, 138, 140, 146, 138, 138, 153, 150, 154,146, 152, 148, 146, 152, 148, 138, 144, 131,220, 218, 220, 220, 218, 220, 228, 228, 226,208, 200, 192, 204, 200, 190, 190, 183, 184,
		94, 84, 86, 94, 84, 88, 103, 99, 106,114, 124, 116, 112, 126, 118, 131, 131, 124,126, 120, 122, 124, 120, 120, 131, 123, 124,124, 124, 132, 126, 126, 120, 126, 129, 125,110, 120, 128, 110, 122, 126, 121, 114, 125,90, 90, 94, 88, 88, 94, 97, 94, 96,106, 106, 110, 106, 108, 110, 116, 121, 127,218, 202, 208, 218, 200, 206, 215, 201, 207,130, 128, 130, 128, 126, 128, 141, 133, 146,136, 136, 130, 136, 138, 128, 153, 143, 138,100, 96, 88, 100, 96, 86, 113, 107, 102,100, 98, 88, 100, 98, 88, 109, 105, 97,
		124, 116, 122, 126, 116, 122, 145, 102, 137,164, 168, 154, 164, 168, 154, 192, 178, 171,100, 102, 100, 100, 104, 102, 112, 116, 116,136, 126, 122, 136, 124, 122, 152, 144, 147,114, 108, 122, 114, 108, 122, 141, 141, 137,148, 120, 132, 146, 130, 132, 206, 188, 166,160, 150, 148, 160, 152, 146, 151, 147, 136,84, 92, 98, 86, 92, 98, 112, 125, 124,156, 162, 152, 156, 158, 152, 162, 165, 189,110, 98, 98, 108, 100, 98, 117, 118, 109,100, 106, 106, 100, 108, 108, 119, 131, 124,100, 102, 94, 100, 102, 96, 136, 116, 113,86, 74, 76, 88, 76, 76, 112, 115, 104,106, 100, 110, 106, 100, 108, 120, 118, 132,108, 110, 106, 106, 118, 106, 117, 118, 115,168, 188, 178, 170, 188, 182, 194, 191, 196,166, 150, 154, 164, 150, 154, 167, 160, 161,146, 142, 132, 144, 142, 130, 173, 161, 154,204, 198, 188, 206, 198, 188, 228, 218, 189,96, 94, 86, 96, 94, 84, 77, 89, 101,134, 126, 124, 132, 126, 124, 154, 156, 141,138, 144, 140, 140, 142, 138, 154, 155, 148,134, 136, 142, 136, 134, 140, 145, 154, 166,156, 160, 154, 156, 162, 156, 200,                 180, 179,124, 138, 138, 122, 140, 136, 188, 147, 139,114, 110, 114, 112, 114, 114, 149, 217, 192,112, 116, 122, 112, 114, 124, 136, 132, 133,112, 116, 134, 114, 114, 136, 128, 125, 142,202, 220, 228, 200, 220, 226, 204, 222, 224,132, 136, 134, 134, 136, 132, 184, 187, 192,158, 162, 152, 158, 164, 150, 163, 160, 152,88, 76, 88, 90, 76, 86, 93, 88, 88,170, 174, 176, 172, 174, 178, 178, 181, 181,182, 176, 180, 184, 174, 178, 202, 199, 195,112, 114, 124, 112, 112, 126, 162, 166, 148,120, 118, 120, 118, 116, 120, 227, 227, 219,110, 108, 106, 110, 108, 106, 133, 127, 126,112, 112, 106, 112, 110, 106, 202, 190, 213,154, 134, 130, 156, 136, 132, 158, 121, 134,
		116, 112, 94, 118, 114, 96, 124, 149, 137,108, 110, 114, 106, 110, 114, 114, 118, 126,106, 98, 100, 104, 100, 100, 137, 135, 134,122, 112, 112, 122, 114, 114, 121, 123, 128), 
		nrow = 85, ncol = 9, byrow = TRUE,
		dimnames = list(NULL, c("J1","J2","J3","R1","R2","R3","S1","S2","S3")) )


T1 = Sys.time()

withinD=numeric()
withinE=numeric()
withinF=numeric()
betweenD=numeric()
betweenE=numeric()
betweenF=numeric()

withinA=numeric()
withinB=numeric()
withinC=numeric()
betweenA=numeric()
betweenB=numeric()
betweenC=numeric()

# ABC Data
samplesize=25
####################################################################################

Blood0=Bloodmain[1:samplesize,c(1:3,1:3,1:3)]

set.seed(i); 
A1add = rnorm(samplesize)
A2add = rnorm(samplesize)
A3add = rnorm(samplesize)
B1add = rnorm(samplesize,0,3)
B2add = rnorm(samplesize,0,3)
B3add = rnorm(samplesize,0,3)
C1add = rnorm(samplesize,0,4) 
C2add = rnorm(samplesize,0,4) 
C3add = rnorm(samplesize,0,4) 
D1add = rnorm(samplesize,0,5)
D2add = rnorm(samplesize,0,5)
D3add = rnorm(samplesize,0,5)
E1add = rnorm(samplesize,0,6) 
E2add = rnorm(samplesize,0,6) 
E3add = rnorm(samplesize,0,6)
F1add = rnorm(samplesize,0,7) 
F2add = rnorm(samplesize,0,7) 
F3add = rnorm(samplesize,0,7)

Blood2add=matrix(cbind(A1add,A2add,A3add,B1add,B2add,B3add,C1add,C2add,C3add),nrow=samplesize)
Blood2 =Blood0 + round(Blood2add,2) 

Blood3add=matrix(cbind(D1add,D2add,D3add,E1add,E2add,E3add,F1add,F2add,F3add),nrow=samplesize)
Blood3 =Blood0 + round(Blood3add,2) 



Blood=cbind(Blood2[,1:6],Blood3[,1:3])
dimnames(Blood) = list(NULL, c("J1","J2","J3","R1","R2","R3","S1","S2","S3")) 
Blood

#####################################################################
#Preparing the Blood Data
library(nlme)
blood = groupedData( y ~ meth | item ,
data = data.frame( y = c(Blood), item = c(row(Blood)),
meth = rep(c("J","R","S"), rep(nrow(Blood)*3, 3)),
repl = rep(rep(c(1:3), rep(nrow(Blood), 3)), 3) ),
labels = list(BP = "Systolic Blood Pressure", method = "Measurement Device"),
order.groups = FALSE )
#pick out two of the three methods ( use J and S ) 
dat = subset(blood, subset = meth != "R")
dat




#####################################################################
 fit1r = lme(y ~ meth-1, data = dat,   #Symm , Symm#
     random = list(item=pdSymm(~ meth-1)), 
     weights=varIdent(form=~1|meth),
     correlation = corSymm(form=~1 | item/repl), 
     method="ML")

 fit2r = lme(y ~ meth-1, data = dat,   #CS , Symm#
     random = list(item=pdCompSymm(~ meth-1)),
     correlation = corSymm(form=~1 | item/repl), 
     method="ML")
  
 fit3r = lme(y ~ meth-1, data = dat,   #Symm , CS# 
     random = list(item=pdSymm(~ meth-1)),
     weights=varIdent(form=~1|meth), 
     correlation = corCompSymm(form=~1 | item/repl), 
     method="ML")

 fit4r = lme(y ~ meth-1, data = dat,   #CS , CS# 
     random = list(item=pdCompSymm(~ meth-1)), 
     correlation = corCompSymm(form=~1 | item/repl), 
     method="ML")

 test1 = anova(fit1r,fit2r)                     # Between-Subject Variabilities
 test2 = anova(fit1r,fit3r)                    # Within-Subject Variabilities
 test3 = anova(fit1r,fit4r)                    # Overall Variabilities   
