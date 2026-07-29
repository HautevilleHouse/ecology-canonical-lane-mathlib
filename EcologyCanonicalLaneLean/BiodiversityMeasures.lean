import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyCanonicalLaneLean.PopulationDynamics

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure BiodiversityMeasuresPackage {E : EcosystemModel} {P : PopulationDynamicsPackage E} where
  speciesRichness : ℕ
  shannonIndex : ℝ
  simpsonIndex : ℝ
  evennessMeasure : ℝ
  measuresConsistent : Prop

structure BiodiversityMeasuresEvidence {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    (B : BiodiversityMeasuresPackage E P) where
  speciesRichnessClosed : B.speciesRichness > 0
  shannonIndexClosed : B.shannonIndex ≥ 0
  simpsonIndexClosed : B.simpsonIndex ≥ 0 ∧ B.simpsonIndex ≤ 1
  evennessMeasureClosed : B.evennessMeasure ≥ 0 ∧ B.evennessMeasure ≤ 1
  measuresConsistentClosed : B.measuresConsistent

def BiodiversityMeasuresClosed {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    (B : BiodiversityMeasuresPackage E P) : Prop :=
  B.speciesRichness > 0 ∧ B.shannonIndex ≥ 0 ∧ (B.simpsonIndex ≥ 0 ∧ B.simpsonIndex ≤ 1) ∧
  (B.evennessMeasure ≥ 0 ∧ B.evennessMeasure ≤ 1) ∧ B.measuresConsistent

theorem biodiversity_measures_closed_from_evidence {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    (B : BiodiversityMeasuresPackage E P) (v : BiodiversityMeasuresEvidence B) :
    BiodiversityMeasuresClosed B := by
  exact And.intro v.speciesRichnessClosed (And.intro v.shannonIndexClosed
    (And.intro v.simpsonIndexClosed (And.intro v.evennessMeasureClosed v.measuresConsistentClosed)))

end EcologyCanonicalLaneLean
end HautevilleHouse