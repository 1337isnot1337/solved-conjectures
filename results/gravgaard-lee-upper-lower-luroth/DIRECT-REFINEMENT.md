# Gravgaard–Lee’s mixed upper/lower Lüroth conjecture: a direct interval refinement

Let $L_{\le k}$ and $L_{\ge k}$ denote the sets of actual infinite Lüroth expansions with all digits at most and at least $k$, respectively. For every $k\ge 2$, put $a=(k-1)/(k(k-1)-1)$. Then
$$
L_{\le k}+L_{\ge k}=(a,1+a].
$$
In particular the sum represents every residue modulo one, as conjectured in [Gravgaard–Lee, Conjecture 2.6](https://arxiv.org/html/2506.12513v2#S2.SS1). Their theorem has the different upper bound $k+2$. This proof uses only explicit gap lengths and an endpoint repair, not a thickness theorem.

For $k=2$ the two sets are $\{1\}$ and $(0,1]$, respectively, so assume $k\ge3$. Put $r_d=1/(d(d-1))$ and $f_d(t)=1/d+r_dt$. The constant digit $k$ has value $a$; $L_{\le k}$ has minimum $a$ and maximum 1, while $L_{\ge k}$ has infimum 0 (not attained) and maximum $a$. Indeed $f_d$ decreases with $d$ on $[0,1]$, and all $f_d$ contract. The hull therefore gives the required upper inclusion.

## 1. Linked interval states

At a stage in the construction, the first summand has a chosen prefix of scale $P>0$; its next digit is constrained to $p,\ldots ,k$, where $2\le p<k$. The second summand has a chosen prefix of scale $Q>0$; its next digit is constrained to $e,e+1,\ldots$, where $e\ge k$. Subsequent digits retain the original bounds. Write $z$ for the target minus the current prefix translations and minus the first summand's local minimum $P a$. The hull lengths of the two remaining sets and their largest first-digit gaps are
$$
W_A=P(1/(p-1)-a),\quad
W_B=Q b_e,\quad b_e=1/e+a r_e,\quad
g=P a r_p,\quad h=Q(1-a)r_{e+1}.
$$
The expressions for the gaps follow from
$f_d(a)-f_{d+1}(1)=a r_d$
on the first side and
$1/d-f_{d+1}(a)=(1-a)r_{d+1}$
on the second. The gaps decrease as the digit increases. All hulls are measured relative to their own infima. The first side attains both extremes; the second does not attain its infimum.

A state is linked if $g\le W_B$ and $h\le W_A$. We maintain $0<z\le W_A+W_B$. Initially take $P=Q=1,p=2,e=k$; then $W_A=1-a,W_B=a$, both link inequalities hold, and $z$ ranges over $(0,1]$.

A single remaining possible first-side digit $k$ is appended immediately, so the new scale is $Pr_k$ and the next digit range resets to $2,\ldots ,k$. This does not change the represented first-side minimum, because $f_k(a)=a$, or its hull length. The new largest gap is $Pr_k a/2$.

### Refine the second side when $g\le V=Qa r_e$

The right-hand branch with digit $e$ has relative lower endpoint $Q/e$ and length $V$. The left group of digits at least $e+1$ has length $Qb_{e+1}$, and the gap between them is $h$.
If $z>Q/e$, append $e$, subtract $Q/e$ from $z$, replace $Q$ by $Qr_e$, and reset the next digit range to at least $k$. The link $g\le V$ holds by assumption, and the largest new second-side gap is at most $h$, since $r_e r_{k+1}\le r_{e+1}$. If $z\le Q/e$, retain the left group instead. This is allowed since $Q/e=Qb_{e+1}+h\le Qb_{e+1}+W_A$; its first-digit gap shrinks, and $Qb_{e+1}\ge V$ preserves the other link. The target remains strictly above the new lower endpoint in both cases.

### Refine the first side when $g>V$

Split off its digit $p$ on the right, leaving digits $p+1,\ldots ,k$ on the left. The lengths of these branches are
$$
L=P(1/p-a),\quad R=P(1-a)r_p,
$$
and the gap between them is $g$. If $z>L+g$, append $p$ and subtract $L+g$ from $z$ in the relative target coordinate. Its new first-side hull length is $R>Q(1-a)r_e\ge h$, and its largest new gap $g/2$ is at most $W_B$. The target is in range because the new right-side upper endpoint of the sum equals the old one.

If $z\le L+g$, select the left group. Increase $e$, if necessary, to the least $e'\ge e$ with $Q(1-a)r_{e'+1}\le L$. The relative coordinate of the target does not change. We have $g\le Qb_{e'}$: when $e'=e$ this is the prior link; otherwise minimality gives $L<Q(1-a)r_{e'}$, and
$$
\frac{g}{L}=\frac{a}{(p-1)(1-ap)}\le 2,\qquad
g<2Q(1-a)r_{e'}\le Q/e'\le Qb_{e'}.
$$
For the middle inequality use $e'\ge 3$. For the first, the denominator is a concave quadratic in $p$, so it suffices to consider $p=2$ and $p=k-1$. The first endpoint uses $a\le 2/5$, and the second gives $(k-1)/(k-2)^2\le 2$. The new first-side largest gap is at most $g$, even if the singleton digit $k$ is appended immediately. Thus both links hold and $z\le L+g\le L+Qb_{e'}$. This completes the ordinary step.

## 2. Preventing a spurious zero tail

The ordinary rule may narrow the second side toward the excluded endpoint zero without ever appending a digit. We prove a stronger statement: **from every linked state in its positive target interval, some finite valid refinement appends a second-side digit and arrives at another linked state in its positive target interval.** All previously chosen digits stay fixed.

If the ordinary rule ever appends a second-side digit, simply take its initial finite segment. Otherwise $Q$ remains fixed. If only finitely many first-side refinements occurred, $e$ would increase indefinitely, hence $V\to0$ while $g>0$ stayed fixed; the rule would then force another first-side refinement. Thus infinitely many first-side digits are appended, because only finitely many first-side group reductions can occur between appends. Its prefix scale tends to zero. The condition $h\le W_A$ then implies $e\to\infty$ as well, so both remaining hull lengths tend to zero. Consequently the target, after subtracting the fixed second-side prefix, is exactly the first-side point determined by the chosen infinite digits. Call it $y$ in the current full first-side coordinates. Those digits are not eventually all $k$: following their last non-$k$ digit, an all-$k$ tail would make $y$ equal to the first-side minimum, giving $z=0$ at that finite step, contrary to the strict invariant. If there were no non-$k$ digits, the same contradiction holds at the starting state.

At any sufficiently deep non-$k$ digit $d$, instead take the lower sibling digit $d+1$ after the same parent prefix, and let $t$ be that sibling cylinder's right endpoint. Since there is a positive gap between consecutive first-side cylinders, $c=y-t>0$. If the parent scale is $P_0$, then $c\le P_0$, while the sibling cylinder has scale $P_0 r_{d+1}\ge P_0 r_k$. Take this depth large and put
$$
j=\lfloor Q/c\rfloor,\qquad Q''=Q r_{j+1},\qquad Q'=Q r_j.
$$
Here $j$ can be taken at least the starting state's $e$, and $Q'',Q'=O(c^2/Q)$, so the sibling cylinder has scale at least $Q''$. Follow repeatedly its rightmost branch, digit 2, keeping its right endpoint $t$ fixed and dividing its scale by 2 at each step. Choose a resulting full first-side cylinder of scale $P'$ with $Q''\le P'\le 2Q''$.

If $c\le Q/(j+1)+aQ''$, append $j+1$ on the second side, giving new scale $Q''$. Since $Q/(j+1)<c$, the target residual relative to the first-side minimum $t-P'(1-a)$ is positive and at most $P'(1-a)+aQ''$. Both links hold: $P'a/2\le aQ''$, and $Q''(1-a)r_{k+1}\le P'(1-a)$.

Otherwise append $j$, giving scale $Q'$. Since $c\le Q/j$ and $c>Q/(j+1)+aQ''$, the displacement satisfies
$$
0\le Q/j-c<(1-a)Q''\le (1-a)P'.
$$
Thus the residual is positive and at most the chosen first-side hull length, hence in the new sum interval. Also $P'a/2\le aQ''\le aQ'$, and
$$
P'\ge Q''=\frac{j-1}{j+1}Q'\ge Q'/2\ge Q' r_{k+1}.
$$
This proves the second link. In either case the new first-side cylinder and the second-side appended digit respect all constraints of the starting state. This is a finite repair and proves the stronger statement.

## 3. Completing the two genuine expansions

Starting in the initial state, repeat the finite refinement of §2. The second-side prefix scale tends to zero, because each pass appends a digit. Its remaining hull length tends to zero. The link $g\le W_B$, together with $g=Pa r_p\ge Pa r_{k-1}$ (where $p\le k-1$), forces the first-side prefix scale to zero too. Both sides therefore have infinitely many digits. Their prefix translations converge, and the target minus the two translations tends to zero because it stays within the sum of the remaining hulls (with the vanishing first-side minimum included). Each resulting suffix is positive and at most 1, so the branch identity $1/d<f_d(x)\le 1/(d-1)$ verifies the original half-open digit convention. No finite endpoint or closure substitution is used. This proves the lower inclusion.
