"""Small exact score checks and numerical checks of the analytic identities."""
from fractions import Fraction
from itertools import combinations, product
from math import comb, cos, log, pi, sin, sqrt


def threshold(value, scale):
    return max(0, value-scale) - max(0, -value-scale)


def check_sparse_scores():
    scale = Fraction(2, 3)
    noise_levels = (-scale, Fraction(0), scale)
    subsets = list(combinations(range(3), 0)) + list(combinations(range(3), 1)) + list(combinations(range(3), 2))
    cases = 0
    for raw in product((-2, 0, 1), repeat=3):
        for noise in product(noise_levels, repeat=3):
            soft = tuple(threshold(v+w,scale) for v,w in zip(raw,noise))
            assert all(abs(q-v) <= 2*scale for q,v in zip(soft,raw))
            # Leaving coordinates whose score is zero out of the release has the same effect.
            assert all(v != 0 or q == 0 for q,v in zip(soft,raw))
            chosen = max(subsets, key=lambda group: sum(soft[i] for i in group))
            best = max(sum(raw[i] for i in group) for group in subsets)
            assert best - sum(raw[i] for i in chosen) <= 4*scale*2
            cases += 1
    return cases


def check_affinity():
    def root(x):
        return cos(pi*x/2) if -1 <= x <= 1 else 0
    for step in range(21):
        delta = step/8
        expected = (1-delta/2)*cos(pi*delta/2) + sin(pi*delta/2)/pi if delta <= 2 else 0
        width = max(0,2-delta)
        chunks = 4000
        numeric = sum(root(delta-1+(j+0.5)*width/chunks)*root(-1+(j+0.5)*width/chunks) for j in range(chunks))*width/chunks
        assert abs(numeric-expected) < 2e-7
        assert 2*(1-expected) <= pi**2*delta**2/4 + 1e-12


def check_two_feature_channel():
    cases = 0
    for n in range(1,6):
        for pool in product((0,1),repeat=2*n):
            common = sum(pool[2*i] == pool[2*i+1] == 1 for i in range(n))
            mixed = sum(pool[2*i] != pool[2*i+1] for i in range(n))
            counts = [0]*(n+1)
            for bits in product((0,1),repeat=n):
                counts[sum(pool[2*i+bit] for i,bit in enumerate(bits))] += 1
            for k,value in enumerate(counts):
                expected = comb(mixed,k-common) * 2**(n-mixed) if common <= k <= common+mixed else 0
                assert value == expected
            cases += 1
    return cases


def check_sine_modes():
    cases = 0
    for m in range(1,33):
        trace_norm = 0
        for k in range(1,m+1):
            angle = (2*k-1)*pi/(2*m+1)
            vec = [0]+[sin(i*angle) for i in range(1,m+1)]
            eigen = 2-2*cos(angle)
            for i in range(1,m+1):
                gram = 2*vec[i]-vec[i-1]-(vec[i+1] if i < m else vec[i])
                assert abs(gram-eigen*vec[i]) < 1e-12
            trace_norm += 1/sqrt(eigen)
            cases += 1
        assert trace_norm >= (2*m+1)/pi*sum(1/(2*k-1) for k in range(1,m+1))-1e-12
    return cases


if __name__ == '__main__':
    check_affinity()
    print(f'{check_sparse_scores()} sparse selections, 21 affinity integrals, '
          f'{check_two_feature_channel()} conditional binomial laws, '
          f'and {check_sine_modes()} prefix-matrix eigenvectors passed.')
