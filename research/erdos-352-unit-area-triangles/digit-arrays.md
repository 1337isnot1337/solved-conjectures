# Equal disks centered on rectangular digit arrays

Consider the following candidate construction for [Erdős problem 352](https://www.erdosproblems.com/352). Choose integers $B\ge2$, $1\le a,b\le B$, and $k\ge1$. Each coordinate of a center has $k$ digits in base $B$. Allow every digit from $0$ through $a-1$ in the first coordinate and every digit from $0$ through $b-1$ in the second, independently at every place. Put a disk of radius $r>0$ around every center. Denote the union by $A$.

**Theorem.** If $A$ avoids triangles of area $t>0$, then $|A|\le300t$, uniformly in all five construction parameters. The conclusion includes arbitrarily thin disks, overlapping disks, and a varying number of digit places. A common invertible affine change of the entire configuration preserves the ratio of the two areas.

The full conjecture asks for a uniform bound for arbitrary measurable sets. Koizumi's equivalent lattice question allows any subset of lattice points; the full rectangular alphabet at each place is an assumption here. [Koizumi's discretization](https://jkoizumi144.com/notes/erdos352.pdf).

## Notation and geometry

Work with closed disks. The open-disk result follows by taking radii increasing to the specified radius. Interchange axes so $a\ge b$. Write $w=a-1$, $v=b-1$, $q=ab$, $Q=q^k$, $S_i=1+B+\cdots+B^{i-1}$, and $D=wB^{k-1}$. The total horizontal span of the centers is $wS_k$. A vertical diameter in the first disk and a third point at the farthest horizontal center produce all areas through $rwS_k$. One disk alone produces all areas through $r^2$. Thus avoidance implies
```math
 t\ge rwS_k,\qquad t\ge r^2 .
```
If the centers are collinear, the bounding rectangle gives $|A|\le 2r(wS_k+2r)\le6t$. Assume $a,b\ge2$ and write $h=wv\ge q/4$. The disk area sum bounds $|A|$ by $\pi Qr^2$. Whenever $Qr^2\le64t$ this suffices, so the remaining arguments may assume $Qr^2>64t$. In that case $Q>64$ and
```math
 rD>64D^2/Q\ge16,
```
since $q\le a^2$, $q\le B^2$, and $w\ge a/2$.

If a triangle of centers has signed double area $d$ and diameter $H$, moving the vertex opposite a longest side within its disk realizes every signed double area between $d-rH$ and $d+rH$ (up to consistent ordering). We use this with the positive target $z=2t$.

## Determinants provided by one digit place

Put $u=(w,1)$. For any place $0\le j<k$ we can select two centers with difference $B^ju$. If the third center differs from the first by $p$, their signed double area is $B^j\det(u,p)$. At a place other than $j$, the projected digit difference can be any integer in $[-h,h]$. Indeed it has the form $wY-X$ with $-v\le Y\le v$ and $-w\le X\le w$, and the adjacent integer intervals overlap.

At place $j$, take the first digit to be $(0,s)$ and the second to be $(w,s+1)$, with $0\le s<v$. Allow the third digit to be arbitrary. Now $Y$ ranges from $-(v-1)$ to $v$ and $X$ from $0$ to $w$, again realizing every integer in $[-h,h]$. Choices at different places are independent.

When $q>B$ we have $2h+1\ge B$. Indeed $2(a-1)(b-1)+1\ge ab-1$ for $a,b\ge2$. The balanced digits $[-h,h]$ therefore realize all integers in $[-hS_i,hS_i]$ at depth $i$, by induction using overlap or adjacency of successive integer intervals. In particular at every base place $j$ all multiples of $B^j$ in $[-B^jhS_k,B^jhS_k]$ occur as signed double areas.

## The case of more than B digit pairs

First take $k\ge2$. If $z> B^{k-1}hS_k$, the bounding rectangle gives
```math
 |A|\le hS_k^2 +2r(w+v)S_k+4r^2\le16t,
```
using $S_k\le2B^{k-1}$. Otherwise take the smallest $j$ with $z\le B^jhS_k$.

If $z\ge\sqrt Q/4$, the step $B^j$ is at most $4z/\sqrt Q$. For $j=0$ this is immediate. For $j>0$ use minimality and
```math
 hS_k/B\ge qB^{k-2}/4\ge q^{k/2}/4 .
```
Rounding to the nearest allowed multiple gives a determinant $d$ with $|d-z|\le2z/\sqrt Q$ and $d\ge z/2$ since $Q>64$. Its triangle has diameter $H\ge\sqrt d$. From $Qr^2>64t$ we get $rH>2z/\sqrt Q$. Moving one vertex realizes $z$.

If $0<z<\sqrt Q/4$, take a base at the units place and leave the top place for making the triangle long. The bottom $k-1$ places realize the nearest integer to $z$ because $hS_{k-1}\ge qB^{k-2}/4\ge\sqrt Q/4$. At the top place set the difference from the first to the third digit equal to $u$ or $-u$, keeping the first and second top digits equal. This adds zero determinant. Choose its sign to agree with the horizontal difference from the lower places. The diameter is at least $D$, and $rD>16$ absorbs the rounding error.

At $k=1$ the one-place construction realizes all integer determinants from zero through $h$, always with diameter at least $w=D$. For $z\le h$ rounding works. For $z>h$ the bounding rectangle argument above applies.

## The case of at most B digit pairs

First suppose $r\le1/2$. Then $z<Q/128$. Take the base at the top place, of length at least $D$. For $k\ge2$, the third point may share the first point's top digit, vary at the units place and keep all intermediate digits equal. This realizes determinants $B^{k-1}e$ for every integer $0\le e\le h$. At $k=1$ the same assertion uses the one-place construction. Since $q\le B$, the top endpoint is at least $Q/4$. The determinant rounding error is at most $B^{k-1}/2$. The bound $Qr^2>64t\ge64rD$ gives
```math
 rw>64w^2 B^{k-1}/q^k\ge64w^2/q\ge16 .
```
Hence $rD$ absorbs the error. This proves in particular that any avoiding thin-disk configuration in this case has $Qr^2\le64t$.

Finally suppose $r>1/2$. Let $j$ be the largest place with $B^j\le2r$, and put $m=k-1-j$ and $L=S_{j+1}$. Fixing the upper $m$ digits gives a connected cluster. One can pass between any two centers in it by changing one digit by one, in steps of length at most $2r$. For any two points of one connected cluster, their signed double area with an arbitrary third point of $A$ has absolute value at most $2t$: the product of the cluster with itself is connected and includes pairs with equal entries. Subtract this inequality at two choices of the third vertex. A horizontal chord of length $wL$ in one cluster and two centers of global vertical separation $vS_k$ give
```math
 hLS_k\le4t .
```
Here a chord means the difference of two points; its interior need not be in the cluster.

Sum the bounding rectangles of the $q^m$ clusters. As $q^m L\le B^m L\le S_k$, their summed area is at most
```math
 q^m\big(hL^2+2r(w+v)L+4r^2\big)\le8t+4q^mr^2 .
```
If $m=0$ use $r^2\le t$. If $m>0$, retain only the disks whose bottom $j+1$ digits are zero. After dividing all lengths by $B^{j+1}$ they form the same sparse construction with $m$ places and radius below $1/2$, by maximality of $j$. The thin-disk result, applied with target $t/B^{2j+2}$, gives $q^mr^2\le64t$. This yields $|A|\le264t$ and completes the theorem.
