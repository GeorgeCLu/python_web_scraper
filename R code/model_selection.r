library(leaps)

#contents of dummyvariables.r here

numcars <- cars[,c(2, 5:8, 18:24)]
numcars2 <-na.omit(numcars)
ret.full <- regsubsets(price....~.,data=numcars2,nvmax=13)
sum.ret.full <- summary(ret.full)

# now to plot out the graphs

# adjusted r squared
plot(sum.ret.full$adjr2,xlab='No. of Variables',ylab='Adj. R^2',type='l')
which.max(sum.ret.full$adjr2)
#outputs 9

# cp
plot(sum.ret.full$cp,xlab='No. of Variables',ylab='Cp',type='l')
which.min(sum.ret.full$cp)
#outputs 7

# BIC
plot(sum.ret.full$bic,xlab='No. of Variables',ylab='BIC',type='l')
which.min(sum.ret.full$bic)
#outputs 7

plot(ret.full,scale='adjr2')
plot(ret.full,scale='Cp')
plot(ret.full,scale='bic')

ret.full.fwd <- regsubsets(price....~.,data=numcars2,nvmax=7,method='forward')
summary(ret.full.fwd)

ret.full.fwd <- regsubsets(price....~.,data=numcars2,nvmax=7,method='backward')
summary(ret.full.fwd)

ret.full.fwd <- regsubsets(price....~.,data=numcars2,nvmax=7,method='seqrep')
summary(ret.full.fwd)

