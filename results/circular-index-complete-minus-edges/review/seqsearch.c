/* Independent exhaustive search for perfect sequencings of K_n - F (n = 2m+1), from the definition:
   a cyclic order e_0..e_{N-1} of all edges such that any two edges at cyclic distance <= m-1 are disjoint.
   Rotation is fixed by putting edge index 0 (in lexicographic order of E(K_n - F)) at position 0.
   usage: seqsearch n out_file|- limit a1 b1 a2 b2 ...   (removed edges)
   prints the number of sequencings found (up to limit; limit 0 = no limit) and writes them, one per line,
   as space-separated "a-b" tokens, to out_file (or nothing if "-"). */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static int n, m, N, ea[200], eb[200];
static unsigned long long emask[200];
static int seq[200], used[200];
static long long found = 0, limit = 0, nodes = 0;
static FILE *out = NULL;
static void rec(int d) {
    if (limit && found >= limit) return;
    nodes++;
    if (d == N) {
        found++;
        if (out) { for (int i = 0; i < N; i++) fprintf(out, "%d-%d%c", ea[seq[i]], eb[seq[i]], i == N - 1 ? '\n' : ' '); }
        return;
    }
    unsigned long long block = 0;
    for (int a = d - m + 1; a < d; a++) if (a >= 0) block |= emask[seq[a]];
    for (int a = 0; a <= d + m - 1 - N; a++) block |= emask[seq[a]];
    for (int e = 0; e < N; e++) {
        if (used[e] || (emask[e] & block)) continue;
        used[e] = 1; seq[d] = e; rec(d + 1); used[e] = 0;
    }
}
int main(int argc, char **argv) {
    n = atoi(argv[1]); m = (n - 1) / 2;
    if (strcmp(argv[2], "-")) out = fopen(argv[2], "w");
    limit = atoll(argv[3]);
    int rem[64][2], t = 0;
    for (int i = 4; i + 1 < argc; i += 2) { rem[t][0] = atoi(argv[i]); rem[t][1] = atoi(argv[i + 1]); t++; }
    N = 0;
    for (int a = 0; a < n; a++) for (int b = a + 1; b < n; b++) {
        int skip = 0;
        for (int i = 0; i < t; i++) if ((rem[i][0] == a && rem[i][1] == b) || (rem[i][0] == b && rem[i][1] == a)) skip = 1;
        if (skip) continue;
        ea[N] = a; eb[N] = b; emask[N] = (1ULL << a) | (1ULL << b); N++;
    }
    used[0] = 1; seq[0] = 0; rec(1);
    printf("n=%d m=%d t=%d N=%d sequencings(e0 fixed)=%lld nodes=%lld\n", n, m, t, N, found, nodes);
    if (out) fclose(out);
    return 0;
}
