# The missing tau bound and the classical BSS transfer

Research notes, 23 November 2026. This file does not prove or disprove the tau conjecture. The source audit accepts the pinned Anthropic theorem as the repository's standing premise and checks its stated scope, not its validity.

## 1. Exact target and a sufficient weaker target

Let tau(f) be the minimum number of arithmetic gates in a division-free straight-line program starting with 1 and x and using addition, subtraction and multiplication. Only nonzero f in Z[x] are considered. The target is

    exists C > 0, for every nonzero f in Z[x],
    #{a in Z : f(a)=0} <= (1+tau(f))^C.

Put F_N(x)=product_{j=1}^N (x-j) and

    mu(n)=min {tau(F_{2^n} h) : 0 != h in Z[x]}.

The full conjecture implies mu(n) >= 2^(n/C)-1. A much weaker assertion already suffices for the BSS consequence: mu is not bounded by any polynomial in n. The lower bound must cover all nonzero multiples, not only F_{2^n} itself.

This sufficient direction is classical. The supplied Shub–Smale manuscript is dated 21 June 1994 despite the filename `ShubSmale-pap97.pdf`. Its introduction, Theorems 1 and 2; Section 3, Theorem 1; and Section 4, Propositions 1 and 2, provide the reduction and removal of fixed machine constants. The following proof spells out that direction with a direct bit-witness language.

### Theorem 1 (classical sufficient criterion, explicit reconstruction)

If mu(n) is not polynomially bounded, then P_C != NP_C in the uniform BSS model with arbitrary finitely many complex machine constants, arithmetic +,-,*, division where defined, and equality branches, charged one operation each.

Proof. For each n, encode a complex number z together with n padding coordinates equal to 1. Accept exactly when z belongs to {1,...,2^n}; reject malformed padding. A witness consists of b_0,...,b_{n-1} with b_i(b_i-1)=0 and

    z=1+sum_{i=0}^{n-1} 2^i b_i.

The verifier uses O(n) BSS operations and n witness coordinates. This language is in NP_C. Suppose P_C=NP_C. A single deterministic BSS machine M then decides it in time T(n)=n^{O(1)}.

Let c_1,...,c_r be all complex constants of M and K=Q(c_1,...,c_r). Choose a transcendence basis t_1,...,t_d for K/Q. The extension K/F, where F=Q(t_1,...,t_d), has finite degree q. Both d and q depend on M, not n. Fix an F-basis of K containing 1. Represent every register by its q coordinates. Addition and multiplication use fixed structure constants from F; division solves a fixed-size linear system, or uses a determinant and adjugate. Equality to zero means that all q coordinates vanish. Thus, on inputs in F, the machine is simulated over F with O(T(n)) operations and finitely many fixed constants from F. Each such constant is a fixed rational function of t with rational coefficients.

Fix n and treat z as an indeterminate. Unroll the simulated computation along its generic path over F(z). At a zero test, take the equality branch precisely when the tested rational function is identically zero. All other tests take the inequality branch. Every divisor on this path is a nonzero rational function: a divisor identically zero would make the program undefined on a nonempty generic set of ordinary inputs. The generic path halts within O(T(n)) steps, since every finite prefix is realized outside finitely many points of the infinite field F and the original worst-case bound applies.

Its answer is No. Otherwise it would accept all but finitely many z in F, although the accepted set in this slice is finite. Track every rational register as a pair of polynomials. For example, addition sends (A,B),(C,D) to (AD+BC,BD), and division sends them to (AD,BC) when C is nonzero. These updates cost a constant number of ring operations per original operation and retain shared intermediate results. Multiply the numerator of every nonzero generic branch test and every generic divisor into an accumulator H_n. The numerator and denominator tracking, including the accumulator, has O(T(n)) gates over the fixed coefficient field. No identically zero test is included. The product is nonzero.

If H_n(j) were nonzero for some j in {1,...,2^n}, all divisions would be defined at j and every test would follow the generic path, so the computation would incorrectly reject j. Thus H_n(j)=0 at every required integer. This argument also covers accepted inputs that leave the generic domain at a divisor, because that divisor's numerator is included.

At this point H_n has a division-free polynomial circuit over F. Substitute the fixed rational functions for its finitely many F-constants and clear denominators by the same simultaneous pair construction. These denominators depend only on t, not on z, so they introduce no pole ambiguity at an integer z=j. Obtain a nonzero polynomial P_n(t,z) in Z[t_1,...,t_d,z] with a division-free constant-free circuit of length S(n)=O_M(T(n)+n+1). Rational numerical coefficients can be constructed once as fixed integer numerator-denominator pairs. Each identity H_n(j)=0 in F gives P_n(t,j)=0 identically in t. Consequently F_{2^n} divides P_n in Z[t,z], by successive division by its monic linear factors.

Every variable degree of P_n is at most D=2^{S(n)}. At least one coefficient of z in P_n is a nonzero polynomial in t. A nonzero polynomial of individual degree at most D cannot vanish on the full grid {0,...,D}^d. This follows by induction on d from the univariate root bound. Hence some integer tuple a in that grid gives g_n(z)=P_n(a,z) nonzero. Constructing each a_i from 1 costs O(log(D+1))=O(S(n)+1) gates by binary expansion; d is fixed. The specialized polynomial therefore has tau(g_n)=O_M(S(n)+1)=n^{O(1)}, and F_{2^n} divides g_n. This contradicts the hypothesis on mu. QED.

The proof is existential and nonuniform at the stage of choosing a specialization and a short polynomial. That is sufficient: mu minimizes over all circuits. It does not assert that a witness circuit for mu can be found efficiently.

### Related factorial criterion

If P=F_N h is nonzero and tau(P)=s, then deg(P)<=2^s. Some integer a in {0,...,2^s} has P(a)!=0, since there are more sample points than the degree. Construct a in O(s+1) gates and substitute in the circuit to get a nonzero integer P(a) of complexity O(s+1). The product of any N consecutive integers is divisible by N!, so P(a) is a nonzero multiple of N!. Thus short multiples of F_N imply short nonzero integer multiples of N!. This is one direction; no reverse implication has been established here.


## Unresolved implication

Neither the universal integer-root inequality nor superpolynomial growth of mu has been proved. The elementary bound proved in [ARITHMETIC.md](ARITHMETIC.md) is only mu(n) >= n + log_2(n) + O(1). The cut recurrences, rank obstructions and arithmetic identities in this directory do not bridge that gap. This file proves the stated classical implication, not the Shub–Smale tau conjecture.
