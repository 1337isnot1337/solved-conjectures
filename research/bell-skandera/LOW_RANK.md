# Bell–Skandera: the lower third of the Kruskal–Katona inequalities

**Status:** Partial result. This does not settle the original Bell–Skandera question. The proof uses the discrete Kruskal–Katona approximation in Shing–Xie, Theorem 3.1 (preprint). An elementary link argument below also shows that Mu–Welker's proposed coefficient inequality is equivalent, rank by rank, to the corresponding Kruskal–Katona inequality.

## Statement

Let F(t) = sum(c_i t^i) be a degree-d real-rooted polynomial with nonnegative integer coefficients and c_0=1. Let K_p(m) be the Kruskal–Katona upper bound on the number of (p+1)-element faces when there are m p-element faces.

1. For p=1, c_2 <= K_1(c_1), whenever d>=2.
2. For 2<=p<d, put
   q = [c_(p+1)/binom(d,p+1)] / [c_p/binom(d,p)].
   If q>=7/4 then c_(p+1)<=K_p(c_p), without a hypothesis on c_1/d.
3. If c_1/d>=7/4, then c_(p+1)<=K_p(c_p) for every 1<=p<=floor(d/3). In particular, this conclusion holds for every irreducible F in Z[t] of degree d>=5 meeting the hypotheses.

The third claim is about the original coefficients, not their first differences. It gives the Kruskal–Katona inequalities for the f-vector truncated after cardinality floor(d/3)+1.

## Proof

Write F(t)=product_i (1+lambda_i t), with lambda_i>0, and a_i=c_i/binom(d,i). Newton's inequalities imply that the ratios a_(i+1)/a_i are nonincreasing. The AM–GM inequality gives c_1>=d because product(lambda_i)=c_d>=1. Also sum(lambda_i^2)>=c_1^2/d>=c_1. Thus c_2<=(c_1^2-c_1)/2, as required in rank one.

Fix a rank 2<=p<d, and set D=d-p, R=7/4, and L=a_p/q^p. By the ratio monotonicity,
- a_p>=q^p, since a_0=1;
- a_p>=a_1 q^(p-1);
- a_d<=a_p q^(d-p), and a_d=c_d>=1.

Therefore L>=max(1,a_1/q,q^(-d)).

We use the discrete approximation of [Shing–Xie, Theorem 3.1](https://hexagonmath.org/pdf/2611.00919v1): if x>=p satisfies m=binom(x,p) for a positive integer m, then K_p(m)>=(x-p-1)m/(p+1). Here the binomial is the real falling-factorial polynomial. Put m=c_p and use c_(p+1)/m=qD/(p+1). It is enough to show x>=p+1+qD, that is,

    binom(p+1+qD,p) <= c_p = L q^p binom(d,p).

After cancelling the positive factors, this asks for U(q)<=L, where

    U(q) = product_{j=1}^p (D + (j+1)/q)/(D+j).

If q>=R, all factors with j>=3 are <=1. The first two factors have product <=1: at q=R this is equivalent, after multiplying positively, to

    (qD+R)(qD+2R) >= (qD+2)(qD+3),

and 3R=21/4>5 and 2R^2=49/8>6; the original factors decrease as q increases. Thus U(q)<=1<=L. This proves claim 2 and treats these q in claim 3.

Now assume a_1>=R and 2<=p<=d/3 (so d>=6). Set q_0=R^(-1/(d-1)). For q in [q_0,R], log(q U(q)) is convex as a function of log q: it is linear plus a sum of convex functions log(D+(j+1)exp(-log q)), minus a constant. At q=R, R U(R)<=R. At q=q_0 we use q_0<=1 and

    U(1) = (d+1)/(d-p+1) <= 3/2,

    U(q_0)/U(1)
      = product_{j=1}^p (1+(q_0^(-1)-1)(j+1)/(D+j+1))
      <= exp((q_0^(-1)-1) p(p+1)/d)
      <= exp((R-1) p(p+1)/(d(d-1)))
      <= exp(3/20).

For the first inequality use log(1+v)<=v and (j+1)/(D+j+1)<=(p+1)/d. The second follows because R^s<=1+s(R-1) for 0<=s<=1. For the third, use p<=d/3 and d>=6:

    (R-1) p(p+1)/(d(d-1))
       <= (d+3)/(12(d-1)) <= 3/20.

Finally exp(3/20)<7/6 because log(7/6)>=1/6 - (1/6)^2/2=11/72>3/20. It follows that q_0 U(q_0)<=U(q_0)<(3/2)(7/6)=R. Convexity therefore gives U(q)<=R/q<=L throughout [q_0,R].

For 0<q<q_0, q^d U(q) is increasing, since it equals

    q^(d-p) product_{j=1}^p (qD+j+1)/(D+j).

At q_0 the preceding estimate gives q_0^d U(q_0)<=R q_0^(d-1)=1. Hence U(q)<=q^(-d)<=L for all smaller q. This proves claim 3 for a_1>=R.

If F is irreducible of degree d>=5, the polynomial x^d F(-1/x) is the monic minimal polynomial of a totally positive algebraic integer; its conjugates are lambda_i. By [Smyth, *Totally positive algebraic integers of small trace* (1984), theorem on p. 2](https://archive.numdam.org/item/AIF_1984__34_3_1_0/), c_1/d>1.7719: all five stated exceptions have degree at most four. In particular c_1/d>=7/4.

## The recursive inequality is equivalent to the corresponding KK inequality

Use the notation F=G+tH of [Mu–Welker, §3.2](https://arxiv.org/html/2503.24076v2). Given m size-p faces and z size-(p+1) faces, let C_p(m) and C_(p+1)(z) be the initial families of the given lengths in colexicographic order on subsets of the positive integers. Then g_p counts the size-p sets in C_p(m) avoiding vertex 1; h_p counts the size-p sets S avoiding 1 for which S union {1} lies in C_(p+1)(z).

To see the coefficient interpretations from the canonical binomial formula, break a colex initial family into its usual blocks of sizes binom(a_i,i): after fixing its tail at each step, the variable part is an arbitrary i-set in [a_i], and the fixed tail avoids 1. Respectively binom(a_i-1,i) and binom(a_i-1,i-1) choices avoid and contain vertex 1. Both families of size-p sets avoiding vertex 1 are initial in the induced colex order. Hence h_p<=g_p exactly if every set in the link at 1 of C_(p+1)(z) occurs in C_p(m).

Every p-set B in the lower shadow of C_(p+1)(z) is at or before some p-set in that link. Indeed, choose A in C_(p+1)(z) containing B. If 1 is absent from B, replacing the element of A outside B by 1 does not increase A in colex, so B itself is in the link. If 1 is in B, then A minus {1} is in the link and lies after B, since the unique added element is greater than 1. Thus inclusion of the link in C_p(m) is equivalent to inclusion of the whole shadow. By Kruskal–Katona this is exactly z<=K_p(m). The equivalence does not require real-rootedness.

## Priority and limitations

- [Bell–Skandera, *Multicomplexes and polynomials with real zeros* (2007)](https://www.lehigh.edu/~mas906/papers/logc.pdf), Question 1.1, asks for the full f-vector, not just a multicomplex. Their general theorem gives the multicomplex conclusion.
- [Mu–Welker, *On a question about real-rooted polynomials and f-polynomials of simplicial complexes*](https://arxiv.org/html/2503.24076v2) lists the original question as open, proves monotonicity of the real binomial top indices, and gives the narrower sufficient rounded separation criterion. It proves the forward implication from the recursive coefficient condition. The link argument above supplies the converse as well.
- [Liu–Wang–Zhang, *Counterexamples to the Mu–Welker recursive decomposition in every degree*](https://arxiv.org/html/2609.23694v2) refutes real-rootedness of the recursive pieces, not their coefficient comparison or the original question.
- [Shing–Xie, *First differences of real-rooted integer polynomials and simplicial complexes*](https://hexagonmath.org/2611.00919v1), posted Nov. 23, 2026, handles initial first differences, not the original coefficient vector. The lower-third result explicitly uses their discrete approximation. No earlier statement of this lower-third conclusion was found in the searched primary sources.
- Products of f-polynomials are f-polynomials by simplicial join, so reduction to irreducibles is valid for the full question. This reduction alone does not make the bounded fraction of ranks into a statement about the same fraction of ranks in an arbitrary product.
- [Repository PR #342](https://github.com/1337isnot1337/solved-conjectures/pull/342) already records a different result with all ranks in irreducible degrees at least 100000. This supplement supplies the stated lower-rank range for all irreducible degrees from five onward and records the rankwise colex equivalence. Treat the shared high-degree range as overlap, not a newly resolved range.
