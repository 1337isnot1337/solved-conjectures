# Sources for the AGY Stepanov upper bound

These nine files are from [AxiomMath/Stacks at `f56a316ddf7a930906d88b78d6f9a2668cffd0cf`](https://github.com/AxiomMath/Stacks/tree/f56a316ddf7a930906d88b78d6f9a2668cffd0cf), licensed under [Apache 2.0](LICENSE).
They were relocated, with internal imports adjusted. The rest of the library is not imported.

`StepanovUpperBound.lean` uses a finite vector of coefficients for its
finite-rank argument. `PlaneCurvePointUpperBound.lean` separates the parameter
proof from its sufficient threshold: the argument only needs `2*k*B ≤ σ`,
so the AGY adapter can use the stronger field-size information available here.

- `BivariateWeightedDegree.lean`: [StacksFrontier.RingTheory.Polynomial.BivariateWeightedDegree](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/BivariateWeightedDegree.lean)
- `CurveDerivation.lean`: [StacksFrontier.RingTheory.Polynomial.CurveDerivation](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/CurveDerivation.lean)
- `PowerSeriesBranch.lean`: [StacksFrontier.RingTheory.Polynomial.PowerSeriesBranch](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/PowerSeriesBranch.lean)
- `ResultantWeightedDegree.lean`: [StacksFrontier.RingTheory.Polynomial.ResultantWeightedDegree](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/ResultantWeightedDegree.lean)
- `PlaneCurveIntersection.lean`: [StacksFrontier.RingTheory.Polynomial.PlaneCurveIntersection](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/PlaneCurveIntersection.lean)
- `OrderOfDerivative.lean`: [StacksFrontier.RingTheory.PowerSeries.OrderOfDerivative](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/PowerSeries/OrderOfDerivative.lean)
- `FrobeniusIndependence.lean`: [StacksFrontier.RingTheory.PowerSeries.FrobeniusIndependence](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/PowerSeries/FrobeniusIndependence.lean)
- `StepanovUpperBound.lean`: [StacksFrontier.RingTheory.Polynomial.StepanovUpperBound](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/StepanovUpperBound.lean)
- `PlaneCurvePointUpperBound.lean`: [StacksFrontier.RingTheory.Polynomial.PlaneCurvePointUpperBound](https://github.com/AxiomMath/Stacks/blob/f56a316ddf7a930906d88b78d6f9a2668cffd0cf/StacksFrontier/RingTheory/Polynomial/PlaneCurvePointUpperBound.lean)
