g <- function(x) {
  ifelse(-pi < x & x < pi, (sin(x))^2, 0)
}
x <- seq(-10, 10, by=.1)
plot(x, g(x), type="l", col="blue")

# RANDOM WALK METROPOLIS
sigma <- 0.5
n_sim <- 100000
theta <- .5
i <- 1
while (i <= n_sim) {
  candidate <- rnorm(
    n = 1,
    mean = theta[i],
    sd = sigma
  )
  u <- runif(1)
  if (u <= g(candidate)/g(theta[i])) {
    theta[i + 1] <- candidate
    i <- i + 1
  }
}
hist(theta, breaks = 20)
