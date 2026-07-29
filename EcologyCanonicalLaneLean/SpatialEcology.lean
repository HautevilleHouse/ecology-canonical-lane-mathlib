import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyCanonicalLaneLean

structure SpatialEcologyPackage where
  habitatFragmentation : Prop
  metapopulationDynamics : Prop
  dispersalKernel : Prop
  landscapeConnectivity : Prop

structure SpatialEcologyEvidence (S : SpatialEcologyPackage) where
  habitatFragmentationClosed : S.habitatFragmentation
  metapopulationDynamicsClosed : S.metapopulationDynamics
  dispersalKernelClosed : S.dispersalKernel
  landscapeConnectivityClosed : S.landscapeConnectivity

def SpatialEcologyClosed (S : SpatialEcologyPackage) : Prop :=
  S.habitatFragmentation ∧ S.metapopulationDynamics ∧ S.dispersalKernel ∧ S.landscapeConnectivity

theorem spatial_ecology_closed_from_evidence (S : SpatialEcologyPackage)
    (Ev : SpatialEcologyEvidence S) : SpatialEcologyClosed S := by
  exact And.intro Ev.habitatFragmentationClosed
    (And.intro Ev.metapopulationDynamicsClosed
      (And.intro Ev.dispersalKernelClosed Ev.landscapeConnectivityClosed))

end EcologyCanonicalLaneLean
end HautevilleHouse