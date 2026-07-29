import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure BiodiversityAssemblyPackage where
  phylogeneticDiversity : Prop
  functionalTraitDistribution : Prop
  speciesRichness : Prop
  evennessIndex : Prop
  nichePartitioning : Prop

structure BiodiversityAssemblyEvidence (B : BiodiversityAssemblyPackage) where
  phylogeneticDiversityClosed : B.phylogeneticDiversity
  functionalTraitDistributionClosed : B.functionalTraitDistribution
  speciesRichnessClosed : B.speciesRichness
  evennessIndexClosed : B.evennessIndex
  nichePartitioningClosed : B.nichePartitioning

def BiodiversityAssemblyClosed (B : BiodiversityAssemblyPackage) : Prop :=
  B.phylogeneticDiversity ∧ B.functionalTraitDistribution ∧
  B.speciesRichness ∧ B.evennessIndex ∧ B.nichePartitioning

theorem biodiversity_assembly_closed_from_evidence (B : BiodiversityAssemblyPackage)
    (E : BiodiversityAssemblyEvidence B) : BiodiversityAssemblyClosed B := by
  exact And.intro E.phylogeneticDiversityClosed
    (And.intro E.functionalTraitDistributionClosed
      (And.intro E.speciesRichnessClosed
        (And.intro E.evennessIndexClosed E.nichePartitioningClosed)))

end EcologyCanonicalLaneLean
end HautevilleHouse