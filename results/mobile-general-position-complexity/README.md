# Mobile general position complexity

**Solved.** The mobile general position threshold problem is PSPACE-complete even on diameter-two graphs with a majority of universal vertices. Checking a supplied initial configuration, and the variant where every robot must visit every vertex, are PSPACE-complete on the same family.

The reduction converts proper four-colouring reachability to covering a clique-reconfiguration component. A bank of universal vertices forces the mobile configurations to be cliques and implements the necessary addition/removal moves.

[Proof](PROOF.md) · [Literature and verification audit](AUDIT.md) · [Exact move checker](verify.py) · [Exact formula on three-layer cones](CONE.md)
