#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;


// ojo, para que esta funcion sirva las dos lineas superiores del codigo en rcpp debe ser asi

// [[Rcpp::export]]
NumericMatrix mvrnorm(int n, NumericVector mu, NumericMatrix sigma) {
  int ncols = sigma.ncol();
  arma::mat Y = arma::randn(n, ncols);
  return wrap(arma::repmat(as<arma::vec>(mu), 1, n).t() + Y * arma::chol(as<arma::mat>(sigma)));
}