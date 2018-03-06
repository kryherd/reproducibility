#z-test
n=62
a=.05# a stands for alpha
d=.5 # d=Delta/sigma
nc=d*sqrt(n/2) # nc stands for non-centrality parameter 
# power in a one-sided test: 
1-pnorm(qnorm(1-a)-nc) 
# power in a two-sided test:
pnorm(nc-qnorm(1-a/2))+pnorm(qnorm(a/2)-nc)

#power for one-sample t 
n=25:30 #n=25,26,27,28,29,30
v=n-1
a=.05
d=(2750-3000)/500 #sigma=500 
nc=d*sqrt(n) 
pt(qt(a,v),v,nc) 
#curve plots power vs n
curve(pt(qt(.05,x-1),x-1,-.5*sqrt(x)) ,5,80,ylab="Power",xlab="n")

#power for two-sample t
n1=65 
n2=65
v=n1+n2-2 
a=.05
# a stands for alpha
d=.5
# d=Delta/sigma
# nc stands for non-centrality parameter 
nc=d*sqrt(n1*n2/(n1+n2))
1-pt(qt(1-a/2,v),v,nc)+pt(qt(a/2,v),v,nc) #power.
pt1<-function(n,d=50/100){
  v=2*n-2
  a=.05 # a stands for alpha d=Delta/sigma 
  nc=d*sqrt(n/2) # nc stands for non-centrality parameter 
  1-pt(qt(1-a/2,v),v,nc)+pt(qt(a/2,v),v,nc) }
curve(pt1(x),5,300,xlab="sample size n", ylab="Power")
curve(pt1(x,.3),5,300,lty="dashed",add=TRUE)

#paired t-test
n=34 
a=.05 # alpha 
r=.5 #correlation 
d=.5 # d=Delta/sigma 
nc=sqrt(n/2)*d/sqrt(1-r)
1-pt(qt(1-a/2,n-1),n-1,nc)+pt(qt(a/2,n-1),n-1,nc)
#correlation btw pretest and posttest r=.5 
#standardized effect size d=Delta/sigma d=.5
pt2=function(n=34,r=.5,d=.5){
  a=.05 # alpha
  nc=sqrt(n/2)*d/sqrt(1-r)
  1-pt(qt(1-a/2,n-1),n-1,nc)+pt(qt(a/2,n-1),n-1,nc) }
curve(pt2(x),5,100,xlab="sample size n", ylab="Power")
curve(pt2(x,r=.3),5,100,lty="dashed",add=TRUE)



