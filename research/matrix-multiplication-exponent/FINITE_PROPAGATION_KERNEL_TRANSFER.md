# Finite-propagation outside maps and arbitrary middle kernels

Research status: the transfer and linear compatibility criterion below
are proved. They enlarge the permitted middle-kernel search space.
They do not establish existence of a kernel for the desired trade.

## 1. Entrywise formulation

Let the flag lattice be Z^d. Use finitely many source families z,
unit labels h, CD-wire labels c, and finite target labels a,b,gamma,
delta. Let Gamma^z_(gamma,hc) be fixed complex C maps. The outside
maps are complex kernels

```math
A^a_{z,h}(u,x),\qquad B^b_{z,h}(y,v).
```

Assume there is a fixed R such that A(u,x)=0 whenever
||u-x||_infinity>R and B(y,v)=0 whenever ||y-v||_infinity>R.
Allow arbitrary complex middle kernels D^delta_(z,hc)(x,y).
No support, boundedness, convergence, or operator-domain hypothesis
is imposed on D.

The required identity is the entrywise system

```math
\sum_{z,h,c}\Gamma^z_{\gamma,hc}
 \sum_{x,y\in\mathbb Z^d}
 A^a_{z,h}(u,x)D^\delta_{z,hc}(x,y)B^b_{z,h}(y,v)
 =T_{ab\gamma\delta}\,\delta_{uv}.                      \tag{1}
```

Each displayed inner sum is finite: x lies within R of u and y
within R of v. Thus (1) is defined as a system of scalar equations,
even if D does not act on finitely supported or square-summable
vectors as an ordinary operator.

## 2. Exact finite flag transfer

Put F_n=[-n,n]^d intersect Z^d and
I_n=[-n+R,n-R]^d intersect Z^d. Let N_n=|F_n| and M_n=|I_n|.
Use the following finite local maps:

```math
A_{\rm fin}=A|_{I_n\times F_n},\qquad
D_{\rm fin}=D|_{F_n\times F_n},\qquad
B_{\rm right,fin}=B|_{F_n\times I_n}.                   \tag{2}
```

The physical B map is the transpose of the last printed kernel;
it is not an auxiliary-index-only transpose. The source uses AD
and BD wires of size N_n, and the target AB flag has size M_n.
The C maps remain Gamma.

For u,v in I_n every x with A(u,x)!=0 and every y with B(y,v)!=0
already lies in F_n. Hence the finite contraction of (2) is
identical to the complete finite sum in (1). It is exactly
T_(ab gamma delta) times the identity matrix on the M_n flag.
Therefore an exact solution of (1) gives an exact finite source
restriction for every n>R.

Moreover

```math
\frac{N_n}{M_n}
 =\left(\frac{2n+1}{2n-2R+1}\right)^d\longrightarrow1.  \tag{3}
```

There is no interpolation loss and no accumulated approximation
error. For a sequence of finite auxiliary parameters, n may be
chosen as large as needed after those parameters and R are fixed.
The middle kernel may have nonzero entries arbitrarily far from
the diagonal; this does not alter the argument.

## 3. Formal and bilateral difference completions

Finite-shift rational outside matrices give kernels satisfying
Section 1 after evaluating their coefficient functions on a
generic lattice orbit avoiding poles. A middle coefficient may
then be represented by a one-sided formal Laurent series, by a
bilateral coefficient array, or directly by its matrix entries.
Only the finitely many coefficients entering (1) at a given u,v
are relevant. The proof uses no formal inverse of a finite shift
matrix and no convergence of a Green-kernel series.

This can bypass an obstruction that specifically uses a lowest
valuation of every middle operator. It does not bypass the
finite-support scalarization bounds on the outside maps.

Indeed fix one target flag value u=v. If the outside offsets in
column (z,h) range over S_A(z,h),S_B(z,h), then each pair of
offsets leaves one A vector, one B vector, and the entire remaining
c-sum as a single CD vector. Therefore even arbitrary kernels obey

```math
\mathop{\mathrm{rank}}_{AB\mid CD}T
 \le\sum_{z,h}|S_A(z,h)|\,|S_B(z,h)|.                   \tag{4}
```

In particular one H-dependent shift at each outside party still
costs only one rank-one AB summand per H. Multiple independent
site-subset shifts in each source column are a genuine distinction.

## 4. Exact algebraic compatibility criterion

Fix all outside kernels and a target D label delta. Treat the
entries D^delta_(z,hc)(x,y) as independent scalar unknowns. Every
equation (1) is a finite linear equation in these unknowns.

There is a solution to all of them if and only if every finite
linear dependence among their coefficient rows annihilates the
corresponding right sides. Equivalently, every finite subsystem
must be consistent.

Here is a direct proof, not an analytic compactness argument.
Let V be the free complex vector space on all unknown labels.
Each equation gives a vector r in V and a desired value b. The
rule r maps to b defines a linear functional on the span of the
equation rows precisely when every finite relation among them
also holds among the b's. Extend that functional to V by extending
a basis. Its values on the free basis are the required kernel
entries. Conversely any solution is such a functional and must
annihilate every finite row relation.

Thus a positive construction could prove compatibility using an
actual exchange identity and then use Section 2. No compatibility
claim for the proposed Lax family follows merely from this criterion.
