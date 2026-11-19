import Conjectures.CutPeriodParts3StateData
import Conjectures.FiniteIntervalCertificate
namespace CutPeriod.Parts3Certificate
open BinaryAutomata
set_option Elab.async false
set_option linter.all false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option exponentiation.threshold 6804
theorem refinement_row_1024 : ∀ d,
    maskOfList ((active (next (1024 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1024 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1025 : ∀ d,
    maskOfList ((active (next (1025 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1025 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1026 : ∀ d,
    maskOfList ((active (next (1026 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1026 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1027 : ∀ d,
    maskOfList ((active (next (1027 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1027 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1028 : ∀ d,
    maskOfList ((active (next (1028 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1028 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1029 : ∀ d,
    maskOfList ((active (next (1029 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1029 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1030 : ∀ d,
    maskOfList ((active (next (1030 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1030 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1031 : ∀ d,
    maskOfList ((active (next (1031 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1031 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1032 : ∀ d,
    maskOfList ((active (next (1032 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1032 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1033 : ∀ d,
    maskOfList ((active (next (1033 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1033 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1034 : ∀ d,
    maskOfList ((active (next (1034 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1034 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1035 : ∀ d,
    maskOfList ((active (next (1035 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1035 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1036 : ∀ d,
    maskOfList ((active (next (1036 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1036 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1037 : ∀ d,
    maskOfList ((active (next (1037 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1037 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1038 : ∀ d,
    maskOfList ((active (next (1038 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1038 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1039 : ∀ d,
    maskOfList ((active (next (1039 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1039 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1040 : ∀ d,
    maskOfList ((active (next (1040 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1040 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1041 : ∀ d,
    maskOfList ((active (next (1041 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1041 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1042 : ∀ d,
    maskOfList ((active (next (1042 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1042 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1043 : ∀ d,
    maskOfList ((active (next (1043 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1043 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1044 : ∀ d,
    maskOfList ((active (next (1044 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1044 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1045 : ∀ d,
    maskOfList ((active (next (1045 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1045 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1046 : ∀ d,
    maskOfList ((active (next (1046 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1046 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1047 : ∀ d,
    maskOfList ((active (next (1047 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1047 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1048 : ∀ d,
    maskOfList ((active (next (1048 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1048 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1049 : ∀ d,
    maskOfList ((active (next (1049 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1049 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1050 : ∀ d,
    maskOfList ((active (next (1050 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1050 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1051 : ∀ d,
    maskOfList ((active (next (1051 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1051 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1052 : ∀ d,
    maskOfList ((active (next (1052 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1052 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1053 : ∀ d,
    maskOfList ((active (next (1053 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1053 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1054 : ∀ d,
    maskOfList ((active (next (1054 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1054 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1055 : ∀ d,
    maskOfList ((active (next (1055 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1055 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1056 : ∀ d,
    maskOfList ((active (next (1056 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1056 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1057 : ∀ d,
    maskOfList ((active (next (1057 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1057 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1058 : ∀ d,
    maskOfList ((active (next (1058 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1058 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1059 : ∀ d,
    maskOfList ((active (next (1059 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1059 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1060 : ∀ d,
    maskOfList ((active (next (1060 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1060 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1061 : ∀ d,
    maskOfList ((active (next (1061 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1061 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1062 : ∀ d,
    maskOfList ((active (next (1062 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1062 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1063 : ∀ d,
    maskOfList ((active (next (1063 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1063 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1064 : ∀ d,
    maskOfList ((active (next (1064 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1064 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1065 : ∀ d,
    maskOfList ((active (next (1065 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1065 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1066 : ∀ d,
    maskOfList ((active (next (1066 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1066 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1067 : ∀ d,
    maskOfList ((active (next (1067 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1067 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1068 : ∀ d,
    maskOfList ((active (next (1068 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1068 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1069 : ∀ d,
    maskOfList ((active (next (1069 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1069 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1070 : ∀ d,
    maskOfList ((active (next (1070 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1070 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1071 : ∀ d,
    maskOfList ((active (next (1071 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1071 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1072 : ∀ d,
    maskOfList ((active (next (1072 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1072 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1073 : ∀ d,
    maskOfList ((active (next (1073 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1073 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1074 : ∀ d,
    maskOfList ((active (next (1074 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1074 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1075 : ∀ d,
    maskOfList ((active (next (1075 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1075 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1076 : ∀ d,
    maskOfList ((active (next (1076 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1076 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1077 : ∀ d,
    maskOfList ((active (next (1077 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1077 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1078 : ∀ d,
    maskOfList ((active (next (1078 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1078 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1079 : ∀ d,
    maskOfList ((active (next (1079 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1079 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1080 : ∀ d,
    maskOfList ((active (next (1080 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1080 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1081 : ∀ d,
    maskOfList ((active (next (1081 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1081 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1082 : ∀ d,
    maskOfList ((active (next (1082 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1082 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1083 : ∀ d,
    maskOfList ((active (next (1083 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1083 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1084 : ∀ d,
    maskOfList ((active (next (1084 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1084 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1085 : ∀ d,
    maskOfList ((active (next (1085 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1085 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1086 : ∀ d,
    maskOfList ((active (next (1086 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1086 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1087 : ∀ d,
    maskOfList ((active (next (1087 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1087 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1088 : ∀ d,
    maskOfList ((active (next (1088 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1088 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1089 : ∀ d,
    maskOfList ((active (next (1089 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1089 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1090 : ∀ d,
    maskOfList ((active (next (1090 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1090 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1091 : ∀ d,
    maskOfList ((active (next (1091 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1091 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1092 : ∀ d,
    maskOfList ((active (next (1092 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1092 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1093 : ∀ d,
    maskOfList ((active (next (1093 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1093 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1094 : ∀ d,
    maskOfList ((active (next (1094 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1094 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1095 : ∀ d,
    maskOfList ((active (next (1095 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1095 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1096 : ∀ d,
    maskOfList ((active (next (1096 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1096 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1097 : ∀ d,
    maskOfList ((active (next (1097 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1097 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1098 : ∀ d,
    maskOfList ((active (next (1098 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1098 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1099 : ∀ d,
    maskOfList ((active (next (1099 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1099 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1100 : ∀ d,
    maskOfList ((active (next (1100 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1100 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1101 : ∀ d,
    maskOfList ((active (next (1101 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1101 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1102 : ∀ d,
    maskOfList ((active (next (1102 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1102 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1103 : ∀ d,
    maskOfList ((active (next (1103 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1103 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1104 : ∀ d,
    maskOfList ((active (next (1104 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1104 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1105 : ∀ d,
    maskOfList ((active (next (1105 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1105 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1106 : ∀ d,
    maskOfList ((active (next (1106 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1106 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1107 : ∀ d,
    maskOfList ((active (next (1107 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1107 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1108 : ∀ d,
    maskOfList ((active (next (1108 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1108 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1109 : ∀ d,
    maskOfList ((active (next (1109 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1109 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1110 : ∀ d,
    maskOfList ((active (next (1110 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1110 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1111 : ∀ d,
    maskOfList ((active (next (1111 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1111 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1112 : ∀ d,
    maskOfList ((active (next (1112 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1112 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1113 : ∀ d,
    maskOfList ((active (next (1113 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1113 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1114 : ∀ d,
    maskOfList ((active (next (1114 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1114 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1115 : ∀ d,
    maskOfList ((active (next (1115 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1115 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1116 : ∀ d,
    maskOfList ((active (next (1116 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1116 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1117 : ∀ d,
    maskOfList ((active (next (1117 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1117 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1118 : ∀ d,
    maskOfList ((active (next (1118 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1118 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1119 : ∀ d,
    maskOfList ((active (next (1119 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1119 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1120 : ∀ d,
    maskOfList ((active (next (1120 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1120 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1121 : ∀ d,
    maskOfList ((active (next (1121 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1121 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1122 : ∀ d,
    maskOfList ((active (next (1122 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1122 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1123 : ∀ d,
    maskOfList ((active (next (1123 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1123 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1124 : ∀ d,
    maskOfList ((active (next (1124 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1124 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1125 : ∀ d,
    maskOfList ((active (next (1125 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1125 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1126 : ∀ d,
    maskOfList ((active (next (1126 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1126 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1127 : ∀ d,
    maskOfList ((active (next (1127 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1127 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1128 : ∀ d,
    maskOfList ((active (next (1128 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1128 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1129 : ∀ d,
    maskOfList ((active (next (1129 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1129 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1130 : ∀ d,
    maskOfList ((active (next (1130 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1130 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1131 : ∀ d,
    maskOfList ((active (next (1131 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1131 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1132 : ∀ d,
    maskOfList ((active (next (1132 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1132 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1133 : ∀ d,
    maskOfList ((active (next (1133 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1133 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1134 : ∀ d,
    maskOfList ((active (next (1134 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1134 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1135 : ∀ d,
    maskOfList ((active (next (1135 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1135 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1136 : ∀ d,
    maskOfList ((active (next (1136 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1136 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1137 : ∀ d,
    maskOfList ((active (next (1137 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1137 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1138 : ∀ d,
    maskOfList ((active (next (1138 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1138 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1139 : ∀ d,
    maskOfList ((active (next (1139 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1139 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1140 : ∀ d,
    maskOfList ((active (next (1140 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1140 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1141 : ∀ d,
    maskOfList ((active (next (1141 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1141 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1142 : ∀ d,
    maskOfList ((active (next (1142 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1142 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1143 : ∀ d,
    maskOfList ((active (next (1143 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1143 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1144 : ∀ d,
    maskOfList ((active (next (1144 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1144 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1145 : ∀ d,
    maskOfList ((active (next (1145 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1145 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1146 : ∀ d,
    maskOfList ((active (next (1146 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1146 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1147 : ∀ d,
    maskOfList ((active (next (1147 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1147 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1148 : ∀ d,
    maskOfList ((active (next (1148 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1148 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1149 : ∀ d,
    maskOfList ((active (next (1149 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1149 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1150 : ∀ d,
    maskOfList ((active (next (1150 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1150 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1151 : ∀ d,
    maskOfList ((active (next (1151 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1151 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1152 : ∀ d,
    maskOfList ((active (next (1152 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1152 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1153 : ∀ d,
    maskOfList ((active (next (1153 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1153 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1154 : ∀ d,
    maskOfList ((active (next (1154 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1154 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1155 : ∀ d,
    maskOfList ((active (next (1155 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1155 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1156 : ∀ d,
    maskOfList ((active (next (1156 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1156 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1157 : ∀ d,
    maskOfList ((active (next (1157 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1157 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1158 : ∀ d,
    maskOfList ((active (next (1158 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1158 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1159 : ∀ d,
    maskOfList ((active (next (1159 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1159 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1160 : ∀ d,
    maskOfList ((active (next (1160 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1160 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1161 : ∀ d,
    maskOfList ((active (next (1161 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1161 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1162 : ∀ d,
    maskOfList ((active (next (1162 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1162 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1163 : ∀ d,
    maskOfList ((active (next (1163 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1163 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1164 : ∀ d,
    maskOfList ((active (next (1164 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1164 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1165 : ∀ d,
    maskOfList ((active (next (1165 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1165 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1166 : ∀ d,
    maskOfList ((active (next (1166 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1166 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1167 : ∀ d,
    maskOfList ((active (next (1167 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1167 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1168 : ∀ d,
    maskOfList ((active (next (1168 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1168 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1169 : ∀ d,
    maskOfList ((active (next (1169 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1169 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1170 : ∀ d,
    maskOfList ((active (next (1170 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1170 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1171 : ∀ d,
    maskOfList ((active (next (1171 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1171 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1172 : ∀ d,
    maskOfList ((active (next (1172 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1172 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1173 : ∀ d,
    maskOfList ((active (next (1173 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1173 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1174 : ∀ d,
    maskOfList ((active (next (1174 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1174 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1175 : ∀ d,
    maskOfList ((active (next (1175 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1175 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1176 : ∀ d,
    maskOfList ((active (next (1176 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1176 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1177 : ∀ d,
    maskOfList ((active (next (1177 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1177 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1178 : ∀ d,
    maskOfList ((active (next (1178 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1178 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1179 : ∀ d,
    maskOfList ((active (next (1179 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1179 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1180 : ∀ d,
    maskOfList ((active (next (1180 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1180 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1181 : ∀ d,
    maskOfList ((active (next (1181 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1181 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1182 : ∀ d,
    maskOfList ((active (next (1182 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1182 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1183 : ∀ d,
    maskOfList ((active (next (1183 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1183 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1184 : ∀ d,
    maskOfList ((active (next (1184 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1184 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1185 : ∀ d,
    maskOfList ((active (next (1185 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1185 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1186 : ∀ d,
    maskOfList ((active (next (1186 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1186 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1187 : ∀ d,
    maskOfList ((active (next (1187 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1187 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1188 : ∀ d,
    maskOfList ((active (next (1188 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1188 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1189 : ∀ d,
    maskOfList ((active (next (1189 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1189 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1190 : ∀ d,
    maskOfList ((active (next (1190 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1190 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1191 : ∀ d,
    maskOfList ((active (next (1191 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1191 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1192 : ∀ d,
    maskOfList ((active (next (1192 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1192 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1193 : ∀ d,
    maskOfList ((active (next (1193 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1193 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1194 : ∀ d,
    maskOfList ((active (next (1194 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1194 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1195 : ∀ d,
    maskOfList ((active (next (1195 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1195 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1196 : ∀ d,
    maskOfList ((active (next (1196 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1196 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1197 : ∀ d,
    maskOfList ((active (next (1197 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1197 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1198 : ∀ d,
    maskOfList ((active (next (1198 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1198 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1199 : ∀ d,
    maskOfList ((active (next (1199 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1199 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1200 : ∀ d,
    maskOfList ((active (next (1200 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1200 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1201 : ∀ d,
    maskOfList ((active (next (1201 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1201 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1202 : ∀ d,
    maskOfList ((active (next (1202 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1202 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1203 : ∀ d,
    maskOfList ((active (next (1203 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1203 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1204 : ∀ d,
    maskOfList ((active (next (1204 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1204 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1205 : ∀ d,
    maskOfList ((active (next (1205 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1205 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1206 : ∀ d,
    maskOfList ((active (next (1206 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1206 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1207 : ∀ d,
    maskOfList ((active (next (1207 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1207 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1208 : ∀ d,
    maskOfList ((active (next (1208 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1208 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1209 : ∀ d,
    maskOfList ((active (next (1209 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1209 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1210 : ∀ d,
    maskOfList ((active (next (1210 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1210 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1211 : ∀ d,
    maskOfList ((active (next (1211 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1211 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1212 : ∀ d,
    maskOfList ((active (next (1212 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1212 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1213 : ∀ d,
    maskOfList ((active (next (1213 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1213 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1214 : ∀ d,
    maskOfList ((active (next (1214 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1214 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1215 : ∀ d,
    maskOfList ((active (next (1215 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1215 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1216 : ∀ d,
    maskOfList ((active (next (1216 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1216 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1217 : ∀ d,
    maskOfList ((active (next (1217 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1217 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1218 : ∀ d,
    maskOfList ((active (next (1218 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1218 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1219 : ∀ d,
    maskOfList ((active (next (1219 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1219 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1220 : ∀ d,
    maskOfList ((active (next (1220 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1220 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1221 : ∀ d,
    maskOfList ((active (next (1221 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1221 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1222 : ∀ d,
    maskOfList ((active (next (1222 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1222 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1223 : ∀ d,
    maskOfList ((active (next (1223 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1223 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1224 : ∀ d,
    maskOfList ((active (next (1224 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1224 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1225 : ∀ d,
    maskOfList ((active (next (1225 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1225 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1226 : ∀ d,
    maskOfList ((active (next (1226 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1226 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1227 : ∀ d,
    maskOfList ((active (next (1227 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1227 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1228 : ∀ d,
    maskOfList ((active (next (1228 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1228 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1229 : ∀ d,
    maskOfList ((active (next (1229 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1229 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1230 : ∀ d,
    maskOfList ((active (next (1230 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1230 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1231 : ∀ d,
    maskOfList ((active (next (1231 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1231 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1232 : ∀ d,
    maskOfList ((active (next (1232 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1232 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1233 : ∀ d,
    maskOfList ((active (next (1233 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1233 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1234 : ∀ d,
    maskOfList ((active (next (1234 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1234 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1235 : ∀ d,
    maskOfList ((active (next (1235 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1235 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1236 : ∀ d,
    maskOfList ((active (next (1236 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1236 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1237 : ∀ d,
    maskOfList ((active (next (1237 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1237 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1238 : ∀ d,
    maskOfList ((active (next (1238 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1238 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1239 : ∀ d,
    maskOfList ((active (next (1239 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1239 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1240 : ∀ d,
    maskOfList ((active (next (1240 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1240 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1241 : ∀ d,
    maskOfList ((active (next (1241 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1241 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1242 : ∀ d,
    maskOfList ((active (next (1242 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1242 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1243 : ∀ d,
    maskOfList ((active (next (1243 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1243 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1244 : ∀ d,
    maskOfList ((active (next (1244 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1244 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1245 : ∀ d,
    maskOfList ((active (next (1245 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1245 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1246 : ∀ d,
    maskOfList ((active (next (1246 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1246 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1247 : ∀ d,
    maskOfList ((active (next (1247 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1247 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1248 : ∀ d,
    maskOfList ((active (next (1248 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1248 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1249 : ∀ d,
    maskOfList ((active (next (1249 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1249 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1250 : ∀ d,
    maskOfList ((active (next (1250 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1250 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1251 : ∀ d,
    maskOfList ((active (next (1251 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1251 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1252 : ∀ d,
    maskOfList ((active (next (1252 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1252 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1253 : ∀ d,
    maskOfList ((active (next (1253 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1253 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1254 : ∀ d,
    maskOfList ((active (next (1254 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1254 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1255 : ∀ d,
    maskOfList ((active (next (1255 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1255 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1256 : ∀ d,
    maskOfList ((active (next (1256 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1256 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1257 : ∀ d,
    maskOfList ((active (next (1257 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1257 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1258 : ∀ d,
    maskOfList ((active (next (1258 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1258 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1259 : ∀ d,
    maskOfList ((active (next (1259 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1259 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1260 : ∀ d,
    maskOfList ((active (next (1260 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1260 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1261 : ∀ d,
    maskOfList ((active (next (1261 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1261 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1262 : ∀ d,
    maskOfList ((active (next (1262 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1262 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1263 : ∀ d,
    maskOfList ((active (next (1263 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1263 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1264 : ∀ d,
    maskOfList ((active (next (1264 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1264 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1265 : ∀ d,
    maskOfList ((active (next (1265 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1265 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1266 : ∀ d,
    maskOfList ((active (next (1266 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1266 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1267 : ∀ d,
    maskOfList ((active (next (1267 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1267 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1268 : ∀ d,
    maskOfList ((active (next (1268 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1268 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1269 : ∀ d,
    maskOfList ((active (next (1269 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1269 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1270 : ∀ d,
    maskOfList ((active (next (1270 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1270 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1271 : ∀ d,
    maskOfList ((active (next (1271 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1271 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1272 : ∀ d,
    maskOfList ((active (next (1272 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1272 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1273 : ∀ d,
    maskOfList ((active (next (1273 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1273 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1274 : ∀ d,
    maskOfList ((active (next (1274 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1274 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1275 : ∀ d,
    maskOfList ((active (next (1275 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1275 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1276 : ∀ d,
    maskOfList ((active (next (1276 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1276 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1277 : ∀ d,
    maskOfList ((active (next (1277 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1277 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1278 : ∀ d,
    maskOfList ((active (next (1278 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1278 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem refinement_row_1279 : ∀ d,
    maskOfList ((active (next (1279 : Fin 2013) d)).map Fin.val)=
      maskOfList (((active (1279 : Fin 2013)).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide +kernel
theorem final_row_1024 : (active (1024 : Fin 2013)).any composed.final=machine.final (label (1024 : Fin 2013)) := by decide +kernel
theorem final_row_1025 : (active (1025 : Fin 2013)).any composed.final=machine.final (label (1025 : Fin 2013)) := by decide +kernel
theorem final_row_1026 : (active (1026 : Fin 2013)).any composed.final=machine.final (label (1026 : Fin 2013)) := by decide +kernel
theorem final_row_1027 : (active (1027 : Fin 2013)).any composed.final=machine.final (label (1027 : Fin 2013)) := by decide +kernel
theorem final_row_1028 : (active (1028 : Fin 2013)).any composed.final=machine.final (label (1028 : Fin 2013)) := by decide +kernel
theorem final_row_1029 : (active (1029 : Fin 2013)).any composed.final=machine.final (label (1029 : Fin 2013)) := by decide +kernel
theorem final_row_1030 : (active (1030 : Fin 2013)).any composed.final=machine.final (label (1030 : Fin 2013)) := by decide +kernel
theorem final_row_1031 : (active (1031 : Fin 2013)).any composed.final=machine.final (label (1031 : Fin 2013)) := by decide +kernel
theorem final_row_1032 : (active (1032 : Fin 2013)).any composed.final=machine.final (label (1032 : Fin 2013)) := by decide +kernel
theorem final_row_1033 : (active (1033 : Fin 2013)).any composed.final=machine.final (label (1033 : Fin 2013)) := by decide +kernel
theorem final_row_1034 : (active (1034 : Fin 2013)).any composed.final=machine.final (label (1034 : Fin 2013)) := by decide +kernel
theorem final_row_1035 : (active (1035 : Fin 2013)).any composed.final=machine.final (label (1035 : Fin 2013)) := by decide +kernel
theorem final_row_1036 : (active (1036 : Fin 2013)).any composed.final=machine.final (label (1036 : Fin 2013)) := by decide +kernel
theorem final_row_1037 : (active (1037 : Fin 2013)).any composed.final=machine.final (label (1037 : Fin 2013)) := by decide +kernel
theorem final_row_1038 : (active (1038 : Fin 2013)).any composed.final=machine.final (label (1038 : Fin 2013)) := by decide +kernel
theorem final_row_1039 : (active (1039 : Fin 2013)).any composed.final=machine.final (label (1039 : Fin 2013)) := by decide +kernel
theorem final_row_1040 : (active (1040 : Fin 2013)).any composed.final=machine.final (label (1040 : Fin 2013)) := by decide +kernel
theorem final_row_1041 : (active (1041 : Fin 2013)).any composed.final=machine.final (label (1041 : Fin 2013)) := by decide +kernel
theorem final_row_1042 : (active (1042 : Fin 2013)).any composed.final=machine.final (label (1042 : Fin 2013)) := by decide +kernel
theorem final_row_1043 : (active (1043 : Fin 2013)).any composed.final=machine.final (label (1043 : Fin 2013)) := by decide +kernel
theorem final_row_1044 : (active (1044 : Fin 2013)).any composed.final=machine.final (label (1044 : Fin 2013)) := by decide +kernel
theorem final_row_1045 : (active (1045 : Fin 2013)).any composed.final=machine.final (label (1045 : Fin 2013)) := by decide +kernel
theorem final_row_1046 : (active (1046 : Fin 2013)).any composed.final=machine.final (label (1046 : Fin 2013)) := by decide +kernel
theorem final_row_1047 : (active (1047 : Fin 2013)).any composed.final=machine.final (label (1047 : Fin 2013)) := by decide +kernel
theorem final_row_1048 : (active (1048 : Fin 2013)).any composed.final=machine.final (label (1048 : Fin 2013)) := by decide +kernel
theorem final_row_1049 : (active (1049 : Fin 2013)).any composed.final=machine.final (label (1049 : Fin 2013)) := by decide +kernel
theorem final_row_1050 : (active (1050 : Fin 2013)).any composed.final=machine.final (label (1050 : Fin 2013)) := by decide +kernel
theorem final_row_1051 : (active (1051 : Fin 2013)).any composed.final=machine.final (label (1051 : Fin 2013)) := by decide +kernel
theorem final_row_1052 : (active (1052 : Fin 2013)).any composed.final=machine.final (label (1052 : Fin 2013)) := by decide +kernel
theorem final_row_1053 : (active (1053 : Fin 2013)).any composed.final=machine.final (label (1053 : Fin 2013)) := by decide +kernel
theorem final_row_1054 : (active (1054 : Fin 2013)).any composed.final=machine.final (label (1054 : Fin 2013)) := by decide +kernel
theorem final_row_1055 : (active (1055 : Fin 2013)).any composed.final=machine.final (label (1055 : Fin 2013)) := by decide +kernel
theorem final_row_1056 : (active (1056 : Fin 2013)).any composed.final=machine.final (label (1056 : Fin 2013)) := by decide +kernel
theorem final_row_1057 : (active (1057 : Fin 2013)).any composed.final=machine.final (label (1057 : Fin 2013)) := by decide +kernel
theorem final_row_1058 : (active (1058 : Fin 2013)).any composed.final=machine.final (label (1058 : Fin 2013)) := by decide +kernel
theorem final_row_1059 : (active (1059 : Fin 2013)).any composed.final=machine.final (label (1059 : Fin 2013)) := by decide +kernel
theorem final_row_1060 : (active (1060 : Fin 2013)).any composed.final=machine.final (label (1060 : Fin 2013)) := by decide +kernel
theorem final_row_1061 : (active (1061 : Fin 2013)).any composed.final=machine.final (label (1061 : Fin 2013)) := by decide +kernel
theorem final_row_1062 : (active (1062 : Fin 2013)).any composed.final=machine.final (label (1062 : Fin 2013)) := by decide +kernel
theorem final_row_1063 : (active (1063 : Fin 2013)).any composed.final=machine.final (label (1063 : Fin 2013)) := by decide +kernel
theorem final_row_1064 : (active (1064 : Fin 2013)).any composed.final=machine.final (label (1064 : Fin 2013)) := by decide +kernel
theorem final_row_1065 : (active (1065 : Fin 2013)).any composed.final=machine.final (label (1065 : Fin 2013)) := by decide +kernel
theorem final_row_1066 : (active (1066 : Fin 2013)).any composed.final=machine.final (label (1066 : Fin 2013)) := by decide +kernel
theorem final_row_1067 : (active (1067 : Fin 2013)).any composed.final=machine.final (label (1067 : Fin 2013)) := by decide +kernel
theorem final_row_1068 : (active (1068 : Fin 2013)).any composed.final=machine.final (label (1068 : Fin 2013)) := by decide +kernel
theorem final_row_1069 : (active (1069 : Fin 2013)).any composed.final=machine.final (label (1069 : Fin 2013)) := by decide +kernel
theorem final_row_1070 : (active (1070 : Fin 2013)).any composed.final=machine.final (label (1070 : Fin 2013)) := by decide +kernel
theorem final_row_1071 : (active (1071 : Fin 2013)).any composed.final=machine.final (label (1071 : Fin 2013)) := by decide +kernel
theorem final_row_1072 : (active (1072 : Fin 2013)).any composed.final=machine.final (label (1072 : Fin 2013)) := by decide +kernel
theorem final_row_1073 : (active (1073 : Fin 2013)).any composed.final=machine.final (label (1073 : Fin 2013)) := by decide +kernel
theorem final_row_1074 : (active (1074 : Fin 2013)).any composed.final=machine.final (label (1074 : Fin 2013)) := by decide +kernel
theorem final_row_1075 : (active (1075 : Fin 2013)).any composed.final=machine.final (label (1075 : Fin 2013)) := by decide +kernel
theorem final_row_1076 : (active (1076 : Fin 2013)).any composed.final=machine.final (label (1076 : Fin 2013)) := by decide +kernel
theorem final_row_1077 : (active (1077 : Fin 2013)).any composed.final=machine.final (label (1077 : Fin 2013)) := by decide +kernel
theorem final_row_1078 : (active (1078 : Fin 2013)).any composed.final=machine.final (label (1078 : Fin 2013)) := by decide +kernel
theorem final_row_1079 : (active (1079 : Fin 2013)).any composed.final=machine.final (label (1079 : Fin 2013)) := by decide +kernel
theorem final_row_1080 : (active (1080 : Fin 2013)).any composed.final=machine.final (label (1080 : Fin 2013)) := by decide +kernel
theorem final_row_1081 : (active (1081 : Fin 2013)).any composed.final=machine.final (label (1081 : Fin 2013)) := by decide +kernel
theorem final_row_1082 : (active (1082 : Fin 2013)).any composed.final=machine.final (label (1082 : Fin 2013)) := by decide +kernel
theorem final_row_1083 : (active (1083 : Fin 2013)).any composed.final=machine.final (label (1083 : Fin 2013)) := by decide +kernel
theorem final_row_1084 : (active (1084 : Fin 2013)).any composed.final=machine.final (label (1084 : Fin 2013)) := by decide +kernel
theorem final_row_1085 : (active (1085 : Fin 2013)).any composed.final=machine.final (label (1085 : Fin 2013)) := by decide +kernel
theorem final_row_1086 : (active (1086 : Fin 2013)).any composed.final=machine.final (label (1086 : Fin 2013)) := by decide +kernel
theorem final_row_1087 : (active (1087 : Fin 2013)).any composed.final=machine.final (label (1087 : Fin 2013)) := by decide +kernel
theorem final_row_1088 : (active (1088 : Fin 2013)).any composed.final=machine.final (label (1088 : Fin 2013)) := by decide +kernel
theorem final_row_1089 : (active (1089 : Fin 2013)).any composed.final=machine.final (label (1089 : Fin 2013)) := by decide +kernel
theorem final_row_1090 : (active (1090 : Fin 2013)).any composed.final=machine.final (label (1090 : Fin 2013)) := by decide +kernel
theorem final_row_1091 : (active (1091 : Fin 2013)).any composed.final=machine.final (label (1091 : Fin 2013)) := by decide +kernel
theorem final_row_1092 : (active (1092 : Fin 2013)).any composed.final=machine.final (label (1092 : Fin 2013)) := by decide +kernel
theorem final_row_1093 : (active (1093 : Fin 2013)).any composed.final=machine.final (label (1093 : Fin 2013)) := by decide +kernel
theorem final_row_1094 : (active (1094 : Fin 2013)).any composed.final=machine.final (label (1094 : Fin 2013)) := by decide +kernel
theorem final_row_1095 : (active (1095 : Fin 2013)).any composed.final=machine.final (label (1095 : Fin 2013)) := by decide +kernel
theorem final_row_1096 : (active (1096 : Fin 2013)).any composed.final=machine.final (label (1096 : Fin 2013)) := by decide +kernel
theorem final_row_1097 : (active (1097 : Fin 2013)).any composed.final=machine.final (label (1097 : Fin 2013)) := by decide +kernel
theorem final_row_1098 : (active (1098 : Fin 2013)).any composed.final=machine.final (label (1098 : Fin 2013)) := by decide +kernel
theorem final_row_1099 : (active (1099 : Fin 2013)).any composed.final=machine.final (label (1099 : Fin 2013)) := by decide +kernel
theorem final_row_1100 : (active (1100 : Fin 2013)).any composed.final=machine.final (label (1100 : Fin 2013)) := by decide +kernel
theorem final_row_1101 : (active (1101 : Fin 2013)).any composed.final=machine.final (label (1101 : Fin 2013)) := by decide +kernel
theorem final_row_1102 : (active (1102 : Fin 2013)).any composed.final=machine.final (label (1102 : Fin 2013)) := by decide +kernel
theorem final_row_1103 : (active (1103 : Fin 2013)).any composed.final=machine.final (label (1103 : Fin 2013)) := by decide +kernel
theorem final_row_1104 : (active (1104 : Fin 2013)).any composed.final=machine.final (label (1104 : Fin 2013)) := by decide +kernel
theorem final_row_1105 : (active (1105 : Fin 2013)).any composed.final=machine.final (label (1105 : Fin 2013)) := by decide +kernel
theorem final_row_1106 : (active (1106 : Fin 2013)).any composed.final=machine.final (label (1106 : Fin 2013)) := by decide +kernel
theorem final_row_1107 : (active (1107 : Fin 2013)).any composed.final=machine.final (label (1107 : Fin 2013)) := by decide +kernel
theorem final_row_1108 : (active (1108 : Fin 2013)).any composed.final=machine.final (label (1108 : Fin 2013)) := by decide +kernel
theorem final_row_1109 : (active (1109 : Fin 2013)).any composed.final=machine.final (label (1109 : Fin 2013)) := by decide +kernel
theorem final_row_1110 : (active (1110 : Fin 2013)).any composed.final=machine.final (label (1110 : Fin 2013)) := by decide +kernel
theorem final_row_1111 : (active (1111 : Fin 2013)).any composed.final=machine.final (label (1111 : Fin 2013)) := by decide +kernel
theorem final_row_1112 : (active (1112 : Fin 2013)).any composed.final=machine.final (label (1112 : Fin 2013)) := by decide +kernel
theorem final_row_1113 : (active (1113 : Fin 2013)).any composed.final=machine.final (label (1113 : Fin 2013)) := by decide +kernel
theorem final_row_1114 : (active (1114 : Fin 2013)).any composed.final=machine.final (label (1114 : Fin 2013)) := by decide +kernel
theorem final_row_1115 : (active (1115 : Fin 2013)).any composed.final=machine.final (label (1115 : Fin 2013)) := by decide +kernel
theorem final_row_1116 : (active (1116 : Fin 2013)).any composed.final=machine.final (label (1116 : Fin 2013)) := by decide +kernel
theorem final_row_1117 : (active (1117 : Fin 2013)).any composed.final=machine.final (label (1117 : Fin 2013)) := by decide +kernel
theorem final_row_1118 : (active (1118 : Fin 2013)).any composed.final=machine.final (label (1118 : Fin 2013)) := by decide +kernel
theorem final_row_1119 : (active (1119 : Fin 2013)).any composed.final=machine.final (label (1119 : Fin 2013)) := by decide +kernel
theorem final_row_1120 : (active (1120 : Fin 2013)).any composed.final=machine.final (label (1120 : Fin 2013)) := by decide +kernel
theorem final_row_1121 : (active (1121 : Fin 2013)).any composed.final=machine.final (label (1121 : Fin 2013)) := by decide +kernel
theorem final_row_1122 : (active (1122 : Fin 2013)).any composed.final=machine.final (label (1122 : Fin 2013)) := by decide +kernel
theorem final_row_1123 : (active (1123 : Fin 2013)).any composed.final=machine.final (label (1123 : Fin 2013)) := by decide +kernel
theorem final_row_1124 : (active (1124 : Fin 2013)).any composed.final=machine.final (label (1124 : Fin 2013)) := by decide +kernel
theorem final_row_1125 : (active (1125 : Fin 2013)).any composed.final=machine.final (label (1125 : Fin 2013)) := by decide +kernel
theorem final_row_1126 : (active (1126 : Fin 2013)).any composed.final=machine.final (label (1126 : Fin 2013)) := by decide +kernel
theorem final_row_1127 : (active (1127 : Fin 2013)).any composed.final=machine.final (label (1127 : Fin 2013)) := by decide +kernel
theorem final_row_1128 : (active (1128 : Fin 2013)).any composed.final=machine.final (label (1128 : Fin 2013)) := by decide +kernel
theorem final_row_1129 : (active (1129 : Fin 2013)).any composed.final=machine.final (label (1129 : Fin 2013)) := by decide +kernel
theorem final_row_1130 : (active (1130 : Fin 2013)).any composed.final=machine.final (label (1130 : Fin 2013)) := by decide +kernel
theorem final_row_1131 : (active (1131 : Fin 2013)).any composed.final=machine.final (label (1131 : Fin 2013)) := by decide +kernel
theorem final_row_1132 : (active (1132 : Fin 2013)).any composed.final=machine.final (label (1132 : Fin 2013)) := by decide +kernel
theorem final_row_1133 : (active (1133 : Fin 2013)).any composed.final=machine.final (label (1133 : Fin 2013)) := by decide +kernel
theorem final_row_1134 : (active (1134 : Fin 2013)).any composed.final=machine.final (label (1134 : Fin 2013)) := by decide +kernel
theorem final_row_1135 : (active (1135 : Fin 2013)).any composed.final=machine.final (label (1135 : Fin 2013)) := by decide +kernel
theorem final_row_1136 : (active (1136 : Fin 2013)).any composed.final=machine.final (label (1136 : Fin 2013)) := by decide +kernel
theorem final_row_1137 : (active (1137 : Fin 2013)).any composed.final=machine.final (label (1137 : Fin 2013)) := by decide +kernel
theorem final_row_1138 : (active (1138 : Fin 2013)).any composed.final=machine.final (label (1138 : Fin 2013)) := by decide +kernel
theorem final_row_1139 : (active (1139 : Fin 2013)).any composed.final=machine.final (label (1139 : Fin 2013)) := by decide +kernel
theorem final_row_1140 : (active (1140 : Fin 2013)).any composed.final=machine.final (label (1140 : Fin 2013)) := by decide +kernel
theorem final_row_1141 : (active (1141 : Fin 2013)).any composed.final=machine.final (label (1141 : Fin 2013)) := by decide +kernel
theorem final_row_1142 : (active (1142 : Fin 2013)).any composed.final=machine.final (label (1142 : Fin 2013)) := by decide +kernel
theorem final_row_1143 : (active (1143 : Fin 2013)).any composed.final=machine.final (label (1143 : Fin 2013)) := by decide +kernel
theorem final_row_1144 : (active (1144 : Fin 2013)).any composed.final=machine.final (label (1144 : Fin 2013)) := by decide +kernel
theorem final_row_1145 : (active (1145 : Fin 2013)).any composed.final=machine.final (label (1145 : Fin 2013)) := by decide +kernel
theorem final_row_1146 : (active (1146 : Fin 2013)).any composed.final=machine.final (label (1146 : Fin 2013)) := by decide +kernel
theorem final_row_1147 : (active (1147 : Fin 2013)).any composed.final=machine.final (label (1147 : Fin 2013)) := by decide +kernel
theorem final_row_1148 : (active (1148 : Fin 2013)).any composed.final=machine.final (label (1148 : Fin 2013)) := by decide +kernel
theorem final_row_1149 : (active (1149 : Fin 2013)).any composed.final=machine.final (label (1149 : Fin 2013)) := by decide +kernel
theorem final_row_1150 : (active (1150 : Fin 2013)).any composed.final=machine.final (label (1150 : Fin 2013)) := by decide +kernel
theorem final_row_1151 : (active (1151 : Fin 2013)).any composed.final=machine.final (label (1151 : Fin 2013)) := by decide +kernel
theorem final_row_1152 : (active (1152 : Fin 2013)).any composed.final=machine.final (label (1152 : Fin 2013)) := by decide +kernel
theorem final_row_1153 : (active (1153 : Fin 2013)).any composed.final=machine.final (label (1153 : Fin 2013)) := by decide +kernel
theorem final_row_1154 : (active (1154 : Fin 2013)).any composed.final=machine.final (label (1154 : Fin 2013)) := by decide +kernel
theorem final_row_1155 : (active (1155 : Fin 2013)).any composed.final=machine.final (label (1155 : Fin 2013)) := by decide +kernel
theorem final_row_1156 : (active (1156 : Fin 2013)).any composed.final=machine.final (label (1156 : Fin 2013)) := by decide +kernel
theorem final_row_1157 : (active (1157 : Fin 2013)).any composed.final=machine.final (label (1157 : Fin 2013)) := by decide +kernel
theorem final_row_1158 : (active (1158 : Fin 2013)).any composed.final=machine.final (label (1158 : Fin 2013)) := by decide +kernel
theorem final_row_1159 : (active (1159 : Fin 2013)).any composed.final=machine.final (label (1159 : Fin 2013)) := by decide +kernel
theorem final_row_1160 : (active (1160 : Fin 2013)).any composed.final=machine.final (label (1160 : Fin 2013)) := by decide +kernel
theorem final_row_1161 : (active (1161 : Fin 2013)).any composed.final=machine.final (label (1161 : Fin 2013)) := by decide +kernel
theorem final_row_1162 : (active (1162 : Fin 2013)).any composed.final=machine.final (label (1162 : Fin 2013)) := by decide +kernel
theorem final_row_1163 : (active (1163 : Fin 2013)).any composed.final=machine.final (label (1163 : Fin 2013)) := by decide +kernel
theorem final_row_1164 : (active (1164 : Fin 2013)).any composed.final=machine.final (label (1164 : Fin 2013)) := by decide +kernel
theorem final_row_1165 : (active (1165 : Fin 2013)).any composed.final=machine.final (label (1165 : Fin 2013)) := by decide +kernel
theorem final_row_1166 : (active (1166 : Fin 2013)).any composed.final=machine.final (label (1166 : Fin 2013)) := by decide +kernel
theorem final_row_1167 : (active (1167 : Fin 2013)).any composed.final=machine.final (label (1167 : Fin 2013)) := by decide +kernel
theorem final_row_1168 : (active (1168 : Fin 2013)).any composed.final=machine.final (label (1168 : Fin 2013)) := by decide +kernel
theorem final_row_1169 : (active (1169 : Fin 2013)).any composed.final=machine.final (label (1169 : Fin 2013)) := by decide +kernel
theorem final_row_1170 : (active (1170 : Fin 2013)).any composed.final=machine.final (label (1170 : Fin 2013)) := by decide +kernel
theorem final_row_1171 : (active (1171 : Fin 2013)).any composed.final=machine.final (label (1171 : Fin 2013)) := by decide +kernel
theorem final_row_1172 : (active (1172 : Fin 2013)).any composed.final=machine.final (label (1172 : Fin 2013)) := by decide +kernel
theorem final_row_1173 : (active (1173 : Fin 2013)).any composed.final=machine.final (label (1173 : Fin 2013)) := by decide +kernel
theorem final_row_1174 : (active (1174 : Fin 2013)).any composed.final=machine.final (label (1174 : Fin 2013)) := by decide +kernel
theorem final_row_1175 : (active (1175 : Fin 2013)).any composed.final=machine.final (label (1175 : Fin 2013)) := by decide +kernel
theorem final_row_1176 : (active (1176 : Fin 2013)).any composed.final=machine.final (label (1176 : Fin 2013)) := by decide +kernel
theorem final_row_1177 : (active (1177 : Fin 2013)).any composed.final=machine.final (label (1177 : Fin 2013)) := by decide +kernel
theorem final_row_1178 : (active (1178 : Fin 2013)).any composed.final=machine.final (label (1178 : Fin 2013)) := by decide +kernel
theorem final_row_1179 : (active (1179 : Fin 2013)).any composed.final=machine.final (label (1179 : Fin 2013)) := by decide +kernel
theorem final_row_1180 : (active (1180 : Fin 2013)).any composed.final=machine.final (label (1180 : Fin 2013)) := by decide +kernel
theorem final_row_1181 : (active (1181 : Fin 2013)).any composed.final=machine.final (label (1181 : Fin 2013)) := by decide +kernel
theorem final_row_1182 : (active (1182 : Fin 2013)).any composed.final=machine.final (label (1182 : Fin 2013)) := by decide +kernel
theorem final_row_1183 : (active (1183 : Fin 2013)).any composed.final=machine.final (label (1183 : Fin 2013)) := by decide +kernel
theorem final_row_1184 : (active (1184 : Fin 2013)).any composed.final=machine.final (label (1184 : Fin 2013)) := by decide +kernel
theorem final_row_1185 : (active (1185 : Fin 2013)).any composed.final=machine.final (label (1185 : Fin 2013)) := by decide +kernel
theorem final_row_1186 : (active (1186 : Fin 2013)).any composed.final=machine.final (label (1186 : Fin 2013)) := by decide +kernel
theorem final_row_1187 : (active (1187 : Fin 2013)).any composed.final=machine.final (label (1187 : Fin 2013)) := by decide +kernel
theorem final_row_1188 : (active (1188 : Fin 2013)).any composed.final=machine.final (label (1188 : Fin 2013)) := by decide +kernel
theorem final_row_1189 : (active (1189 : Fin 2013)).any composed.final=machine.final (label (1189 : Fin 2013)) := by decide +kernel
theorem final_row_1190 : (active (1190 : Fin 2013)).any composed.final=machine.final (label (1190 : Fin 2013)) := by decide +kernel
theorem final_row_1191 : (active (1191 : Fin 2013)).any composed.final=machine.final (label (1191 : Fin 2013)) := by decide +kernel
theorem final_row_1192 : (active (1192 : Fin 2013)).any composed.final=machine.final (label (1192 : Fin 2013)) := by decide +kernel
theorem final_row_1193 : (active (1193 : Fin 2013)).any composed.final=machine.final (label (1193 : Fin 2013)) := by decide +kernel
theorem final_row_1194 : (active (1194 : Fin 2013)).any composed.final=machine.final (label (1194 : Fin 2013)) := by decide +kernel
theorem final_row_1195 : (active (1195 : Fin 2013)).any composed.final=machine.final (label (1195 : Fin 2013)) := by decide +kernel
theorem final_row_1196 : (active (1196 : Fin 2013)).any composed.final=machine.final (label (1196 : Fin 2013)) := by decide +kernel
theorem final_row_1197 : (active (1197 : Fin 2013)).any composed.final=machine.final (label (1197 : Fin 2013)) := by decide +kernel
theorem final_row_1198 : (active (1198 : Fin 2013)).any composed.final=machine.final (label (1198 : Fin 2013)) := by decide +kernel
theorem final_row_1199 : (active (1199 : Fin 2013)).any composed.final=machine.final (label (1199 : Fin 2013)) := by decide +kernel
theorem final_row_1200 : (active (1200 : Fin 2013)).any composed.final=machine.final (label (1200 : Fin 2013)) := by decide +kernel
theorem final_row_1201 : (active (1201 : Fin 2013)).any composed.final=machine.final (label (1201 : Fin 2013)) := by decide +kernel
theorem final_row_1202 : (active (1202 : Fin 2013)).any composed.final=machine.final (label (1202 : Fin 2013)) := by decide +kernel
theorem final_row_1203 : (active (1203 : Fin 2013)).any composed.final=machine.final (label (1203 : Fin 2013)) := by decide +kernel
theorem final_row_1204 : (active (1204 : Fin 2013)).any composed.final=machine.final (label (1204 : Fin 2013)) := by decide +kernel
theorem final_row_1205 : (active (1205 : Fin 2013)).any composed.final=machine.final (label (1205 : Fin 2013)) := by decide +kernel
theorem final_row_1206 : (active (1206 : Fin 2013)).any composed.final=machine.final (label (1206 : Fin 2013)) := by decide +kernel
theorem final_row_1207 : (active (1207 : Fin 2013)).any composed.final=machine.final (label (1207 : Fin 2013)) := by decide +kernel
theorem final_row_1208 : (active (1208 : Fin 2013)).any composed.final=machine.final (label (1208 : Fin 2013)) := by decide +kernel
theorem final_row_1209 : (active (1209 : Fin 2013)).any composed.final=machine.final (label (1209 : Fin 2013)) := by decide +kernel
theorem final_row_1210 : (active (1210 : Fin 2013)).any composed.final=machine.final (label (1210 : Fin 2013)) := by decide +kernel
theorem final_row_1211 : (active (1211 : Fin 2013)).any composed.final=machine.final (label (1211 : Fin 2013)) := by decide +kernel
theorem final_row_1212 : (active (1212 : Fin 2013)).any composed.final=machine.final (label (1212 : Fin 2013)) := by decide +kernel
theorem final_row_1213 : (active (1213 : Fin 2013)).any composed.final=machine.final (label (1213 : Fin 2013)) := by decide +kernel
theorem final_row_1214 : (active (1214 : Fin 2013)).any composed.final=machine.final (label (1214 : Fin 2013)) := by decide +kernel
theorem final_row_1215 : (active (1215 : Fin 2013)).any composed.final=machine.final (label (1215 : Fin 2013)) := by decide +kernel
theorem final_row_1216 : (active (1216 : Fin 2013)).any composed.final=machine.final (label (1216 : Fin 2013)) := by decide +kernel
theorem final_row_1217 : (active (1217 : Fin 2013)).any composed.final=machine.final (label (1217 : Fin 2013)) := by decide +kernel
theorem final_row_1218 : (active (1218 : Fin 2013)).any composed.final=machine.final (label (1218 : Fin 2013)) := by decide +kernel
theorem final_row_1219 : (active (1219 : Fin 2013)).any composed.final=machine.final (label (1219 : Fin 2013)) := by decide +kernel
theorem final_row_1220 : (active (1220 : Fin 2013)).any composed.final=machine.final (label (1220 : Fin 2013)) := by decide +kernel
theorem final_row_1221 : (active (1221 : Fin 2013)).any composed.final=machine.final (label (1221 : Fin 2013)) := by decide +kernel
theorem final_row_1222 : (active (1222 : Fin 2013)).any composed.final=machine.final (label (1222 : Fin 2013)) := by decide +kernel
theorem final_row_1223 : (active (1223 : Fin 2013)).any composed.final=machine.final (label (1223 : Fin 2013)) := by decide +kernel
theorem final_row_1224 : (active (1224 : Fin 2013)).any composed.final=machine.final (label (1224 : Fin 2013)) := by decide +kernel
theorem final_row_1225 : (active (1225 : Fin 2013)).any composed.final=machine.final (label (1225 : Fin 2013)) := by decide +kernel
theorem final_row_1226 : (active (1226 : Fin 2013)).any composed.final=machine.final (label (1226 : Fin 2013)) := by decide +kernel
theorem final_row_1227 : (active (1227 : Fin 2013)).any composed.final=machine.final (label (1227 : Fin 2013)) := by decide +kernel
theorem final_row_1228 : (active (1228 : Fin 2013)).any composed.final=machine.final (label (1228 : Fin 2013)) := by decide +kernel
theorem final_row_1229 : (active (1229 : Fin 2013)).any composed.final=machine.final (label (1229 : Fin 2013)) := by decide +kernel
theorem final_row_1230 : (active (1230 : Fin 2013)).any composed.final=machine.final (label (1230 : Fin 2013)) := by decide +kernel
theorem final_row_1231 : (active (1231 : Fin 2013)).any composed.final=machine.final (label (1231 : Fin 2013)) := by decide +kernel
theorem final_row_1232 : (active (1232 : Fin 2013)).any composed.final=machine.final (label (1232 : Fin 2013)) := by decide +kernel
theorem final_row_1233 : (active (1233 : Fin 2013)).any composed.final=machine.final (label (1233 : Fin 2013)) := by decide +kernel
theorem final_row_1234 : (active (1234 : Fin 2013)).any composed.final=machine.final (label (1234 : Fin 2013)) := by decide +kernel
theorem final_row_1235 : (active (1235 : Fin 2013)).any composed.final=machine.final (label (1235 : Fin 2013)) := by decide +kernel
theorem final_row_1236 : (active (1236 : Fin 2013)).any composed.final=machine.final (label (1236 : Fin 2013)) := by decide +kernel
theorem final_row_1237 : (active (1237 : Fin 2013)).any composed.final=machine.final (label (1237 : Fin 2013)) := by decide +kernel
theorem final_row_1238 : (active (1238 : Fin 2013)).any composed.final=machine.final (label (1238 : Fin 2013)) := by decide +kernel
theorem final_row_1239 : (active (1239 : Fin 2013)).any composed.final=machine.final (label (1239 : Fin 2013)) := by decide +kernel
theorem final_row_1240 : (active (1240 : Fin 2013)).any composed.final=machine.final (label (1240 : Fin 2013)) := by decide +kernel
theorem final_row_1241 : (active (1241 : Fin 2013)).any composed.final=machine.final (label (1241 : Fin 2013)) := by decide +kernel
theorem final_row_1242 : (active (1242 : Fin 2013)).any composed.final=machine.final (label (1242 : Fin 2013)) := by decide +kernel
theorem final_row_1243 : (active (1243 : Fin 2013)).any composed.final=machine.final (label (1243 : Fin 2013)) := by decide +kernel
theorem final_row_1244 : (active (1244 : Fin 2013)).any composed.final=machine.final (label (1244 : Fin 2013)) := by decide +kernel
theorem final_row_1245 : (active (1245 : Fin 2013)).any composed.final=machine.final (label (1245 : Fin 2013)) := by decide +kernel
theorem final_row_1246 : (active (1246 : Fin 2013)).any composed.final=machine.final (label (1246 : Fin 2013)) := by decide +kernel
theorem final_row_1247 : (active (1247 : Fin 2013)).any composed.final=machine.final (label (1247 : Fin 2013)) := by decide +kernel
theorem final_row_1248 : (active (1248 : Fin 2013)).any composed.final=machine.final (label (1248 : Fin 2013)) := by decide +kernel
theorem final_row_1249 : (active (1249 : Fin 2013)).any composed.final=machine.final (label (1249 : Fin 2013)) := by decide +kernel
theorem final_row_1250 : (active (1250 : Fin 2013)).any composed.final=machine.final (label (1250 : Fin 2013)) := by decide +kernel
theorem final_row_1251 : (active (1251 : Fin 2013)).any composed.final=machine.final (label (1251 : Fin 2013)) := by decide +kernel
theorem final_row_1252 : (active (1252 : Fin 2013)).any composed.final=machine.final (label (1252 : Fin 2013)) := by decide +kernel
theorem final_row_1253 : (active (1253 : Fin 2013)).any composed.final=machine.final (label (1253 : Fin 2013)) := by decide +kernel
theorem final_row_1254 : (active (1254 : Fin 2013)).any composed.final=machine.final (label (1254 : Fin 2013)) := by decide +kernel
theorem final_row_1255 : (active (1255 : Fin 2013)).any composed.final=machine.final (label (1255 : Fin 2013)) := by decide +kernel
theorem final_row_1256 : (active (1256 : Fin 2013)).any composed.final=machine.final (label (1256 : Fin 2013)) := by decide +kernel
theorem final_row_1257 : (active (1257 : Fin 2013)).any composed.final=machine.final (label (1257 : Fin 2013)) := by decide +kernel
theorem final_row_1258 : (active (1258 : Fin 2013)).any composed.final=machine.final (label (1258 : Fin 2013)) := by decide +kernel
theorem final_row_1259 : (active (1259 : Fin 2013)).any composed.final=machine.final (label (1259 : Fin 2013)) := by decide +kernel
theorem final_row_1260 : (active (1260 : Fin 2013)).any composed.final=machine.final (label (1260 : Fin 2013)) := by decide +kernel
theorem final_row_1261 : (active (1261 : Fin 2013)).any composed.final=machine.final (label (1261 : Fin 2013)) := by decide +kernel
theorem final_row_1262 : (active (1262 : Fin 2013)).any composed.final=machine.final (label (1262 : Fin 2013)) := by decide +kernel
theorem final_row_1263 : (active (1263 : Fin 2013)).any composed.final=machine.final (label (1263 : Fin 2013)) := by decide +kernel
theorem final_row_1264 : (active (1264 : Fin 2013)).any composed.final=machine.final (label (1264 : Fin 2013)) := by decide +kernel
theorem final_row_1265 : (active (1265 : Fin 2013)).any composed.final=machine.final (label (1265 : Fin 2013)) := by decide +kernel
theorem final_row_1266 : (active (1266 : Fin 2013)).any composed.final=machine.final (label (1266 : Fin 2013)) := by decide +kernel
theorem final_row_1267 : (active (1267 : Fin 2013)).any composed.final=machine.final (label (1267 : Fin 2013)) := by decide +kernel
theorem final_row_1268 : (active (1268 : Fin 2013)).any composed.final=machine.final (label (1268 : Fin 2013)) := by decide +kernel
theorem final_row_1269 : (active (1269 : Fin 2013)).any composed.final=machine.final (label (1269 : Fin 2013)) := by decide +kernel
theorem final_row_1270 : (active (1270 : Fin 2013)).any composed.final=machine.final (label (1270 : Fin 2013)) := by decide +kernel
theorem final_row_1271 : (active (1271 : Fin 2013)).any composed.final=machine.final (label (1271 : Fin 2013)) := by decide +kernel
theorem final_row_1272 : (active (1272 : Fin 2013)).any composed.final=machine.final (label (1272 : Fin 2013)) := by decide +kernel
theorem final_row_1273 : (active (1273 : Fin 2013)).any composed.final=machine.final (label (1273 : Fin 2013)) := by decide +kernel
theorem final_row_1274 : (active (1274 : Fin 2013)).any composed.final=machine.final (label (1274 : Fin 2013)) := by decide +kernel
theorem final_row_1275 : (active (1275 : Fin 2013)).any composed.final=machine.final (label (1275 : Fin 2013)) := by decide +kernel
theorem final_row_1276 : (active (1276 : Fin 2013)).any composed.final=machine.final (label (1276 : Fin 2013)) := by decide +kernel
theorem final_row_1277 : (active (1277 : Fin 2013)).any composed.final=machine.final (label (1277 : Fin 2013)) := by decide +kernel
theorem final_row_1278 : (active (1278 : Fin 2013)).any composed.final=machine.final (label (1278 : Fin 2013)) := by decide +kernel
theorem final_row_1279 : (active (1279 : Fin 2013)).any composed.final=machine.final (label (1279 : Fin 2013)) := by decide +kernel
theorem refinement_block_4 : ∀ q : Fin 2013, 1024≤q.val → q.val<1280 →
    ∀ d, maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val) := by
  have h : ∀ q : Fin 2013, 1024≤q.val → q.val<1280 → ∀ d, maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val) :=
    FiniteCertificate.checked_interval_rows (n:=2013) (lo:=1024) (len:=256)
      (P:=fun q => ∀ d, maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val)) [⟨1024,refinement_row_1024⟩,⟨1025,refinement_row_1025⟩,⟨1026,refinement_row_1026⟩,⟨1027,refinement_row_1027⟩,⟨1028,refinement_row_1028⟩,⟨1029,refinement_row_1029⟩,⟨1030,refinement_row_1030⟩,⟨1031,refinement_row_1031⟩,⟨1032,refinement_row_1032⟩,⟨1033,refinement_row_1033⟩,⟨1034,refinement_row_1034⟩,⟨1035,refinement_row_1035⟩,⟨1036,refinement_row_1036⟩,⟨1037,refinement_row_1037⟩,⟨1038,refinement_row_1038⟩,⟨1039,refinement_row_1039⟩,⟨1040,refinement_row_1040⟩,⟨1041,refinement_row_1041⟩,⟨1042,refinement_row_1042⟩,⟨1043,refinement_row_1043⟩,⟨1044,refinement_row_1044⟩,⟨1045,refinement_row_1045⟩,⟨1046,refinement_row_1046⟩,⟨1047,refinement_row_1047⟩,⟨1048,refinement_row_1048⟩,⟨1049,refinement_row_1049⟩,⟨1050,refinement_row_1050⟩,⟨1051,refinement_row_1051⟩,⟨1052,refinement_row_1052⟩,⟨1053,refinement_row_1053⟩,⟨1054,refinement_row_1054⟩,⟨1055,refinement_row_1055⟩,⟨1056,refinement_row_1056⟩,⟨1057,refinement_row_1057⟩,⟨1058,refinement_row_1058⟩,⟨1059,refinement_row_1059⟩,⟨1060,refinement_row_1060⟩,⟨1061,refinement_row_1061⟩,⟨1062,refinement_row_1062⟩,⟨1063,refinement_row_1063⟩,⟨1064,refinement_row_1064⟩,⟨1065,refinement_row_1065⟩,⟨1066,refinement_row_1066⟩,⟨1067,refinement_row_1067⟩,⟨1068,refinement_row_1068⟩,⟨1069,refinement_row_1069⟩,⟨1070,refinement_row_1070⟩,⟨1071,refinement_row_1071⟩,⟨1072,refinement_row_1072⟩,⟨1073,refinement_row_1073⟩,⟨1074,refinement_row_1074⟩,⟨1075,refinement_row_1075⟩,⟨1076,refinement_row_1076⟩,⟨1077,refinement_row_1077⟩,⟨1078,refinement_row_1078⟩,⟨1079,refinement_row_1079⟩,⟨1080,refinement_row_1080⟩,⟨1081,refinement_row_1081⟩,⟨1082,refinement_row_1082⟩,⟨1083,refinement_row_1083⟩,⟨1084,refinement_row_1084⟩,⟨1085,refinement_row_1085⟩,⟨1086,refinement_row_1086⟩,⟨1087,refinement_row_1087⟩,⟨1088,refinement_row_1088⟩,⟨1089,refinement_row_1089⟩,⟨1090,refinement_row_1090⟩,⟨1091,refinement_row_1091⟩,⟨1092,refinement_row_1092⟩,⟨1093,refinement_row_1093⟩,⟨1094,refinement_row_1094⟩,⟨1095,refinement_row_1095⟩,⟨1096,refinement_row_1096⟩,⟨1097,refinement_row_1097⟩,⟨1098,refinement_row_1098⟩,⟨1099,refinement_row_1099⟩,⟨1100,refinement_row_1100⟩,⟨1101,refinement_row_1101⟩,⟨1102,refinement_row_1102⟩,⟨1103,refinement_row_1103⟩,⟨1104,refinement_row_1104⟩,⟨1105,refinement_row_1105⟩,⟨1106,refinement_row_1106⟩,⟨1107,refinement_row_1107⟩,⟨1108,refinement_row_1108⟩,⟨1109,refinement_row_1109⟩,⟨1110,refinement_row_1110⟩,⟨1111,refinement_row_1111⟩,⟨1112,refinement_row_1112⟩,⟨1113,refinement_row_1113⟩,⟨1114,refinement_row_1114⟩,⟨1115,refinement_row_1115⟩,⟨1116,refinement_row_1116⟩,⟨1117,refinement_row_1117⟩,⟨1118,refinement_row_1118⟩,⟨1119,refinement_row_1119⟩,⟨1120,refinement_row_1120⟩,⟨1121,refinement_row_1121⟩,⟨1122,refinement_row_1122⟩,⟨1123,refinement_row_1123⟩,⟨1124,refinement_row_1124⟩,⟨1125,refinement_row_1125⟩,⟨1126,refinement_row_1126⟩,⟨1127,refinement_row_1127⟩,⟨1128,refinement_row_1128⟩,⟨1129,refinement_row_1129⟩,⟨1130,refinement_row_1130⟩,⟨1131,refinement_row_1131⟩,⟨1132,refinement_row_1132⟩,⟨1133,refinement_row_1133⟩,⟨1134,refinement_row_1134⟩,⟨1135,refinement_row_1135⟩,⟨1136,refinement_row_1136⟩,⟨1137,refinement_row_1137⟩,⟨1138,refinement_row_1138⟩,⟨1139,refinement_row_1139⟩,⟨1140,refinement_row_1140⟩,⟨1141,refinement_row_1141⟩,⟨1142,refinement_row_1142⟩,⟨1143,refinement_row_1143⟩,⟨1144,refinement_row_1144⟩,⟨1145,refinement_row_1145⟩,⟨1146,refinement_row_1146⟩,⟨1147,refinement_row_1147⟩,⟨1148,refinement_row_1148⟩,⟨1149,refinement_row_1149⟩,⟨1150,refinement_row_1150⟩,⟨1151,refinement_row_1151⟩,⟨1152,refinement_row_1152⟩,⟨1153,refinement_row_1153⟩,⟨1154,refinement_row_1154⟩,⟨1155,refinement_row_1155⟩,⟨1156,refinement_row_1156⟩,⟨1157,refinement_row_1157⟩,⟨1158,refinement_row_1158⟩,⟨1159,refinement_row_1159⟩,⟨1160,refinement_row_1160⟩,⟨1161,refinement_row_1161⟩,⟨1162,refinement_row_1162⟩,⟨1163,refinement_row_1163⟩,⟨1164,refinement_row_1164⟩,⟨1165,refinement_row_1165⟩,⟨1166,refinement_row_1166⟩,⟨1167,refinement_row_1167⟩,⟨1168,refinement_row_1168⟩,⟨1169,refinement_row_1169⟩,⟨1170,refinement_row_1170⟩,⟨1171,refinement_row_1171⟩,⟨1172,refinement_row_1172⟩,⟨1173,refinement_row_1173⟩,⟨1174,refinement_row_1174⟩,⟨1175,refinement_row_1175⟩,⟨1176,refinement_row_1176⟩,⟨1177,refinement_row_1177⟩,⟨1178,refinement_row_1178⟩,⟨1179,refinement_row_1179⟩,⟨1180,refinement_row_1180⟩,⟨1181,refinement_row_1181⟩,⟨1182,refinement_row_1182⟩,⟨1183,refinement_row_1183⟩,⟨1184,refinement_row_1184⟩,⟨1185,refinement_row_1185⟩,⟨1186,refinement_row_1186⟩,⟨1187,refinement_row_1187⟩,⟨1188,refinement_row_1188⟩,⟨1189,refinement_row_1189⟩,⟨1190,refinement_row_1190⟩,⟨1191,refinement_row_1191⟩,⟨1192,refinement_row_1192⟩,⟨1193,refinement_row_1193⟩,⟨1194,refinement_row_1194⟩,⟨1195,refinement_row_1195⟩,⟨1196,refinement_row_1196⟩,⟨1197,refinement_row_1197⟩,⟨1198,refinement_row_1198⟩,⟨1199,refinement_row_1199⟩,⟨1200,refinement_row_1200⟩,⟨1201,refinement_row_1201⟩,⟨1202,refinement_row_1202⟩,⟨1203,refinement_row_1203⟩,⟨1204,refinement_row_1204⟩,⟨1205,refinement_row_1205⟩,⟨1206,refinement_row_1206⟩,⟨1207,refinement_row_1207⟩,⟨1208,refinement_row_1208⟩,⟨1209,refinement_row_1209⟩,⟨1210,refinement_row_1210⟩,⟨1211,refinement_row_1211⟩,⟨1212,refinement_row_1212⟩,⟨1213,refinement_row_1213⟩,⟨1214,refinement_row_1214⟩,⟨1215,refinement_row_1215⟩,⟨1216,refinement_row_1216⟩,⟨1217,refinement_row_1217⟩,⟨1218,refinement_row_1218⟩,⟨1219,refinement_row_1219⟩,⟨1220,refinement_row_1220⟩,⟨1221,refinement_row_1221⟩,⟨1222,refinement_row_1222⟩,⟨1223,refinement_row_1223⟩,⟨1224,refinement_row_1224⟩,⟨1225,refinement_row_1225⟩,⟨1226,refinement_row_1226⟩,⟨1227,refinement_row_1227⟩,⟨1228,refinement_row_1228⟩,⟨1229,refinement_row_1229⟩,⟨1230,refinement_row_1230⟩,⟨1231,refinement_row_1231⟩,⟨1232,refinement_row_1232⟩,⟨1233,refinement_row_1233⟩,⟨1234,refinement_row_1234⟩,⟨1235,refinement_row_1235⟩,⟨1236,refinement_row_1236⟩,⟨1237,refinement_row_1237⟩,⟨1238,refinement_row_1238⟩,⟨1239,refinement_row_1239⟩,⟨1240,refinement_row_1240⟩,⟨1241,refinement_row_1241⟩,⟨1242,refinement_row_1242⟩,⟨1243,refinement_row_1243⟩,⟨1244,refinement_row_1244⟩,⟨1245,refinement_row_1245⟩,⟨1246,refinement_row_1246⟩,⟨1247,refinement_row_1247⟩,⟨1248,refinement_row_1248⟩,⟨1249,refinement_row_1249⟩,⟨1250,refinement_row_1250⟩,⟨1251,refinement_row_1251⟩,⟨1252,refinement_row_1252⟩,⟨1253,refinement_row_1253⟩,⟨1254,refinement_row_1254⟩,⟨1255,refinement_row_1255⟩,⟨1256,refinement_row_1256⟩,⟨1257,refinement_row_1257⟩,⟨1258,refinement_row_1258⟩,⟨1259,refinement_row_1259⟩,⟨1260,refinement_row_1260⟩,⟨1261,refinement_row_1261⟩,⟨1262,refinement_row_1262⟩,⟨1263,refinement_row_1263⟩,⟨1264,refinement_row_1264⟩,⟨1265,refinement_row_1265⟩,⟨1266,refinement_row_1266⟩,⟨1267,refinement_row_1267⟩,⟨1268,refinement_row_1268⟩,⟨1269,refinement_row_1269⟩,⟨1270,refinement_row_1270⟩,⟨1271,refinement_row_1271⟩,⟨1272,refinement_row_1272⟩,⟨1273,refinement_row_1273⟩,⟨1274,refinement_row_1274⟩,⟨1275,refinement_row_1275⟩,⟨1276,refinement_row_1276⟩,⟨1277,refinement_row_1277⟩,⟨1278,refinement_row_1278⟩,⟨1279,refinement_row_1279⟩] (by decide +kernel)
  intro q hlo hhi
  exact h q hlo (by have hq := q.isLt; omega)
theorem final_block_4 : ∀ q : Fin 2013, 1024≤q.val → q.val<1280 →
    (active q).any composed.final=machine.final (label q) := by
  have h : ∀ q : Fin 2013, 1024≤q.val → q.val<1280 → (active q).any composed.final=machine.final (label q) :=
    FiniteCertificate.checked_interval_rows (n:=2013) (lo:=1024) (len:=256)
      (P:=fun q => (active q).any composed.final=machine.final (label q)) [⟨1024,final_row_1024⟩,⟨1025,final_row_1025⟩,⟨1026,final_row_1026⟩,⟨1027,final_row_1027⟩,⟨1028,final_row_1028⟩,⟨1029,final_row_1029⟩,⟨1030,final_row_1030⟩,⟨1031,final_row_1031⟩,⟨1032,final_row_1032⟩,⟨1033,final_row_1033⟩,⟨1034,final_row_1034⟩,⟨1035,final_row_1035⟩,⟨1036,final_row_1036⟩,⟨1037,final_row_1037⟩,⟨1038,final_row_1038⟩,⟨1039,final_row_1039⟩,⟨1040,final_row_1040⟩,⟨1041,final_row_1041⟩,⟨1042,final_row_1042⟩,⟨1043,final_row_1043⟩,⟨1044,final_row_1044⟩,⟨1045,final_row_1045⟩,⟨1046,final_row_1046⟩,⟨1047,final_row_1047⟩,⟨1048,final_row_1048⟩,⟨1049,final_row_1049⟩,⟨1050,final_row_1050⟩,⟨1051,final_row_1051⟩,⟨1052,final_row_1052⟩,⟨1053,final_row_1053⟩,⟨1054,final_row_1054⟩,⟨1055,final_row_1055⟩,⟨1056,final_row_1056⟩,⟨1057,final_row_1057⟩,⟨1058,final_row_1058⟩,⟨1059,final_row_1059⟩,⟨1060,final_row_1060⟩,⟨1061,final_row_1061⟩,⟨1062,final_row_1062⟩,⟨1063,final_row_1063⟩,⟨1064,final_row_1064⟩,⟨1065,final_row_1065⟩,⟨1066,final_row_1066⟩,⟨1067,final_row_1067⟩,⟨1068,final_row_1068⟩,⟨1069,final_row_1069⟩,⟨1070,final_row_1070⟩,⟨1071,final_row_1071⟩,⟨1072,final_row_1072⟩,⟨1073,final_row_1073⟩,⟨1074,final_row_1074⟩,⟨1075,final_row_1075⟩,⟨1076,final_row_1076⟩,⟨1077,final_row_1077⟩,⟨1078,final_row_1078⟩,⟨1079,final_row_1079⟩,⟨1080,final_row_1080⟩,⟨1081,final_row_1081⟩,⟨1082,final_row_1082⟩,⟨1083,final_row_1083⟩,⟨1084,final_row_1084⟩,⟨1085,final_row_1085⟩,⟨1086,final_row_1086⟩,⟨1087,final_row_1087⟩,⟨1088,final_row_1088⟩,⟨1089,final_row_1089⟩,⟨1090,final_row_1090⟩,⟨1091,final_row_1091⟩,⟨1092,final_row_1092⟩,⟨1093,final_row_1093⟩,⟨1094,final_row_1094⟩,⟨1095,final_row_1095⟩,⟨1096,final_row_1096⟩,⟨1097,final_row_1097⟩,⟨1098,final_row_1098⟩,⟨1099,final_row_1099⟩,⟨1100,final_row_1100⟩,⟨1101,final_row_1101⟩,⟨1102,final_row_1102⟩,⟨1103,final_row_1103⟩,⟨1104,final_row_1104⟩,⟨1105,final_row_1105⟩,⟨1106,final_row_1106⟩,⟨1107,final_row_1107⟩,⟨1108,final_row_1108⟩,⟨1109,final_row_1109⟩,⟨1110,final_row_1110⟩,⟨1111,final_row_1111⟩,⟨1112,final_row_1112⟩,⟨1113,final_row_1113⟩,⟨1114,final_row_1114⟩,⟨1115,final_row_1115⟩,⟨1116,final_row_1116⟩,⟨1117,final_row_1117⟩,⟨1118,final_row_1118⟩,⟨1119,final_row_1119⟩,⟨1120,final_row_1120⟩,⟨1121,final_row_1121⟩,⟨1122,final_row_1122⟩,⟨1123,final_row_1123⟩,⟨1124,final_row_1124⟩,⟨1125,final_row_1125⟩,⟨1126,final_row_1126⟩,⟨1127,final_row_1127⟩,⟨1128,final_row_1128⟩,⟨1129,final_row_1129⟩,⟨1130,final_row_1130⟩,⟨1131,final_row_1131⟩,⟨1132,final_row_1132⟩,⟨1133,final_row_1133⟩,⟨1134,final_row_1134⟩,⟨1135,final_row_1135⟩,⟨1136,final_row_1136⟩,⟨1137,final_row_1137⟩,⟨1138,final_row_1138⟩,⟨1139,final_row_1139⟩,⟨1140,final_row_1140⟩,⟨1141,final_row_1141⟩,⟨1142,final_row_1142⟩,⟨1143,final_row_1143⟩,⟨1144,final_row_1144⟩,⟨1145,final_row_1145⟩,⟨1146,final_row_1146⟩,⟨1147,final_row_1147⟩,⟨1148,final_row_1148⟩,⟨1149,final_row_1149⟩,⟨1150,final_row_1150⟩,⟨1151,final_row_1151⟩,⟨1152,final_row_1152⟩,⟨1153,final_row_1153⟩,⟨1154,final_row_1154⟩,⟨1155,final_row_1155⟩,⟨1156,final_row_1156⟩,⟨1157,final_row_1157⟩,⟨1158,final_row_1158⟩,⟨1159,final_row_1159⟩,⟨1160,final_row_1160⟩,⟨1161,final_row_1161⟩,⟨1162,final_row_1162⟩,⟨1163,final_row_1163⟩,⟨1164,final_row_1164⟩,⟨1165,final_row_1165⟩,⟨1166,final_row_1166⟩,⟨1167,final_row_1167⟩,⟨1168,final_row_1168⟩,⟨1169,final_row_1169⟩,⟨1170,final_row_1170⟩,⟨1171,final_row_1171⟩,⟨1172,final_row_1172⟩,⟨1173,final_row_1173⟩,⟨1174,final_row_1174⟩,⟨1175,final_row_1175⟩,⟨1176,final_row_1176⟩,⟨1177,final_row_1177⟩,⟨1178,final_row_1178⟩,⟨1179,final_row_1179⟩,⟨1180,final_row_1180⟩,⟨1181,final_row_1181⟩,⟨1182,final_row_1182⟩,⟨1183,final_row_1183⟩,⟨1184,final_row_1184⟩,⟨1185,final_row_1185⟩,⟨1186,final_row_1186⟩,⟨1187,final_row_1187⟩,⟨1188,final_row_1188⟩,⟨1189,final_row_1189⟩,⟨1190,final_row_1190⟩,⟨1191,final_row_1191⟩,⟨1192,final_row_1192⟩,⟨1193,final_row_1193⟩,⟨1194,final_row_1194⟩,⟨1195,final_row_1195⟩,⟨1196,final_row_1196⟩,⟨1197,final_row_1197⟩,⟨1198,final_row_1198⟩,⟨1199,final_row_1199⟩,⟨1200,final_row_1200⟩,⟨1201,final_row_1201⟩,⟨1202,final_row_1202⟩,⟨1203,final_row_1203⟩,⟨1204,final_row_1204⟩,⟨1205,final_row_1205⟩,⟨1206,final_row_1206⟩,⟨1207,final_row_1207⟩,⟨1208,final_row_1208⟩,⟨1209,final_row_1209⟩,⟨1210,final_row_1210⟩,⟨1211,final_row_1211⟩,⟨1212,final_row_1212⟩,⟨1213,final_row_1213⟩,⟨1214,final_row_1214⟩,⟨1215,final_row_1215⟩,⟨1216,final_row_1216⟩,⟨1217,final_row_1217⟩,⟨1218,final_row_1218⟩,⟨1219,final_row_1219⟩,⟨1220,final_row_1220⟩,⟨1221,final_row_1221⟩,⟨1222,final_row_1222⟩,⟨1223,final_row_1223⟩,⟨1224,final_row_1224⟩,⟨1225,final_row_1225⟩,⟨1226,final_row_1226⟩,⟨1227,final_row_1227⟩,⟨1228,final_row_1228⟩,⟨1229,final_row_1229⟩,⟨1230,final_row_1230⟩,⟨1231,final_row_1231⟩,⟨1232,final_row_1232⟩,⟨1233,final_row_1233⟩,⟨1234,final_row_1234⟩,⟨1235,final_row_1235⟩,⟨1236,final_row_1236⟩,⟨1237,final_row_1237⟩,⟨1238,final_row_1238⟩,⟨1239,final_row_1239⟩,⟨1240,final_row_1240⟩,⟨1241,final_row_1241⟩,⟨1242,final_row_1242⟩,⟨1243,final_row_1243⟩,⟨1244,final_row_1244⟩,⟨1245,final_row_1245⟩,⟨1246,final_row_1246⟩,⟨1247,final_row_1247⟩,⟨1248,final_row_1248⟩,⟨1249,final_row_1249⟩,⟨1250,final_row_1250⟩,⟨1251,final_row_1251⟩,⟨1252,final_row_1252⟩,⟨1253,final_row_1253⟩,⟨1254,final_row_1254⟩,⟨1255,final_row_1255⟩,⟨1256,final_row_1256⟩,⟨1257,final_row_1257⟩,⟨1258,final_row_1258⟩,⟨1259,final_row_1259⟩,⟨1260,final_row_1260⟩,⟨1261,final_row_1261⟩,⟨1262,final_row_1262⟩,⟨1263,final_row_1263⟩,⟨1264,final_row_1264⟩,⟨1265,final_row_1265⟩,⟨1266,final_row_1266⟩,⟨1267,final_row_1267⟩,⟨1268,final_row_1268⟩,⟨1269,final_row_1269⟩,⟨1270,final_row_1270⟩,⟨1271,final_row_1271⟩,⟨1272,final_row_1272⟩,⟨1273,final_row_1273⟩,⟨1274,final_row_1274⟩,⟨1275,final_row_1275⟩,⟨1276,final_row_1276⟩,⟨1277,final_row_1277⟩,⟨1278,final_row_1278⟩,⟨1279,final_row_1279⟩] (by decide +kernel)
  intro q hlo hhi
  exact h q hlo (by have hq := q.isLt; omega)

end CutPeriod.Parts3Certificate
