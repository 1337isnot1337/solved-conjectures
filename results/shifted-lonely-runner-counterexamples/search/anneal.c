/* Grid annealing for the shifted lonely runner covering problem (speeds 1..n or given list).
   cost = number of grid times t_g = g/G with no runner i satisfying ||s_i + v_i t_g|| <= delta.
   Incremental updates: a move touches only the grid points of the old and new teeth of one runner.
   usage: anneal n G iters seed margin T0 T1 [initfile]
   output: best cost, then n shifts (one per line). Heuristic only; certification is done elsewhere. */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

static uint64_t rs;
static inline uint64_t rnd64(void){ rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }
static inline double rnd(void){ return (rnd64() >> 11) * (1.0 / 9007199254740992.0); }
static double gauss(void){ double u = rnd(), v = rnd(); if (u < 1e-300) u = 1e-300; return sqrt(-2.0 * log(u)) * cos(6.283185307179586 * v); }

static int n, G; static double delta; static int *v; static int16_t *cnt; static long cost;

static void apply(int i, double s, int sign){
    double h = delta / v[i];
    for (int m = 0; m < v[i]; m++){
        double c = (m - s) / v[i];
        long lo = (long)ceil((c - h) * G - 1e-9), hi = (long)floor((c + h) * G + 1e-9);
        for (long g = lo; g <= hi; g++){
            long idx = g % G; if (idx < 0) idx += G;
            if (sign > 0){ if (cnt[idx]++ == 0) cost--; }
            else { if (--cnt[idx] == 0) cost++; }
        }
    }
}

int main(int argc, char **argv){
    if (argc < 8){ fprintf(stderr, "usage\n"); return 2; }
    n = atoi(argv[1]); G = atoi(argv[2]); double iters = atof(argv[3]); rs = 88172645463325252ULL ^ (uint64_t)atoll(argv[4]) * 0x9E3779B97F4A7C15ULL;
    double margin = atof(argv[5]), T0 = atof(argv[6]), T1 = atof(argv[7]);
    delta = 1.0 / (n + 1 + margin);
    v = malloc(n * sizeof(int)); for (int i = 0; i < n; i++) v[i] = i + 1;
    double *s = malloc(n * sizeof(double)), *best = malloc(n * sizeof(double));
    for (int k = 0; k < 20; k++) rnd64();
    for (int i = 0; i < n; i++) s[i] = rnd();
    if (argc > 8){ FILE *f = fopen(argv[8], "r"); if (f){ for (int i = 0; i < n; i++) if (fscanf(f, "%lf", &s[i]) != 1) break; fclose(f);} }
    s[0] = 0.0;
    cnt = calloc(G, sizeof(int16_t)); cost = G;
    for (int i = 0; i < n; i++) apply(i, s[i], +1);
    long bestcost = cost; memcpy(best, s, n * sizeof(double));
    double lr = log(T1 / T0);
    for (double it = 0; it < iters && cost > 0; it += 1){
        double T = T0 * exp(lr * it / iters);
        int i = 1 + (int)(rnd() * (n - 1)); if (i >= n) i = n - 1;
        double si;
        if (rnd() < 0.3) si = rnd(); else { si = s[i] + 0.02 * gauss(); si -= floor(si); }
        long old = cost;
        apply(i, s[i], -1); apply(i, si, +1);
        if (cost <= old || rnd() < exp((double)(old - cost) / T)){
            s[i] = si;
            if (cost < bestcost){ bestcost = cost; memcpy(best, s, n * sizeof(double)); }
        } else { apply(i, si, -1); apply(i, s[i], +1); }
    }
    printf("%ld\n", bestcost);
    for (int i = 0; i < n; i++) printf("%.17g\n", best[i]);
    return 0;
}
