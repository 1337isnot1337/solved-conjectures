#!/usr/bin/env python3
"""Propose compact share-transfer certificates; Lean checks every transfer.

The maximum-flow relaxation is only a search heuristic. The generated proof
uses Conjectures.FranklShareFlow, with no flow optimality premise.
"""
from __future__ import annotations
import argparse
from collections import deque
from pathlib import Path
from time import monotonic
from generate_lean_fc_certificates import PATTERNS, elements, unions, lean_set

class Dinic:

    def __init__(self, n):
        self.g = [[] for _ in range(n)]

    def edge(self, a, b, c):
        x = [b, c, None]
        y = [a, 0, x]
        x[2] = y
        self.g[a].append(x)
        self.g[b].append(y)
        return x

    def run(self, s, t):
        flow = 0
        n = len(self.g)
        while True:
            lev = [-1] * n
            lev[s] = 0
            q = deque([s])
            while q:
                v = q.popleft()
                for w, c, r in self.g[v]:
                    if c > 0 and lev[w] < 0:
                        lev[w] = lev[v] + 1
                        q.append(w)
            if lev[t] < 0:
                return (flow, lev)
            it = [0] * n

            def dfs(v, f):
                if v == t:
                    return f
                while it[v] < len(self.g[v]):
                    e = self.g[v][it[v]]
                    w, c, r = e
                    if c > 0 and lev[w] == lev[v] + 1:
                        z = dfs(w, min(f, c))
                        if z:
                            e[1] -= z
                            r[1] += z
                            return z
                    it[v] += 1
                return 0
            while True:
                z = dfs(s, 10 ** 12)
                if not z:
                    break
                flow += z

def search(name, limit=10000):
    n, gs, w = PATTERNS[name]
    N = 1 << n
    base = unions(gs)
    sh = [sum(((1 if s >> i & 1 else -1) * wi for i, wi in enumerate(w))) for s in range(N)]
    inf = 1 + sum((abs(x) for x in sh))
    calls = 0
    plans = []
    nodes = []

    def relax(f, e):
        d = Dinic(N + 2)
        S = N
        T = N + 1
        arcs = []
        for a in range(N):
            d.edge(S, a, max(-sh[a], 0) + (inf if f >> a & 1 else 0))
            d.edge(a, T, max(sh[a], 0) + (inf if e >> a & 1 else 0))
            seen = set()
            for b in (*base, *elements(f)):
                v = a | b
                if v != a and v not in seen:
                    arcs.append((a, b, d.edge(a, v, inf)))
                    seen.add(v)
        flow, lev = d.run(S, T)
        adj = sh[:]
        plan = []
        for a, b, edge in arcs:
            m = inf - edge[1]
            if m:
                adj[a] += m
                adj[a | b] -= m
                plan.append((a, b, m))
        lower = sum((adj[a] if f >> a & 1 else 0 if e >> a & 1 else min(adj[a], 0) for a in range(N)))
        return (lower, plan, [a for a in range(N) if lev[a] >= 0])

    def go(f, e):
        nonlocal calls
        calls += 1
        if calls > limit:
            raise RuntimeError('limit')
        if f & e:
            return ('bound',)
        lo, plan, U = relax(f, e)
        if lo >= 0:
            plans.append(len(plan))
            return ('flow', plan)
        us = set(U)
        assert sum((sh[a] for a in U)) < 0, (lo, sum((sh[a] for a in U)))
        viol = [(a, b) for a in U for b in U if a | b not in us]
        if not viol:
            raise RuntimeError(('counterexample', U))
        a, b = min(viol, key=lambda ab: (sh[ab[0]], sh[ab[1]], ab))
        assert not (f | e) >> a & 1
        left = go(f, e | 1 << a)
        nf = f | 1 << a
        for b in (*base, *elements(f)):
            nf |= 1 << (a | b)
        right = go(nf, e)
        return ('split', a, left, right)
    start = monotonic()
    tree = go(0, 0)
    print(name, 'calls', calls, 'flow_leaves', len(plans), 'transfers', sum(plans), 'seconds', round(monotonic() - start, 2), flush=True)
    return tree

def emit(name, tree):
    n, generators, weights = PATTERNS[name]
    title = "".join(part.title() for part in name.split("_"))
    namespace = "Frankl.FC." + ("SmallCyclicPasch" if name == "pasch" else "Vaughan" + title)
    base = unions(generators)
    lines = [
        "module",
        "",
        "public import Conjectures.FranklFC",
        "public import Conjectures.FranklShareFlowPointwise",
        "",
        "@[expose] public section",
        "",
        "set_option maxRecDepth 20000",
        "set_option maxHeartbeats 0",
        "set_option Elab.async false",
        "",
        f"namespace {namespace}",
        "",
        "/-! Proposed by generate_lean_fc_flow.py. Every membership branch,",
        "share transfer, and leaf bound is checked by the Lean kernel below. -/",
        "",
        f"def ground : Finset ℕ := Finset.range {n}",
        f"def weights (i : ℕ) : ℕ := ({list(weights)} : List ℕ).getD i 0",
        "def base : Finset (Finset ℕ) := {" + ", ".join(map(lean_set, base)) + "}",
        "",
    ]
    nodes = []
    proofs = []

    def lean_family(mask):
        return "∅" if mask == 0 else "{" + ", ".join(
            lean_set(a) for a in elements(mask)) + "}"

    def visit(node, forced, excluded):
        kind = node[0]
        if kind == "split":
            a = node[1]
            next_forced = forced | (1 << a)
            for b in (*base, *elements(forced)):
                next_forced |= 1 << (a | b)
            next_excluded = excluded | (1 << a)
            left = visit(node[2], forced, next_excluded)
            right = visit(node[3], next_forced, excluded)
            expression = f".split ({lean_set(a)} : Finset ℕ) c{left} c{right}"
        else:
            entries = [] if kind == "bound" else node[1]
            plan = "[" + ",\n    ".join(
                "⟨" + lean_set(a) + ", " + lean_set(b) + ", " + str(m) + "⟩"
                for a, b, m in entries) + "]"
            expression = ".leaf " + plan
        i = len(nodes)
        nodes.append(f"private def c{i} : ShareFlow.Certificate (Finset ℕ) :=\n  {expression}")
        header = (
            f"private theorem checked{i} :\n"
            "    ShareFlow.check (fun A B => A ∪ B) base ground.powerset\n"
            f"      (share ground weights) ({lean_family(forced)}) "
            f"({lean_family(excluded)}) c{i} = true := by\n")
        if kind == "split":
            body = (
                "  apply ShareFlow.check_split\n"
                f"  · have he : insert ({lean_set(a)} : Finset ℕ) "
                f"({lean_family(excluded)} : Finset (Finset ℕ)) = "
                f"{lean_family(next_excluded)} := by decide +kernel\n"
                f"    rw [he]\n    exact checked{left}\n"
                f"  · have hf : ShareSearch.infer (fun A B => A ∪ B) base "
                f"({lean_family(forced)}) ({lean_set(a)} : Finset ℕ) = "
                f"{lean_family(next_forced)} := by decide +kernel\n"
                f"    rw [hf]\n    exact checked{right}")
        else:
            body = "  apply ShareFlow.check_leaf_of_pointwise\n  decide +kernel"
        proofs.append(header + body)
        return i

    root = visit(tree, 0, 0)
    lines.extend(nodes)
    lines.append("")
    lines.extend(proofs)
    lines.extend([
        "",
        f"@[no_expose] def certificate : ShareFlow.Certificate (Finset ℕ) := c{root}",
        "",
        "theorem checked :",
        "    ShareFlow.check (fun A B => A ∪ B) base ground.powerset",
        "      (share ground weights) ∅ ∅ certificate = true := by",
        f"  exact checked{root}",
        "",
        "theorem extension_share_nonnegative {family : Finset (Finset ℕ)}",
        "    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family)",
        "    (hd : family ⊆ ground.powerset) :",
        "    0 ≤ ∑ S ∈ family, share ground weights S :=",
        "  ShareFlow.certificate_nonnegative certificate checked hc hd",
        "",
        "theorem abundant {family : Finset (Finset ℕ)}",
        "    (hu : UnionClosed family) (hb : base ⊆ family) :",
        "    ∃ x ∈ ground, 0 < weights x ∧ Abundant family x := by",
        "  apply abundant_of_extension_shares hu hb (by decide +kernel)",
        "    (by refine ⟨0, ?_, ?_⟩ <;> decide +kernel)",
        "  exact fun _ hd hc => extension_share_nonnegative hc hd",
        "",
        f"end {namespace}",
        "",
    ])
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pattern", choices=PATTERNS)
    parser.add_argument("--node-limit", type=int, default=10000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    tree = search(args.pattern, args.node_limit)
    filename = ("FranklSmallCyclicPaschCertificate.lean" if args.pattern == "pasch" else
                "FranklVaughan" + "".join(p.title() for p in args.pattern.split("_")) + ".lean")
    output = args.output or Path(__file__).resolve().parents[2] / "lean" / "Conjectures" / filename
    output.write_text(emit(args.pattern, tree))
    print(output.name)

if __name__ == "__main__":
    main()
