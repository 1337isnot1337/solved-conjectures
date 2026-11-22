/* anneal3: heat-bath (Gibbs) annealing for the shifted lonely runner grid cover, speeds 1..n.
   One move: pick runner i, remove it, compute for every shift bin b (M bins) the number of grid points left
   uncovered if runner i is placed at the bin centre, and sample a bin with probability ~ exp(-cost/T).
   usage: anneal3 n G iters seed margin T0 T1 [key=value]: init=file M=<bins> metro=<prob of a plain Metropolis move>
   output: best cost, then n shifts. */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

static uint64_t rs;
static inline uint64_t rnd64(void){ rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }
static inline double rnd(void){ return (rnd64() >> 11) * (1.0 / 9007199254740992.0); }
static double gauss(void){ double u = rnd(), v = rnd(); if (u < 1e-300) u = 1e-300; return sqrt(-2.0 * log(u)) * cos(6.283185307179586 * v); }

static int n, G, M; static double delta; static int *v; static int16_t *cnt; static long cost;
static int *ulist, *upos, nu;
static inline void uadd(int g){ upos[g] = nu; ulist[nu++] = g; }
static inline void udel(int g){ int p = upos[g], last = ulist[--nu]; ulist[p] = last; upos[last] = p; upos[g] = -1; }

static void apply(int i, double s, int sign){
    double h = delta / v[i];
    for (int m = 0; m < v[i]; m++){
        double c = (m - s) / v[i];
        long lo = (long)ceil((c - h) * G - 1e-9), hi = (long)floor((c + h) * G + 1e-9);
        if (lo < 0){ lo += G; hi += G; }
        else if (lo >= G){ lo -= G; hi -= G; }
        for (long g = lo; g <= hi; g++){
            long idx = g >= G ? g - G : g;
            if (sign > 0){ if (cnt[idx]++ == 0){ cost--; udel(idx); } }
            else { if (--cnt[idx] == 0){ cost++; uadd(idx); } }
        }
    }
}

int main(int argc, char **argv){
    if (argc < 8){ fprintf(stderr, "usage\n"); return 2; }
    n = atoi(argv[1]); G = atoi(argv[2]); double iters = atof(argv[3]); rs = 88172645463325252ULL ^ (uint64_t)atoll(argv[4]) * 0x9E3779B97F4A7C15ULL;
    double margin = atof(argv[5]), T0 = atof(argv[6]), T1 = atof(argv[7]);
    const char *initf = NULL; double metro = 0.0; M = 16384; double abf = 2.0; long abc = 0; int nextq = 1;
    for (int k = 8; k < argc; k++){
        char *e = strchr(argv[k], '='); if (!e) continue; *e = 0; char *val = e + 1;
        if (!strcmp(argv[k], "init")) initf = val;
        else if (!strcmp(argv[k], "M")) M = atoi(val);
        else if (!strcmp(argv[k], "metro")) metro = atof(val);
        else if (!strcmp(argv[k], "abf")) abf = atof(val);
        else if (!strcmp(argv[k], "abc")) abc = atol(val);
    }
    delta = 1.0 / (n + 1 + margin);
    v = malloc(n * sizeof(int)); for (int i = 0; i < n; i++) v[i] = i + 1;
    double *s = malloc(n * sizeof(double)), *best = malloc(n * sizeof(double));
    for (int k = 0; k < 20; k++) rnd64();
    for (int i = 0; i < n; i++) s[i] = rnd();
    if (initf){ FILE *f = fopen(initf, "r"); if (f){ for (int i = 0; i < n; i++) if (fscanf(f, "%lf", &s[i]) != 1) break; fclose(f);} }
    s[0] = 0.0;
    cnt = calloc(G, sizeof(int16_t)); ulist = malloc(G * sizeof(int)); upos = malloc(G * sizeof(int));
    nu = 0; for (int g = 0; g < G; g++) uadd(g);
    cost = G;
    for (int i = 0; i < n; i++) apply(i, s[i], +1);
    long bestcost = cost; memcpy(best, s, n * sizeof(double));
    int *D = malloc((M + 1) * sizeof(int)); double *wt = malloc(4096 * sizeof(double)); double *cw = malloc(M * sizeof(double));
    double lr = log(T1 / T0);
    int dw = (int)floor(delta * M); /* half width in bins (approx) */
    for (double it = 0; it < iters && cost > 0; it += 1){
        double T = T0 * exp(lr * it / iters);
        if (it >= nextq * 0.1 * iters){ fprintf(stderr, "%ld ", cost); nextq++; }
        if (abc > 0 && it >= abf * iters && cost > abc){ fprintf(stderr, "ABORT "); break; }
        int i = 1 + (int)(rnd() * (n - 1)); if (i >= n) i = n - 1;
        if (metro > 0 && rnd() < metro){
            double si = s[i] + 0.02 * gauss(); si -= floor(si);
            long old = cost; apply(i, s[i], -1); apply(i, si, +1);
            if (cost <= old || rnd() < exp((double)(old - cost) / T)){ s[i] = si; if (cost < bestcost){ bestcost = cost; memcpy(best, s, n * sizeof(double)); } }
            else { apply(i, si, -1); apply(i, s[i], +1); }
            continue;
        }
        apply(i, s[i], -1);
        /* depth array: number of currently uncovered points covered if runner i sits at bin b */
        memset(D, 0, (M + 1) * sizeof(int));
        for (int k = 0; k < nu; k++){
            double t = (double)ulist[k] / G;
            double c = -v[i] * t; c -= floor(c);
            /* bins b with |(b+0.5)/M - c| <= delta (mod 1) */
            long lo = (long)ceil((c - delta) * M - 0.5 - 1e-9), hi = (long)floor((c + delta) * M - 0.5 + 1e-9);
            if (lo < 0){ D[lo + M]++; D[M]--; D[0]++; D[hi + 1]--; }
            else if (hi >= M){ D[lo]++; D[M]--; D[0]++; D[hi - M + 1]--; }
            else { D[lo]++; D[hi + 1]--; }
        }
        (void)dw;
        int run = 0, mx = -1;
        for (int b = 0; b < M; b++){ run += D[b]; D[b] = run; if (run > mx) mx = run; }
        /* weights exp(-(mx - D)/T), truncated */
        int K = (int)(30 * T) + 1; if (K > 4095) K = 4095;
        for (int k = 0; k <= K; k++) wt[k] = exp(-k / T);
        double tot = 0;
        for (int b = 0; b < M; b++){ int k = mx - D[b]; if (k <= K) tot += wt[k]; cw[b] = tot; }
        double r = rnd() * tot; int lo = 0, hi = M - 1;
        while (lo < hi){ int mid = (lo + hi) >> 1; if (cw[mid] < r) lo = mid + 1; else hi = mid; }
        double si = (lo + rnd()) / M; /* uniform within the chosen bin */
        apply(i, si, +1); s[i] = si;
        if (cost < bestcost){ bestcost = cost; memcpy(best, s, n * sizeof(double)); }
    }
    fprintf(stderr, "| best %ld\n", bestcost);
    printf("%ld\n", bestcost);
    for (int i = 0; i < n; i++) printf("%.17g\n", best[i]);
    return 0;
}
