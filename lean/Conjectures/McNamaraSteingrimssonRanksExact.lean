module

public import Conjectures.McNamaraSteingrimssonWrittenRankEval

@[expose] public section
namespace McNamaraSteingrimsson

theorem writtenRankNum_44 : writtenRankNum 44=8598793292661 := by decide
theorem writtenRankNum_45 : writtenRankNum 45=8598464986146 := by decide
theorem writtenRankNum_46 : writtenRankNum 46=8599053474845 := by decide

theorem writtenRankCard_44 : writtenRankCard 44=8598793292661 := by
  have h := (writtenRankCard_exact_arithmetic 44 (by decide) (by decide)).trans writtenRankNum_44
  exact_mod_cast h

theorem writtenRankCard_45 : writtenRankCard 45=8598464986146 := by
  have h := (writtenRankCard_exact_arithmetic 45 (by decide) (by decide)).trans writtenRankNum_45
  exact_mod_cast h

theorem writtenRankCard_46 : writtenRankCard 46=8599053474845 := by
  have h := (writtenRankCard_exact_arithmetic 46 (by decide) (by decide)).trans writtenRankNum_46
  exact_mod_cast h

end McNamaraSteingrimsson
