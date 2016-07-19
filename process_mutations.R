#process muations and wolbachia infection v.1
d_mut<-read.delim("mutations2014.txt", header=T)
d_sum<-read.delim("summary.txt", header=T)
d_sum
d_mut1<-d_mut[complete.cases(d_mut[,8:18]),] #no n/a in F1 and F2
dim(d_mut1)

View(d_mut1)

class(d_mut1$sampling.site)

#subdivide by generations
F1 <- cbind(d_mut1[1:3], d_mut1[7:17])
View(F1)
dim(F1)
F2 <- cbind(d_mut1[1:3], d_mut1[18:27])
View(F2)

#create df 660*9 to store frequencies calculations