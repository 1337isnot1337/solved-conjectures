# Estrugo–Pastine’s star-center degree question

Can a largest star of independent $r$-sets always be centered at a vertex of degree $\delta(G)+o(n)$ in an $n$-vertex graph?

The unrestricted question already follows from Feghali–Johnson–Thomas by replacing vertices with cliques. The independent review supplies that deduction. This research note retains two quantitative strengthenings. [Review and priority correction](https://github.com/1337isnot1337/solved-conjectures/issues/782#issuecomment-7187707661)

A tree on $22d+1$ vertices has a **unique** maximum $(15d-1)$-center of degree $d$, for every $d\ge3$. Every other vertex belongs to fewer independent sets of that size. For general connected graphs, even at a fixed rank $r\ge3$, the minimum degree among maximizing vertices can exceed the graph minimum degree by $n-o(n)$.

[Proof](proof.md) · [Source and priority audit](sources.md) · [Exact check](check.py) · [Issue 782](https://github.com/1337isnot1337/solved-conjectures/issues/782)

Hurlbert and Kamat give the question and its attribution in the last paragraph of §4. Feghali, Johnson and Thomas introduced related rooted-tree counterexamples with prescribed degree and distance from the leaves. The proof here counts independent sets two below the maximum to obtain a degree proportional to the order. [Question as printed](https://glennhurlbert.github.io/Papers/IFISTpub.pdf) · [Earlier rooted-tree construction](https://arxiv.org/abs/1506.07741)
