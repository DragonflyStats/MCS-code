#Load Functions for Roy's methodology

#FUNCTIONS
#########################################################################

#FUNCTIONS
#########################################################################

getParam = function(x) {
    Param = list(
        meanX=x$coefficients$fixed[1],
        meanY=x$coefficients$fixed[2],
        DVarX=as.numeric(VarCorr(MCS1)[1,1]),
        DVarY=as.numeric(VarCorr(MCS1)[2,1]),
        DCovXY=sqrt(DVarX*DVarY),
        SigVarX=x$sigma,
        SigVarY=x$sigma*max(intervals(x)$varStruct[2],is.null(intervals(x)$varStruct[2])),
        SigCovXY=x$sigma*max(intervals(x)$corStruct[2],is.null(intervals(x)$corStruct[2])-1)
        )
    Param
    }

#########################################################################


getD = function(x) {
    v = as.numeric(VarCorr(x)[1:2,1])
    r = as.numeric(VarCorr(x)[2,3])
    Dhat = matrix(0,2,2)
    diag(Dhat) = v
    Dhat[1,2] = Dhat[2,1] = r * sqrt(prod(v))
    arr=rownames(summary(x)$contrasts$method)
    colnames(Dhat)=arr
    rownames(Dhat)=arr
    Dhat
}
#########################################################################


getSigma = function(x) {
    res = as.numeric(VarCorr(x)[6])
    V = max(is.null(intervals(x)$varStruct[2]),intervals(x)$varStruct[2])
    C = intervals(x)$corStruct[2]
    Sighat = matrix(1,2,2)
    Sighat[2,2] = as.numeric(VarCorr(x)[3,1])
    Sighat[1,1] = as.numeric(VarCorr(x)[3,1])*(V^2)
    Sighat[1,2] = Sighat[2,1] = as.numeric(VarCorr(x)[3,1])*V*C
    arr=rownames(summary(x)$contrasts$method)
    colnames(Sighat)=arr
    rownames(Sighat)=arr
    Sighat
}

#########################################################################
getOmega = function(x) {
    Omega = matrix(1,2,2)
    Omega[1,1] = getD(x)[1,1] + getSigma(x)[1,1] 
    Omega[2,2] = getD(x)[2,2] + getSigma(x)[2,2]
    Omega[1,2] = Omega[2,1] = getD(x)[1,2] + getSigma(x)[1,2]
    Omega
}
#########################################################################

getCR = function(x) {
    CR = numeric(2)
    V = max(is.null(intervals(x)$varStruct[2]),intervals(x)$varStruct[2])
    CR[1] = 1.96 * sqrt(2) * as.numeric(VarCorr(x)[6])
    CR[2] = 1.96 * sqrt(2) * as.numeric(VarCorr(x)[6]) * V
    CR
}




#########################################################################

getParam = function(x) {
    Param = list(
        meanX=x$coefficients$fixed[1],
        meanY=x$coefficients$fixed[2],
        DVarX=as.numeric(VarCorr(MCS1)[1,1]),
        DVarY=as.numeric(VarCorr(MCS1)[2,1]),
        DCovXY=sqrt(DVarX*DVarY),
        SigVarX=x$sigma,
        SigVarY=x$sigma*max(intervals(x)$varStruct[2],is.null(intervals(x)$varStruct[2])),
        SigCovXY=x$sigma*max(intervals(x)$corStruct[2],is.null(intervals(x)$corStruct[2])-1)
        )
    Param
    }

#########################################################################



getD = function(x) {
    v = as.numeric(VarCorr(x)[1:2,1])
    r = as.numeric(VarCorr(x)[2,3])
    Dhat = matrix(0,2,2)
    diag(Dhat) = v
    Dhat[1,2] = Dhat[2,1] = r * sqrt(prod(v))
    arr=rownames(summary(x)$contrasts$method)
    colnames(Dhat)=arr
    rownames(Dhat)=arr
   
    Dhat=getSigma(x) - getSigma(x) + Dhat
   
   dimnames(Dhat) = dimnames(x$varFix)
   base = paste( attr(x$terms, "term.labels") ,
                dimnames( intervals(x)$varStruct )[[1]], sep = "" )
        j = match(base, dimnames(Dhat)[[1]])
        jj = switch(j, 2, 1)
   Dhat
   }

D.old = function(x) {
        V = VarCorr(x)
   v = as.numeric( V[1:2,1] )
   r = as.numeric( V[2,3] )
   Dhat = diag(2)
   diag(Dhat) = v
   Dhat[1,2] = Dhat[2,1] = r * sqrt(prod(v))
   dimnames(Dhat) = dimnames(x$varFix)
   Dhat
}

#########################################################################

getSigma = function(x) {
        s = x$sigma
        i = intervals(x)
        r = i$corStruct[2]
        v = i$varStruct[2]
   SigHat = diag(2)
   dimnames(SigHat) = dimnames(x$varFix)
   base = paste( attr(x$terms, "term.labels") ,
                dimnames( intervals(x)$varStruct )[[1]], sep = "" )
        j = match(base, dimnames(SigHat)[[1]])
        jj = switch(j, 2, 1)
   SigHat[jj,jj] = s^2
   SigHat[j,j] = (s*v)^2
   SigHat[j,jj] = SigHat[jj,j] = r * v * s^2
   SigHat
}

Sigma.old = function(x) {
    res = as.numeric(VarCorr(x)[6])
    V = max(is.null(intervals(x)$varStruct[2]),intervals(x)$varStruct[2])
    C = intervals(x)$corStruct[2]
    Sighat = matrix(1,2,2)
    Sighat[2,2] = as.numeric(VarCorr(x)[3,1])
    Sighat[1,1] = as.numeric(VarCorr(x)[3,1])*(V^2)
    Sighat[1,2] = Sighat[2,1] = as.numeric(VarCorr(x)[3,1])*V*C
    arr=rownames(summary(x)$contrasts$method)
    colnames(Sighat)=arr
    rownames(Sighat)=arr
    Sighat
}

#########################################################################

getOmega = function(x) getD(x) + getSigma(x)








#########################################################################

getCR = function(x) {
    CR = numeric(2)
    V = max(is.null(intervals(x)$varStruct[2]),intervals(x)$varStruct[2])
    CR[1] = 1.96 * sqrt(2) * as.numeric(VarCorr(x)[6])
    CR[2] = 1.96 * sqrt(2) * as.numeric(VarCorr(x)[6]) * V
    CR
}

#########################################################################
getCorMat= function(x) {
    CorMat = matrix(1,4,4)
    Rho.xy = getOmega2(x)[2,1]/ sqrt(getOmega2(x)[1,1]*getOmega2(x)[2,2])
    CorMat[1,2] = CorMat[2,1] = CorMat[3,4] = CorMat[4,3] = Rho.xy

    CorMat[1,3] = CorMat[3,1] =  getD(x)[1,1]/getOmega2(x)[1,1]
    CorMat[4,2] = CorMat[2,4] =  getD(x)[2,2]/getOmega2(x)[2,2]
    CorMat[4,1] = CorMat[3,2] = CorMat[2,3] = CorMat[1,4] = Rho.xy*(getD(x)[1,2]/getOmega2(x)[1,2])
    CorMat
}

#########################################################################

roy.SDV = function(x)
    {
    SDV = sqrt(getOmega(x)[1,1]+getOmega(x)[2,2]-(2*getOmega(x)[1,2]))
    SDV
    }
    
bxc.SDV = function(x)
    {
    sig1 = x$sigma
    sig2 = as.numeric(intervals(x)$varStruct[2])
    sig2 = as.numeric(sig2)*sig1
    tau = as.numeric(intervals(x)[2]$reStruct$item[2])
    tau=as.numeric(tau)
    SDV=sqrt(tau^2 +tau^2 +sig1^2 +sig2^2)
    SDV
    }
    
bxc.D = function(x)
    {
    Tauhat=diag(2)
    tau = as.numeric(intervals(x)[2]$reStruct$item[2])
    tau.sq=as.numeric(tau)^2
    Tau.hat= 
    }
bxc.Sigma = function(x)
    {
    sig1 = x$sigma
    sig2 = as.numeric(intervals(x)$varStruct[2])
    sig2 = as.numeric(sig2)*sig1
    tau = as.numeric(intervals(x)[2]$reStruct$item[2])
    tau=as.numeric(tau)
    SDV=sqrt(tau^2 +tau^2 +sig1^2 +sig2^2)
    SDV
    }
#########################################################################

getOmegaCorr = function(x) {
        M = getOmega(x)
        M[row(M) != col(M)] = 0
        diag(M) = 1 / sqrt(diag(M))
        kronecker( diag(3) , cov2cor(getOmega(x)) ) +
        kronecker( matrix(1, 3, 3) - diag(3) , M %*% getD(x) %*% M )
        }


getLOA=function(x) {
        bias=abs(summary(x)$tTable[1]-summary(x)$tTable[2])
        varDiff=getOmega(x)[1,1] + getOmega(x)[2,2] - (2*getOmega(x)[2,1])
        LOA=c(bias-(1.96*sqrt(varDiff)),bias+(1.96*sqrt(varDiff)))
        LOA
        }
