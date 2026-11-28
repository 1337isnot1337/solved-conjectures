# A single interaction cycle obstructs common compound weights

2026-11-24. Follow-up to the forest composition theorem in PROOF.md. The statement below concerns the stronger simultaneous compound-coupling property, not a counterexample to the Marcus–de Oliveira conjecture. General failure of common weights was known to Drury; we isolate failure already at one interaction cycle of two-coordinate factors. No priority claim; in particular the September 2026 Holden analysis includes orthogonal/quaternion obstruction families, and overlap of the explicit family below with earlier examples is not ruled out.

## The certificate

Use coordinates 0,1,2,3. For a permutation pi, the implication

~~~math
\pi(\{0,3\})=\{0,1\}\quad\Longrightarrow\quad
\pi(0)=0\ \text{or}\ \pi(2)=2\ \text{or}\ \pi(\{2,3\})=\{0,3\}
~~~

holds. Indeed, if the first alternative fails, pi(0)=1 and pi(3)=0; then pi(2) is either 2 or 3, giving the second or third alternative. Taking probabilities under any common permutation law yields the necessary inequality

~~~math
|U_{00}|^2+|U_{22}|^2+
|\det U[\{0,3\},\{2,3\}]|^2
-|\det U[\{0,1\},\{0,3\}]|^2\geq 0.
~~~

Let R_ij(c,s) be identity off the ordered coordinates (i,j) and act on them by the real rotation [[c,-s],[s,c]], with c^2+s^2=1. Define

~~~math
U=R_{12}(c,-s)R_{30}(c,s)R_{23}(c,s)R_{01}(c,s).
~~~

These four local supports form a single cycle (cycle rank one for the coordinate-factor incidence graph); no edge repeats. Multiplication gives

~~~math
U=\begin{pmatrix}
c^2&-cs&s^2&cs
\\ cs&c^2&cs&-s^2
\\ -s^2&-cs&c^2&-cs
\\ -cs&s^2&cs&c^2
\end{pmatrix}.
~~~

The two singleton squares in the certificate are each c^4. The positive two-minor is c^2 s^2-c^2 s^2=0; the negative two-minor before squaring is -2c^2s^2. Thus the left side is exactly

~~~math
2c^4(1-2s^4),
~~~

strictly negative whenever c is nonzero and s^4>1/2. In particular take c=5/13, s=12/13: the left side is -16138750/815730721. This proves that the forest composition theorem cannot be extended to all one-cycle circuits while retaining simultaneous spectrum-independent weights.

For any n>=4, embedding these four coordinates and adjoining identity coordinates gives the same obstruction: a common law would force every auxiliary coordinate to be fixed almost surely by its singleton probability one, and then restrict to a common law on the original four coordinates.

## Audit

- The event implication is a direct exhaustion of the two possible remaining images of coordinate 2; it does not require a probability law to be supported on products of the four gate transpositions. It excludes every law on S_4.
- The matrix is orthogonal by its explicit product of rotations, with no floating-point dependence.
- All signs and index sets in the displayed certificate are explicit. The rational witness and the family sign criterion can be checked by hand.
- A floating-point linear feasibility search suggested the four-term inequality; the displayed proof and rational computation supersede the numerical evidence.
- This does not establish that any particular spectra escape their determinant hull. Common weights are sufficient, not necessary for the original conjecture. The original named conjecture remains unresolved.
- A useful next question is whether the spectrum-dependent determinant convexity survives arbitrary single-cycle factors despite this exact failure of common weights. The forest proof alone cannot address it.

## Prior art and scope

Drury's counterexamples to the general compound-coupling assertion predate this work; see https://doi.org/10.1016/0024-3795(94)00361-0 and the prior research notebook. Holden's September 2026 report (https://clopen.solutions/submissions/openproblemsinnla-holden-mi05-2026-09-13-report/v1/) treats order-four orthogonal obstructions and mentions a quaternion family. We claim only a verified research-route boundary for the specific local factorization, not a new refutation of the previously disproved stronger conjecture or a new priority claim.
