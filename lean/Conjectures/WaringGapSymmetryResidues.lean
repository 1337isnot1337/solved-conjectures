module

public import Conjectures.WaringGapSymmetryInjective

@[expose] public section

namespace WaringGapSymmetryCore

theorem cover64 : CoversResidues data64 :=
  cover_of_certificate data64 605637028844486560 192541681802850798 5658291481426951400103288081989910395817489 (by decide)

theorem unique64 : UniqueReduced data64 :=
  unique_of_coordinate_certificate data64 406837268550925863 969740588752481260
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)

theorem cover128 : CoversResidues data128 :=
  cover_of_certificate data128 673412091720402879668151559679273665 19634276914226491121056059135758415293 16956492488865960669554705388023488272231619306776691461787121451176554357669093407277073 (by decide)

theorem unique128 : UniqueReduced data128 :=
  unique_of_coordinate_certificate data128 7382481681128296803757218506390950806
    10733766628171766154518719926100529182
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)

end WaringGapSymmetryCore
