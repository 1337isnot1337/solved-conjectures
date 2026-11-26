# Wang–Yang's Fuss–Narayana conjecture

Yi Wang and Arthur L. B. Yang conjectured total nonnegativity of the four Fuss–Narayana triangles and strict total positivity of the two Fuss–Narayana squares for every integer parameter $m\ge 2$. The proof here establishes all six statements, including minors on arbitrary row and column sets. The package is on the research branch for independent mathematical review. [Journal paper, Conjecture 4.1](https://cfc.nankai.edu.cn/_upload/article/files/ca/07/264e89bc4d9bb418a6d91d482b90/ef62459f-bec2-470d-8199-b57a790de20a.pdf) · [Review thread](https://github.com/1337isnot1337/solved-conjectures/issues/98)

The [proof](proof.md) evaluates determinants of successive products of linear fractions. Expanding the two squares into intermediate columns puts their minors under a strict positivity test. Ordered knots treat the two forward triangles, and the Galvin–Pacurar change-of-basis theorem treats both row reversals. The [source audit](sources.md) identifies prior results and the repository's earlier work.

Run `python3 results/wang-yang-fuss-narayana/check.py` from the repository root to check the six source matrices against the formulas in the proof. The script checks 3,168 product identities and all 82,344 minors of their leading order-seven sections at $m=2,3,5,11$ with exact arithmetic. [Reproducible check](check.py)
