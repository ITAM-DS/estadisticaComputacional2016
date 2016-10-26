#include <Rcpp.h>
using namespace Rcpp;

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double loglikelihood(double theta, NumericVector toss) {
  double sumx = sum(toss);
  int n = toss.size();
  return sumx*log(theta) + (n-sumx)*log(1-theta);
}

// [[Rcpp::export]]
double logprior(double theta, double shape1, double shape2) {
  return (shape1-1)*log(theta) + (shape2-1)*log(1-theta);
}

double logposterior(double theta, NumericVector toss, double shape1, double shape2) {
  return loglikelihood(theta, toss) + logprior(theta, shape1, shape2);
}

// [[Rcpp::export]]
NumericVector run_mcmc(
    NumericVector toss, 
    int n_sim, double theta_0, 
    double jump_size = .5, 
    double shape1=-.5, 
    double shape2=-.5) {
  //
  NumericVector sim(n_sim); 
  double U, eta;
  bool test;
  //
  sim[0] = theta_0;
  for (int i=0; i < n_sim; i++) {
    U = (runif(1))[0];
    do {
      eta = (rnorm(sim[i], jump_size))[0];
      test = log(U) > logposterior(eta, toss, shape1, shape2) - logposterior(sim[i], toss, shape1, shape2);
    } while (test);
    sim[i + 1] = eta;
  }
  return sim;
}
/*** R
timesTwo(42)
*/
