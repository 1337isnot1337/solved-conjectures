# Agrawal’s conjecture: an exact prime-power reduction

Tracking issue: [#358](https://github.com/1337isnot1337/solved-conjectures/issues/358).

**Status:** Structural reduction, not a proof or counterexample. No priority is asserted.

The original conjecture (as stated explicitly in [Popovych](https://eprint.iacr.org/2009/008.pdf), introduction) asks: if `r` is prime, `r∤n`, and `(X−1)^n≡X^n−1` modulo `(n,X^r−1)`, must `n` be prime or `n²≡1 (mod r)`? The [Lenstra–Pomerance discussion](https://aimath.org/WWN/primesinp/primesinp.pdf), pp. 23–24, gives heuristic reasons for expecting a counterexample at `r=5`; in their finite search, surviving composite `n` for `r≥5` were squarefree. Popovych proves sufficient squarefree criteria without constructing a counterexample. Searches of the exact title, formula, 2025–26 sources, and the recent cited reference record did not locate a full resolution. The version with `r>log n` is not the original statement.

## Prime-power characterization

For distinct primes `p,r` and `a≥2`, the following are equivalent in `(Z/p^a Z)[X]/(X^r−1)`:

```text
(X−1)^(p^a) = X^(p^a)−1;
(X−1)^p     = X^p−1.
```

Thus the degree-`p` signed binomial remainder gives the exact maximum admissible prime-power exponent, even though the original test uses `p^a`. Namely, collect the coefficients of `(X−1)^p−X^p+1` by exponent modulo `r`, and take the minimum `p`-adic valuation of these integer sums. The equivalence shows that `a` passes exactly when it is no greater than that minimum. The minimum is finite: a primitive complex root `ζ` of `X^r−1` nearest to −1 satisfies `|ζ−1|>1`; if all remainder coefficients vanished over `Z`, repeated Galois substitution `ζ↦ζ^p` would make `(ζ−1)^(p^f)=ζ−1` for some `f>0`, a contradiction. In particular, no `a≥2` can pass when `r>p` (no coefficient grouping) or when `p=2` (the degree-2 difference is `2(1−X)`).

Proof: work before reduction in `R=Z_p[X]/(Φ_r(X))` and put `ζ=X` and `u=ζ−1`. The omitted factor `X−1` contributes a tautology to both equations. Since `p∤r`, the algebra `R` is a product of unramified rings of integers: `Φ_r` has distinct roots modulo `p` and its distinct irreducible factors Hensel lift. Also `u` is a unit, since `Φ_r(1)=r`. The automorphism `F:ζ↦ζ^p` is the Frobenius lift (it reduces to the `p`-power map). Write `u=t v` with its unique Teichmüller part `t` and principal unit `v≡1 (mod p)`. Then `F(t)=t^p` and `v^(p^a)≡1 (mod p^a)`. Therefore `u^(p^a)=F^a(u)` modulo `p^a` holds exactly when `v≡1 (mod p^a)`. Likewise `u^p=F(u)` holds exactly when `v^p=F(v)`. If `v≢1 (mod p^a)`, the minimum of the componentwise valuations of `v−1` is some `d<a`; `F` preserves that minimum while raising `v` to the `p`th power increases it by at least one. Hence `v^p≠F(v)` modulo `p^a`. This proves the characterization.

## The conductor 5 case

For odd `p≠5`, put `χ=(5/p)`, and let `F_j` denote the Fibonacci sequence, with `F_0=0` and `F_1=1`. The equivalent tests above at `r=5` are also equivalent to the following simultaneous congruences:

```text
p^a | 5^(p−1)−1,     p^a | F_(p−χ).
```

To see this, put `φ=1+ζ+ζ^(-1)` and `s=2φ−1` in the unramified algebra. Direct identities are `φ²−φ−1=0`, `s²=5`, and

```text
1+ζ = −ζ^(−2) φ,
(1−ζ)(1−ζ^(−1)) = 3−φ = s/φ.
```

If `u` is Teichmüller modulo `p^a`, all its Galois conjugates are too. Their norm is 5, and the quotient `(ζ²−1)/(ζ−1)=1+ζ` shows that `φ` is likewise Teichmüller. Conversely, if 5 and `φ` are Teichmüller, then so is `s`, since its square is 5 and the principal-unit quotient is an odd-prime power group. The second identity and `ζ^(-1)−1=−ζ^(-1)(ζ−1)` now show that `u²`, and hence `u`, is Teichmüller. All roots of unity used here have order coprime to `p`.

A rational unit 5 is Teichmüller modulo `p^a` exactly when `5^(p−1)≡1 (mod p^a)`. The Frobenius sends `φ` to `φ` when `χ=1` and to `ψ=1−φ=−1/φ` when `χ=-1` (equivalently, it fixes or swaps these expressions according as `p≡±1` or `±2 (mod 5)`). Thus `φ` is Teichmüller exactly when `φ^(p−χ)=χ` modulo `p^a`. Since `p−χ` is even, Binet's identity gives `sF_(p−χ)=φ^(p−χ)−φ^(-(p−χ))`. Vanishing of the Fibonacci value is therefore equivalent to `φ^(2(p−χ))=1`. Its square root with the correct mod-`p` sign is uniquely `χ`: the opposite sign differs by the unit 2. This proves the equivalence.

A prime-power counterexample at conductor 5 must have `p≡±2 (mod 5)` and odd `a≥3`, so it requires both the base-5 super-Wieferich condition and the Fibonacci congruence at level `p³`. This excludes any deduction of an original counterexample from a single ordinary Wieferich congruence. It does not prove that no such prime exists.

## Unresolved squarefree route

For a prime `p≡2,3 (mod 5)`, in `F_p[X]/(Φ_5)` write `L_p=ord(ζ−1)`. If the squarefree candidate `n` has fixed residue `n≡2 (mod 5)`, the test modulo `p` is equivalent to `n≡p^j (mod L_p)`, with `j=1` or 3 according as `p≡2` or 3. The equality `(ζ−1)^(p²−1)=−ζ^(-1)` gives `L_p | 10(p²−1)`, the same cyclotomic order bound in Popovych. Using exact orders may weaken his sufficient simultaneous Carmichael and Lucas–Carmichael restrictions, but no set of primes with the required subset product was constructed. No new finite search range or attainment claim is made.
