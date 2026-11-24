# Regular values of short rational expressions cannot directly carry a hard polynomial graph

Status: written obstruction under the project's imported border lower bound and reviewed factor-degeneration lemma. This concerns rational expressions constructed from the input by charged arithmetic, including finite decision trees with Boolean regular-value tests. It does not cover independently quantified circuit parameters or an uncharged interior-coefficient operation. No HN_C separation is proved.

## 1. Query semantics

Let a=(x,y) be the input and let P(a,t),Q(a,t) be polynomial circuits. A marked center alpha(a) and a proposed value v(a) may be rational functions obtained by ordinary BSS arithmetic on the current path, with their divisions defined there. The regular-value query is true exactly when Q(a,.) is not the zero polynomial and the univariate rational function P/Q has a finite removable value v at t=alpha.

Define A(a,t)=P(a,t)-v(a)Q(a,t), then put u=t-alpha. With the convention that the order of the zero polynomial is infinity, the query is equivalent to

```math
Q(a,\alpha+u)\not\equiv0,
\qquad
\mathop{\mathrm{ord}}_u A(a,\alpha+u)
>\mathop{\mathrm{ord}}_u Q(a,\alpha+u).                 \tag{1}
```

A regularity-only query replaces the strict comparison by ord(P)>=ord(Q). Displayed denominators may vanish at the marked center; cancellation in the univariate rational function is permitted. An identically zero denominator is invalid, including the displayed pair P=Q=0. A convention returning false on invalid pairs is used below; making invalidity a separate branch has the same argument.

Coefficient circuits and marked centers must actually be supplied by the charged computation. A division-free numerator/denominator pair for a rational arithmetic circuit is obtained gate by gate with constant overhead. Rational input coefficients and a rational center can be substituted and their input denominators cleared with polynomial overhead. Denominators used by the ordinary input computation remain required to be nonzero. A rational query circuit with its own internal divisions also requires that its intermediate denominators not specialize to the zero rational function; their validity tests can be included separately.

## 2. Generic orders can change only on a leading-coefficient zero set

Let H(x,y)=y-f(x), where f is a polynomial, and localize C[x,y] at a polynomial D not divisible by H. This permits exactly the input denominators known to be nonzero at the generic point of the graph. Restriction to H is therefore defined.

Take a nonzero polynomial in u over that localized ring and write

```math
B(x,y,u)=u^k\bigl(b_0(x,y)+u b_1(x,y)+\cdots\bigr),
\qquad b_0\ne0.                                        \tag{2}
```

If b_0 does not vanish identically on H, the restriction of B to H remains nonzero and has exactly order k. If its order increases or the restriction becomes the zero polynomial, b_0 must vanish identically on H. After clearing its input denominator, its nonzero numerator is divisible by H.

Apply this observation to the denominator and to A=P-vQ in (1). If neither first nonzero coefficient vanishes identically on H, all nonzero orders and denominator validity are unchanged at the generic point of H. Thus the truth of (1) is unchanged there. The zero cases are explicit:

- If Q is identically zero in the ambient function field, it remains so on H wherever its coefficient restriction is defined.
- If an ambient nonzero Q becomes identically zero on H, its first coefficient already supplies the required multiple of H.
- If A is identically zero in the ambient function field, it remains zero on H; the query remains true whenever Q remains valid.
- If an ambient nonzero A becomes zero or gains order on H, its first coefficient supplies the multiple.

Consequently, any change of generic truth between ambient input space and H exposes a nonzero first coefficient of one of the small query polynomials that is divisible by H. The same conclusion holds for a regularity-only comparison.

## 3. A leading coefficient is cheap in the border model

Suppose B is computed by a division-free circuit of size s and k is its first u exponent. Then

```math
\epsilon^{-k}B(x,y,\epsilon)\longrightarrow b_0(x,y)     \tag{3}
```

coefficientwise. Thus b_0 has border complexity O(s), with powers of epsilon admitted as scalar constants. Even if those powers are charged, k<=2^s for a binary arithmetic circuit, so repeated squaring constructs the required power in O(s) gates. The argument uses the first nonzero coefficient, not an arbitrary interior coefficient.

Input denominator clearing does not change this fact. It multiplies B by a small nonzero rational-denominator numerator depending only on x,y, whose restriction to H is nonzero. Its first u coefficient has the same vanishing condition on H and a polynomial circuit bound before taking the limit.

If H divides this nonzero b_0, the reviewed graph-factor degeneration lemma gives

```math
\underline L(f)\le\mathop{\mathrm{poly}}(s,n,\deg f+1). \tag{4}
```

To see the hypotheses directly, divide B symbolically by u^k only for the existence proof. The result is a polynomial F(u,x,y) with F(0,x,y)=b_0 nonzero. For every fixed nonzero tau, its zero set is exactly the zero set of the small circuit B(x,y,tau), so it has the required small existential presentation. Apply [HYPERSURFACE_DEGENERATION.md](HYPERSURFACE_DEGENERATION.md). There is no algorithm here for dividing a polynomial circuit by u^k.

The same conclusion is the approximative-input factor consequence recorded in [SOURCE_AUDIT.md](SOURCE_AUDIT.md), using Bürgisser, arXiv:1812.06828v1, Theorem 1.3, Proposition 3.4, Section 3.3, and Lemma 2.3. The explicit degeneration argument above avoids treating a limit coefficient as an exact small multiple.

## 4. Finite decision trees with Boolean regularity queries

Consider an arithmetic/equality decision tree augmented with Boolean regular-value or regularity-only queries as defined in Section 1. Every query circuit is constructed from the current input and registers by charged ordinary arithmetic. Let T bound its path length and total supplied circuit resources, up to a fixed polynomial overhead. Arbitrary complex scalar constants are permitted.

Suppose its accepting set S is contained in H and is Zariski dense in H. Then

```math
\underline L(f)\le\mathop{\mathrm{poly}}(T,n,\deg f+1). \tag{5}
```

For a fixed input dimension the tree has finitely many paths. Its predicates are constructible: every univariate order or regular-value test is a finite Boolean combination of coefficient conditions, whether or not those coefficients are explicitly computed. Since H is irreducible, some accepting path is taken on a dense constructible subset of H. All ordinary registers on that path are rational functions of x,y. Their actual division denominators are nonzero at the generic point of H.

Compare the generic truth of every branch condition on this path with its ambient generic truth. If an ordinary equality changes truth, its nonzero numerator vanishes on H and is already a small multiple. If a regularity query changes truth, Sections 2–3 supply a border-small leading coefficient with H as a factor.

If no branch condition changes generic truth, the same finite path is followed on a nonempty ambient Zariski-open set: intersect the finitely many generic open conditions and division domains. That path accepts, contradicting S being contained in a hypersurface. Thus one of the preceding multiple-exposure cases occurs and proves (5).

This argument includes polynomially many adaptive tests and ordinary branches. It does not require a single query to define the graph by itself. The accepting language need only be a dense sound subset of the graph.

Under the imported permanent border lower bound, no polynomial-resource family of these direct regularity-oracle decision trees can accept a dense sound subset of the permanent graph for all sufficiently large m. In particular a deterministic polynomial-time reduction of permanent graph membership to one short univariate regular-value query is excluded.

## 5. A polynomial regular limit also has a direct jet proof

There is a separate useful statement about function values. Suppose a rational circuit R(x,t)=P(x,t)/Q(x,t) of size s has, for generic x, a finite limit f(x) as t tends to zero, where f is a polynomial of degree at most d. Then

```math
\underline L(f)\le O\bigl((s+n+1)(d+1)^3\bigr)          \tag{6}
```

is a safe coarse bound.

If P is identically zero, the conclusion is immediate. Otherwise write Q=t^a(q_0(x)+t q_1(x)+...) with q_0 nonzero, and similarly write P with its generic t order. Generic finite regularity implies that the numerator order is at least a. Choose a center b with q_0(b) nonzero. After the common scalar t powers are canceled for the mathematical argument, R is holomorphic in (x,t) near (b,0), with R(x,0)=f(x).

For a small nonzero epsilon, compute the degree-d Taylor polynomial in x-b of R(x,epsilon). Homogeneous-component propagation through the polynomial numerator and denominator uses arrays of d+1 circuit outputs and convolution at multiplication gates. The denominator's constant component Q(b,epsilon) is nonzero. Truncated inversion then uses the recurrence

```math
I_0=Q(b,\epsilon)^{-1},\qquad
I_k=-Q(b,\epsilon)^{-1}\sum_{j=1}^{k}Q_j I_{k-j}.
```

All inverses in this computation are scalars depending on epsilon. There are polynomially many gates in s,n,d, without a dense expansion into all x monomials. Holomorphy implies coefficientwise convergence of these degree-d Taylor polynomials to the degree-d Taylor polynomial of f, which is f itself. Translating back from x-b proves (6).

Only generic regularity and equality to the polynomial f are needed. Exceptional input values where the displayed denominator or a leading coefficient vanishes do not affect this border conclusion. This statement is about a rational expression actually constructed from x, not about independently guessed numerical circuit constants.

## 6. Kronecker encoding and why principal-part cancellation is a real cost

Take B=m+1, weights w_j=B^(j-1), and kappa=sum_j w_j. Define

```math
K_m(X,t)=\prod_{i=1}^{m}
 \left(\sum_{j=1}^{m}X_{ij}t^{w_j}\right).              \tag{7}
```

Successive powering and repeated squaring build the t powers with O(m log m) gates, and the row products add O(m^2). Every exponent count in a degree-m monomial is below B, so uniqueness of base-B digits gives

```math
[t^\kappa]K_m(X,t)=\mathop{\mathrm{per}}_m(X).          \tag{8}
```

For m>=2 this is an interior coefficient. The monomial choosing the first column in every row has exponent m<kappa, while choosing the last column in every row has exponent m B^(m-1)>kappa. Their coefficients are nonzero polynomials in X. Therefore t^(-kappa)K_m has genuine negative Laurent terms on generic input.

Suppose a charged polynomial-size rational construction produced a correction C_m(X,t) such that

```math
R_m(X,t)=t^{-\kappa}K_m(X,t)-C_m(X,t)
```

were regular at zero with value per_m(X) on a dense open set. Formula (6) would give polynomial border circuits for the permanent. Hence no such family exists under the standing lower bound. An asserted cancellation must account for its principal-part circuit; naming the cancellation or its coefficient conditions does not supply it.

There is also a simple witness-soundness failure. If an arbitrary correction is existentially supplied without enforcing its principal-part restrictions, then

```math
C_m(X,y,t)=t^{-\kappa}K_m(X,t)-y
```

is already a short correction for every proposed y, and the remainder is the constant y. The intended correction must have only negative Laurent powers, or some other proved normalization that fixes its constant and positive parts. That restriction is not automatic from cancellation of the pole.

## 7. Scope that remains unresolved

The decision-tree theorem uses coefficient circuits and centers computed rationally from the input on a fixed path. It does not substitute arbitrary existential witnesses c(x,y) into those circuits. In a formula with independently quantified c, an initial coefficient may vanish on a witness subvariety of (x,y,c)-space without being divisible by H in input space. Eliminating c can change the component structure. That operation is not proved cheap by this note.

The theorem likewise does not cover an oracle that returns arbitrary algebraic witness roots, multivariate regularity at a point, or a formal instruction to extract an interior Laurent coefficient. The exact APS presentation of a univariate regular value records a useful predicate, but it does not turn (8) into a regular value while the negative terms remain.

Thus the direct regular-value route cannot carry the permanent graph with polynomial resources. A remaining route would require a genuinely quantified incidence or a different operation whose completeness and aggregation cost are proved separately. The HN_C separation itself remains unresolved.
