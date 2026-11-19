module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated arithmetic block for period 7. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: 0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitBatches.P7.B011.Data

def representativeIds : List ℕ := [1421, 1422, 1423, 1424, 1425, 1426, 1427, 1428, 1429, 1430, 1431, 1432, 1433, 1434, 1435, 1436, 1437, 1438, 1439, 1440, 1441, 1442, 1443, 1444, 1445, 1446, 1447, 1448, 1449, 1450, 1451, 1452, 1453, 1454, 1455, 1456, 1457, 1458, 1459, 1460, 1461, 1462, 1463, 1464, 1465, 1466, 1467, 1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1481, 1482, 1483, 1484, 1485, 1486, 1487, 1488, 1489, 1490, 1491, 1492, 1493, 1494, 1495, 1496, 1497, 1498, 1499, 1500, 1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1523, 1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540, 1541, 1542, 1543, 1544, 1545, 1546, 1547, 1548]

def sourceRows : List ℕ := [1025, 1039, 89, 627, 1626, 1734, 735, 1017, 1032, 81, 577, 1576, 1701, 702, 563, 1562, 1694, 695, 1715, 1600, 716, 601, 966, 1094, 1108, 994, 74, 118, 32, 924, 538, 1537, 1670, 671, 849, 1706, 1586, 707, 587, 951, 1086, 1101, 980, 59, 110, 10, 902, 516, 1515, 1644, 645, 823, 1633, 634, 1026, 1040, 90, 628, 1627, 1735, 736, 1027, 1041, 91, 629, 1628, 1736, 737, 1019, 1034, 1018, 1033, 82, 967, 1095, 1109, 995, 75, 119, 952, 1087, 1102, 981, 60, 111, 578, 1577, 1702, 703, 579, 1578, 1703, 704, 565, 1564, 1696, 697, 564, 1563, 1695, 696, 539, 1538, 1671, 672, 33, 925, 850, 517, 1516, 1645, 646, 11, 903, 824, 1621, 1729, 1557, 1571, 920, 1666, 898, 1640, 1596, 919, 1664, 1582, 897]

def chunk0 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1421; original row 1025.
    { word := [0, 8, 6, 2, 8, 8, 9], weights := [0, 1, 0, 0] },
    -- Representative 1422; original row 1039.
    { word := [0, 8, 6, 10, 8, 8, 9], weights := [0, 1, 0, 0] }
  ]

def chunk1 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1423; original row 89.
    { word := [0, 0, 6, 2, 8, 8, 9], weights := [0, 1, 0, 0] },
    -- Representative 1424; original row 627.
    { word := [0, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }
  ]

def chunk2 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1425; original row 1626.
    { word := [0, 12, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] },
    -- Representative 1426; original row 1734.
    { word := [0, 12, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }
  ]

def chunk3 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1427; original row 735.
    { word := [0, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] },
    -- Representative 1428; original row 1017.
    { word := [0, 8, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk4 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1429; original row 1032.
    { word := [0, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] },
    -- Representative 1430; original row 81.
    { word := [0, 0, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }
  ]

def chunk5 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1431; original row 577.
    { word := [0, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 1432; original row 1576.
    { word := [0, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk6 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1433; original row 1701.
    { word := [0, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 1434; original row 702.
    { word := [0, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk7 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1435; original row 563.
    { word := [0, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 1436; original row 1562.
    { word := [0, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk8 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1437; original row 1694.
    { word := [0, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] },
    -- Representative 1438; original row 695.
    { word := [0, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }
  ]

def chunk9 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1439; original row 1715.
    { word := [0, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 1440; original row 1600.
    { word := [0, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk10 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1441; original row 716.
    { word := [0, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 1442; original row 601.
    { word := [0, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk11 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1443; original row 966.
    { word := [0, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1444; original row 1094.
    { word := [0, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk12 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1445; original row 1108.
    { word := [0, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1446; original row 994.
    { word := [0, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk13 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1447; original row 74.
    { word := [0, 0, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1448; original row 118.
    { word := [0, 0, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk14 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1449; original row 32.
    { word := [0, 0, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1450; original row 924.
    { word := [0, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk15 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1451; original row 538.
    { word := [0, 4, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1452; original row 1537.
    { word := [0, 12, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk16 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1453; original row 1670.
    { word := [0, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1454; original row 671.
    { word := [0, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk17 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1455; original row 849.
    { word := [0, 8, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1456; original row 1706.
    { word := [0, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk18 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1457; original row 1586.
    { word := [0, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 1458; original row 707.
    { word := [0, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk19 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1459; original row 587.
    { word := [0, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 1460; original row 951.
    { word := [0, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk20 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1461; original row 1086.
    { word := [0, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1462; original row 1101.
    { word := [0, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk21 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1463; original row 980.
    { word := [0, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1464; original row 59.
    { word := [0, 0, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk22 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1465; original row 110.
    { word := [0, 0, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1466; original row 10.
    { word := [0, 0, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk23 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1467; original row 902.
    { word := [0, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1468; original row 516.
    { word := [0, 4, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk24 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1469; original row 1515.
    { word := [0, 12, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1470; original row 1644.
    { word := [0, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk25 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1471; original row 645.
    { word := [0, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] },
    -- Representative 1472; original row 823.
    { word := [0, 8, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }
  ]

def chunk26 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1473; original row 1633.
    { word := [0, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] },
    -- Representative 1474; original row 634.
    { word := [0, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }
  ]

def chunk27 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1475; original row 1026.
    { word := [0, 8, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1476; original row 1040.
    { word := [0, 8, 6, 10, 8, 8, 10], weights := [0, 1, 0, 0] }
  ]

def chunk28 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1477; original row 90.
    { word := [0, 0, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] },
    -- Representative 1478; original row 628.
    { word := [0, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }
  ]

def chunk29 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1479; original row 1627.
    { word := [0, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] },
    -- Representative 1480; original row 1735.
    { word := [0, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }
  ]

def chunk30 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1481; original row 736.
    { word := [0, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] },
    -- Representative 1482; original row 1027.
    { word := [0, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk31 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1483; original row 1041.
    { word := [0, 8, 6, 10, 8, 8, 12], weights := [0, 1, 0, 0] },
    -- Representative 1484; original row 91.
    { word := [0, 0, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk32 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1485; original row 629.
    { word := [0, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1486; original row 1628.
    { word := [0, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk33 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1487; original row 1736.
    { word := [0, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1488; original row 737.
    { word := [0, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk34 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1489; original row 1019.
    { word := [0, 8, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1490; original row 1034.
    { word := [0, 8, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk35 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1491; original row 1018.
    { word := [0, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 1492; original row 1033.
    { word := [0, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }
  ]

def chunk36 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1493; original row 82.
    { word := [0, 0, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] },
    -- Representative 1494; original row 967.
    { word := [0, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk37 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1495; original row 1095.
    { word := [0, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1496; original row 1109.
    { word := [0, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk38 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1497; original row 995.
    { word := [0, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1498; original row 75.
    { word := [0, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk39 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1499; original row 119.
    { word := [0, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1500; original row 952.
    { word := [0, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk40 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1501; original row 1087.
    { word := [0, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1502; original row 1102.
    { word := [0, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk41 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1503; original row 981.
    { word := [0, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1504; original row 60.
    { word := [0, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk42 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1505; original row 111.
    { word := [0, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1506; original row 578.
    { word := [0, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk43 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1507; original row 1577.
    { word := [0, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 1508; original row 1702.
    { word := [0, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk44 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1509; original row 703.
    { word := [0, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 1510; original row 579.
    { word := [0, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }
  ]

def chunk45 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1511; original row 1578.
    { word := [0, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] },
    -- Representative 1512; original row 1703.
    { word := [0, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }
  ]

def chunk46 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1513; original row 704.
    { word := [0, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] },
    -- Representative 1514; original row 565.
    { word := [0, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }
  ]

def chunk47 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1515; original row 1564.
    { word := [0, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] },
    -- Representative 1516; original row 1696.
    { word := [0, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }
  ]

def chunk48 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1517; original row 697.
    { word := [0, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] },
    -- Representative 1518; original row 564.
    { word := [0, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk49 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1519; original row 1563.
    { word := [0, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 1520; original row 1695.
    { word := [0, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }
  ]

def chunk50 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1521; original row 696.
    { word := [0, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] },
    -- Representative 1522; original row 539.
    { word := [0, 4, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk51 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1523; original row 1538.
    { word := [0, 12, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1524; original row 1671.
    { word := [0, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk52 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1525; original row 672.
    { word := [0, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1526; original row 33.
    { word := [0, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk53 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1527; original row 925.
    { word := [0, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1528; original row 850.
    { word := [0, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk54 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1529; original row 517.
    { word := [0, 4, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1530; original row 1516.
    { word := [0, 12, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk55 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1531; original row 1645.
    { word := [0, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1532; original row 646.
    { word := [0, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk56 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1533; original row 11.
    { word := [0, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1534; original row 903.
    { word := [0, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }
  ]

def chunk57 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1535; original row 824.
    { word := [0, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] },
    -- Representative 1536; original row 1621.
    { word := [0, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }
  ]

def chunk58 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1537; original row 1729.
    { word := [0, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 1538; original row 1557.
    { word := [0, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }
  ]

def chunk59 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1539; original row 1571.
    { word := [0, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] },
    -- Representative 1540; original row 920.
    { word := [0, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }
  ]

def chunk60 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1541; original row 1666.
    { word := [0, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 1542; original row 898.
    { word := [0, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }
  ]

def chunk61 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1543; original row 1640.
    { word := [0, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] },
    -- Representative 1544; original row 1596.
    { word := [0, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }
  ]

def chunk62 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1545; original row 919.
    { word := [0, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] },
    -- Representative 1546; original row 1664.
    { word := [0, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }
  ]

def chunk63 : List FranklSmallCyclic.Weights.Entry :=
  [
    -- Representative 1547; original row 1582.
    { word := [0, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] },
    -- Representative 1548; original row 897.
    { word := [0, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }
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

end FranklSmallCyclic.OrbitBatches.P7.B011.Data
