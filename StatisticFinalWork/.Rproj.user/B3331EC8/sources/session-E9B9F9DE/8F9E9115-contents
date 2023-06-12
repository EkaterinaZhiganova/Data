#Import dataset from the file to R

Dataset = read.csv('NSE_BANKING_SECTOR.csv')

#Remove columns with non-number characteristics or date

Dataset = subset(Dataset, select = -c(DATE, SYMBOL, SERIES))

# Find out a correlation of all variables

cor(Dataset)

# Choose two variables with a high correlation, check a correlation coefficient

cor(Dataset$HIGH, Dataset$CLOSE)

# Create a plot

plot(Dataset$HIGH ~ Dataset$CLOSE, pch = 19, col = "green", ylab = "Day's highest price", xlab = "Close price of the previous day")

# Define a- intercept and b-slope to the line-equation

model <- lm(formula = HIGH ~ CLOSE, data = Dataset)
coef(model)

# Create an abline to our plot

abline(a=coef(model)[1], b=coef(model)[2], lty=6, col = "blue")

# Find out more information about variables, specially coefficient of determination
summary(model)

# Define a normal distribution, 68-95-99,7. It is a normal distribution
pnorm(Dataset$CLOSE, -0.812, 0.9998)
pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)
pnorm(3) - pnorm(-3)

# Define quartiles from 25% to 75% with a step by 5%
quantile(Dataset$CLOSE, probs = seq(.25,0.75, by = 0.05))
quantile(Dataset$HIGH, probs = seq(.25,0.75, by = 0.05))

