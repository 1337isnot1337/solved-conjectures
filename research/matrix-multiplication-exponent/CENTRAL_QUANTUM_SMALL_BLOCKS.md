# Exact small blocks of the central quantum source

Status: explicit source normal forms and their complete coupled operator equation. No target conversion is asserted.

Use the k=4, eight-dimensional tensor S and ordered subset basis in [CENTRAL_QUANTUM_SOURCE.md](CENTRAL_QUANTUM_SOURCE.md), Section 7. The half-shift operator has permutation
```math
H=(0\ 7)(1\ 6)(3\ 4),
```
fixing 2 and 5. Multiplication by $`e_4^4`$ at $`\kappa=1`$ is H on this selected space. The Frobenius transfer identity permits H to move between any two source legs. Therefore S has no coefficient with different H eigenvalues on different legs. It is a full four-party direct sum
```math
S=S_+\oplus S_-,\qquad \dim V_+=5,\quad\dim V_-=3.
\tag{1}
```

## 1. Exact evaluation data and basis maps

Let $`z`$ satisfy $`z^4+1=0`$, chosen as $`e^{\pi i/4}`$, and put $`a=z-z^3=\sqrt2`$. Number the ten cyclic root-subset representatives in this order:
```math
0123,0124,0125,0126,0134,0135,0136,0145,0146,0246.
\tag{2}
```
The digits give the exponents of z. Let $`v_h`$ be the eight selected Schur evaluation vector at that root subset and let $`w_h`$ include its cyclic orbit size, exactly as in the orbit decomposition. The positive eigenvalue occurs at $`h=0,2,4,6,7,9`$; the negative eigenvalue occurs at $`h=1,3,5,8`$. This follows either from H or from the multiplier eigenvalue $`(\prod_{b\in J}z^b)^4=(-1)^{\sum_{b\in J}b}`$.

Direct substitution in the Schur alternants gives
```math
\begin{aligned}
v_9={}&\frac{-3+2a}{4}v_0-\frac12v_2-\frac12v_4
       +\frac{-3-2a}{4}v_6-\frac12v_7,
\\ v_8={}&(-3+2a)v_1+(-3+2a)v_3-v_5.
\end{aligned}
\tag{3}
```
Every coefficient in these two relations is nonzero. The orbit weights are
```math
\begin{aligned}
w_0&=(3-2a)/32,&w_6&=(3+2a)/32,
\\ w_2&=w_4=w_7=1/16,&w_9&=1/8,
\\ w_1&=w_3=(-2+a)/16,&w_5&=w_8=(-2-a)/16.
\end{aligned}
\tag{4}
```

The ten vectors span the full eight-dimensional space, since S is concise. Their eigenvalue groups therefore span the five- and three-dimensional summands in (1). Relation (3), with all coefficients nonzero, shows that the first five positive vectors and the first three negative vectors are bases of the respective summands.

For either line of (3), write its right side as $`\sum_i c_i v_{h_i}`$. Use the basis $`b_i=c_i v_{h_i}`$, and map $`b_i`$ to $`e_i`$ on each of the four local factors. The final vector in the line then maps to $`e=\sum_i e_i`$. The resulting exact normal form is
```math
\sum_i\alpha_i e_i^{\otimes4}+\beta e^{\otimes4},
\qquad \alpha_i=w_{h_i}/c_i^4,
\tag{5}
```
with $`\beta`$ equal to the final orbit weight. Specifically,
```math
\begin{aligned}
S_+&\simeq
 (792+560a)e_1^{\otimes4}+e_2^{\otimes4}+e_3^{\otimes4}
 +(792-560a)e_4^{\otimes4}+e_5^{\otimes4}
 +\frac18(e_1+e_2+e_3+e_4+e_5)^{\otimes4},
\\ S_-&\simeq
 \alpha(e_1^{\otimes4}+e_2^{\otimes4})
 +\beta e_3^{\otimes4}
 +\beta(e_1+e_2+e_3)^{\otimes4},
\\ \alpha&=-\frac{338+239a}{16},\qquad
\beta=-\frac{2+a}{16}.
\end{aligned}
\tag{6}
```

The six and four summands give ordinary-rank bounds six and four. Their AB|CD flattenings are separate blocks of the rank-ten flattening of S. Hence both bounds are attained, for ordinary rank and border rank. This uses matrix-rank additivity for a block diagonal flattening, not a general tensor-rank direct-sum conjecture.

## 2. The exact coupled operator equation

Consider one block of local dimension d in the normal form (5). Tensor it with a C--D wire of size Q and two flag wires of input size N. Let
```math
A_h^a:\mathbb C^N\to\mathbb C^M,\qquad
B_h^b:\mathbb C^M\to\mathbb C^N,
```
where B is written as the right matrix factor, so its physical local tensor map is the full transpose. Let $`\Gamma_{\gamma,hc}`$ be the C map and let $`X_{h,c}^{ij}\in\mathop{\mathrm{Mat}}_N`$ be the middle D coefficient for output label $`(i,j)`$.

The complete coefficient at output $`(a,b,\gamma;i,j)`$ is
```math
\begin{split}
&\sum_{h=1}^d\sum_{c=1}^Q
 \alpha_h\Gamma_{\gamma,hc}
 A_h^aX_{h,c}^{ij}B_h^b
\\ &\quad+\beta\sum_{c=1}^Q
 \left(\sum_{h=1}^d\Gamma_{\gamma,hc}\right)
 \left(\sum_{\lambda=1}^d A_\lambda^a\right)
 \left(\sum_{\rho=1}^d X_{\rho,c}^{ij}\right)
 \left(\sum_{\mu=1}^d B_\mu^b\right).
\end{split}
\tag{7}
```
The matrix order in the second line is A, then D, then B. It follows directly from the coefficient $`\beta`$ on every quadruple of the dense source term; it does not commute any operators. The two full summands of (1) can have independent maps because their block label is present at every source party.

For a C-compressed target, (7) must equal
```math
\delta_{ai}\delta_{bj}L_{\gamma,ij}I_M
\tag{8}
```
for every output label. In particular, the dense term does not provide independent additional maps: its A map is $`\sum A_h`$, its B map is $`\sum B_h`$, and likewise at C and D. Replacing those sums by arbitrary independently controlled maps changes the specified source.

Equations (6)--(8) give small explicit source systems for a complete coefficient test. They do not establish a solution of that system or an asymptotic family.
