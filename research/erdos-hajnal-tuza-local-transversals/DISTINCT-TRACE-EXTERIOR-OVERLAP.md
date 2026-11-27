# Distinct minimum traces limit exterior overlap

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This is an unconditional version of one bound previously used
only around a fixed exterior core.

Assume the saturated parameters \(r=5t+3s-2\), \(m=t+s\)
in the near-threshold range. Fix an edge \(A\); let \(E,E'\)
be minimum neighbors of \(A\), with traces \(Y=A\cap E\),
\(Y'=A\cap E'\). Put \(W=E\setminus A\) and \(W'=E'\setminus A\).
If \(|Y\setminus Y'|\ge s\), then
\[
m-|Y\cap Y'|\le |W\cap W'|\le t.
\]
More precisely, for any \(s\)-set \(S\subseteq Y\setminus Y'\)
and any witness \(F\) avoiding \(Y\setminus S\),
\[
\bigl|(F\setminus A)\cap(W'\setminus W)\bigr|
    \le t-|W\cap W'|.
\]
In particular, at the first jump \(s=1\) these hold for
**every pair of distinct minimum traces**, with arbitrary
representatives. At the upper endpoint of the overlap
interval, each separating witness avoids the entire
opposite exterior difference.

## Proof

Choose the indicated \(S\) and witness \(F\). Saturation of
the petal bound for \(A,E\) implies
\[
F\cap A\cap E=S,\qquad
|F\cap A|=|F\cap E|=m .
\]
Set \(W_F=F\setminus A\); then \(|W_F\cap W|=m-s=t\).
The four distinct edges \(A,E,E',F\) have empty
intersection because \(S\cap Y'=\varnothing\). Their
exterior beyond \(A\) has size at least \(2r-2\).
All three exteriors have size \(r-m\), so exact
inclusion-exclusion gives
\[
2r-2\le |W\cup W'\cup W_F|
 =3(r-m)-|W\cap W'|-t-|W_F\cap(W'\setminus W)|.
\]
Since \(3(r-m)-(2r-2)-t=t\), both upper bounds follow.
The lower bound in the first display is the minimum
intersection inequality for \(E,E'\) after subtracting
their common points in \(A\).

Choosing one representative of each distinct trace now gives
a family of \((r-m)\)-point exteriors whose intersections
are uniformly at most \(t\) at the first jump. The
[near-common-core proof](NEAR-COMMON-EXTERIOR-CORE.md)
uses the same four-edge obstruction but is stronger when
most of the exterior overlap is already in a shared core.
