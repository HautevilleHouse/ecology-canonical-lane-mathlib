import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure NutrientCyclingPackage where
  decompositionRate : Prop
  mineralization : Prop
  immobilization : Prop
  nutrientUseEfficiency : Prop

structure NutrientCyclingEvidence (N : NutrientCyclingPackage) where
  decompositionRateClosed : N.decompositionRate
  mineralizationClosed : N.mineralization
  immobilizationClosed : N.immobilization
  nutrientUseEfficiencyClosed : N.nutrientUseEfficiency

def NutrientCyclingClosed (N : NutrientCyclingPackage) : Prop :=
  N.decompositionRate ∧ N.mineralization ∧ N.immobilization ∧ N.nutrientUseEfficiency

theorem nutrient_cycling_closed_from_evidence (N : NutrientCyclingPackage)
    (Ev : NutrientCyclingEvidence N) : NutrientCyclingClosed N := by
  exact And.intro Ev.decompositionRateClosed
    (And.intro Ev.mineralizationClosed
      (And.intro Ev.immobilizationClosed Ev.nutrientUseEfficiencyClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse