import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure BiodiversityIndexPackage where
  speciesRichness : Prop
  shannonIndex : Prop
  evennessMeasure : Prop
  rarefactionCurve : Prop

structure BiodiversityIndexEvidence (B : BiodiversityIndexPackage) where
  speciesRichnessClosed : B.speciesRichness
  shannonIndexClosed : B.shannonIndex
  evennessMeasureClosed : B.evennessMeasure
  rarefactionCurveClosed : B.rarefactionCurve

def BiodiversityIndexClosed (B : BiodiversityIndexPackage) : Prop :=
  B.speciesRichness ∧ B.shannonIndex ∧ B.evennessMeasure ∧ B.rarefactionCurve

theorem biodiversity_index_closed_from_evidence (B : BiodiversityIndexPackage)
    (Ev : BiodiversityIndexEvidence B) : BiodiversityIndexClosed B := by
  exact And.intro Ev.speciesRichnessClosed
    (And.intro Ev.shannonIndexClosed
      (And.intro Ev.evennessMeasureClosed Ev.rarefactionCurveClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse