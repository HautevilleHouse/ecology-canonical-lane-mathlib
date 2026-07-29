import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure BiogeochemicalCyclesPackage where
  carbonCycle : Prop
  nitrogenCycle : Prop
  phosphorusCycle : Prop
  fluxBalance : Prop
  carbonCycleClosed : carbonCycle
  nitrogenCycleClosed : nitrogenCycle
  phosphorusCycleClosed : phosphorusCycle
  fluxBalanceClosed : fluxBalance

structure BiogeochemicalCyclesEvidence (B : BiogeochemicalCyclesPackage) where
  carbonCycleClosed : B.carbonCycle
  nitrogenCycleClosed : B.nitrogenCycle
  phosphorusCycleClosed : B.phosphorusCycle
  fluxBalanceClosed : B.fluxBalance

def BiogeochemicalCyclesClosed (B : BiogeochemicalCyclesPackage) : Prop :=
  B.carbonCycle ∧ B.nitrogenCycle ∧ B.phosphorusCycle ∧ B.fluxBalance

theorem biogeochemical_cycles_closed_from_evidence (B : BiogeochemicalCyclesPackage)
    (E : BiogeochemicalCyclesEvidence B) : BiogeochemicalCyclesClosed B := by
  exact And.intro E.carbonCycleClosed
    (And.intro E.nitrogenCycleClosed
      (And.intro E.phosphorusCycleClosed E.fluxBalanceClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse