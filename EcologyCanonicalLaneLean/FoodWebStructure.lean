import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure FoodWebPackage (A : AdmissibleClass) where
  trophicLevels : Prop
  predatorPreyInteractions : Prop
  foodWebStability : Prop
  energyTransferEfficiency : Prop
  biodiversityMeasure : Prop

structure FoodWebEvidence {A : AdmissibleClass} (F : FoodWebPackage A) where
  trophicLevelsClosed : F.trophicLevels
  predatorPreyInteractionsClosed : F.predatorPreyInteractions
  foodWebStabilityClosed : F.foodWebStability
  energyTransferEfficiencyClosed : F.energyTransferEfficiency
  biodiversityMeasureClosed : F.biodiversityMeasure

def FoodWebClosed {A : AdmissibleClass} (F : FoodWebPackage A) : Prop :=
  F.trophicLevels ∧ F.predatorPreyInteractions ∧ F.foodWebStability ∧
  F.energyTransferEfficiency ∧ F.biodiversityMeasure

theorem food_web_closed_from_evidence
    {A : AdmissibleClass} (F : FoodWebPackage A)
    (E : FoodWebEvidence F) : FoodWebClosed F := by
  exact And.intro E.trophicLevelsClosed
    (And.intro E.predatorPreyInteractionsClosed
      (And.intro E.foodWebStabilityClosed
        (And.intro E.energyTransferEfficiencyClosed E.biodiversityMeasureClosed)))

end EcologyCanonicalLaneLean
end HautevilleHouse