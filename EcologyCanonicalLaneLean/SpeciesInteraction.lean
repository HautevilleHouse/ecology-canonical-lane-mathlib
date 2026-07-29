import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure SpeciesInteractionPackage where
  predatorPreyModel : Prop
  competitionModel : Prop
  mutualismModel : Prop
  coexistenceConditions : Prop
  predatorPreyModelClosed : predatorPreyModel
  competitionModelClosed : competitionModel
  mutualismModelClosed : mutualismModel
  coexistenceConditionsClosed : coexistenceConditions

structure SpeciesInteractionEvidence (S : SpeciesInteractionPackage) where
  predatorPreyModelClosed : S.predatorPreyModel
  competitionModelClosed : S.competitionModel
  mutualismModelClosed : S.mutualismModel
  coexistenceConditionsClosed : S.coexistenceConditions

def SpeciesInteractionClosed (S : SpeciesInteractionPackage) : Prop :=
  S.predatorPreyModel ∧ S.competitionModel ∧ S.mutualismModel ∧ S.coexistenceConditions

theorem species_interaction_closed_from_evidence (S : SpeciesInteractionPackage)
    (E : SpeciesInteractionEvidence S) : SpeciesInteractionClosed S := by
  exact And.intro E.predatorPreyModelClosed
    (And.intro E.competitionModelClosed
      (And.intro E.mutualismModelClosed E.coexistenceConditionsClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse