# Why a uniform near-maximal Shannon entropy bound cannot prove Erdős 461

This is an obstruction to a proposed proof method, not a resolution of Erdős 461. No novelty or bounty claim is made.

Let t>2 and let I be uniform on {1,...,t}. Write

    c_s(n) = |{i in {1,...,t}: s_t(n+i)=s}|,
    H_n = H(s_t(n+I)),
    C_t = product_(p prime, p<t) (1-1/p),

using natural logarithms. The smooth-component range has size f(n,t), but H_n can be substantially smaller than log f(n,t). A proof of H_n >= log t-O(1) would imply the desired linear range bound. That proposed entropy estimate is false.

## A finite inequality

For any integer 1<=y<t, put

    Q = (product_(p prime, p<t) p) lcm(1,...,y).

Average n uniformly over {0,...,Q-1}. For every s<=y, membership in the event s_t(m)=s is periodic modulo Q, and

    Pr_n(s_t(n+i)=s) = C_t/s.

To see this, require v_p(m)=v_p(s) for each p<t. The modulus Q contains p^(v_p(s)+1), and the proportion of allowable residues is p^(-v_p(s))(1-1/p). Multiplication over primes gives C_t/s. Therefore

    E_n c_s(n) = t C_t/s.

For an integer count c>=0, set 0 log 0=0. Then c log c>=0, so

    log t-H_n = (1/t) sum_s c_s(n) log c_s(n)
              >= (1/t) sum_(s<=y) c_s(n) log c_s(n).

The function x log x, extended by zero at x=0, is convex. Applying Jensen separately to each count gives

    E_n[log t-H_n]
      >= C_t sum_(s<=y) (1/s) log(t C_t/s).

In particular there exists a residue n with

    H_n <= log t - C_t sum_(s<=y) log(t C_t/s)/s.             (1)

This is an exact finite inequality. Taking y<=t C_t makes every summand on the right-hand deficit nonnegative, although that restriction is not needed for the validity of (1).

## Asymptotic consequence

Take y=floor(t C_t). Mertens' product theorem gives

    C_t = (exp(-EulerGamma)+o(1))/log t,
    y ~ exp(-EulerGamma)t/log t.

The elementary estimates H_y=log y+EulerGamma+o(1) and
sum_(s<=y) log(s)/s = (1/2)(log y)^2+O(1) imply

    sum_(s<=y) log(t C_t/s)/s = (1/2+o(1))(log t)^2.

Consequently, for arbitrarily large t (indeed, for every sufficiently large t with a suitable n),

    H_n <= (1 - exp(-EulerGamma)/2 + o(1)) log t
         = (0.719270... + o(1)) log t.

Thus no universal bound H_n>=log t-C can hold for a fixed C.

This does not refute f(n,t)>=ct: a distribution can have linearly many singleton classes while a substantial part of its probability lies in much larger classes. A successful argument must control the number of classes without requiring near-maximal Shannon entropy.

## Relation to prior work

The exact prescribed-smooth-component average C_t/s is the same elementary input used in the June 2026 [Erdős Problems 461 discussion](https://www.erdosproblems.com/forum/thread/461) to derive the already-known upper bound inf_n f(n,t)<=(1-exp(-EulerGamma)+o(1))t. The Jensen argument above is a diagnostic for the entropy route considered in this session. It has not been formally verified in Lean, and no assertion of prior-literature novelty is made.
