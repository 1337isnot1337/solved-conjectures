# Sun’s Fibonacci and odd squarefree number conjecture

Sun offers $1,000 for a complete solution to the question whether every positive integer is the sum of a Fibonacci number and a positive odd squarefree number. The Fibonacci sequence starts at $F_0=0$, $F_1=1$. [Sponsor’s statement](https://oeis.org/A304522) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/230)

**Partial result.** The natural density of exceptions exists and is less than $3.71\cdot10^{-30}$. Positive density would force an entire arithmetic progression of exceptions. Every finite prime-square obstruction must involve at least two distinct Wall–Sun–Sun primes. The first two sections establish a preliminary bound and the last section proves the stronger estimate. The numerical density bound uses the published search of Dorais and Klyve. Our argument gives no bound on the first exception and permits an infinite exceptional set of density zero. [Dorais and Klyve, §4](https://cs.uwaterloo.ca/journals/JIS/VOL14/Klyve/klyve3.pdf)

## Avoidance of all ordinary prime squares in a finite set

Write $A=\left(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\right)$, so $(A^j)_{12}=F_j$ and $\operatorname{tr}(A^j)=L_j$, the Lucas number. For $p\ge7$ prime set $D_p=2(p^2-1)$. The two roots $\alpha,\beta$ of $x^2-x-1$ are distinct units in $\mathbb F_{p^2}$, so $A^{D_p}=I\pmod p$. The integer $D_p$ is coprime to $p$. Call $p$ ordinary if $A^{D_p}\ne I\pmod{p^2}$. Equivalently the order of $A$ grows on passage from $p$ to $p^2$. The exceptions are precisely the Wall–Sun–Sun primes. To see the usual Fibonacci criterion directly, put $d=p-(5/p)$ with the Legendre symbol. In the split case $A^d=I\pmod p$, and in the nonsplit case Frobenius exchanges $\alpha,\beta$, so $A^d=-I\pmod p$. If $p^2\mid F_d$, the identity $A^d=F_d A+F_{d-1}I$ makes $A^d$ scalar modulo $p^2$. Its determinant is one, so the scalar is the same sign as modulo $p$. Conversely, $D_p/d$ is coprime to $p$ and even. If $A^d=\pm(I+pC)$ modulo $p^2$, then $A^{D_p}=I$ modulo $p^2$ only if $C=0$ modulo $p$. This gives $p^2\mid F_d$. [Period background and matrix criterion](https://webspace.ship.edu/msrenault/fibonacci/fib.htm)

**Finite avoidance theorem.** For any integer $n$ and any finite set of ordinary primes, there is a positive index $i$ such that $n-F_i$ is odd and is divisible by none of their squares, nor by $3^2$ or $5^2$. The good indices contain an infinite arithmetic progression. Their size need not be compatible with $F_i<n$.

Take $i=hu$, where $h=1$ for even $n$ and $h=3$ for odd $n$. We will choose $u$ coprime to

```math
H=\operatorname{lcm}\bigl(600,\ pD_p\ (p\text{ in the finite set})\bigr).
```

Since $3\nmid u$ and $F_i$ is even just when $3\mid i$, the required parity follows. Write $u$ by CRT modulo the prime powers of $H$, fixing them in increasing order of their primes. For any prime factor having no condition, choose any unit. Assigning a residue modulo a prime allows any lift to the full power of that prime in $H$.

* For even $n$ take $u\equiv1\pmod8$. The two unit choices modulo 3 give $u\equiv1,17\pmod{24}$, with $F_u\equiv1,4\pmod9$, respectively. Choose one that avoids $n$. For odd $n$ take $u\equiv1$ or $3\pmod8$. Then $F_{3u}\equiv2$ or $7\pmod9$, respectively, independently of the unit choice modulo 3. These identities follow from the Fibonacci period 24 modulo 9.
* The formula $F_j\equiv j3^{j-1}\pmod5$ for $j\ge1$ follows by the recurrence and the repeated characteristic root 3. With $u\pmod4$ fixed and $h=1$ or 3, varying $u\pmod5$ through the units makes $F_{hu}$ take all four nonzero residues. Choose one different from $n\pmod5$.
* Consider an ordinary prime $p\ge7$ in the set. All prime factors of $D_p=2(p-1)(p+1)$ are smaller than $p$, since $p+1$ is even. Thus $u\bmod D_p$ is already fixed and is a unit. Write it as $u_0$, odd and positive. We claim $L_{hu_0}\ne0\pmod p$. Otherwise $(\alpha/\beta)^{hu_0}=-1$. Raise this to an inverse of $u_0$ modulo $D_p$. The inverse is odd, so $(\alpha/\beta)^h=-1$, which would give $L_h=0\pmod p$. But $L_1=1$ and $L_3=4$.

For the last step write $A^{D_p}=I+pB\pmod{p^2}$. The matrix $B$ lies in the span of $I,A$ modulo $p$ by the formula for $A^{D_p}$. Its trace is zero because $D_p$ is even and the determinant is one. Since $B$ is nonzero at an ordinary prime, there is a nonzero $b\in\mathbb F_p$ with $B=b(2A-I)$. Consequently

```math
F_{h(u_0+D_p v)}\equiv F_{hu_0}+p h v b L_{hu_0}\pmod{p^2}.
```

Indeed, the off-diagonal entry of $A^j(2A-I)$ is $2F_{j+1}-F_j=L_j$. The coefficient of $pv$ is a unit. Among all $p$ possible values of $v\pmod p$, at most one makes the displayed Fibonacci number equal $n\pmod{p^2}$. Requiring $p\nmid u_0+D_p v$ removes one more choice. The remaining choices give a permissible unit value for $u\pmod p$ because $D_p$ is invertible there. This condition is independent of how we later lift $u$ to the full modulus. CRT finishes the induction. Every positive $u$ in the resulting class modulo $H$ works. [Independent constructive checks](verify.py)

## Passing from finite congruences to natural density

For $y\ge5$ let $M_y=2\prod_{3\le p\le y}p^2$, with the product over primes. Call a residue $r\pmod{M_y}$ blocked if every $F_i$ of the required parity has $p^2\mid r-F_i$ for at least one of these odd primes. Let $b_y$ be the proportion of blocked residues. Every positive integer in such a residue is an exception, and the blocked sets increase with $y$.

In each unblocked residue choose one index $i_r$ avoiding those squares. This requires only finitely many choices for fixed $y$. For $n$ large enough within that residue, $n-F_{i_r}$ is positive and odd. Conditional on this residue, the upper density of $n$ for which some prime $q>y$ satisfies $q^2\mid n-F_{i_r}$ is at most $\sum_{q>y}q^{-2}$. Indeed, for $n\le X$ each such $q\le\sqrt X$ contributes at most $X/(M_yq^2)+1$ by CRT. The total additive error is $O(\sqrt X)$ for each fixed residue, which vanishes after normalization. If $E$ denotes the full exception set, it follows that

```math
b_y\le\underline d(E)\le\overline d(E)\le b_y+\sum_{q>y}q^{-2}.
```

Taking $y\to\infty$ proves $d(E)=\lim_y b_y$. Positive density therefore implies some blocked residue. The finite avoidance theorem rules this out whenever every prime involved is ordinary. Taking $y=9\cdot10^{14}$, the published Fibonacci–Wieferich search covers all primes through $y$, so $b_y=0$. Bounding the remaining prime sum by $\sum_{m>y}m^{-2}<1/y$ gives the preliminary bound. The quoted computational bound is external. The verifier here constructs indices for 350 test targets against every odd prime square through $97^2$.

## A stronger bound from the distribution of admissible indices

In fact a blocked class requires **at least two distinct Wall–Sun–Sun primes**, and the density of exceptions is at most

```math
3\left(\sum_{q\ {\rm Wall\text{–}Sun\text{–}Sun}}q^{-2}\right)^2
<\frac{3}{(9\cdot10^{14})^2}<3.71\cdot10^{-30}.
```

Fix $y$ and condition on the target residue at 2 and at every ordinary prime square through $y$, including the separate conditions at 3 and 5. Write $W$ for the finite set of Wall–Sun–Sun primes through $y$. Enlarge the modulus $H$ for the index construction by all $D_q$ for $q\in W$. We will choose a random unit $u\bmod H$ using only the conditioned target residues. This makes the law of $u$ independent of the target coordinates modulo $q^2$ for $q\in W$.

Use the preceding choices modulo 8 and 3, fixing one allowed choice in each case. At each prime $\ell\ge5$ occurring in $H$ choose uniformly from the allowed nonzero first digits, of which there are at least $\ell-2$. This includes auxiliary primes without an avoidance condition, where every unit is allowed. In every prime power component choose all higher digits uniformly after assigning the required initial digits. The choices at successive primes may depend on the previously chosen components.

For $t\mid H$, each residue modulo $t$ receives probability at most $1/B(t)$, where $B$ is multiplicative on coprime factors and

```math
B(2^v)=2^{\max(v-3,0)},\qquad B(3^v)=3^{\max(v-1,0)},\qquad
B(\ell^v)=(\ell-2)\ell^{v-1}\quad(\ell\ge5,\ v\ge1).
```

For each component these are bounds conditional on *all* preceding choices. Multiplying them successively bounds the probability of any prescribed projection. Unspecified digits in earlier components can be averaged out.

For $q\in W$, choose a root $\alpha$ of the Fibonacci characteristic polynomial in $\mathbb F_{q^2}$, and put $t_q=\operatorname{ord}(\alpha^h)$. It divides $D_q$. For odd $hu$ the other root satisfies $\beta^{hu}=-\alpha^{-hu}$. Thus fixing $F_{hu}\bmod q$ imposes a quadratic equation on $z=\alpha^{hu}$, namely $z+z^{-1}=(\alpha-\beta)F_{hu}$. At most two residues for $u\bmod t_q$ can satisfy it. In particular the probability mass of any one Fibonacci residue modulo $q^2$ is at most $2/B(t_q)$.

If $B(t_q)<3$, the explicit factors imply $t_q\mid48$. This gives $\alpha^{48h}=\beta^{48h}=1$, hence $A^{144}=I\pmod q$ because $48h\mid144$. Consequently $q$ divides $\gcd(F_{144},F_{145}-1)=498454011879264<9\cdot10^{14}$. Such a prime cannot be in $W$ by the published search. Thus every one of the probabilities just bounded is at most $2/3$.

For a fixed target coordinate $r_q\bmod q^2$ write $z_q=\Pr_u(F_{hu}\equiv r_q\pmod{q^2})$. Ordinary prime squares have already been avoided. If the full target residue is blocked, the events for $q\in W$ cover the support of $u$, so $s=\sum_q z_q\ge1$. A single prime cannot do this. Moreover

```math
\sum_{q\ne p} z_q z_p=s^2-\sum_q z_q^2\ \ge\ s^2-\tfrac23s\ \ge\tfrac13,
```

where the sum uses ordered pairs. Under a uniform choice of the remaining **target** coordinates the $z_q$ are independent, because each is a function of just $r_q$ and the already fixed law of $u$. Their means are $q^{-2}$. Taking expectations bounds the proportion of blocked completions by $3\sum_{q\ne p}q^{-2}p^{-2}$, uniformly in the conditioned residues. Averaging them and letting $y\to\infty$ proves the stated bound by the density identity above. This argument also gives the necessary condition $\sum_{q\in W}2/B(t_q)\ge1$ for a blocked residue of the given parity.
