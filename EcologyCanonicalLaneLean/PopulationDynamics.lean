import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure PopulationDynamicsPackage where
  carryingCapacity : Prop
  logisticGrowth : Prop
  predatorPreyInteraction : Prop
  equilibriumPoints : Prop
  stabilityAnalysis : Prop

structure PopulationDynamicsEvidence (P : PopulationDynamicsPackage) where
  carryingCapacityClosed : P.carryingCapacity
  logisticGrowthClosed : P.logisticGrowth
  predatorPreyInteractionClosed : P.predatorPreyInteraction
  equilibriumPointsClosed : P.equilibriumPoints
  stabilityAnalysisClosed : P.stabilityAnalysis

def PopulationDynamicsClosed (P : PopulationDynamicsPackage) : Prop :=
  P.carryingCapacity ∧ P.logisticGrowth ∧ P.predatorPreyInteraction ∧
  P.equilibriumPoints ∧ P.stabilityAnalysis

theorem population_dynamics_closed_from_evidence (P : PopulationDynamicsPackage)
    (E : PopulationDynamicsEvidence P) : PopulationDynamicsClosed P := by
  exact And.intro E.carryingCapacityClosed
    (And.intro E.logisticGrowthClosed
      (And.intro E.predatorPreyInteractionClosed
        (And.intro E.equilibriumPointsClosed E.stabilityAnalysisClosed)))

end EcologyCanonicalLaneLean
end HautevilleHouse