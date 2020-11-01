#library(UsingR)
data(father.son)
x <- (father.son$sheight - mean(father.son$sheight)) / sd(father.son$sheight)
y <- (father.son$fheight - mean(father.son$fheight)) / sd(father.son$fheight)
rho <- cor(y, x)
myPlot <- function(x, y) {
  plot(y, x,
       ylab = "Father's height, normalized",
       xlab = "Son's height, normalized",
       ylim = c(-3, 3), xlim = c(-3, 3),
       bg = "lightblue", col = "black", cex = 1.1, pch = 21,
       frame = FALSE)
}

myPlot(x, y)
abline(0, 1) # if there were perfect correlation
#abline(0, rho, lwd = 2) # father predicts son
#abline(0, 1 / rho, lwd = 2) # son predicts father, son on vertical axis
abline(h = 0); abline(v = 0) # reference lines for no relathionship
abline(lm(y~x),col='red',lwd=3)
dev.copy(png, file = "sf.png") 
dev.off()