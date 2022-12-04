x <- read.csv('U:/Puzzle1.csv',blank.lines.skip = FALSE)
ncol(x)
nrow(x)

rm(x_sum)
xNA = x[x =='NA']
x_sum <- data.frame("Col1" = c(seq(0,0,length.out = length(xNA)+1)))

j = 1
i = 0

for (i in 1:(nrow(x)-1)){
  i <- i+1
  if (is.na(x[i,1])==TRUE) {j <- j+1}
  else {
    x_sum[j,1] <- x_sum[j,1] + x[i,1]
    }
}

sum_sort <- x_sum$Col1[order(x_sum$Col1,decreasing=TRUE)]
sum(sum_sort[1:3])