# The M32 base map: reconstruction boundary and tangent obstruction

Research audit, 23 November 2026 (America/Chicago). Source: Zhi-Wei Sun,
*Tensor Degenerations for Matrix Multiplication*,
[arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1), Sections 4–8
and Appendix A. Updated 24 November 2026 UTC. This note does not infer
that the abstract M32 border-rank claim is false. It records the missing
map data and the stronger incompatibility now proved for the printed
complete local ledger.

The [tangent-globalization audit](SUN_TANGENT_GLOBALIZATION_OBSTRUCTION.md)
shows that no fixed degree-zero side-local maps can globalize that
complete ledger to M32. Its six-product replacement retains every raw
dense record and all three endpoints. Using one replacement in each
outer row would give border rank at most 2032, contradicting the known
lower bound 2042. The source-budget estimates are independently
certified. A repair must change a tested premise, such as the complete
leading record set or the absence of later Laurent poles.

## The base is logically independent of the failed quotient

Theorem 8.1(a) claims a degeneration from

```math
D_{16}\otimes
 (14C_3\oplus6C_2\oplus7W\oplus5D_4)
```

to M32, with border-rank cost 2048. If valid, this would imply
$\omega_{\mathbb C}\le11/5$. This does not require either the M64
quotient or the subsequent dyadic propagation. The present audit therefore
does not reject the base solely because those later constructions fail.

## What can be reconstructed from numerical entries

The following portions are specified sufficiently to perform finite exact
checks:

- the defect equation (4.1), its zero fibre, and the cycle relabelling
  (4.3)–(4.6);
- the packet masks, chart matrices, frequencies, and scalar Walsh identity
  (5.1), after the previously recorded normalization repair;
- the local tangent and active output tensors in Sections 6–7, including
  the rank-four degeneration (7.3);
- the exceptional endpoint matrices in Appendix C;
- the fixed five-empty packet map (6.6), and the corrected crossed map
  when it is used;
- the row matrices U_X, U_Y, U_Z and each of the separate scalar/matrix
  identities (8.2)–(8.6).

These checks establish local tensors and scalar identities. They do not
yet specify one composable triple of maps from the original source to
the final three 1024-dimensional matrix-entry spaces.

## The entries that are still needed

For each original source summand, each of its three basis vectors, and
each outer diagonal label h, an executable certificate must determine
the three Laurent-polynomial coefficient arrays

```math
\begin{aligned}
\Psi_X(e_{h,p,i})&=\sum_{u,v\in I_{32}}
 a_{h,p,i;u,v}(t)x_{uv},\\
\Psi_Y(e_{h,p,j})&=\sum_{v,w\in I_{32}}
 b_{h,p,j;v,w}(t)y_{vw},\\
\Psi_Z(e_{h,p,k})&=\sum_{w,u\in I_{32}}
 c_{h,p,k;w,u}(t)z_{wu}.
\end{aligned}
```

Here p denotes the declared original module or packet occurrence; for
compressed modules its range must be replaced by the corresponding D4
basis. Factored formulas suffice; listing all entries is unnecessary.

Section 8 says to take the direct sum of a dense-character map and a
completion-orbit map, and compose it with the earlier Laurent maps.
It does not give their action on the abstract dense coordinates X0,
X1, X2, X3, Y0, Y1, Y2, Z0, Z1 or on their source-resolved versions.
In particular the following information is not determined by the displayed
identities:

1. The map from each one-leg output label to the chart and absolute-character
   coordinates used in the dense coefficient formula. Equation (5.2)
   supplies two chart representatives of a *joint three-leg defect*; it
   does not specify the three local coefficient arrays.
2. The source-record implementation of the factor involving
   $\langle\beta,q+r\rangle$ in (8.3). Its scalar equality is correct.
   To use it in a local map one must specify which original factor carries
   the required variables before the closure. The equation by itself does
   not do that.
3. The complete coefficient arrays after the row selection (8.2), including
   their action on the source-resolved endpoint coordinates. A nonsingular
   matrix M_I and a Walsh delta identity do not specify these arrays.

Appendix A.11 gives a composition of named maps for the M1024 construction.
It calls for the old four-bit row/Weyl maps, but does not add the missing
old-map entries. Its formula (A.11's displayed assembly, numbered (1.9) in
the current HTML/PDF conversion) still uses the unspecified maps as symbols.

## Why the terminal relabelling is insufficient

Equation (4.6) is a valid formula for matrix multiplication, but it already
contains the cross-leg shifts Y_(h+q,v) and Z_(h+q+r,w). A relabelling of
that formula does not produce those shifts from the original diagonal row
source.

For an exact comparison, the collapsed fixed zero-fibre tensor is
isomorphic to the group-addition tensor of H4 tensored with M2. Over the
complex numbers its border rank is at most 16 times 7 = 112. Tensoring
with a diagonal tensor of rank 16 therefore has border rank at most 1792.
It cannot degenerate to M32, whose border rank is at least 2042 by
Landsberg–Michałek, arXiv:1608.07486v1, Theorem 1.1. This explains why
the source-resolved phase implementation is mathematically necessary.
Sun explicitly says not to pass through that collapsed tensor. The bound
therefore does not refute a richer raw-record construction.

The printed complete tangent ledger and its fixed degree-zero M32
globalization are now proved incompatible. The missing maps cannot be
supplied while keeping both premises. An alternative richer source map
remains unverified; the abstract border-rank-2048 claim is not refuted by
this argument. No partial weighted family can be extracted from the
claimed cycle ledger alone, because that would assume the same absent
composition and its absence of off-cycle terms.
