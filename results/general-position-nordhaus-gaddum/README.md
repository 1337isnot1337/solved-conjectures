# Chandran–Di Stefano–Haritha–Thomas–Tuite general-position conjecture

**True.** For every finite graph on $n$ vertices, the independent general-position chromatic numbers of the graph and its complement sum to at most $n+1$ and multiply to at most $((n+1)/2)^2$. The proof gives a stronger mixed bound: the independent general-position chromatic number of the graph plus the ordinary chromatic number of its complement is at most $n+1$.

- [Complete written proof](PROOF.md)
- [Source, priority and review](AUDIT.md)
- [Independent finite checker](verify.py), run with the Python standard library using `python3 verify.py`
- [Discovery issue #851](https://github.com/1337isnot1337/solved-conjectures/issues/851)

This resolves both general-position assertions of Conjecture 9.3. They use shortest paths, not all induced paths. The [separate monophonic product assertion is false](../monophonic-product-nordhaus-gaddum/). The written proof does not depend on the checker or on Lean. No external refereeing is claimed.
