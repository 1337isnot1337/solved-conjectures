# Controlled sums of stabilizer-code images over a growing alphabet

Status: an elementary exact span bound and its application to a restricted class of geodesic trades. Coefficients in the sum are unrestricted. No bound for arbitrary complex local maps is asserted. The alphabet in the bound must not be confused with the number of qubits.

## 1. Two stabilizer-code projectors

Fix a prime $`p`$. Work on a tensor product of $`p`$-level qudits. A stabilizer group is a commuting Pauli subgroup with its eigenvalue phases included, containing no nontrivial scalar. Its code projector is
```math
P_S=|S|^{-1}\sum_{s\in S}s.
\tag{1}
```
The subgroup size is a power of $`p`$, and (1) is an orthogonal projector.

For two such projectors $`P=P_S`$, $`Q=P_T`$, either they commute or
```math
\|PQ\|\le p^{-1/2}.
\tag{2}
```
More precisely, let $`T_0`$ consist of the elements of $`T`$ commuting with every element of $`S`$, and let $`[T:T_0]=p^d`$. Then
```math
PQP=p^{-d}P P_{T_0}.
\tag{3}
```
The product on the right is an orthogonal projector, possibly zero, times $`p^{-d}`$.

Indeed, if $`t\in T`$ does not commute with $`s\in S`$, their commutator is a nontrivial $`p`$-th root $`\omega`$, and
$`PtP=PstP=\omega PtsP=\omega PtP`$, so $`PtP=0`$.
For $`t\in T_0`$, $`PtP=Pt`$. Averaging gives (3), and $`P`$ commutes with $`P_{T_0}`$. If $`d=0`$, the two full projectors commute. If $`d\ge1`$, (3) gives (2).

In particular, stabilizer codes with a nonzero common vector cannot have noncommuting defining Pauli groups: a common eigenvector of two Paulis with a nontrivial scalar commutator would be zero. Thus the familiar example of noncommuting arbitrary projectors with a nonzero intersection does not contradict (2).

## 2. A span lemma with no coefficient bound

Let $`P_1,\ldots,P_r`$ be stabilizer-code projectors and put
$`\Sigma=\sum_bP_b`$. If $`r\lt \sqrt p`$, every stabilizer state lying in
$`\sum_b\mathop{\mathrm{im}}P_b`$ belongs to at least one individual code.

For noncommuting pairs, (2) implies the operator inequality
```math
P_bP_c+P_cP_b
\ge-p^{-1/2}(P_b+P_c).
\tag{4}
```
For any vector $`x`$, the absolute value of
$`\langle P_bx,P_cx\rangle`$ is at most
$`p^{-1/2}\|P_bx\|\|P_cx\|`$, and $`2uv\le u^2+v^2`$, proving (4).
Commuting pairs contribute the positive operator $`2P_bP_c`$. Therefore
```math
\Sigma^2\ge
\left(1-\frac{r-1}{\sqrt p}\right)\Sigma.
\tag{5}
```
Writing $`\alpha=1-(r-1)/\sqrt p>0`$, every nonzero eigenvalue of $`\Sigma`$ is at least $`\alpha`$. If $`\Pi`$ is the orthogonal projector onto its range, which is the sum of the code spaces, then
```math
\Pi\le\alpha^{-1}\Sigma.
\tag{6}
```

For a normalized stabilizer state $`\psi`$, the probability
$`\langle\psi,P_b\psi\rangle`$ is either zero or a reciprocal power of $`p`$. To see this directly, average its Pauli expectations in (1). A Pauli expectation is zero unless its label belongs to the maximal isotropic stabilizer label space of $`\psi`$; on the intersection, the remaining phases form a character. The character sum is zero or the size of that intersection. Thus
```math
\psi\notin\mathop{\mathrm{im}}P_b
\quad\Longrightarrow\quad
\langle\psi,P_b\psi\rangle\le p^{-1}.
\tag{7}
```
If $`\psi`$ belonged to the sum but no individual code, (6)--(7) would give
```math
1\le\frac{r}{p(1-(r-1)/\sqrt p)}<1.
```
The strict last inequality is equivalent to $`r\lt \sqrt p`$, a contradiction.

This proof controls the smallest nonzero eigenvalue of the projector sum. It does not assume that a chosen decomposition of $`\psi`$ has bounded coefficients or well-conditioned summands.

## 3. Application to independently controlled local stabilizer branches

Set $`q=p^n`$, $`N=p^u`$, $`M=p^v`$. A branch begins with
```math
S_{q,N}=U_{ABC}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N).
\tag{8}
```
It applies local stabilizer partial isometries at $`A,B,C`$, and an arbitrary complex linear map at $`D`$. For precision, the allowed outside maps have the form
```math
V\bigl(|0\rangle^{\otimes a}\otimes I\bigr)
 \bigl(\langle0|^{\otimes b}\otimes I\bigr)U,
\tag{9}
```
with compatible dimensions and Clifford $`U,V`$, up to a scalar. An arbitrary sum of $`r`$ such branches is allowed, with different outside maps in every branch.

Let
```math
T_{q,M}=U_{ACD}(q)U_{BCD}(q)W_{AB}(M).
\tag{10}
```
If $`N/M\lt \sqrt q`$, an exact expression of (10) as such a sum requires
```math
r\ge\sqrt p.
\tag{11}
```

Here is the code-space reduction. The support of the $`ABC`$ reduced density matrix of the stabilizer source (8) is a stabilizer code: its projector is the sum of the source stabilizers acting trivially on $`D`$, normalized as in (1). The image of a stabilizer code under (9) is again a stabilizer code or zero. This can be checked one computational-basis postselection at a time. A measured Pauli already fixed to the opposite eigenvalue gives zero; an independent commuting measurement adds a stabilizer; a noncommuting generator is replaced by the measured Pauli after choosing a commuting basis for the remaining generators. Removing the fixed measured qudit and adding a fixed output qudit preserve the code description.

For branch $`b`$, let $`V_b`$ be its $`ABC`$ coefficient space after the outside maps. Every output obtained with its arbitrary $`D`$ map lies in $`V_b\otimes V_D^{\mathrm{out}}`$, a stabilizer code on the full output space. The target (10) is a stabilizer state. If $`r\lt \sqrt p`$, Section 2 would place it in one individual branch code.

Membership in $`V_b\otimes V_D^{\mathrm{out}}`$ implies that a suitable $`D`$ map for that branch produces the entire target: every target $`D`$-slice is a linear combination of the branch's input $`D`$-slices, which span $`V_b`$. Since the target is concise at $`A,B,C`$, the three branch maps must then have full row rank. In (9) this forces $`a=0`$, giving the full-row-rank maps in
[STABILIZER_TRANSFER_OBSTRUCTION.md](STABILIZER_TRANSFER_OBSTRUCTION.md).
Its one-branch case requires $`N/M\ge\sqrt q`$, a contradiction. This proves (11).

The same argument permits a source whose shared $`q`$-label is also copied to $`D`$: its $`ABC`$ coefficient support is a larger stabilizer code, and the common-transfer obstruction still has its $`n`$ independent shared labels.

## 4. Prime alphabet and field-linear versions

For $`q=p`$ prime and $`N=M=p^u`$, (11) reads
```math
r\ge\sqrt q.
\tag{12}
```
It rules out a subpolynomial number of independently controlled Clifford-code branches in this growing-prime-alphabet model. It allows their arbitrary interference and arbitrary $`D`$ coefficients.

There is also a finite-field formulation. Treat one $`q=p^n`$-dimensional register as an $`\mathbb F_q`$ qudit, with Pauli labels in $`\mathbb F_q^2`$, additive-character phases, and only $`\mathbb F_q`$-linear isotropic code spaces and Clifford transformations. Every local register, including the flag spaces, belongs to this $`\mathbb F_q`$-linear model; in particular $`N,M`$ are compatible powers of $`q`$. Then intersections and centralizer indices in Section 1 are powers of $`q`$. Indeed, if the symplectic pairing of two $`\mathbb F_q`$-linear spaces is nonzero, multiplication by all scalars of $`\mathbb F_q`$ makes the additive-character commutation condition nontrivial on a full $`\mathbb F_q`$ direction. Formula (3) has $`q^{-d}`$, and (7) has $`q^{-1}`$. The entire proof therefore holds with $`q`$ replacing $`p`$.

This extension does not include arbitrary Clifford circuits on $`n`$ qubits. Their label spaces may be only $`\mathbb F_2`$-linear, with principal angles of size $`2^{-1/2}`$. In the unrestricted qubit-Clifford model, (11) supplies only the constant lower bound $`r\ge\sqrt2`$, hence $`r\ge2`$.

Thus controlled qubit Clifford families growing with $`\log q`$, genuinely non-Clifford local filters, and non-stabilizer flag truncations remain possible escape routes. No existence statement for any of them follows from this note.


## 5. A small controlled sum really can escape the fixed-alphabet bound

The limitation for fixed $`p`$ is substantive. For $`p=2`$ and $`n\ge1`$, use unnormalized product stabilizer vectors
```math
\phi_0=(|0\rangle+|1\rangle)^{\otimes n},\qquad
\phi_j=|1\rangle^{\otimes(j-1)}|0\rangle
       (|0\rangle+|1\rangle)^{\otimes(n-j)}
\quad(1\le j\le n).
```
Every binary word other than $`1^n`$ has one unique first zero. Hence
```math
|1\rangle^{\otimes n}=\phi_0-\sum_{j=1}^n\phi_j.
\tag{13}
```
None of the $`n+1`$ one-dimensional branch codes contains the target. Nevertheless their sum does. In normalized vectors, the coefficients include $`2^{n/2}`$ and $`2^{(n-j)/2}`$; a bounded-coefficient argument would miss this exact cancellation.

For fixed prime $`p`$, the same first-differing-coordinate partition uses
$`1+n(p-1)`$ product stabilizer vectors to isolate the word
$`(p-1)^n`$ from the uniform sum of all $`p^n`$ words. This is $`O(\log q)`$ branches when $`q=p^n`$ and $`p`$ is fixed.

Equation (13) is an exact scalar-state interference template. It is not the geodesic trade: a trade must simultaneously retain the independent outer labels, the entire common $`AB`$ flag, and the copied $`C,D`$ labels in its legal local coefficient equations. In particular, encoding an independent second output selector by an unstated additional shared label would change the source budget. Whether a first-differing-bit construction can satisfy those equations using the existing flags remains open.

