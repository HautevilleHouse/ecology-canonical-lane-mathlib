import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure EcosystemEngineeringPackage where
  habitatModification : Prop
  resourceAllocation : Prop
  keystoneEffect : Prop
  trophicCascade : Prop

structure EcosystemEngineeringEvidence (E : EcosystemEngineeringPackage) where
  habitatModificationClosed : E.habitatModification
  resourceAllocationClosed : E.resourceAllocation
  keystoneEffectClosed : E.keystoneEffect
  trophicCascadeClosed : E.trophicCascade

def EcosystemEngineeringClosed (E : EcosystemEngineeringPackage) : Prop :=
  E.habitatModification ∧ E.resourceAllocation ∧ E.keystoneEffect ∧ E.trophicCascade

theorem ecosystem_engineering_closed_from_evidence (E : EcosystemEngineeringPackage)
    (Ev : EcosystemEngineeringEvidence E) : EcosystemEngineeringClosed E := by
  exact And.intro Ev.habitatModificationClosed
    (And.intro Ev.resourceAllocationClosed
      (And.intro Ev.keystoneEffectClosed Ev.trophicCascadeClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse