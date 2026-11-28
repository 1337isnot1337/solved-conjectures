# Erdős problem 352

Does some absolute area threshold force three points spanning a triangle of area exactly one in every measurable planar set above the threshold? This question remains open in these notes. [Problem and references](https://www.erdosproblems.com/352) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/1117).

- [General upper bound](logarithmic-bound.md). Inside a square of side $R$, the area of any avoiding set is at most $C(1+\log(2+R))^2$. The [Fourier-slice identity](radon-bound.md) also gives a direct linear estimate.
- [Concentration of lattice examples](long-pairs.md). Koizumi's lattice conjecture holds when a fixed fraction of pairs have separation comparable to the diameter allowance $N$.
- [Directional sections](projections.md) and [connected components](components.md). These give geometric hypotheses under which an absolute bound follows, and estimates for individual components.
- [Digit arrays](digit-arrays.md). Unions of equal disks based on rectangular digit sets obey an absolute bound at arbitrary depth. A [finite check](check_digit_arrays.py) verifies the determinant witnesses on small complete arrays.
- [Right triangles and side directions](direction-obstruction.md). Bounded open sets of arbitrarily large area can force all sides of every area-one triangle into an arbitrarily narrow cone. These examples leave the original unrestricted triangle question open.
