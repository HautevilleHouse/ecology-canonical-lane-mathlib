import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure SuccessionPackage (A : AdmissibleClass) where
  primarySuccession : Prop
  secondarySuccession : Prop
  climaxCommunity : Prop
  disturbanceRegime : Prop
  resilience : Prop

structure SuccessionEvidence {A : AdmissibleClass} (S : SuccessionPackage A) where
  primarySuccessionClosed : S.primarySuccession
  secondarySuccessionClosed : S.secondarySuccession
  climaxCommunityClosed : S.climaxCommunity
  disturbanceRegimeClosed : S.disturbanceRegime
  resilienceClosed : S.resilience

def SuccessionClosed {A : AdmissibleClass} (S : SuccessionPackage A) : Prop :=
  S.primarySuccession ∧ S.secondarySuccession ∧ S.climaxCommunity ∧
  S.disturbanceRegime ∧ S.resilience

theorem succession_closed_from_evidence
    {A : AdmissibleClass} (S : SuccessionPackage A)
    (E : SuccessionEvidence S) : SuccessionClosed S := by
  exact And.intro E.primarySuccessionClosed
    (And.intro E.secondarySuccessionClosed
      (And.intro E.climaxCommunityClosed
        (And.intro E.disturbanceRegimeClosed E.resilienceClosed)))

end EcologyCanonicalLaneLean
end HautevilleHouse