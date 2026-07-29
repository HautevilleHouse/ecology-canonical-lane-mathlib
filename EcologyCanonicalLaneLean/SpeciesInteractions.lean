import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure SpeciesInteractionsPackage where
  competitionModel : Prop
  mutualismModel : Prop
  trophicCascade : Prop
  nichePartitioning : Prop

structure SpeciesInteractionsEvidence (S : SpeciesInteractionsPackage) where
  competitionModelClosed : S.competitionModel
  mutualismModelClosed : S.mutualismModel
  trophicCascadeClosed : S.trophicCascade
  nichePartitioningClosed : S.nichePartitioning

def SpeciesInteractionsClosed (S : SpeciesInteractionsPackage) : Prop :=
  S.competitionModel ∧ S.mutualismModel ∧ S.trophicCascade ∧ S.nichePartitioning

theorem species_interactions_closed_from_evidence (S : SpeciesInteractionsPackage)
    (E : SpeciesInteractionsEvidence S) : SpeciesInteractionsClosed S := by
  exact And.intro E.competitionModelClosed
    (And.intro E.mutualismModelClosed
      (And.intro E.trophicCascadeClosed E.nichePartitioningClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse