/* heat-bath annealing with speed-change moves.
   usage: a3s n G iters seed delta T0 T1 Vmax ps init(speeds+shifts file or -) [M]
   runner set: n distinct speeds from 1..Vmax. Move: pick runner i (index>0; runner 0 keeps speed and shift 0).
   with prob 1-ps: heat-bath over shift bins (speed fixed). with prob ps: heat-bath over (speed w in unused U {v_i}) x bins.
   output: best cost, then n lines "speed shift". */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <string.h>
static uint64_t rs;
static inline uint64_t rnd64(void){ rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }
static inline double rnd(void){ return (rnd64() >> 11) * (1.0 / 9007199254740992.0); }
static int n, G, M; static double delta; static int *v; static int16_t *cnt; static long cost;
static int *ulist, *upos, nu;
static inline void uadd(int g){ upos[g] = nu; ulist[nu++] = g; }
static inline void udel(int g){ int p = upos[g], last = ulist[--nu]; ulist[p] = last; upos[last] = p; upos[g] = -1; }
static void apply(int w, double s, int sign){
    double h = delta / w;
    for (int m = 0; m < w; m++){
        double c = (m - s) / w;
        long lo = (long)ceil((c - h) * G - 1e-9), hi = (long)floor((c + h) * G + 1e-9);
        if (lo < 0){ lo += G; hi += G; } else if (lo >= G){ lo -= G; hi -= G; }
        for (long g = lo; g <= hi; g++){
            long idx = g >= G ? g - G : g;
            if (sign > 0){ if (cnt[idx]++ == 0){ cost--; udel(idx); } }
            else { if (--cnt[idx] == 0){ cost++; uadd(idx); } }
        }
    }
}
static void depth(int w, int *D){
    memset(D, 0, (M + 1) * sizeof(int));
    for (int k = 0; k < nu; k++){
        double t = (double)ulist[k] / G;
        double c = -w * t; c -= floor(c);
        long lo = (long)ceil((c - delta) * M - 0.5 - 1e-9), hi = (long)floor((c + delta) * M - 0.5 + 1e-9);
        if (lo < 0){ D[lo + M]++; D[M]--; D[0]++; D[hi + 1]--; }
        else if (hi >= M){ D[lo]++; D[M]--; D[0]++; D[hi - M + 1]--; }
        else { D[lo]++; D[hi + 1]--; }
    }
    int run = 0; for (int b = 0; b < M; b++){ run += D[b]; D[b] = run; }
}
int main(int argc, char **argv){
    if (argc < 11){ fprintf(stderr, "usage\n"); return 2; }
    n = atoi(argv[1]); G = atoi(argv[2]); double iters = atof(argv[3]); rs = 88172645463325252ULL ^ (uint64_t)atoll(argv[4]) * 0x9E3779B97F4A7C15ULL;
    delta = atof(argv[5]); double T0 = atof(argv[6]), T1 = atof(argv[7]); int Vmax = atoi(argv[8]); double ps = atof(argv[9]);
    M = argc > 11 ? atoi(argv[11]) : 8192; int f0 = argc > 12 ? atoi(argv[12]) : 0; int KC = argc > 13 ? atoi(argv[13]) : 0;
    for (int k = 0; k < 20; k++) rnd64();
    v = malloc(n * sizeof(int)); double *s = malloc(n * sizeof(double));
    if (strcmp(argv[10], "-")){ FILE *f = fopen(argv[10], "r"); for (int i = 0; i < n; i++) if (fscanf(f, "%d %lf", &v[i], &s[i]) != 2){ fprintf(stderr, "bad init\n"); return 2; } fclose(f); }
    else { for (int i = 0; i < n; i++){ v[i] = i + 1; s[i] = rnd(); } }
    if (!f0) s[0] = 0.0;
    char *used = calloc(Vmax + 2, 1); for (int i = 0; i < n; i++) used[v[i]] = 1;
    int *bv = malloc(n * sizeof(int)); double *bs = malloc(n * sizeof(double));
    cnt = calloc(G, sizeof(int16_t)); ulist = malloc(G * sizeof(int)); upos = malloc(G * sizeof(int));
    nu = 0; for (int g = 0; g < G; g++) uadd(g); cost = G;
    for (int i = 0; i < n; i++) apply(v[i], s[i], +1);
    long bestcost = cost; memcpy(bv, v, n * sizeof(int)); memcpy(bs, s, n * sizeof(double));
    int *D = malloc((M + 1) * sizeof(int)); double *wt = malloc(4096 * sizeof(double));
    int *cand = malloc((Vmax + 1) * sizeof(int)); double *cw = malloc((size_t)(Vmax + 1) * M * sizeof(double)); int *Dall = malloc((size_t)(Vmax + 1) * M * sizeof(int));
    double lr = log(T1 / T0); int nextq = 1;
    for (double it = 0; it < iters && cost > 0; it += 1){
        double T = T0 * exp(lr * it / iters);
        if (it >= nextq * 0.1 * iters){ fprintf(stderr, "%ld ", cost); nextq++; }
        int i = f0 ? (int)(rnd() * n) : 1 + (int)(rnd() * (n - 1)); if (i >= n) i = n - 1;
        apply(v[i], s[i], -1);
        int nc = 0;
        if (rnd() < ps){ used[v[i]] = 0; for (int w = 1; w <= Vmax; w++) if (!used[w]) cand[nc++] = w;
            if (KC > 0 && nc > KC){ for (int a = 0; a < KC; a++){ int b = a + (int)(rnd() * (nc - a)); if (b >= nc) b = nc - 1; int tmp = cand[a]; cand[a] = cand[b]; cand[b] = tmp; } nc = KC; int has = 0; for (int a = 0; a < nc; a++) if (cand[a] == v[i]) has = 1; if (!has) cand[nc++] = v[i]; } }
        else cand[nc++] = v[i];
        int mx = -1;
        for (int c = 0; c < nc; c++){ depth(cand[c], Dall + (size_t)c * M); for (int b = 0; b < M; b++) if (Dall[(size_t)c * M + b] > mx) mx = Dall[(size_t)c * M + b]; }
        int K = (int)(30 * T) + 1; if (K > 4095) K = 4095;
        for (int k = 0; k <= K; k++) wt[k] = exp(-k / T);
        double tot = 0; size_t NB = (size_t)nc * M;
        for (size_t b = 0; b < NB; b++){ int k = mx - Dall[b]; if (k <= K) tot += wt[k]; cw[b] = tot; }
        double r = rnd() * tot; size_t lo = 0, hi = NB - 1;
        while (lo < hi){ size_t mid = (lo + hi) >> 1; if (cw[mid] < r) lo = mid + 1; else hi = mid; }
        int w = cand[lo / M]; double si = ((lo % M) + rnd()) / M;
        used[v[i]] = 0; v[i] = w; used[w] = 1; s[i] = si;
        apply(w, si, +1);
        if (cost < bestcost){ bestcost = cost; memcpy(bv, v, n * sizeof(int)); memcpy(bs, s, n * sizeof(double)); }
    }
    fprintf(stderr, "| best %ld\n", bestcost);
    printf("%ld\n", bestcost);
    for (int i = 0; i < n; i++) printf("%d %.17g\n", bv[i], bs[i]);
    return 0;
}
