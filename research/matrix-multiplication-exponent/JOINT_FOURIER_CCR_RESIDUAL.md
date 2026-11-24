# Full residual of a joint Fourier and commutator ansatz

Research status: the constant term is exactly the desired geodesic
trade coefficient. The full operator has nonzero residual terms, so
this is not a construction of the trade. Taking the constant term of a
Weyl operator is not an authorized local tensor operation.

Use the source, target, coefficient convention, and local-map requirements of
[WEYL_DIVISION_TRADE_TRANSFER.md](WEYL_DIVISION_TRADE_TRANSFER.md), Section 1.
Work modulo an odd integer $`q\ge3`$, and let zeta be a primitive q-th root of
unity. In the Weyl algebra with q^2 coordinate generators x_(uv) and
derivatives partial_(uv), choose one family

```math
c_{kl,hc}=\mathbf 1_{c-h=k+l}\,\zeta^{-h(k-l)},
\qquad a_h^a=\partial_{a,h},\qquad b_h^b=x_{h,b}.
```

For each c,i,j write g=c-i-j and put

```math
x_c^{ij}=\frac1q\zeta^{g(i-j)}
             x_{i,g}\partial_{g,j}.
```

The D entry depends on c,i,j and does not depend on h. The C map is
invertible: for each value of c-h, its h dependence is a Fourier
matrix, while the map (k,l)->(k+l,k-l) is invertible because q is odd.

For fixed a,b,i,j,k,l define

```math
\Delta=k+l-i-j,\qquad \eta=i-j-k+l.
```

The complete coefficient produced by these operators is

```math
\frac{\zeta^{\Delta(i-j)}}q
 \sum_{h\in\mathbb Z/q}
 \zeta^{h\eta}\,
 \partial_{a,h}x_{i,h+\Delta}
 \partial_{h+\Delta,j}x_{h,b}.                 \tag{1}
```

Normal ordering one summand, with g=h+Delta, gives

```math
\begin{aligned}
\partial_{a,h}x_{i,g}\partial_{g,j}x_{h,b}
={}&x_{i,g}x_{h,b}\partial_{a,h}\partial_{g,j}\\
&+\delta_{g,h}\delta_{j,b}\,x_{i,g}\partial_{a,h}\\
&+\delta_{a,h}\delta_{h,b}\,x_{i,g}\partial_{g,j}\\
&+\delta_{a,i}\delta_{h,g}\,x_{h,b}\partial_{g,j}\\
&+\delta_{a,i}\delta_{h,g}\delta_{g,h}\delta_{j,b}.
\end{aligned}                                                   \tag{2}
```

This follows by moving the first derivative past x_(i,g), then moving
both remaining derivatives past x_(h,b), using only the defining CCR.
There is exactly one scalar term. Summing it in (1) gives

```math
\delta_{a,i}\delta_{b,j}\mathbf 1_{\Delta=0}
 \frac1q\sum_h\zeta^{h\eta}
 =\delta_{a,i}\delta_{b,j}\delta_{k,i}\delta_{l,j}.
```

The last equality uses Fourier orthogonality and the invertibility of
2 modulo q. Thus this ansatz performs the two C/D label comparisons
jointly at the level of scalar contractions; it does not assume two
independent low-rank selector factorizations.

## Exact residual

All the degree-four and degree-two terms in (2) remain. For q>=3,
choose i=k=0, j=l=1, and a=b=2. The desired output coefficient is zero.
Equation (1) contains, with coefficient 1/q, the normally ordered
monomial

```math
x_{0,0}x_{0,2}\partial_{2,0}\partial_{0,1}.
```

It comes from h=0 and cannot be canceled by another h term, since its
coordinate and derivative indices determine h. It cannot be canceled
by the degree-two terms either. By PBW independence the residual is
nonzero.

A successful use of this ansatz therefore needs additional legal
families which cancel the entire displayed residual, or a proved local
degeneration that removes it while preserving almost all common flag
space. The constant-term map itself supplies neither operation. The
one-family ansatz is also subject to the existing common-C obstruction;
additional families must avoid the hypotheses of that obstruction if
their count is to be subpolynomial in q.


## Scope of verification

The operator-comparison worker derived the candidate and its normal
ordering. Root independently checked all five terms of (2), Fourier
orthogonality, and the displayed nonzero coefficient. The C map has
one Fourier block for each sum index, so it is invertible for odd q.
The D map has no hidden dependence on h. The failure occurs in the
full operator algebra before any finite flag cutoff, so a cutoff
boundary estimate cannot remove this coefficient by itself.

The example is retained as a failed input to the transfer theorem.
It proves neither a tensor conversion nor a general impossibility.
Taking the scalar term of a product of noncommuting local operators
cannot be inserted as an extra party map.
