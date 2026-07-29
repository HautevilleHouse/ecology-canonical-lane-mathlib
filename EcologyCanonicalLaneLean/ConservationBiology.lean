import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure ConservationBiologyPackage where
  minimumViablePopulation : Prop
  extinctionRisk : Prop
  reserveDesign : Prop
  minimumViablePopulationClosed : minimumViablePopulation
  extinctionRiskClosed : extinctionRisk
  reserveDesignClosed : reserveDesign

structure ConservationBiologyEvidence (C : ConservationBiologyPackage) where
  minimumViablePopulationClosed : C.minimumViablePopulation
  extinctionRiskClosed : C.extinctionRisk
  reserveDesignClosed : C.reserveDesign

def ConservationBiologyClosed (C : ConservationBiologyPackage) : Prop :=
  C.minimumViablePopulation ∧ C.extinctionRisk ∧ C.reserveDesign

theorem conservation_biology_closed_from_evidence (C : ConservationBiologyPackage)
    (E : ConservationBiologyEvidence C) : ConservationBiologyClosed C := by
  exact And.intro E.minimumViablePopulationClosed
    (And.intro E.extinctionRiskClosed E.reserveDesignClosed)

end EcologyCanonicalLaneLean
end HautevilleHouse