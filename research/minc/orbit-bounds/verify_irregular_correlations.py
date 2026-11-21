"""Supply outward bounds on two real intervals in the variational comparison."""
from fractions import Fraction as F
from verify_flat_correlations import log_bound


def shape(u):
    d = 1 + u*u
    a = u/d
    return d, a, 2*(u+a)


def resolvent(z):
    return (z*z + 8*z + 11) / (z**3 + 9*z*z + 18*z + 6)


def lower_gap(lo, hi, use_resolvent):
    _, a_lo, s_lo = shape(lo)
    d_hi, a_hi, s_hi = shape(hi)
    a_upper = F(1, 2) if lo <= 1 <= hi else max(a_lo, a_hi)
    phi_upper = log_bound(d_hi, True) - 1 + 1/d_hi
    if use_resolvent:
        z = 1/(s_lo*(1+s_lo))
        gain = resolvent(z) - d_hi/(1+d_hi)*log_bound(1+s_hi, True)
    else:
        gain = (1+1/(1+d_hi))*log_bound(1+s_lo, False) - F(289, 500)
    return 2*(gain-2*a_upper) - phi_upper


def cover(lo, hi, use_resolvent):
    pending = [(lo,hi)]
    leaves = 0
    while pending:
        lo, hi = pending.pop()
        if lower_gap(lo, hi, use_resolvent) > 0:
            leaves += 1
            continue
        assert hi-lo > F(1, 2**40), (lo,hi)
        mid = (lo+hi)/2
        pending.extend([(lo,mid), (mid,hi)])
    return leaves


def check_irregular_components():
    # Construct two populations by prescribing a positive solution W a = u.
    # All W entries and all comparisons are rational.
    checked = 0
    for n_left in range(3, 6):
        for n_right in range(3, 6):
            groups = [0]*n_left + [1]*n_right
            n = len(groups)
            for cross in (F(1,100), F(1,50), F(1,25)):
                u = (F(1), F(1,2))
                d = [1+x*x for x in u]
                a = [u[i]/d[i] for i in range(2)]
                left = (u[0]-n_right*cross*a[1])/((n_left-1)*a[0])
                right = (u[1]-n_left*cross*a[0])/((n_right-1)*a[1])
                assert cross <= min(left,right) and max(left,right) < 1
                # I+W and C with nonnegative entries sqrt(w_ij) are PSD:
                # each is a sum of a nonnegative global constant kernel,
                # within-population constant kernels, and a diagonal.
                inside = (left,right)
                W = [[0 if i==j else inside[g] if g==h else cross
                      for j,h in enumerate(groups)] for i,g in enumerate(groups)]
                for i,g in enumerate(groups):
                    assert sum(W[i][j]*a[groups[j]] for j in range(n)) == u[g]
                    assert 1/d[g]+sum(a[g]*W[i][j]*a[groups[j]] for j in range(n)) == 1
                Y = [[w+int(i==j) for j,w in enumerate(row)] for i,row in enumerate(W)]
                # Subset recurrence for the nonnegative permanent.
                totals = [F(0)]*(1 << n)
                totals[0] = F(1)
                for mask in range(1, 1 << n):
                    row = Y[mask.bit_count()-1]
                    totals[mask] = sum(row[j]*totals[mask ^ (1 << j)]
                                       for j in range(n) if mask & (1 << j))
                m_upper = sum(log_bound(d[g], True)-1+1/d[g] for g in groups)
                assert m_upper < log_bound(totals[-1], False)
                checked += 1
    return checked


if __name__ == '__main__':
    harmonic = sum((F(1,j) for j in range(1,1025)), F(0))
    assert harmonic - 10*log_bound(F(2), False) < F(289,500)
    assert log_bound(F(4), False) + 1 - 2*F(289,500) - F(4,5) - F(2,25) > 0
    first = cover(F(1,100), F(31,100), True)
    second = cover(F(31,100), F(5), False)
    print(f'{check_irregular_components()} exact irregular component replays')
    print(f'{first} resolvent intervals and {second} pure Gaussian intervals certified')
