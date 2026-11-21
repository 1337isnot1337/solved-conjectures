# Perron root of permanental compounds: additional priority audit

Audit date: 20 November 2026 (America/Chicago). This supplements the existing source audit; it does not introduce another result or recheck the proof.

## Conclusion

No earlier theorem with the candidate's full domain was found: a relative FPRAS for $`\rho(P_k(A))`$, uniform in $`k`$, for every nonnegative rational square matrix, including reducible, periodic, and nonsymmetric inputs with zero diagonal. The new sources below contain relevant methods, but none of the inspected statements gives that theorem. Priority remains provisional.

The most substantial new overlap is a 2026 theorem on spectral growth across the homogeneous sectors of stability-preserving semigroups. It reinforces the need to credit the coefficient-log-concavity-to-spectral-growth argument as an established method. The candidate's claimed contribution remains its uniform comparison between the grand trace and the maximum compound Perron root, followed by the fugacity and permanent-oracle reduction.

## Stability-preserving semigroups

Dongsheng Wei, [*Generators of stability-preserving semigroups, spectral gaps, and classical ground-state computation*, arXiv:2609.26802v2](https://arxiv.org/html/2609.26802v2), is a preexisting 2026 preprint. The primary arXiv HTML was retrieved successfully, and Theorems 6.1 and 7.1 and Appendix C were inspected.

Theorem 7.1 states that the spectral abscissae of homogeneous sectors form a concave sequence when the generator preserves degree, has nonnegative off-diagonal coefficients, and generates a semigroup preserving nonnegative real stability. It allows reducible and nonsymmetric generators. Its proof applies Newton's inequalities to coefficient sums and passes to exponential growth rates.

Theorem 6.1 approximates the principal eigenvalue of a damped local generator to additive error. Its polynomial bound fixes the interaction degree, local norm bound, and strictly positive damping; the exponent depends on their ratios. This is not the arbitrary-input discrete-transfer theorem required by P18.

Appendix C, Theorem C.1, also precludes an automatic extension through flow factorization: nontrivial coordinate permutations lie outside the relative closure of finite products of invertible disk-stability-preserving one-parameter flows. This is the source's stated theorem, not a new claim here. It blocks a general identification of discrete preservers with such flows. No compound FPRAS or uniform grand-trace bound was identified.

Weiqi Jiang, [*Discrete Concavity of Token-Graph Spectral Radii via Lorentzian Semigroups*, arXiv:2609.25037v1](https://arxiv.org/html/2609.25037v1), independently uses the same limiting method. The primary HTML was retrieved; Theorems 1.1–1.2, the model definition, and the growth-rate argument were inspected. For weighted undirected token graphs, write


```math
H_k^{(\theta)}=A_k+\theta D_k,\qquad -1\leq\theta\leq1.
```


The finite-time theorem gives log-concavity in $`k`$ of


```math
\binom nk^{-1}\mathbf 1^*e^{tH_k^{(\theta)}}\mathbf 1.
```


The large-time limit yields concavity of the largest eigenvalues. The paper does not state an approximation algorithm. Its token adjacency operators move one particle along an undirected edge; they are not the arbitrary discrete permanental compounds in P18.

**Scope inference.** Preservation by each iterate of $`T_A`$ does not by itself establish preservation by $`e^{t(T_A-I)}`$. Neither source supplies that missing implication, a replacement reduction, or a relative FPRAS for all $`P_k(A)`$. Their spectral concavity results should therefore be recorded as overlap in ingredients.

## Quantum partition-function algorithms

[Sergey Bravyi and David Gosset, *Polynomial-time classical simulation of quantum ferromagnets*, arXiv:1612.05602](https://arxiv.org/html/1612.05602), Theorem 1, approximates the Gibbs partition function of the specified Hermitian family


```math
H=\sum_{i\lt j}(-b_{ij}X_iX_j+c_{ij}Y_iY_j)
  +\sum_i d_i(I+Z_i),\qquad |c_{ij}|\leq b_{ij}.
```


After normalizing coefficient magnitudes, its randomized runtime is polynomial in the number of qubits, inverse temperature, and inverse relative accuracy. The proof uses a weighted-perfect-matching representation of a Trotterized trace. Choosing sufficiently large inverse temperature then gives an additive approximation to ground energy. The primary HTML was retrieved; the model, Theorems 1–2, and the trace-to-matching construction were inspected.

[Chaithanya Rayudu and Jun Takahashi, *Fast mixing of operator-loop path-integral quantum Monte Carlo for stoquastic XY Hamiltonians*, arXiv:2509.21683v1](https://arxiv.org/html/2509.21683v1), improves the algorithm for that Hamiltonian family. Its primary HTML, introduction, result statement, and open-problems section were inspected. It proves polynomial mixing of the specified operator-loop chain and derives a partition-function approximation through counting-to-sampling reduction. The paper explicitly leaves broader Hamiltonian extensions open.

**Scope inference.** These are genuine older trace-approximation algorithms. Their hypotheses concern a particular real Hermitian local Hamiltonian and its Gibbs exponential. Arbitrary $`P_k(A)`$ can be nonsymmetric and periodic. Applying either theorem to all such compounds would require an additional reduction not present in the inspected sources. Merely identifying permanents or particle occupations in both constructions is insufficient.

[Benjamin Wong, Sergey Bravyi, David Gosset, and Yinchen Liu, *Lee–Yang tensors and Hamiltonian complexity*, arXiv:2602.03605v1](https://arxiv.org/html/2602.03605v1), was also retrieved from primary arXiv HTML. Its introduction and tensor definitions were inspected. The stated spectral result concerns Hermitian operators with Lee–Yang radius greater than one, and its circuit result is quasipolynomial quantum state preparation. It does not state the required arbitrary nonnegative-compound FPRAS in the inspected sections. This is a narrower examination than a full proof review of that paper.

## Transfer matrices and remaining access limits

[Mordecai J. Golin, Yiu Cho Leung, and Yajun Wang, *Permanents of Circulants: a Transfer Matrix Approach*](https://cse.hkust.edu.hk/~golin/pubs/Perm_ANALCO_06_Long.pdf), is available as a 15-page author-hosted extended abstract. Its abstract and introduction, including the stated complexity dependence, were inspected. The transfer construction handles fixed-jump and specified linear-jump circulant families. Its setup cost depends exponentially on the width parameter. It supplies older cycle-cover transfer methods, not a uniform FPRAS for arbitrary compound Perron roots.

Two access limitations remain concrete:

- The original Minc 1986 research-problems note was not obtained. Additional exact-title and bibliographic searches did not verify a DOI. This preserves the existing audit's access limit.
- The apparently promising [Kazan repository PDF for Al'pina–Al'pin](https://dspace.kpfu.ru/xmlui/bitstream/net/138702/-1/SCOPUS10723374-2006-132-2-SID28044468398-a1.pdf) is only a one-page metadata/abstract record. It does not remove the English full-text access limit. The original Russian paper had already been located in the earlier audit.

The [Bebiano–Li–da Providência 2000 journal PDF](https://journals.uwyo.edu/index.php/ela/article/download/97/97/97) was located, but its text extraction is corrupted. No conclusion about its full body is based on that extraction. The publisher record confirms the title and bibliographic identity only. Likewise, Huillet's [*Occupancy statistics arising from weighted particle rearrangements*](https://doi.org/10.1088/1751-8113/40/31/001) was located through the publisher abstract, while the HAL full-text request was denied. These are recorded access limits, not papers claimed to have been read completely.

## Retrieval and search record

Searches expanded the earlier audit through stability-preserving semigroups, token graphs, bosonic occupation operators, quantum Gibbs traces, transfer matrices, and exact/alternate permanental-compound and zeon terminology. Both search engines were used. Direct web opens of several arXiv pages returned `DisabledError`; public HTTPS retrieval from arXiv succeeded separately. The mathematical assessments above use the retrieved primary HTML, not mirror descriptions. [Retrieval records](priority-source-records.json) distinguish inspected sections from searches of a complete HTML body.

No additional resolution is counted, and no fixed-degree or structured-matrix result is substituted for the full candidate theorem.
