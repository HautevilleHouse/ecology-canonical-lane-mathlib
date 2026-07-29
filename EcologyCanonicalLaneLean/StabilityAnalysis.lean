import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyCanonicalLaneLean.BiodiversityMeasures

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure StabilityAnalysisPackage {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    {B : BiodiversityMeasuresPackage E P} where
  resilienceMetric : ℝ
  resistanceMetric : ℝ
  lyapunovStability : Prop
  structuralStability : Prop

structure StabilityAnalysisEvidence {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    {B : BiodiversityMeasuresPackage E P} (S : StabilityAnalysisPackage E P B) where
  resilienceMetricClosed : S.resilienceMetric > 0
  resistanceMetricClosed : S.resistanceMetric > 0
  lyapunovStabilityClosed : S.lyapunovStability
  structuralStabilityClosed : S.structuralStability

def StabilityAnalysisClosed {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    {B : BiodiversityMeasuresPackage E P} (S : StabilityAnalysisPackage E P B) : Prop :=
  S.resilienceMetric > 0 ∧ S.resistanceMetric > 0 ∧ S.lyapunovStability ∧ S.structuralStability

theorem stability_analysis_closed_from_evidence {E : EcosystemModel} {P : PopulationDynamicsPackage E}
    {B : BiodiversityMeasuresPackage E P} (S : StabilityAnalysisPackage E P B)
    (v : StabilityAnalysisEvidence S) : StabilityAnalysisClosed S := by
  exact And.intro v.resilienceMetricClosed (And.intro v.resistanceMetricClosed
    (And.intro v.lyapunovStabilityClosed v.structuralStabilityClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse