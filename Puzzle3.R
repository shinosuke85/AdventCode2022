input <- read.csv('U:/Puzzle3.csv', header = FALSE, col.names = 'rucksack')


nchar(input[1,1])

both <- data.frame()

i <- 1

for (i in 1:(nrow(input))) {

    item <- input[i,1]
    x <- substr(item, 1, nchar(item)/2)
    x_char <- as.data.frame(strsplit(x,""))
    colnames(x_char) <- 'char'
    x_char <- sort(x_char$char)
    
    y <- substr(item, nchar(item)/2+1, nchar(item))
    y_char <- as.data.frame(strsplit(y,""))
    colnames(y_char) <- 'char'
    y_char <- sort(y_char$char)
    
    interim <- x_char[x_char %in% y_char]
    both[i,1] <- interim[1]
    
    rm(x)
    rm(y)
    
    next
}

letters <- c(tolower(LETTERS[1:26]), LETTERS[1:26])
priority <- c(seq(1,52,1))
priorities <- data.frame(letters, priority)

result <- merge(both, priorities, by.x='V1', by.y='letters')
sum(result$priority)
