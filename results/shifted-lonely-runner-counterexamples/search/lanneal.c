/* Exact lattice annealer for the shifted lonely runner problem.
   Speeds 1..n, threshold P/Q, shifts m_q/Q (m_q in Z_Q). In u = Q*t, runner q covers [(j*Q - m - P)/q, (j*Q - m + P)/q].
   All endpoints are multiples of 1/q, so the cover is determined by the elementary intervals between consecutive
   Farey fractions (order n) inside each unit of u. Cost = sum over uncovered elementary intervals of (1 + lambda*len*F).
   A state with zero uncovered intervals is an exact cover: gamma <= P/Q.
   usage: lanneal n P Q iters seed T0 T1 lambda pu dmax [initfile]   -> prints: unc cost / m_1..m_n */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
static uint64_t rs;
static inline uint64_t rnd(void){ rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }
static inline double urand(void){ return (rnd() >> 11) * (1.0/9007199254740992.0); }
int n, P, Q, F; long M;
int **idxq; uint16_t *cnt; double *w; double cost; long unc; int *m;
static inline long G(int q, long A){ long qQ = (long)q*Q; A %= qQ; if (A < 0) A += qQ; return (A / q) * F + idxq[q][A % q]; }
static inline void add1(long i){ if (cnt[i]++ == 0) { cost -= w[i]; unc--; } }
static inline void rem1(long i){ if (--cnt[i] == 0) { cost += w[i]; unc++; } }
static void add_range(long g0, long g1){ long i; if (g0 == g1) return; if (g0 < g1) { for (i=g0;i<g1;i++) add1(i); } else { for (i=g0;i<M;i++) add1(i); for (i=0;i<g1;i++) add1(i); } }
static void rem_range(long g0, long g1){ long i; if (g0 == g1) return; if (g0 < g1) { for (i=g0;i<g1;i++) rem1(i); } else { for (i=g0;i<M;i++) rem1(i); for (i=0;i<g1;i++) rem1(i); } }
static void place(int q, int mq, int sign){ for (int j=0;j<q;j++){ long A = (long)j*Q - mq - P; if (sign>0) add_range(G(q,A), G(q,A+2*P)); else rem_range(G(q,A), G(q,A+2*P)); } }
static void step(int q, int mq, int d){ /* shift mq -> mq+d, |d| <= 2P */
  for (int j=0;j<q;j++){ long A = (long)j*Q - mq - P;
    if (d > 0) { add_range(G(q,A-d), G(q,A)); rem_range(G(q,A+2*P-d), G(q,A+2*P)); }
    else { int e = -d; rem_range(G(q,A), G(q,A+e)); add_range(G(q,A+2*P), G(q,A+2*P+e)); } } }
int main(int argc, char **argv){
  if (argc < 11) { fprintf(stderr, "usage\n"); return 1; }
  n = atoi(argv[1]); P = atoi(argv[2]); Q = atoi(argv[3]); long iters = atol(argv[4]); rs = 88172645463325252ULL ^ (uint64_t)atol(argv[5]) * 0x9E3779B97F4A7C15ULL; if (!rs) rs = 1;
  double T0 = atof(argv[6]), T1 = atof(argv[7]), lambda = atof(argv[8]), pu = atof(argv[9]); int dmax = atoi(argv[10]);
  for (int i=0;i<20;i++) rnd();
  /* Farey sequence of order n in [0,1) */
  int cap = 3*n*n/9 + 100; int *fn = malloc(sizeof(int)*cap), *fd = malloc(sizeof(int)*cap); F = 0;
  { int a=0,b=1,c=1,d=n; while (a < b) { if (F >= cap) { cap *= 2; fn = realloc(fn, sizeof(int)*cap); fd = realloc(fd, sizeof(int)*cap); } fn[F]=a; fd[F]=b; F++; int k=(n+b)/d; int e=k*c-a, f=k*d-b; a=c; b=d; c=e; d=f; } }
  M = (long)Q*F;
  idxq = malloc(sizeof(int*)*(n+1));
  for (int q=1;q<=n;q++) idxq[q] = malloc(sizeof(int)*q);
  for (int i=0;i<F;i++) for (int k=1; fd[i]*k<=n; k++) idxq[fd[i]*k][fn[i]*k] = i;
  cnt = calloc(M, sizeof(uint16_t)); w = malloc(sizeof(double)*M);
  for (int i=0;i<F;i++){ double len = (i+1<F ? (double)fn[i+1]/fd[i+1] : 1.0) - (double)fn[i]/fd[i]; for (int k=0;k<Q;k++) w[(long)k*F+i] = 1.0 + lambda*len*F; }
  cost = 0; unc = M; for (long i=0;i<M;i++) cost += w[i];
  m = malloc(sizeof(int)*(n+1)); int *best = malloc(sizeof(int)*(n+1));
  m[1] = 0;
  if (argc > 11) { FILE *f = fopen(argv[11], "r"); for (int q=1;q<=n;q++) if (fscanf(f, "%d", &m[q]) != 1) return 2; fclose(f); }
  else for (int q=2;q<=n;q++) m[q] = rnd() % Q;
  for (int q=1;q<=n;q++) place(q, m[q], +1);
  double bestcost = cost; long bestunc = unc; memcpy(best, m, sizeof(int)*(n+1));
  double T = T0, ratio = pow(T1/T0, 1024.0/(double)iters);
  for (long it=0; it<iters && bestunc > 0; it++){
    if ((it & 1023) == 1023) T *= ratio;
    int q = 2 + rnd() % (n-1); double old = cost;
    if (urand() < pu) {
      int nm = rnd() % Q; if (nm == m[q]) continue;
      place(q, m[q], -1); place(q, nm, +1);
      double dlt = cost - old;
      if (dlt <= 0 || urand() < exp(-dlt/T)) m[q] = nm; else { place(q, nm, -1); place(q, m[q], +1); }
    } else {
      int d = 1 + rnd() % dmax; if (rnd() & 1) d = -d;
      step(q, m[q], d);
      double dlt = cost - old;
      if (dlt <= 0 || urand() < exp(-dlt/T)) { m[q] = ((m[q] + d) % Q + Q) % Q; } else step(q, m[q] + d, -d);
    }
    if (unc < bestunc || (unc == bestunc && cost < bestcost)) { bestcost = cost; bestunc = unc; memcpy(best, m, sizeof(int)*(n+1)); }
  }
  printf("%ld %.4f\n", bestunc, bestcost); for (int q=1;q<=n;q++) printf("%d ", best[q]); printf("\n");
  return 0;
}
