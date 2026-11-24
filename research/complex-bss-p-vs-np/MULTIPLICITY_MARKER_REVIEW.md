# Independent review of the uniquely marked multiplicity class

Reviewed file: [MULTIPLICITY_MARKER.md](MULTIPLICITY_MARKER.md).

Status: the charged construction, uniqueness proof, differential identity, and scope restrictions pass this independent written audit. The marked-factor jet bound remains unproved.

## 1. Encoding every divisorial multiplicity without carries

With $`B=2^s+1`$, all multiplicities in an input $`F_i`$ or $`G`$ are at most $`2^s=B-1`$. Thus
```math
v_p(W)=B^r v_p(G)+\sum_{i=1}^r B^{i-1}v_p(F_i)
```
is an actual base-$`B`$ digit expansion. No cancellation of leading digits and no carry can occur.

The recurrence $`W_r=G`$, $`W_{i-1}=W_i^B F_i`$ gives exactly the stated exponent pattern. Each $`B`$-th power costs $`s`$ squarings and one multiplication by its original argument. The total circuit size is $`O(s+rs+r)`$, and the degree bound $`B^{r+1}-1`$ follows by summing the geometric progression.

For $`R`$, the $`G`$-digit is zero and every $`F_i`$-digit is positive. If a factor $`p`$ has the same numerical multiplicity, uniqueness of base-$`B`$ digits makes $`p`$ divide every $`F_i`$ and not divide $`G`$. The saturated support hypothesis then forces $`p`$ to be associated to $`R`$. The marker satisfies $`1\le k_R<B^r`$, with $`O(rs)`$ bits.

On a generic coefficient line, pairwise factor intersections and tangencies are avoided. Each simple root of an underlying irreducible factor inherits exactly its divisorial multiplicity in $`W`$. Therefore the marker selects precisely the roots from $`R`$ on that line. This statement uses genericity; it is not asserted at collisions.

## 2. The differential expression

For $`W=p^m h`$, $`p\nmid h`$, and a direction with $`\partial p\not\equiv0\pmod p`$, the leading terms are
```math
\partial W
\equiv m p^{m-1}h\,\partial p\pmod{p^m},
```
and
```math
W\partial^2W
\equiv m(m-1)p^{2m-2}h^2(\partial p)^2
\pmod{p^{2m-1}}.
```
Consequently
```math
(k-1)(\partial W)^2-kW\partial^2W
\equiv m(k-m)p^{2m-2}h^2(\partial p)^2
\pmod{p^{2m-1}}.
```
The sign $`k-m`$ is correct. At $`m\ne k`$ this has exact order $`2m-2`$, and at $`m=k`$ it has at least order $`2m-1`$. The calculation also covers $`m=1`$.

Dividing by $`(\partial W)^2`$ gives
```math
\frac{E_k}{(\partial W)^2}
=\frac{k}{\mu_W}-1,
```
whose regular value along the factor is $`k/m-1`$. The intended selection therefore requires both $`W=0`$ and the regular value $`\mu_W=k_R`$. Equality of the multiplicity map alone can hold away from $`W=0`$.

The raw equations $`W=E_k=0`$ retain every unwanted factor of multiplicity at least two. Thus the draft correctly refuses to treat this cleared system as a sound selector.

## 3. What has and has not been obtained

The full saturated path now supplies one short polynomial and one short integer marker for the target component. This is stronger than merely knowing that the component divides one small polynomial.

It does not supply the marked factor's circuit, a regular-value certificate at a vanishing denominator, or its low-order aggregate logarithmic jet. The conditional marked-factor assertion depends on circuit size, variable count, jet order, and the binary length of the multiplicity; no degree-independent theorem establishing it has been imported. Its stated application to the resultant is consequently a sufficient missing step, not a completed separation proof.
