import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure FoodWebPackage where
  trophicLevels : Prop
  connectance : Prop
  omnivoryIndex : Prop
  foodChainLength : Prop

structure FoodWebEvidence (F : FoodWebPackage) where
  trophicLevelsClosed : F.trophicLevels
  connectanceClosed : F.connectance
  omnivoryIndexClosed : F.omnivoryIndex
  foodChainLengthClosed : F.foodChainLength

def FoodWebClosed (F : FoodWebPackage) : Prop :=
  F.trophicLevels ∧ F.connectance ∧ F.omnivoryIndex ∧ F.foodChainLength

theorem food_web_closed_from_evidence (F : FoodWebPackage)
    (Ev : FoodWebEvidence F) : FoodWebClosed F := by
  exact And.intro Ev.trophicLevelsClosed
    (And.intro Ev.connectanceClosed
      (And.intro Ev.omnivoryIndexClosed Ev.foodChainLengthClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse