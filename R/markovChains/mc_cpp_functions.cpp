#include <Rcpp.h>
using namespace Rcpp; 
using namespace std;

// [[Rcpp::export]]
int sampleC(NumericVector prob) {
  // RcppArmadillo ya tiene una version de sample
  NumericVector prob_normalized = prob/sum(prob); // por si las probabilidades no suma 1 como deben
  NumericVector cumprob = cumsum(prob_normalized);
  // randon uniform between zero and one
  double u = runif(1)[0];
  int i=0; // posiciones al estilo R, primero 1
  while (cumprob[i] < u) {
    i++;
  }
  return i + 1; // el +1  es porque R cuenta indices distinto
}

// [[Rcpp::export]]
int mc_transition(int current_state, NumericMatrix trans_mat) {
  NumericVector prob =  trans_mat(current_state-1,_); // el -1 es por diferencias indices R y C++
    return sampleC(prob);
}


// [[Rcpp::export]]
IntegerVector mc_sim(int init_state, int n_transitions, NumericMatrix trans_mat) {
  IntegerVector trajectory(n_transitions + 1); // el estado inicial mas el numero de transicion
  trajectory[0] = init_state;
  for (int i=0; i < n_transitions; i++) {
    trajectory[i + 1] = mc_transition(trajectory[i], trans_mat);
  }
  return trajectory;
}


