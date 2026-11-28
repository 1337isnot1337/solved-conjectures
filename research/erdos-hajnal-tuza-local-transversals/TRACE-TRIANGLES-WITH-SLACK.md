# A trace-triangle obstruction with nonzero petal slack

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This generalizes the [stable saturated obstruction](STABLE-TRACE-TRIANGLE-OBSTRUCTION.md)
to overlapping exterior petals and to a common exterior that may
contain more than $`t`$ vertices.

Assume $`r=5t+z`$, $`1\le z\le t/4`$, $`\tau>t`$, and the
local span condition. Put $`m=t+s`$ for the minimum pair
intersection and $`\delta=z-3s+2`$. Fix $`A`$, and suppose
three distinct other edges $`E_1,E_2,E_3`$ have traces
$`Y_i=A\cap E_i`$ with empty triple intersection. These edges need not
be minimum neighbors. Write
```math
K=\sum_{i\lt j}(|Y_i\cap Y_j|-s)_+ .
```
Then
```math
t\le 5s+9K+15\delta+3.
```
Consequently, if $`z=o(t)`$, three such traces with pair
intersections all $`o(t)`$ cannot have empty triple intersection.

## 1. The common exterior

If a trace pair intersects in more than $`t`$ points,
then $`K\ge t+1-s`$ and the conclusion is immediate
since $`s\le t`$. Otherwise all pair intersections have
size at most $`t`$, as needed in the cut argument.

Write $`L=r-m`$, $`W_i=E_i\setminus A`$,
$`e_i=|Y_i|-m`$, $`d_{ij}=|W_i\cap W_j|`$, and
$`C=\bigcap_i W_i`$. Note $`|W_i|=L-e_i`$.
We have $`d_{ij}\le t+\delta-\max(e_i,e_j)`$.
Indeed choose a $`(s+e_i)`$-subset of $`Y_i`$
disjoint from $`Y_j`$, possible since $`|Y_i\cap Y_j|\le t`$,
and choose a witness $`F`$ avoiding its $`t`$-point
complement in $`Y_i`$.
Then $`F`$ meets $`W_i`$ in at least $`m-(s+e_i)=t-e_i`$
points, and has at most $`L`$ points outside $`A`$.
The four edges $`A,E_i,E_j,F`$ are distinct and have
empty intersection. The distinctness of $`E_j,F`$
uses $`Y_i\cap Y_j\ne\varnothing`$, which follows
from the local condition on $`A,E_i,E_j`$.
The union outside $`A`$ has at least $`2r-2`$ points.
It has size at most
```math
(L-e_i)+(L-e_j)+L-d_{ij}-(t-e_i)
=3L-e_j-d_{ij}-t.
```
This proves $`d_{ij}\le t+\delta-e_j`$, and the
reflection proves the bound with $`e_i`$ as well.

Put $`c=|C|`$ and $`d=t-c`$, which may now be negative.
By minimality $`d_{ij}\ge m-|Y_i\cap Y_j|`$.
Applying the local span condition to $`A,E_1,E_2,E_3`$
and using $`3L-(2r-2)=2t+\delta`$ gives
```math
\sum_{i\lt j}d_{ij}\le 2t+\delta+c-\sum_i e_i,
\qquad
-\delta\le d\le K+\delta-\sum_i e_i .
```
In particular we can use the weaker bound $`d\le K+\delta`$
in the remainder. 

The entire triple intersection of the $`E_i`$'s is $`C`$.
Let $`Q_{ij}=(E_i\cap E_j)\setminus C`$ and
$`S=\sum_{i<j}|Q_{ij}|`$. These three sets are pairwise
disjoint and nonempty: any two traces intersect, by the
local condition on $`A,E_i,E_j`$.
We have
```math
S\le3s+K+\delta+2d\le3s+3K+3\delta,
\qquad S\ge3(s+d).
```
The upper bound follows by expanding $`S`$ as the sum
of the three trace intersection sizes plus
$`\sum d_{ij}-3c`$; the lower bound uses the minimum
full intersection size $`m`$.

## 2. Complementary witnesses

Assume $`t>5s+9K+15\delta+3`$, so $`c>0`$ and
$`S+1+\delta<t`$. Choose an edge $`D`$ avoiding
$`\min(c,t)`$ points of $`C`$. Then $`D`$ differs
from each $`E_i`$ and $`|D\cap C|\le(-d)_+`$.

Choose an edge $`H`$ avoiding all the $`Q_{ij}`$,
all points of $`D\cap C`$, and some one vertex of
$`D`$. This uses at most $`S+\delta+1<t`$ forbidden
points. Fill the forbidden set to size $`t`$, first
from remaining points of $`C`$ when possible.
The chosen $`H`$ differs from $`D`$ and each $`E_i`$.
Since at most $`S+1`$ forbidden points are outside
$`C`$ until $`C`$ is exhausted,
```math
h:=|H\cap C|\le (S+1-d)_+ .
```
Moreover $`D\cap H`$ avoids $`C`$ and all the $`Q_{ij}`$
and hence has no point in two of the $`E_i`$'s.

Fix $`i,j`$, and put $`|E_i\cap E_j|=m+\eta`$.
The four edges $`D,H,E_i,E_j`$ have empty intersection.
Their union outside $`E_i\cup E_j`$ must have size
at least $`r+m+\eta-2`$.
The $`D`$-exterior has size at most
$`r-2m+s+d_++\eta`$, because $`D`$ hits at most
$`|Q_{ij}|+(-d)_+=s+d_++\eta`$ points of the pair
intersection. The $`H`$-exterior has size at most
$`r-2m+h`$. Subtracting yields
```math
|(D\cap H)\setminus(E_i\cup E_j)|
\le \delta-s+d_++h \le S-s+1+2\delta.
```
For the last step, if $`d\ge0`$ use $`S\ge3(s+d)`$
so $`d_++h\le S+1`$; if $`d<0`$, use
$`-d\le\delta`$.
Every point of $`D\cap H`$ is outside at least one
of the three pair unions. Summing gives
```math
t+s\le|D\cap H|\le3(S-s+1+2\delta)
\le6s+9K+15\delta+3 ,
```
the contradiction. The method uses different avoidance
sets for $`D`$ and $`H`$; neither is assumed to avoid
a common exterior larger than $`t`$ on its own.
This does not resolve the unrestricted problem.
