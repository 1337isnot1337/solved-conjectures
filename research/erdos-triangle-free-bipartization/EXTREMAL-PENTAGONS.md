# Retaining the residual optimal cut forces more pentagons

Let W maximize the ordered monochromatic mass m among all triangle-free graphons. If m>2/25, then W has C₅ homomorphism density greater than 0.00005620. The new point is to combine the two-root cut in [EDGE-PENTAGONS](EDGE-PENTAGONS.md) with an optimal cut of the residual region, without introducing an uncontrolled mixed term. The result is an extremal restriction, not a universal upper bound on m.

Choose a zero-one maximizing W, as in [SATURATION](SATURATION.md). For ordered edge roots x,y use the same A,B,D, r=|D|, p_D, a,b and w(A,B) as before. Put Q=∫_D |a−b|. Let g:D→{−1,1} give a cut minimizing the ordered monochromatic mass m_D restricted to D (or an arbitrarily close approximation). Maximality on the full triangle-free graphon space gives m_D≤m r², by normalization of D.

Keep signs + on A and − on B. Let ξ be a fair global sign. On D use fractional signs with mean (ξg+h)/2, where h=−sign(a−b). This lies in [−1,1] and can be implemented as a mixture of cuts up to arbitrarily small graphon error. To see the latter directly, approximate the kernel and the means by finite step functions and subdivide each step into a positive and a negative piece with the prescribed proportions. The resulting quadratic integral tends to the fractional signed moment. Average over ξ. The mixed g–h term in the quadratic moment on D disappears; the remaining terms are at most

    (1/4)(2m_D−p_D) + (1/4)p_D = m_D/2.

The mean sign on D is h/2, so the cut inequality becomes

    m ≤ p/2 − w(A,B) − Q/2 + m_D/4.

Now insert Q≥I−2√(rJ), and average the moments from [EDGE-PENTAGONS](EDGE-PENTAGONS.md). The two C₄ terms cancel exactly. It follows that

    m(1−E r²/4) ≤ p/2 − t(P₄)/p + √[(E r)t(C₅)/p].

In particular E r≤1−2p and t(P₄)≥p³. Every maximizing W has minimum degree at least 2m≥4/25 ([the variation argument](GRAPHON-EXTREMIZERS.md)), so r≤17/25 almost surely, yielding E r²≤(17/25)(1−2p). A maximizing counterexample is in the middle density band and therefore p≥a=1243/5000. Since p/2−p²≤1/16, rearranging gives

    t(C₅) > [a/(1−2a)] · [(2/25)(1−(17/100)(1−2a))−1/16]²
          = 0.0000562052254… .

Both factors on the right of the intermediate bound with p in place of a increase with p in the relevant interval; the bracket is already positive at a. A stronger optimization could retain both path and degree moments rather than discard them separately.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
