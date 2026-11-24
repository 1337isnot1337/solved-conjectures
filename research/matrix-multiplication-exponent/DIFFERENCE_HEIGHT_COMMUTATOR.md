# Height commutator for the full site-shift Lax matrix

Research status: the identity below is a direct consequence of the
proved Lax factorization. It realizes a large gauged Cartan projector
by actual flag operators. It does not establish a copied-label trade.

Use the full height coordinates q_c and translations
T_J f(q)=f(q+s*hbar*1_J)T_J. Let

```math
H_c=\mathop{\mathrm{diag}}_J 1_{c\in J},\qquad
\mathcal L_k(z)=G_k(z,q)\mathop{\mathrm{diag}}_J(T_J)
                                      G_k(z+k\hbar,q)^{-1}.
```

Then

```math
\mathcal L_k(z)q_c\mathcal L_k(z)^{-1}-q_c I
 =s\hbar\,G_k(z,q)H_cG_k(z,q)^{-1}.                    \tag{1}
```

Indeed multiplication by q_c commutes with both rational G matrices.
Conjugating it by diag(T_J) adds s*hbar*H_c. This proves (1) in
the difference algebra, with the product order exactly as printed.
The projector on the right has ordinary auxiliary rank
binom(s-1,k-1)=p*k/s.

For centered height qbar_c=q_c-(sum_l q_l)/s, the identity is

```math
\mathcal L_k(z)\bar q_c\mathcal L_k(z)^{-1}-\bar q_c I
 =s\hbar\,G_k(z,q)H_cG_k(z,q)^{-1}-k\hbar I.            \tag{2}
```

The scalar correction is required because a k-subset translation
changes the mean coordinate by k*hbar. In particular the reduced
one-dimensional s=2,k=1 flag gives 2*hbar*P_c-hbar*I.

The semidynamical Cartan commutator has shared-input Q1/Q2 support,
so (1) is a possible way to represent its bulk defect by middle
height insertions. A source identity with a nonconstant C coefficient
inside the shared-h sum still needs a separate proof. Taking matrix
elements of (1) only proves a sum over h without that insertion.
