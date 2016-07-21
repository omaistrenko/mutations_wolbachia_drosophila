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
F1_freq<-matrix(, nrow=660, ncol = 9)
F1_total<-F1$F1
F1_total
F1_freq


F1_mut_freq_clean<-F1_mut_freq[,2:10]
plot(F1_mut_freq_clean)
dim(F1_mut_freq_clean)
index_vec<-c(1:660)
View(F1_mut_freq_clean)
pairs(F1_mut_freq_clean)
plot(index_vec, F1_mut_freq_clean[,1])

par(mfrow=c(3,3))

for (i in 1:ncol(F1_mut_freq_clean)){
	plot(index_vec, F1_mut_freq_clean[,i])
	}

F1_mut_freq_clean_bin<-ifelse(F1_mut_freq_clean!=0, 1, F1_mut_freq_clean)
View(F1_mut_freq_clean_bin)
library(gplots)
heatmap.2(F1_mut_freq_clean_bin)

par(mfrow=c(3,3))

for (i in 1:ncol(F1_mut_freq_clean_bin)){
	plot(index_vec, F1_mut_freq_clean_bin[,i], )
	}
F1_mut_freq_clean_bin_ann<-cbind(F1[,1:4], F1_mut_freq_clean_bin)
View(F1_mut_freq_clean_bin_ann)
