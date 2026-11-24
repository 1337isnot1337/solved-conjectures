# A transfer-space obstruction for global local stabilizer maps

Status: a proved restriction on a specific operation class. It does not bound arbitrary complex local maps, sums of separately controlled Clifford families, or the matrix multiplication exponent.

Fix a prime $`p`$. All local dimensions below are powers of $`p`$. A full-row-rank stabilizer map from $`p^n`$ to $`p^{n-\ell}`$ means a nonzero scalar multiple of
```math
L=V(\langle0|^{\otimes\ell}\otimes I)U,
\tag{1}
```
where $`U,V`$ are Clifford unitaries. Equivalently it projects onto a stabilizer code of codimension $`\ell`$ qudits and identifies that code with the output. The argument below needs only (1), not a classification of every circuit with ancillas.

Generalized Pauli labels form the symplectic vector space
$`\mathbb F_p^{2n}`$. Their alternating form records commutation. A commuting independent measured family in (1) is an isotropic subspace $`M`$ of dimension $`\ell`$. A Pauli commuting with $`M`$ descends to a Pauli on the output code. It descends to a scalar exactly when its label belongs to $`M`$. These statements follow by conjugating (1) back to the first $`\ell`$ computational-basis measurements.

## 1. A general common-transfer count

Suppose a source tensor has an $`m`$-dimensional common Pauli transfer space on three parties $`A,B,C`$. Precisely, there is a vector space $`V_0=\mathbb F_p^m`$ and, for each $`i\in\{A,B,C\}`$, an injective isotropic Pauli-label map $`P_i:V_0\to\mathbb F_p^{2n_i}`$, with commuting representatives chosen so that
```math
(P_A(v)\otimes1\otimes1\otimes1)S
=(1\otimes P_B(v)\otimes1\otimes1)S
=(1\otimes1\otimes P_C(v)\otimes1)S
\quad(v\in V_0).
\tag{2}
```
In (2), $`P_i(v)`$ denotes the corresponding Pauli operator. The fourth party may have any dimension.

Apply stabilizer maps at $`A,B,C`$ that remove respectively
$`\ell_A,\ell_B,\ell_C`$ qudits, and an arbitrary linear map at $`D`$. Assume the nonzero output $`T`$ has only scalar common transfer triples:
```math
\mathcal Z_{ABC}(T)=
\{(\lambda I_A,\lambda I_B,\lambda I_C):\lambda\in\mathbb C\}.
\tag{3}
```
Then
```math
m\le\ell_A+\ell_B+\ell_C.
\tag{4}
```

For the proof, let $`M_i`$ be the measured Pauli space and put
```math
K_i=P_i^{-1}(M_i),\qquad k_i=\dim K_i.
```
The commutation map $`V_0\to M_i^*`$ vanishes on the $`k_i`$-dimensional subspace $`M_i\cap P_i(V_0)`$ in its second argument, since $`P_i(V_0)`$ is isotropic. Its rank is therefore at most $`\ell_i-k_i`$. Thus the common subspace $`V_{\mathrm{good}}`$ whose transferred Paulis commute with all three measured spaces has
```math
\dim V_{\mathrm{good}}
\ge m-\sum_i(\ell_i-k_i).
\tag{5}
```
For every $`v\in V_{\mathrm{good}}`$, (2) descends through the three maps and the arbitrary $`D`$ map. Condition (3) makes every descended operator scalar. The code criterion following (1) implies
$`v\in K_A\cap K_B\cap K_C`$. Consequently
```math
m-\sum_i\ell_i+\sum_i k_i
\le\dim V_{\mathrm{good}}
\le\min_i k_i.
```
This proves the stronger inequality
$`m\le\sum_i\ell_i-\sum_i k_i+\min_i k_i`$, hence (4).

## 2. Application to the geodesic source

Write
```math
q=p^n,\quad r=p^t,\quad N=p^u,\quad M=p^v,
```
and consider
```math
\begin{aligned}
S_{q,N,r}
 &=U_{ABCD}(r)U_{ABC}(q)
   W_{CD}(q)W_{AD}(N)W_{BD}(N),\\
T_{q,M}
 &=U_{ACD}(q)U_{BCD}(q)W_{AB}(M).
\end{aligned}
\tag{6}
```
If (6) admits an exact restriction with stabilizer maps (1) at $`A,B,C`$, and any linear map at $`D`$, then
```math
r\,\frac NM\ge\sqrt q.
\tag{7}
```

The source's $`q`$ common $`ABC`$ labels and its $`r`$ full-unit labels give $`m=n+t`$ independent common Pauli transfers: use the diagonal characters of these labels at $`A,B,C`$. The input and output local dimensions are
```math
\begin{array}{c|ccc}
 &A&B&C\\ \hline
S_{q,N,r}&rqN&rqN&rq^2\\
T_{q,M}&qM&qM&q^2 .
\end{array}
```
The target is concise at each of these parties. Hence any successful local maps have full row rank, and maps of form (1) remove
```math
\ell_A=\ell_B=t+u-v,\qquad\ell_C=t.
\tag{8}
```

To verify (3), write
```math
T_{q,M}=\sum_{i,j=1}^q\sum_{k=1}^M
 e_{ik}^A e_{jk}^B e_{ij}^C e_{ij}^D.
```
Comparing each independent $`D_{ij}`$ coefficient in a common-transfer equality first forces $`C_{ij}`$ to be an eigenvector of its transfer map. Since the $`AB`$ coefficient is a full-rank $`M`$-wire, the $`A`$ map on the entire $`i`$-th flag block and the $`B`$ map on the entire $`j`$-th flag block must be the same scalar $`\lambda_{ij}`$. Varying $`j`$ and then $`i`$ makes all these scalars equal. Off-block components vanish by the same coefficient comparison. Thus (3) holds.

Applying (4) and (8) gives
```math
n+t\le3t+2(u-v),\qquad
n\le2(t+u-v),
```
which is exactly (7).

For the finite star comparison
```math
U_{ABCD}(r)U_{ABCD}(q)
 W_{AD}(q)W_{BD}(q)W_{CD}(q)
 \longrightarrow
U_{ABD}(q)U_{ACD}(q)U_{BCD}(q),
```
the same argument gives $`r\ge\sqrt q`$: the shared source character space has dimension $`n+t`$, all three outer maps remove $`t`$ qudits, and the target common transfer space is scalar.

## 3. Scope

Bound (7) excludes a geodesic trade with $`r=p^{o(n)}`$ and $`N/M=p^{o(n)}`$ inside this global local stabilizer-map class. It permits dense Fourier and Clifford basis changes. The fourth-party map is unrestricted.

It does not apply merely because each branch of a sum uses Fourier matrices or Clifford maps. Choosing different Clifford operations conditional on a full-unit branch can produce a global local map that is not Clifford. Arbitrary complex filters, such controlled sums, and general Laurent families remain outside the statement.

The proof is a finite-dimensional Pauli transfer count. It is not a new spectral point, not a lower bound on unrestricted source overhead, and not evidence that the desired geodesic trade is false.

