module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated stress representatives from the frozen orbit candidate data.
Rows are ordered by period/support/local-generator cost, then class ID.
The arithmetic proof module checks the actual period-nine masks.

Orbit packet SHA256: 0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c
-/
@[expose] public section

namespace FranklSmallCyclic.Orbit128Data

def representativeIds : List ℕ := [6777, 6789, 6866, 6882, 6747, 6759, 6762, 6770, 6771, 6772, 6778, 6779, 6785, 6791, 6792, 6793, 6794, 6795, 6799, 6811, 6815, 6817, 6823, 6824, 6839, 6840, 6842, 6846, 6867, 6868, 6870, 6875, 6883, 6884, 6886, 6895, 6906, 6919, 6925, 6935, 6943, 6996, 7001, 7005, 7006, 7053, 7084, 7102, 7206, 7207, 7209, 7216, 7224, 7257, 7259, 7265, 7267, 7324, 7326, 7429, 7488, 7492, 7560, 7664, 7677, 7685, 7721, 7729, 7737, 7741, 7883, 7907, 8153, 8169, 8513, 8560, 8562, 6740, 6748, 6749, 6751, 6758, 6761, 6763, 6765, 6766, 6773, 6774, 6775, 6780, 6781, 6786, 6787, 6796, 6797, 6798, 6801, 6804, 6812, 6813, 6816, 6818, 6819, 6825, 6826, 6827, 6828, 6829, 6834, 6841, 6843, 6844, 6847, 6848, 6850, 6854, 6869, 6871, 6874, 6876, 6879, 6881, 6885, 6888, 6889, 6890, 6894, 6896]

def sourceRows : List ℕ := [8372, 8309, 6330, 6331, 4094, 8084, 8085, 8358, 8397, 7499, 8350, 8367, 7592, 8302, 7537, 8042, 8200, 8112, 3349, 4033, 3970, 3158, 4066, 3103, 5919, 4595, 6026, 4662, 6208, 5000, 5310, 1503, 6209, 5001, 5311, 1504, 1308, 6553, 6554, 5720, 5841, 7773, 7774, 7716, 7714, 6028, 6312, 6313, 9057, 8717, 8722, 8096, 8097, 3297, 3295, 3360, 3361, 4070, 4075, 3389, 6320, 6321, 6045, 6582, 5780, 5781, 6565, 6566, 6623, 6624, 5779, 6034, 4041, 3365, 6287, 5751, 6325, 4096, 4089, 4092, 3292, 8011, 8012, 7895, 7521, 8055, 7410, 8253, 7495, 8345, 8231, 7470, 7583, 8193, 7532, 8037, 3070, 3071, 3668, 2483, 3862, 2948, 2576, 3701, 2521, 3028, 4056, 3098, 5956, 4504, 5915, 4591, 4569, 4653, 1452, 6093, 4845, 792, 1482, 1435, 504, 776, 4846, 6136, 6115, 4916, 1483, 1436]

def chunk0 : List Weights.Entry :=
  [
    -- Representative 6777, original row 8372, local generators 12.
    { word := [10, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] },
    -- Representative 6789, original row 8309, local generators 12.
    { word := [10, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }
  ]

def chunk1 : List Weights.Entry :=
  [
    -- Representative 6866, original row 6330, local generators 12.
    { word := [8, 10, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] },
    -- Representative 6882, original row 6331, local generators 12.
    { word := [8, 10, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }
  ]

def chunk2 : List Weights.Entry :=
  [
    -- Representative 6747, original row 4094, local generators 11.
    { word := [6, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6759, original row 8084, local generators 11.
    { word := [10, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk3 : List Weights.Entry :=
  [
    -- Representative 6762, original row 8085, local generators 11.
    { word := [10, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 6770, original row 8358, local generators 11.
    { word := [10, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }
  ]

def chunk4 : List Weights.Entry :=
  [
    -- Representative 6771, original row 8397, local generators 11.
    { word := [10, 10, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] },
    -- Representative 6772, original row 7499, local generators 11.
    { word := [10, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk5 : List Weights.Entry :=
  [
    -- Representative 6778, original row 8350, local generators 11.
    { word := [10, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] },
    -- Representative 6779, original row 8367, local generators 11.
    { word := [10, 10, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }
  ]

def chunk6 : List Weights.Entry :=
  [
    -- Representative 6785, original row 7592, local generators 11.
    { word := [10, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6791, original row 8302, local generators 11.
    { word := [10, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }
  ]

def chunk7 : List Weights.Entry :=
  [
    -- Representative 6792, original row 7537, local generators 11.
    { word := [10, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6793, original row 8042, local generators 11.
    { word := [10, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk8 : List Weights.Entry :=
  [
    -- Representative 6794, original row 8200, local generators 11.
    { word := [10, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] },
    -- Representative 6795, original row 8112, local generators 11.
    { word := [10, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk9 : List Weights.Entry :=
  [
    -- Representative 6799, original row 3349, local generators 11.
    { word := [2, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] },
    -- Representative 6811, original row 4033, local generators 11.
    { word := [4, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }
  ]

def chunk10 : List Weights.Entry :=
  [
    -- Representative 6815, original row 3970, local generators 11.
    { word := [4, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6817, original row 3158, local generators 11.
    { word := [2, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }
  ]

def chunk11 : List Weights.Entry :=
  [
    -- Representative 6823, original row 4066, local generators 11.
    { word := [4, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6824, original row 3103, local generators 11.
    { word := [2, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk12 : List Weights.Entry :=
  [
    -- Representative 6839, original row 5919, local generators 11.
    { word := [8, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6840, original row 4595, local generators 11.
    { word := [8, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk13 : List Weights.Entry :=
  [
    -- Representative 6842, original row 6026, local generators 11.
    { word := [8, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6846, original row 4662, local generators 11.
    { word := [8, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk14 : List Weights.Entry :=
  [
    -- Representative 6867, original row 6208, local generators 11.
    { word := [8, 10, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] },
    -- Representative 6868, original row 5000, local generators 11.
    { word := [8, 2, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }
  ]

def chunk15 : List Weights.Entry :=
  [
    -- Representative 6870, original row 5310, local generators 11.
    { word := [8, 6, 8, 12, 8, 12, 10], weights := [1, 1, 1, 1] },
    -- Representative 6875, original row 1503, local generators 11.
    { word := [0, 10, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }
  ]

def chunk16 : List Weights.Entry :=
  [
    -- Representative 6883, original row 6209, local generators 11.
    { word := [8, 10, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6884, original row 5001, local generators 11.
    { word := [8, 2, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }
  ]

def chunk17 : List Weights.Entry :=
  [
    -- Representative 6886, original row 5311, local generators 11.
    { word := [8, 6, 8, 12, 8, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6895, original row 1504, local generators 11.
    { word := [0, 10, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }
  ]

def chunk18 : List Weights.Entry :=
  [
    -- Representative 6906, original row 1308, local generators 11.
    { word := [0, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6919, original row 6553, local generators 11.
    { word := [8, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk19 : List Weights.Entry :=
  [
    -- Representative 6925, original row 6554, local generators 11.
    { word := [8, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 6935, original row 5720, local generators 11.
    { word := [8, 8, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }
  ]

def chunk20 : List Weights.Entry :=
  [
    -- Representative 6943, original row 5841, local generators 11.
    { word := [8, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6996, original row 7773, local generators 11.
    { word := [10, 2, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }
  ]

def chunk21 : List Weights.Entry :=
  [
    -- Representative 7001, original row 7774, local generators 11.
    { word := [10, 2, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] },
    -- Representative 7005, original row 7716, local generators 11.
    { word := [10, 2, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }
  ]

def chunk22 : List Weights.Entry :=
  [
    -- Representative 7006, original row 7714, local generators 11.
    { word := [10, 2, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] },
    -- Representative 7053, original row 6028, local generators 11.
    { word := [8, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }
  ]

def chunk23 : List Weights.Entry :=
  [
    -- Representative 7084, original row 6312, local generators 11.
    { word := [8, 10, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] },
    -- Representative 7102, original row 6313, local generators 11.
    { word := [8, 10, 10, 10, 8, 4, 12], weights := [1, 1, 1, 1] }
  ]

def chunk24 : List Weights.Entry :=
  [
    -- Representative 7206, original row 9057, local generators 11.
    { word := [12, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] },
    -- Representative 7207, original row 8717, local generators 11.
    { word := [12, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }
  ]

def chunk25 : List Weights.Entry :=
  [
    -- Representative 7209, original row 8722, local generators 11.
    { word := [12, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] },
    -- Representative 7216, original row 8096, local generators 11.
    { word := [10, 8, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }
  ]

def chunk26 : List Weights.Entry :=
  [
    -- Representative 7224, original row 8097, local generators 11.
    { word := [10, 8, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] },
    -- Representative 7257, original row 3297, local generators 11.
    { word := [2, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }
  ]

def chunk27 : List Weights.Entry :=
  [
    -- Representative 7259, original row 3295, local generators 11.
    { word := [2, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] },
    -- Representative 7265, original row 3360, local generators 11.
    { word := [2, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }
  ]

def chunk28 : List Weights.Entry :=
  [
    -- Representative 7267, original row 3361, local generators 11.
    { word := [2, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] },
    -- Representative 7324, original row 4070, local generators 11.
    { word := [4, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }
  ]

def chunk29 : List Weights.Entry :=
  [
    -- Representative 7326, original row 4075, local generators 11.
    { word := [4, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] },
    -- Representative 7429, original row 3389, local generators 11.
    { word := [2, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }
  ]

def chunk30 : List Weights.Entry :=
  [
    -- Representative 7488, original row 6320, local generators 11.
    { word := [8, 10, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 7492, original row 6321, local generators 11.
    { word := [8, 10, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk31 : List Weights.Entry :=
  [
    -- Representative 7560, original row 6045, local generators 11.
    { word := [8, 9, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] },
    -- Representative 7664, original row 6582, local generators 11.
    { word := [8, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk32 : List Weights.Entry :=
  [
    -- Representative 7677, original row 5780, local generators 11.
    { word := [8, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 7685, original row 5781, local generators 11.
    { word := [8, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk33 : List Weights.Entry :=
  [
    -- Representative 7721, original row 6565, local generators 11.
    { word := [8, 12, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] },
    -- Representative 7729, original row 6566, local generators 11.
    { word := [8, 12, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }
  ]

def chunk34 : List Weights.Entry :=
  [
    -- Representative 7737, original row 6623, local generators 11.
    { word := [8, 12, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] },
    -- Representative 7741, original row 6624, local generators 11.
    { word := [8, 12, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }
  ]

def chunk35 : List Weights.Entry :=
  [
    -- Representative 7883, original row 5779, local generators 11.
    { word := [8, 8, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] },
    -- Representative 7907, original row 6034, local generators 11.
    { word := [8, 9, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }
  ]

def chunk36 : List Weights.Entry :=
  [
    -- Representative 8153, original row 4041, local generators 11.
    { word := [4, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] },
    -- Representative 8169, original row 3365, local generators 11.
    { word := [2, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }
  ]

def chunk37 : List Weights.Entry :=
  [
    -- Representative 8513, original row 6287, local generators 11.
    { word := [8, 10, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] },
    -- Representative 8560, original row 5751, local generators 11.
    { word := [8, 8, 9, 12, 12, 12, 8], weights := [1, 0, 0, 1] }
  ]

def chunk38 : List Weights.Entry :=
  [
    -- Representative 8562, original row 6325, local generators 11.
    { word := [8, 10, 10, 10, 8, 10, 8], weights := [1, 0, 0, 1] },
    -- Representative 6740, original row 4096, local generators 10.
    { word := [6, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }
  ]

def chunk39 : List Weights.Entry :=
  [
    -- Representative 6748, original row 4089, local generators 10.
    { word := [6, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 6749, original row 4092, local generators 10.
    { word := [6, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }
  ]

def chunk40 : List Weights.Entry :=
  [
    -- Representative 6751, original row 3292, local generators 10.
    { word := [2, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] },
    -- Representative 6758, original row 8011, local generators 10.
    { word := [10, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk41 : List Weights.Entry :=
  [
    -- Representative 6761, original row 8012, local generators 10.
    { word := [10, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] },
    -- Representative 6763, original row 7895, local generators 10.
    { word := [10, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }
  ]

def chunk42 : List Weights.Entry :=
  [
    -- Representative 6765, original row 7521, local generators 10.
    { word := [10, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 6766, original row 8055, local generators 10.
    { word := [10, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }
  ]

def chunk43 : List Weights.Entry :=
  [
    -- Representative 6773, original row 7410, local generators 10.
    { word := [10, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6774, original row 8253, local generators 10.
    { word := [10, 10, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }
  ]

def chunk44 : List Weights.Entry :=
  [
    -- Representative 6775, original row 7495, local generators 10.
    { word := [10, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6780, original row 8345, local generators 10.
    { word := [10, 10, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }
  ]

def chunk45 : List Weights.Entry :=
  [
    -- Representative 6781, original row 8231, local generators 10.
    { word := [10, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] },
    -- Representative 6786, original row 7470, local generators 10.
    { word := [10, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk46 : List Weights.Entry :=
  [
    -- Representative 6787, original row 7583, local generators 10.
    { word := [10, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 6796, original row 8193, local generators 10.
    { word := [10, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }
  ]

def chunk47 : List Weights.Entry :=
  [
    -- Representative 6797, original row 7532, local generators 10.
    { word := [10, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 6798, original row 8037, local generators 10.
    { word := [10, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk48 : List Weights.Entry :=
  [
    -- Representative 6801, original row 3070, local generators 10.
    { word := [2, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] },
    -- Representative 6804, original row 3071, local generators 10.
    { word := [2, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }
  ]

def chunk49 : List Weights.Entry :=
  [
    -- Representative 6812, original row 3668, local generators 10.
    { word := [4, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] },
    -- Representative 6813, original row 2483, local generators 10.
    { word := [2, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk50 : List Weights.Entry :=
  [
    -- Representative 6816, original row 3862, local generators 10.
    { word := [4, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6818, original row 2948, local generators 10.
    { word := [2, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }
  ]

def chunk51 : List Weights.Entry :=
  [
    -- Representative 6819, original row 2576, local generators 10.
    { word := [2, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6825, original row 3701, local generators 10.
    { word := [4, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk52 : List Weights.Entry :=
  [
    -- Representative 6826, original row 2521, local generators 10.
    { word := [2, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6827, original row 3028, local generators 10.
    { word := [2, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk53 : List Weights.Entry :=
  [
    -- Representative 6828, original row 4056, local generators 10.
    { word := [4, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] },
    -- Representative 6829, original row 3098, local generators 10.
    { word := [2, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk54 : List Weights.Entry :=
  [
    -- Representative 6834, original row 5956, local generators 10.
    { word := [8, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] },
    -- Representative 6841, original row 4504, local generators 10.
    { word := [8, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk55 : List Weights.Entry :=
  [
    -- Representative 6843, original row 5915, local generators 10.
    { word := [8, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6844, original row 4591, local generators 10.
    { word := [8, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }
  ]

def chunk56 : List Weights.Entry :=
  [
    -- Representative 6847, original row 4569, local generators 10.
    { word := [8, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] },
    -- Representative 6848, original row 4653, local generators 10.
    { word := [8, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }
  ]

def chunk57 : List Weights.Entry :=
  [
    -- Representative 6850, original row 1452, local generators 10.
    { word := [0, 10, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] },
    -- Representative 6854, original row 6093, local generators 10.
    { word := [8, 10, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }
  ]

def chunk58 : List Weights.Entry :=
  [
    -- Representative 6869, original row 4845, local generators 10.
    { word := [8, 2, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] },
    -- Representative 6871, original row 792, local generators 10.
    { word := [0, 6, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }
  ]

def chunk59 : List Weights.Entry :=
  [
    -- Representative 6874, original row 1482, local generators 10.
    { word := [0, 10, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] },
    -- Representative 6876, original row 1435, local generators 10.
    { word := [0, 10, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }
  ]

def chunk60 : List Weights.Entry :=
  [
    -- Representative 6879, original row 504, local generators 10.
    { word := [0, 2, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] },
    -- Representative 6881, original row 776, local generators 10.
    { word := [0, 6, 8, 12, 8, 12, 10], weights := [0, 1, 1, 0] }
  ]

def chunk61 : List Weights.Entry :=
  [
    -- Representative 6885, original row 4846, local generators 10.
    { word := [8, 2, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] },
    -- Representative 6888, original row 6136, local generators 10.
    { word := [8, 10, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }
  ]

def chunk62 : List Weights.Entry :=
  [
    -- Representative 6889, original row 6115, local generators 10.
    { word := [8, 10, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] },
    -- Representative 6890, original row 4916, local generators 10.
    { word := [8, 2, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }
  ]

def chunk63 : List Weights.Entry :=
  [
    -- Representative 6894, original row 1483, local generators 10.
    { word := [0, 10, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] },
    -- Representative 6896, original row 1436, local generators 10.
    { word := [0, 10, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }
  ]

def entries : List Weights.Entry :=
  chunk0 ++ chunk1 ++ chunk2 ++ chunk3 ++ chunk4 ++ chunk5 ++ chunk6 ++ chunk7 ++ chunk8 ++ chunk9 ++ chunk10 ++ chunk11 ++ chunk12 ++ chunk13 ++ chunk14 ++ chunk15 ++ chunk16 ++ chunk17 ++ chunk18 ++ chunk19 ++ chunk20 ++ chunk21 ++ chunk22 ++ chunk23 ++ chunk24 ++ chunk25 ++ chunk26 ++ chunk27 ++ chunk28 ++ chunk29 ++ chunk30 ++ chunk31 ++ chunk32 ++ chunk33 ++ chunk34 ++ chunk35 ++ chunk36 ++ chunk37 ++ chunk38 ++ chunk39 ++ chunk40 ++ chunk41 ++ chunk42 ++ chunk43 ++ chunk44 ++ chunk45 ++ chunk46 ++ chunk47 ++ chunk48 ++ chunk49 ++ chunk50 ++ chunk51 ++ chunk52 ++ chunk53 ++ chunk54 ++ chunk55 ++ chunk56 ++ chunk57 ++ chunk58 ++ chunk59 ++ chunk60 ++ chunk61 ++ chunk62 ++ chunk63

theorem representativeIds_length : representativeIds.length = 128 := by decide +kernel

theorem entries_length : entries.length = 128 := by decide +kernel

end FranklSmallCyclic.Orbit128Data
