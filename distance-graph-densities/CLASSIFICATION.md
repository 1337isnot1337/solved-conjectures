# A corrected formula for all parameters

For every integer $k\ge1$ and each $s\in\{5,7\}$ we determine the maximum upper density $\alpha(D)$ of a set of integers avoiding all differences in $D=\{1,k,k+s\}$. For both families this proves Haralambis's prediction $\alpha(D)=\kappa(D)$, where $\kappa(D)=\max_{t\in[0,1]}\min_{d\in D}\|dt\|$ and $\|\cdot\|$ is distance to the nearest integer. The prediction for an arbitrary triple is open in the sources checked. [Liu and Robinson, Conjecture 3](https://arxiv.org/abs/1611.03940)

For **gap five**, use Theorem 1 of the [original proof](PROOF.md) and the small cases below. For **gap seven**, the following table gives the density for $k\ge8$ outside the eight listed small cases. Each pair $(P,C)$ denotes $(4P-C)/(9P)$.

| $k\bmod9$ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|---|
| Entry | $(k+8,5)$ | $4/9$ | $(k+8,4)$ | $(2k+7,7)$ | $(k+8,3)$ | $(k+8,7)$ | $(k+8,2)$ | $(k+8,6)$ | $(k+8,1)$ |

At $k\equiv5\pmod9$, $k\ge41$, the answer is $(4k+25)/(9k+72)$. The published preprint's prediction exceeds this by $(k-41)/(9(k+1)(k+8))$. Thus the two formulas agree at 41 and differ at **every** $k=50,59,68,\ldots$. At $k=14,23,32$ the original prediction holds. The other eight residue branches agree with the preprint throughout its stated domain. [Carraher et al., Conjecture 39](https://arxiv.org/pdf/1401.7183)

For $k=1$ the value is $3/7$ at gap five and $4/9$ at gap seven, by the residue-$1$ argument below. The remaining small cases complete the two formulas.

| Gap | Values of $k$ | Densities in the same order |
|---|---|---|
| 5 | 2, 3, 4, 5, 7, 12 | $1/3,4/11,2/5,1/3,3/8,5/13$ |
| 7 | 2, 3, 4, 5, 6, 7 | $3/10,5/13,2/5,6/17,3/7,1/3$ |
| 7 | 9, 11, 14, 16, 18, 23, 25, 32 | $2/5,5/12,2/5,7/17,8/19,5/12,11/26,14/33$ |

## Constructions and the Lonely Runner value

For rational $t=a/P$ in lowest terms, put $h=P\min_{d\in D}\|dt\|$. The residues $ax\bmod P<h$ define an independent set of density $h/P$. Rational times are dense and the objective is continuous, hence $\kappa(D)\le\alpha(D)$. The constructions below attain the stated density at a particular time. Together with the upper bounds, they imply equality. The gap-five constructions are in the original proof.

At gap seven and residue $1$, take $t=4/9$. All forbidden differences are $\pm1$ modulo 9. The eight consecutive sites $i,\ldots,i+7$ and the site $i+k+7$ form a nine-cycle, which contains at most four occupied sites. Averaging gives the reverse inequality. This argument also applies to $k=1$. For gap five use the seven-cycle and $t=3/7$.

For gap-seven residues $0,2,4,5,6,7,8$, put $P=k+8$, $h=(4P-C)/9$ and $t=h/P$. The table makes $h$ integral. Modulo $P$, the forbidden steps multiplied by $h$ are $h$, $h+C$ and $-h$. They all belong to $[h,P-h]$ since $P\ge7C$. In the seven classes the first eligible $k$ values are respectively $27,20,13,41,15,34,8$, where this inequality can be checked directly. It persists as $k$ grows.

For residue $3$ put $P=2k+7$, $h=(4P-7)/9$ and $a=h+1$. Writing $k=9j+3$ gives $h=8j+5$ odd. Since $9a=4P+2$ and $P$ is odd, $\gcd(a,P)=1$. The identity $2(ka-h)=P(h-3)$ gives $ka\equiv h\pmod P$. Also $(k+7)a\equiv-h$ and $h\le a\le P-h$. Thus $t=a/P$ works.

For each of the 20 small cases the Python verifier exhibits a rational time by enumerating denominators that are sums of two forbidden differences. It checks the three modular distances, the cardinality and independence of the residue set. Using the strict-prefix lemma from the original proof, it then excludes a denser independent set by direct enumeration on a specified interval of length at most 128. The denominators used for the construction suffice because the verifier finds a witness. [Small cases and finite-word verifier](counterexample.py)

## The upper bound at gap seven

The shortening proof for gap five applies with the following constants and local counts. For clarity, the two cycles at index $i$ consist of the sites $i,\ldots,i+7,i+k+7$ and $i+k,\ldots,i+k+7,i$. Each has nine vertices. Subtract each occupation count from four, and call the sum of the two deficits $d_i$. These nonnegative integers have mean $8-18\rho$ at density $\rho$. A better periodic set therefore yields a rotation with $P\sum_{i<t}d_i<Ht$ at every $1\le t\le P$, where the sum starts at zero and $H=2C\le14$. Periodic approximation covers arbitrary sets.

Use rows of width $k$ with states storing the last seven bits of each row. For $P=Rk+e$, take $(R,e)=(1,8)$ or $(2,7)$ as the table specifies. The finite strip construction, seam equalities, final $e$ transitions and prefix tests are exactly those defined in the [gap-five proof](PROOF.md), with the history length seven and the nine-cycle costs above. In the two-row graph there are 577 states. The states with both a four-step incoming and a four-step outgoing zero-cost walk induce a single directed nine-cycle. The verifier generates all states and checks these assertions. In any 17 zero steps, states 4 and 13 therefore agree. The indices work simultaneously for both adjacent pairs of a three-row strip.

For $k>4000$, divide the first $k$ columns into $H$ segments at $\lfloor bk/H\rfloor$, and reserve the first and last 17 columns of each segment. Every interior has length at least $\lfloor4001/14\rfloor-34=251\ge17H$. There are at most $H-1$ positive columns in total. If every zero run in one interior had length at most 16, its length would be at most $16H+(H-1)$. Hence each interior admits deletion of a closed nine-step walk of zero cost, leaving the seams and the remembered first $e$ bits intact.

Set $k'=k-9H$ and $P'=Rk'+e$. Write $jR=bH+u$, $0\le u<H$. The checkpoint $\lfloor jP/H\rfloor$ occurs within $e$ columns to the right of segment boundary $u$ in row $b$, or within the final extension at $j=H$. Exactly $9(bH+u)=9jR$ steps preceding it have been deleted in row order. Its cost is unchanged at the shortened checkpoint $\lfloor jP'/H\rfloor$. By monotonicity these checkpoints imply all strict prefix bounds. The new parameter has the same residue modulo nine. A step from above 4000 lands at or above 3875, so all small exceptions are avoided.

Iteration reaches $k\le4000$. The C++ verifier excludes such a path at all 3,541 required base parameters from 8 through 4000 and accepts the relaxed-budget controls. This proves the upper bound in all remaining cases. [Strip verifier](verify.cpp)

The supplementary tables of Carraher et al. already contain many exact small values and construction bounds. The classification gives a uniform upper bound and the corrected branch for all $k$. A related result of Pandey treats $\{a,b,a+nb\}$ under the hypothesis $a<b$. The representation $a=k,b=1$ of the present families falls outside that hypothesis for $k>1$. [Original data](https://lidicky.name/dstolee/data/CGHRS13-DistanceData.pdf), [Pandey, Theorems 2.1, 3.1 and 4.1](https://www.dml.cz/bitstream/handle/10338.dmlcz/144179/MathBohem_140-2015-1_5.pdf)
