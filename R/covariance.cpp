#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;

// ojo, para que esta funcion sirva las dos lineas superiores del codigo en rcpp debe ser asi

// [[Rcpp::export]]
NumericMatrix cov_cpp(NumericMatrix X) {
  return wrap(arma::cov(as<arma::mat>(X)));
}