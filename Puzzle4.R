input <- read.csv('U:/Puzzle4.csv', header = FALSE)

colnames(input) <- 'input'

input2 <- cbind(input, read.table(text = as.character(input$input), sep = ","))
input3 <- cbind(read.table(text  = as.character(input2$V1), sep = '-'), read.table(text  = as.character(input2$V2), sep = '-'))
colnames(input3) <- c('min1', 'max1', 'min2', 'max2')


input3$output <- with(input3, ifelse(((min1 - min2)*(max2 - max1)>=0), 1, 0))
input3$output2 <- with(input3, ifelse(((min1 - max2)>0), 1, ifelse((min2 - max1)>0, 1, 0)))


sum(input3$output)
nrow(input3)- sum(input3$output2)


