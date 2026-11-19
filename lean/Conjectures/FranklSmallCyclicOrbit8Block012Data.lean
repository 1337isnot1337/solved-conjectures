module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 8. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: 0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P8.B012.Data

def representativeIds : List ℕ := [4852, 4853, 4854, 4855, 4856, 4857, 4858, 4859, 4860, 4861, 4862, 4863, 4864, 4865, 4866, 4867, 4868, 4869, 4870, 4871, 4872, 4873, 4874, 4875, 4876, 4877, 4878, 4879, 4880, 4881, 4882, 4883, 4884, 4885, 4886, 4887, 4888, 4889, 4890, 4891, 4892, 4893, 4894, 4895, 4896, 4897, 4898, 4899, 4900, 4901, 4902, 4903, 4904, 4905, 4906, 4907, 4908, 4909, 4910, 4911, 4912, 4913, 4914, 4915, 4916, 4917, 4918, 4919, 4920, 4921, 4922, 4923, 4924, 4925, 4926, 4927, 4928, 4929, 4930, 4931, 4932, 4933, 4934, 4935, 4936, 4937, 4938, 4939, 4940, 4941, 4942, 4943, 4944, 4945, 4946, 4947, 4948, 4949, 4950, 4951, 4952, 4953, 4954, 4955, 4956, 4957, 4958, 4959, 4960, 4961, 4962, 4963, 4964, 4965, 4966, 4967, 4968, 4969, 4970, 4971, 4972, 4973, 4974, 4975, 4976, 4977, 4978, 4979]

def sourceRows : List ℕ := [735, 1017, 1032, 81, 577, 1576, 1701, 702, 563, 1562, 1694, 695, 1715, 1600, 716, 601, 966, 1094, 1108, 994, 74, 118, 1537, 1670, 671, 32, 924, 849, 1706, 1586, 707, 587, 951, 1086, 1101, 980, 59, 110, 1515, 1644, 645, 10, 902, 823, 967, 1095, 1109, 995, 75, 119, 1538, 1671, 672, 33, 925, 850, 952, 1087, 1102, 981, 60, 111, 1516, 1645, 646, 11, 903, 824, 1633, 634, 1026, 1040, 90, 628, 1627, 1735, 736, 1027, 1041, 91, 629, 1628, 1736, 737, 1018, 1033, 82, 578, 1577, 1702, 703, 579, 1578, 1703, 704, 564, 1563, 1695, 696, 1597, 1532, 1665, 1583, 1510, 1639, 1533, 1666, 1511, 1640, 1620, 1728, 1621, 1729, 1556, 1570, 1571, 598, 666, 1596, 1531, 1664, 597, 665, 919, 918, 958, 987, 957]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4852; original row 735.
    { word := [0, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] },
    -- Representative 4853; original row 1017.
    { word := [0, 8, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4854; original row 1032.
    { word := [0, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 4855; original row 81.
    { word := [0, 0, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4856; original row 577.
    { word := [0, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 4857; original row 1576.
    { word := [0, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4858; original row 1701.
    { word := [0, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 4859; original row 702.
    { word := [0, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4860; original row 563.
    { word := [0, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 4861; original row 1562.
    { word := [0, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4862; original row 1694.
    { word := [0, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 4863; original row 695.
    { word := [0, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4864; original row 1715.
    { word := [0, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 4865; original row 1600.
    { word := [0, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4866; original row 716.
    { word := [0, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 4867; original row 601.
    { word := [0, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4868; original row 966.
    { word := [0, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4869; original row 1094.
    { word := [0, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4870; original row 1108.
    { word := [0, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4871; original row 994.
    { word := [0, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4872; original row 74.
    { word := [0, 0, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4873; original row 118.
    { word := [0, 0, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4874; original row 1537.
    { word := [0, 12, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 4875; original row 1670.
    { word := [0, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4876; original row 671.
    { word := [0, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 4877; original row 32.
    { word := [0, 0, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4878; original row 924.
    { word := [0, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 4879; original row 849.
    { word := [0, 8, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4880; original row 1706.
    { word := [0, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 4881; original row 1586.
    { word := [0, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4882; original row 707.
    { word := [0, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 4883; original row 587.
    { word := [0, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4884; original row 951.
    { word := [0, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4885; original row 1086.
    { word := [0, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4886; original row 1101.
    { word := [0, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4887; original row 980.
    { word := [0, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4888; original row 59.
    { word := [0, 0, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4889; original row 110.
    { word := [0, 0, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4890; original row 1515.
    { word := [0, 12, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 4891; original row 1644.
    { word := [0, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4892; original row 645.
    { word := [0, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 4893; original row 10.
    { word := [0, 0, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4894; original row 902.
    { word := [0, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 4895; original row 823.
    { word := [0, 8, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4896; original row 967.
    { word := [0, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4897; original row 1095.
    { word := [0, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4898; original row 1109.
    { word := [0, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4899; original row 995.
    { word := [0, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4900; original row 75.
    { word := [0, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4901; original row 119.
    { word := [0, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4902; original row 1538.
    { word := [0, 12, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4903; original row 1671.
    { word := [0, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4904; original row 672.
    { word := [0, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4905; original row 33.
    { word := [0, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4906; original row 925.
    { word := [0, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4907; original row 850.
    { word := [0, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4908; original row 952.
    { word := [0, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4909; original row 1087.
    { word := [0, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4910; original row 1102.
    { word := [0, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4911; original row 981.
    { word := [0, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4912; original row 60.
    { word := [0, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4913; original row 111.
    { word := [0, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4914; original row 1516.
    { word := [0, 12, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4915; original row 1645.
    { word := [0, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk32 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4916; original row 646.
    { word := [0, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4917; original row 11.
    { word := [0, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk33 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4918; original row 903.
    { word := [0, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4919; original row 824.
    { word := [0, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk34 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4920; original row 1633.
    { word := [0, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 4921; original row 634.
    { word := [0, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk35 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4922; original row 1026.
    { word := [0, 8, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4923; original row 1040.
    { word := [0, 8, 6, 10, 8, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk36 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4924; original row 90.
    { word := [0, 0, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 4925; original row 628.
    { word := [0, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }
  ]

def chunk37 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4926; original row 1627.
    { word := [0, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] },
    -- Representative 4927; original row 1735.
    { word := [0, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }
  ]

def chunk38 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4928; original row 736.
    { word := [0, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] },
    -- Representative 4929; original row 1027.
    { word := [0, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk39 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4930; original row 1041.
    { word := [0, 8, 6, 10, 8, 8, 12], weights := [0, 1, 0, 0] },
    -- Representative 4931; original row 91.
    { word := [0, 0, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk40 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4932; original row 629.
    { word := [0, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4933; original row 1628.
    { word := [0, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk41 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4934; original row 1736.
    { word := [0, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 4935; original row 737.
    { word := [0, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk42 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4936; original row 1018.
    { word := [0, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 4937; original row 1033.
    { word := [0, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk43 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4938; original row 82.
    { word := [0, 0, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 4939; original row 578.
    { word := [0, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk44 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4940; original row 1577.
    { word := [0, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 4941; original row 1702.
    { word := [0, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk45 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4942; original row 703.
    { word := [0, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 4943; original row 579.
    { word := [0, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }
  ]

def chunk46 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4944; original row 1578.
    { word := [0, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] },
    -- Representative 4945; original row 1703.
    { word := [0, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }
  ]

def chunk47 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4946; original row 704.
    { word := [0, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] },
    -- Representative 4947; original row 564.
    { word := [0, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk48 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4948; original row 1563.
    { word := [0, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 4949; original row 1695.
    { word := [0, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk49 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4950; original row 696.
    { word := [0, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 4951; original row 1597.
    { word := [0, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }
  ]

def chunk50 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4952; original row 1532.
    { word := [0, 12, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] },
    -- Representative 4953; original row 1665.
    { word := [0, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }
  ]

def chunk51 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4954; original row 1583.
    { word := [0, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] },
    -- Representative 4955; original row 1510.
    { word := [0, 12, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }
  ]

def chunk52 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4956; original row 1639.
    { word := [0, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] },
    -- Representative 4957; original row 1533.
    { word := [0, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }
  ]

def chunk53 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4958; original row 1666.
    { word := [0, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 4959; original row 1511.
    { word := [0, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }
  ]

def chunk54 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4960; original row 1640.
    { word := [0, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 4961; original row 1620.
    { word := [0, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }
  ]

def chunk55 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4962; original row 1728.
    { word := [0, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] },
    -- Representative 4963; original row 1621.
    { word := [0, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }
  ]

def chunk56 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4964; original row 1729.
    { word := [0, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 4965; original row 1556.
    { word := [0, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }
  ]

def chunk57 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4966; original row 1570.
    { word := [0, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] },
    -- Representative 4967; original row 1571.
    { word := [0, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }
  ]

def chunk58 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4968; original row 598.
    { word := [0, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] },
    -- Representative 4969; original row 666.
    { word := [0, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }
  ]

def chunk59 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4970; original row 1596.
    { word := [0, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] },
    -- Representative 4971; original row 1531.
    { word := [0, 12, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }
  ]

def chunk60 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4972; original row 1664.
    { word := [0, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] },
    -- Representative 4973; original row 597.
    { word := [0, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }
  ]

def chunk61 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4974; original row 665.
    { word := [0, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] },
    -- Representative 4975; original row 919.
    { word := [0, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }
  ]

def chunk62 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4976; original row 918.
    { word := [0, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] },
    -- Representative 4977; original row 958.
    { word := [0, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }
  ]

def chunk63 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 4978; original row 987.
    { word := [0, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] },
    -- Representative 4979; original row 957.
    { word := [0, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }
  ]

def entries : List FranklSmallCyclic.Weights.Entry :=
  chunk0 ++ chunk1 ++ chunk2 ++ chunk3 ++ chunk4 ++ chunk5 ++ chunk6 ++ chunk7 ++ chunk8 ++ chunk9 ++ chunk10 ++ chunk11 ++ chunk12 ++ chunk13 ++ chunk14 ++ chunk15 ++ chunk16 ++ chunk17 ++ chunk18 ++ chunk19 ++ chunk20 ++ chunk21 ++ chunk22 ++ chunk23 ++ chunk24 ++ chunk25 ++ chunk26 ++ chunk27 ++ chunk28 ++ chunk29 ++ chunk30 ++ chunk31 ++ chunk32 ++ chunk33 ++ chunk34 ++ chunk35 ++ chunk36 ++ chunk37 ++ chunk38 ++ chunk39 ++ chunk40 ++ chunk41 ++ chunk42 ++ chunk43 ++ chunk44 ++ chunk45 ++ chunk46 ++ chunk47 ++ chunk48 ++ chunk49 ++ chunk50 ++ chunk51 ++ chunk52 ++ chunk53 ++ chunk54 ++ chunk55 ++ chunk56 ++ chunk57 ++ chunk58 ++ chunk59 ++ chunk60 ++ chunk61 ++ chunk62 ++ chunk63

theorem representativeIds_length : representativeIds.length = 128 := by decide +kernel

theorem sourceRows_length : sourceRows.length = 128 := by decide +kernel

theorem entries_length : entries.length = 128 := by decide +kernel

theorem representativeIds_nodup : representativeIds.Nodup := by decide +kernel

def entryAt (index : Fin 128) : FranklSmallCyclic.Weights.Entry :=
  entries.get ⟨index.val, by simpa only [entries_length] using index.isLt⟩

theorem entryAt_mem (index : Fin 128) : entryAt index ∈ entries :=
  List.get_mem _ _

end FranklSmallCyclic.OrbitBatches.P8.B012.Data
