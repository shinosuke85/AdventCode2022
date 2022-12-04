input <- read.csv('U:/Puzzle2.csv',blank.lines.skip = FALSE, header = FALSE)



### PART 1 ####
x <- input
colnames(x) <- c('them','us')

#calculate shape score
x$shape <- with(x, ifelse(x$us == 'X', 1, ifelse(x$us == 'Y', 2 , 3)))

#calculate game score

win <- c('A Y', 'B Z', 'C X')
draw <- c('A X', 'B Y', 'C Z')

x$merge <- paste(x$them, x$us)
x$score <- with(x, ifelse(x$merge %in% win, 6, ifelse (x$merge %in% draw, 3, 0)))

#add them together
x$total <- x$shape + x$score
sum(x$total)




### PART 2 ####
y <- input
colnames(y) <- c('them','outcome')

#calculate game score
y$score <- with(y, ifelse(y$outcome == 'X', 0, ifelse(y$outcome == 'Y', 3, 6 )))

#calculate shape needed for required outcome
choices <- data.frame (them = c('A', 'B', 'C'),
                    lose = c('Z', 'X', 'Y'),
                    draw = c('X', 'Y', 'Z'),
                    win = c('Y', 'Z', 'X'))

y <- merge(y, choices, by.x='them', by.y = 'them')
y$choice <- with(y, ifelse(y$outcome == 'X', y$lose, ifelse(y$outcome == 'Y', y$draw, y$win)))

#calculate shape score
y$shape <- with(y, ifelse(y$choice == 'X', 1, ifelse(y$choice == 'Y', 2 , 3)))

#add them together
y$total <- y$shape + y$score
sum(y$total)

