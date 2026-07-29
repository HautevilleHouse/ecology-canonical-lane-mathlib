import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure EcosystemStabilityPackage where
  resilience : Prop
  resistance : Prop
  regimeShift : Prop
  biodiversityStability : Prop

structure EcosystemStabilityEvidence (E : EcosystemStabilityPackage) where
  resilienceClosed : E.resilience
  resistanceClosed : E.resistance
  regimeShiftClosed : E.regimeShift
  biodiversityStabilityClosed : E.biodiversityStability

def EcosystemStabilityClosed (E : EcosystemStabilityPackage) : Prop :=
  E.resilience ∧ E.resistance ∧ E.regimeShift ∧ E.biodiversityStability

theorem ecosystem_stability_closed_from_evidence (E : EcosystemStabilityPackage)
    (Ev : EcosystemStabilityEvidence E) : EcosystemStabilityClosed E := by
  exact And.intro Ev.resilienceClosed
    (And.intro Ev.resistanceClosed
      (And.intro Ev.regimeShiftClosed Ev.biodiversityStabilityClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse