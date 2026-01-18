// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: ETSI NFV SOL 001 vnfd types definitions version 4.4.1

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_common_types_4_4_1

// --------------------------------------------------
// Data Types
// --------------------------------------------------

//
// Describes requirements on a virtual network interface
//
sig tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Provides a human readable name for the requirement.', 'required': False}
  //
  // Provides a human readable name for the requirement.
  //
  name: lone string,

  // YAML description: {'type': 'string', 'description': 'Provides a human readable description of the requirement.', 'required': False}
  //
  // Provides a human readable description of the requirement.
  //
  description: lone string,

  // YAML network_interface_requirements: {'type': 'map', 'description': 'The network interface requirements. A map of strings that contain a set of key-value pairs that describes the hardware platform specific  network interface deployment requirements.', 'required': True, 'entry_schema': {'type': 'string'}}
  //
  // The network interface requirements. A map of strings that contain a set of key-value pairs that describes the hardware platform specific  network interface deployment requirements.
  //
  network_interface_requirements: one TOSCA/map_string/Map,

  // YAML nic_io_requirements: {'type': 'tosca.datatypes.nfv.LogicalNodeData', 'description': 'references (couples) the CP with any logical node I/O requirements (for network devices) that may have been created. Linking these attributes is necessary so that so that I/O requirements that need to be articulated at the logical node level can be associated with the network interface requirements associated with the CP.', 'required': False}
  //
  // references (couples) the CP with any logical node I/O requirements (for network devices) that may have been created. Linking these attributes is necessary so that so that I/O requirements that need to be articulated at the logical node level can be associated with the network interface requirements associated with the CP.
  //
  nic_io_requirements: lone tosca_datatypes_nfv_LogicalNodeData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VirtualNetworkInterfaceRequirements */
run Show_tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements
  expect 1

//
// describes requested additional capability for a particular VDU
//
sig tosca_datatypes_nfv_RequestedAdditionalCapability extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML requested_additional_capability_name: {'type': 'string', 'description': 'Identifies a requested additional capability for the VDU.', 'required': True}
  //
  // Identifies a requested additional capability for the VDU.
  //
  requested_additional_capability_name: one string,

  // YAML support_mandatory: {'type': 'boolean', 'description': 'Indicates whether the requested additional capability is mandatory for successful operation.', 'required': True}
  //
  // Indicates whether the requested additional capability is mandatory for successful operation.
  //
  support_mandatory: one boolean,

  // YAML min_requested_additional_capability_version: {'type': 'string', 'description': 'Identifies the minimum version of the requested additional capability.', 'required': False}
  //
  // Identifies the minimum version of the requested additional capability.
  //
  min_requested_additional_capability_version: lone string,

  // YAML preferred_requested_additional_capability_version: {'type': 'string', 'description': 'Identifies the preferred version of the requested additional capability.', 'required': False}
  //
  // Identifies the preferred version of the requested additional capability.
  //
  preferred_requested_additional_capability_version: lone string,

  // YAML target_performance_parameters: {'type': 'map', 'description': 'Identifies specific attributes, dependent on the requested additional capability type.', 'required': True, 'entry_schema': {'type': 'string'}}
  //
  // Identifies specific attributes, dependent on the requested additional capability type.
  //
  target_performance_parameters: one TOSCA/map_string/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.RequestedAdditionalCapability */
run Show_tosca_datatypes_nfv_RequestedAdditionalCapability {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_RequestedAdditionalCapability
  expect 1

//
// supports the specification of requirements related to virtual memory of a virtual compute resource
//
sig tosca_datatypes_nfv_VirtualMemory extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML virtual_mem_size: {'type': 'scalar-unit.size', 'description': 'Amount of virtual memory.', 'required': True}
  //
  // Amount of virtual memory.
  //
  virtual_mem_size: one scalar_unit_size,

  // YAML virtual_mem_oversubscription_policy: {'type': 'string', 'description': 'The memory core oversubscription policy in terms of virtual memory to physical memory on the platform.', 'required': False}
  //
  // The memory core oversubscription policy in terms of virtual memory to physical memory on the platform.
  //
  virtual_mem_oversubscription_policy: lone string,

  // YAML vdu_mem_requirements: {'type': 'map', 'description': 'The hardware platform specific VDU memory requirements. A map of strings that contains a set of key-value pairs that describes hardware platform specific VDU memory requirements.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // The hardware platform specific VDU memory requirements. A map of strings that contains a set of key-value pairs that describes hardware platform specific VDU memory requirements.
  //
  vdu_mem_requirements: lone TOSCA/map_string/Map,

  // YAML numa_enabled: {'type': 'boolean', 'description': 'It specifies the memory allocation to be cognisant of the relevant process/core allocation.', 'required': True, 'default': False}
  //
  // It specifies the memory allocation to be cognisant of the relevant process/core allocation.
  //
  numa_enabled: one boolean,

  // YAML huge_pages_requirements: {'type': 'list', 'description': 'The requirement for huge pages resources. Each element in the list indicates a hugepage size and the total memory requested for hugepages of that size.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.Hugepages'}}
  //
  // The requirement for huge pages resources. Each element in the list indicates a hugepage size and the total memory requested for hugepages of that size.
  //
  huge_pages_requirements: seq tosca_datatypes_nfv_Hugepages,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VirtualMemory */
run Show_tosca_datatypes_nfv_VirtualMemory {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualMemory
  expect 1

//
// Supports the specification of requirements related to virtual CPU(s) of a virtual compute resource
//
sig tosca_datatypes_nfv_VirtualCpu extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML cpu_architecture: {'type': 'string', 'description': 'CPU architecture type. Examples are x86, ARM', 'required': False}
  //
  // CPU architecture type. Examples are x86, ARM
  //
  cpu_architecture: lone string,

  // YAML num_virtual_cpu: {'type': 'integer', 'description': 'Number of virtual CPUs', 'required': True, 'constraints': [{'greater_than': 0}]}
  //
  // Number of virtual CPUs
  //
  num_virtual_cpu: one integer,

  // YAML virtual_cpu_clock: {'type': 'scalar-unit.frequency', 'description': 'Minimum virtual CPU clock rate', 'required': False}
  //
  // Minimum virtual CPU clock rate
  //
  virtual_cpu_clock: lone scalar_unit_frequency,

  // YAML virtual_cpu_oversubscription_policy: {'type': 'string', 'description': 'CPU core oversubscription policy e.g. the relation of virtual CPU cores to physical CPU cores/threads.', 'required': False}
  //
  // CPU core oversubscription policy e.g. the relation of virtual CPU cores to physical CPU cores/threads.
  //
  virtual_cpu_oversubscription_policy: lone string,

  // YAML vdu_cpu_requirements: {'type': 'map', 'description': 'The hardware platform specific VDU CPU requirements. A map of strings that contains a set of key-value pairs describing VDU CPU specific hardware platform requirements.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // The hardware platform specific VDU CPU requirements. A map of strings that contains a set of key-value pairs describing VDU CPU specific hardware platform requirements.
  //
  vdu_cpu_requirements: lone TOSCA/map_string/Map,

  // YAML virtual_cpu_pinning: {'type': 'tosca.datatypes.nfv.VirtualCpuPinning', 'description': 'The virtual CPU pinning configuration for the virtualised compute resource.', 'required': False}
  //
  // The virtual CPU pinning configuration for the virtualised compute resource.
  //
  virtual_cpu_pinning: lone tosca_datatypes_nfv_VirtualCpuPinning,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  num_virtual_cpu.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.VirtualCpu */
run Show_tosca_datatypes_nfv_VirtualCpu {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualCpu
  expect 1

//
// Supports the specification of requirements related to the virtual CPU pinning configuration of a virtual compute resource
//
sig tosca_datatypes_nfv_VirtualCpuPinning extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML virtual_cpu_pinning_policy: {'type': 'string', 'description': 'Indicates the policy for CPU pinning. The policy can take values of "static" or "dynamic". In case of "dynamic" the allocation of virtual CPU cores to logical CPU cores is decided by the VIM. (e.g. SMT (Simultaneous Multi-Threading) requirements). In case of "static" the allocation is requested to be according to the virtual_cpu_pinning_rule.', 'required': False, 'constraints': [{'valid_values': ['static', 'dynamic']}]}
  //
  // Indicates the policy for CPU pinning. The policy can take values of "static" or "dynamic". In case of "dynamic" the allocation of virtual CPU cores to logical CPU cores is decided by the VIM. (e.g. SMT (Simultaneous Multi-Threading) requirements). In case of "static" the allocation is requested to be according to the virtual_cpu_pinning_rule.
  //
  virtual_cpu_pinning_policy: lone string,

  // YAML virtual_cpu_pinning_rule: {'type': 'list', 'description': 'Provides the list of rules for allocating virtual CPU cores to logical  CPU cores/threads', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Provides the list of rules for allocating virtual CPU cores to logical  CPU cores/threads
  //
  virtual_cpu_pinning_rule: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  virtual_cpu_pinning_policy.valid_values["static" + "dynamic"]

}

/** There exists some tosca.datatypes.nfv.VirtualCpuPinning */
run Show_tosca_datatypes_nfv_VirtualCpuPinning {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualCpuPinning
  expect 1

//
// Defines the configurable properties of a VNFC
//
sig tosca_datatypes_nfv_VnfcConfigurableProperties extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML additional_vnfc_configurable_properties: {'type': 'tosca.datatypes.nfv.VnfcAdditionalConfigurableProperties', 'description': 'Describes additional configuration for VNFC that can be modified using the ModifyVnfInfo operation', 'required': False}
  //
  // Describes additional configuration for VNFC that can be modified using the ModifyVnfInfo operation
  //
  additional_vnfc_configurable_properties: lone tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfcConfigurableProperties */
run Show_tosca_datatypes_nfv_VnfcConfigurableProperties {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfcConfigurableProperties
  expect 1

//
// VnfcAdditionalConfigurableProperties type is an empty base type for deriving data types for describing additional configurable properties for a given VNFC.
//
sig tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfcAdditionalConfigurableProperties */
run Show_tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties
  expect 1

//
// describes additional instantiation data for a given Vdu.Compute (for VM based VDU) or Vdu.OsContainerDeployableUnit node (for Oscontainer based VDU) used in a specific deployment flavour.
//
sig tosca_datatypes_nfv_VduProfile extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML min_number_of_instances: {'type': 'integer', 'description': 'Minimum number of instances of the VNFC based on this Vdu.Compute (for VM based VDU) or Vdu.OsContainerDeployableUnit node (for Oscontainer based VDU) that is permitted to exist for a particular VNF deployment flavour.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Minimum number of instances of the VNFC based on this Vdu.Compute (for VM based VDU) or Vdu.OsContainerDeployableUnit node (for Oscontainer based VDU) that is permitted to exist for a particular VNF deployment flavour.
  //
  min_number_of_instances: one integer,

  // YAML max_number_of_instances: {'type': 'integer', 'description': 'Maximum number of instances of the VNFC based on this Vdu.Compute (for VM based VDU) or Vdu.OsContainerDeployableUnit node (for Oscontainer based VDU) that is permitted to exist for a particular VNF deployment flavour.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Maximum number of instances of the VNFC based on this Vdu.Compute (for VM based VDU) or Vdu.OsContainerDeployableUnit node (for Oscontainer based VDU) that is permitted to exist for a particular VNF deployment flavour.
  //
  max_number_of_instances: one integer,

  // YAML nfvi_maintenance_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the impact tolerance and rules to be observed when instance(s) of the Vdu.Compute (for VM based VDU) are impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the impact tolerance and rules to be observed when instance(s) of the Vdu.Compute (for VM based VDU) are impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  nfvi_maintenance_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  min_number_of_instances.greater_or_equal[0]
  max_number_of_instances.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.VduProfile */
run Show_tosca_datatypes_nfv_VduProfile {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VduProfile
  expect 1

//
// Describes additional instantiation data for a given VL used in a specific VNF deployment flavour.
//
sig tosca_datatypes_nfv_VlProfile extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML max_bitrate_requirements: {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements', 'description': 'Specifies the maximum bitrate requirements for a VL instantiated according to this profile.', 'required': True}
  //
  // Specifies the maximum bitrate requirements for a VL instantiated according to this profile.
  //
  max_bitrate_requirements: one tosca_datatypes_nfv_LinkBitrateRequirements,

  // YAML min_bitrate_requirements: {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements', 'description': 'Specifies the minimum bitrate requirements for a VL instantiated according to this profile.', 'required': True}
  //
  // Specifies the minimum bitrate requirements for a VL instantiated according to this profile.
  //
  min_bitrate_requirements: one tosca_datatypes_nfv_LinkBitrateRequirements,

  // YAML qos: {'type': 'tosca.datatypes.nfv.Qos', 'description': 'Specifies the QoS requirements of a VL instantiated according to this profile.', 'required': False}
  //
  // Specifies the QoS requirements of a VL instantiated according to this profile.
  //
  qos: lone tosca_datatypes_nfv_Qos,

  // YAML virtual_link_protocol_data: {'type': 'list', 'description': 'Specifies the protocol data for a virtual link.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualLinkProtocolData'}}
  //
  // Specifies the protocol data for a virtual link.
  //
  virtual_link_protocol_data: seq tosca_datatypes_nfv_VirtualLinkProtocolData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VlProfile */
run Show_tosca_datatypes_nfv_VlProfile {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VlProfile
  expect 1

//
// describes one protocol layer and associated protocol data for a given virtual link used in a specific VNF deployment flavour
//
sig tosca_datatypes_nfv_VirtualLinkProtocolData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML associated_layer_protocol: {'type': 'string', 'description': 'Identifies one of the protocols a virtualLink gives access to (ethernet, mpls, odu2, ipv4, ipv6, pseudo-wire) as specified by the connectivity_type property.', 'required': True, 'constraints': [{'valid_values': ['ethernet', 'mpls', 'odu2', 'ipv4', 'ipv6', 'pseudo-wire']}]}
  //
  // Identifies one of the protocols a virtualLink gives access to (ethernet, mpls, odu2, ipv4, ipv6, pseudo-wire) as specified by the connectivity_type property.
  //
  associated_layer_protocol: one string,

  // YAML l2_protocol_data: {'type': 'tosca.datatypes.nfv.L2ProtocolData', 'description': 'Specifies the L2 protocol data for a virtual link. Shall be present when the associatedLayerProtocol attribute indicates a L2 protocol and shall be absent otherwise.', 'required': False}
  //
  // Specifies the L2 protocol data for a virtual link. Shall be present when the associatedLayerProtocol attribute indicates a L2 protocol and shall be absent otherwise.
  //
  l2_protocol_data: lone tosca_datatypes_nfv_L2ProtocolData,

  // YAML l3_protocol_data: {'type': 'tosca.datatypes.nfv.L3ProtocolData', 'description': 'Specifies the L3 protocol data for this virtual link.  Shall be present when the associatedLayerProtocol attribute indicates a L3 protocol and shall be absent otherwise.', 'required': False}
  //
  // Specifies the L3 protocol data for this virtual link.  Shall be present when the associatedLayerProtocol attribute indicates a L3 protocol and shall be absent otherwise.
  //
  l3_protocol_data: lone tosca_datatypes_nfv_L3ProtocolData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  associated_layer_protocol.valid_values["ethernet" + "mpls" + "odu2" + "ipv4" + "ipv6" + "pseudo-wire"]

}

/** There exists some tosca.datatypes.nfv.VirtualLinkProtocolData */
run Show_tosca_datatypes_nfv_VirtualLinkProtocolData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualLinkProtocolData
  expect 1

//
// describes L2 protocol data for a given virtual link used in a specific VNF deployment flavour.
//
sig tosca_datatypes_nfv_L2ProtocolData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Identifies the network name associated with this L2 protocol.', 'required': False}
  //
  // Identifies the network name associated with this L2 protocol.
  //
  name: lone string,

  // YAML network_type: {'type': 'string', 'description': 'Specifies the network type for this L2 protocol. The value may be overridden at run-time.', 'required': False, 'constraints': [{'valid_values': ['flat', 'vlan', 'vxlan', 'gre']}]}
  //
  // Specifies the network type for this L2 protocol. The value may be overridden at run-time.
  //
  network_type: lone string,

  // YAML vlan_transparent: {'type': 'boolean', 'description': 'Specifies whether to support VLAN transparency for this L2 protocol or not.', 'required': True, 'default': False}
  //
  // Specifies whether to support VLAN transparency for this L2 protocol or not.
  //
  vlan_transparent: one boolean,

  // YAML mtu: {'type': 'integer', 'description': 'Specifies the maximum transmission unit (MTU) value for this L2 protocol.', 'required': False, 'constraints': [{'greater_than': 0}]}
  //
  // Specifies the maximum transmission unit (MTU) value for this L2 protocol.
  //
  mtu: lone integer,

  // YAML segmentation_id: {'type': 'string', 'description': 'Specifies a specific virtualised network segment, which depends on the network type. For e.g., VLAN ID for VLAN network type and tunnel ID for GRE/VXLAN network types', 'required': False}
  //
  // Specifies a specific virtualised network segment, which depends on the network type. For e.g., VLAN ID for VLAN network type and tunnel ID for GRE/VXLAN network types
  //
  segmentation_id: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  network_type.valid_values["flat" + "vlan" + "vxlan" + "gre"]
  some mtu implies mtu.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.L2ProtocolData */
run Show_tosca_datatypes_nfv_L2ProtocolData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_L2ProtocolData
  expect 1

//
// describes L3 protocol data for a given virtual link used in a specific VNF deployment flavour.
//
sig tosca_datatypes_nfv_L3ProtocolData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Identifies the network name associated with this L3 protocol.', 'required': False}
  //
  // Identifies the network name associated with this L3 protocol.
  //
  name: lone string,

  // YAML ip_version: {'type': 'string', 'description': 'Specifies IP version of this L3 protocol. The value of the ip_version property shall be consistent with the value of the layer_protocol in the connectivity_type property of the virtual link node.', 'required': True, 'constraints': [{'valid_values': ['ipv4', 'ipv6']}]}
  //
  // Specifies IP version of this L3 protocol. The value of the ip_version property shall be consistent with the value of the layer_protocol in the connectivity_type property of the virtual link node.
  //
  ip_version: one string,

  // YAML cidr: {'type': 'string', 'description': 'Specifies the CIDR (Classless Inter-Domain Routing) of this L3 protocol. The value may be overridden at run-time.', 'required': True}
  //
  // Specifies the CIDR (Classless Inter-Domain Routing) of this L3 protocol. The value may be overridden at run-time.
  //
  cidr: one string,

  // YAML ip_allocation_pools: {'type': 'list', 'description': 'Specifies the allocation pools with start and end IP addresses for this L3 protocol. The value may be overridden at run-time.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.IpAllocationPool'}}
  //
  // Specifies the allocation pools with start and end IP addresses for this L3 protocol. The value may be overridden at run-time.
  //
  ip_allocation_pools: seq tosca_datatypes_nfv_IpAllocationPool,

  // YAML gateway_ip: {'type': 'string', 'description': 'Specifies the gateway IP address for this L3 protocol. The value may be overridden at run-time.', 'required': False}
  //
  // Specifies the gateway IP address for this L3 protocol. The value may be overridden at run-time.
  //
  gateway_ip: lone string,

  // YAML dhcp_enabled: {'type': 'boolean', 'description': 'Indicates whether DHCP (Dynamic Host Configuration Protocol) is enabled or disabled for this L3 protocol. The value may be overridden at run-time.', 'required': False}
  //
  // Indicates whether DHCP (Dynamic Host Configuration Protocol) is enabled or disabled for this L3 protocol. The value may be overridden at run-time.
  //
  dhcp_enabled: lone boolean,

  // YAML ipv6_address_mode: {'type': 'string', 'description': 'Specifies IPv6 address mode. May be present when the value of the ipVersion attribute is "ipv6" and shall be absent otherwise. The value may be overridden at run-time.', 'required': False, 'constraints': [{'valid_values': ['slaac', 'dhcpv6-stateful', 'dhcpv6-stateless']}]}
  //
  // Specifies IPv6 address mode. May be present when the value of the ipVersion attribute is "ipv6" and shall be absent otherwise. The value may be overridden at run-time.
  //
  ipv6_address_mode: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  ip_version.valid_values["ipv4" + "ipv6"]
  ipv6_address_mode.valid_values["slaac" + "dhcpv6-stateful" + "dhcpv6-stateless"]

}

/** There exists some tosca.datatypes.nfv.L3ProtocolData */
run Show_tosca_datatypes_nfv_L3ProtocolData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_L3ProtocolData
  expect 1

//
// Specifies a range of IP addresses
//
sig tosca_datatypes_nfv_IpAllocationPool extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML start_ip_address: {'type': 'string', 'description': 'The IP address to be used as the first one in a pool of addresses derived from the cidr block full IP range', 'required': True}
  //
  // The IP address to be used as the first one in a pool of addresses derived from the cidr block full IP range
  //
  start_ip_address: one string,

  // YAML end_ip_address: {'type': 'string', 'description': 'The IP address to be used as the last one in a pool of addresses derived from the cidr block full IP range', 'required': True}
  //
  // The IP address to be used as the last one in a pool of addresses derived from the cidr block full IP range
  //
  end_ip_address: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.IpAllocationPool */
run Show_tosca_datatypes_nfv_IpAllocationPool {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_IpAllocationPool
  expect 1

//
// Describes the scale level for each aspect that corresponds to a given level of resources to be instantiated within a deployment flavour in term of the number VNFC instances
//
sig tosca_datatypes_nfv_InstantiationLevel extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the level', 'required': True}
  //
  // Human readable description of the level
  //
  description: one string,

  // YAML scale_info: {'type': 'map', 'description': 'Represents for each aspect the scale level that corresponds to this instantiation level. scale_info shall be present if the VNF supports scaling.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}
  //
  // Represents for each aspect the scale level that corresponds to this instantiation level. scale_info shall be present if the VNF supports scaling.
  //
  scale_info: lone TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.InstantiationLevel */
run Show_tosca_datatypes_nfv_InstantiationLevel {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_InstantiationLevel
  expect 1

//
// Indicates for a given Vdu.Compute in a given level the number of instances to deploy
//
sig tosca_datatypes_nfv_VduLevel extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML number_of_instances: {'type': 'integer', 'description': 'Number of instances of VNFC based on this VDU to deploy for this level.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Number of instances of VNFC based on this VDU to deploy for this level.
  //
  number_of_instances: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  number_of_instances.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.VduLevel */
run Show_tosca_datatypes_nfv_VduLevel {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VduLevel
  expect 1

//
// Represents information to configure lifecycle management operations
//
sig tosca_datatypes_nfv_VnfLcmOperationsConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML instantiate: {'type': 'tosca.datatypes.nfv.VnfInstantiateOperationConfiguration', 'description': 'Configuration parameters for the InstantiateVnf operation', 'required': False}
  //
  // Configuration parameters for the InstantiateVnf operation
  //
  instantiate: lone tosca_datatypes_nfv_VnfInstantiateOperationConfiguration,

  // YAML scale: {'type': 'tosca.datatypes.nfv.VnfScaleOperationConfiguration', 'description': 'Configuration parameters for the ScaleVnf operation', 'required': False}
  //
  // Configuration parameters for the ScaleVnf operation
  //
  scale: lone tosca_datatypes_nfv_VnfScaleOperationConfiguration,

  // YAML scale_to_level: {'type': 'tosca.datatypes.nfv.VnfScaleToLevelOperationConfiguration', 'description': 'Configuration parameters for the ScaleVnfToLevel operation', 'required': False}
  //
  // Configuration parameters for the ScaleVnfToLevel operation
  //
  scale_to_level: lone tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration,

  // YAML change_flavour: {'type': 'tosca.datatypes.nfv.VnfChangeFlavourOperationConfiguration', 'description': 'Configuration parameters for the changeVnfFlavourOpConfig operation', 'required': False}
  //
  // Configuration parameters for the changeVnfFlavourOpConfig operation
  //
  change_flavour: lone tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration,

  // YAML heal: {'type': 'tosca.datatypes.nfv.VnfHealOperationConfiguration', 'description': 'Configuration parameters for the HealVnf operation', 'required': False}
  //
  // Configuration parameters for the HealVnf operation
  //
  heal: lone tosca_datatypes_nfv_VnfHealOperationConfiguration,

  // YAML terminate: {'type': 'tosca.datatypes.nfv.VnfTerminateOperationConfiguration', 'description': 'Configuration parameters for the TerminateVnf operation', 'required': False}
  //
  // Configuration parameters for the TerminateVnf operation
  //
  terminate: lone tosca_datatypes_nfv_VnfTerminateOperationConfiguration,

  // YAML operate: {'type': 'tosca.datatypes.nfv.VnfOperateOperationConfiguration', 'description': 'Configuration parameters for the OperateVnf operation', 'required': False}
  //
  // Configuration parameters for the OperateVnf operation
  //
  operate: lone tosca_datatypes_nfv_VnfOperateOperationConfiguration,

  // YAML change_ext_connectivity: {'type': 'tosca.datatypes.nfv.VnfChangeExtConnectivityOperationConfiguration', 'description': 'Configuration parameters for the changeExtVnfConnectivityOpConfig operation', 'required': False}
  //
  // Configuration parameters for the changeExtVnfConnectivityOpConfig operation
  //
  change_ext_connectivity: lone tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration,

  // YAML change_current_package: {'type': 'tosca.datatypes.nfv.VnfChangeCurrentPackageOperationConfiguration', 'description': 'Configuration parameters for the ChangeCurrentVnfPackage operation', 'required': False}
  //
  // Configuration parameters for the ChangeCurrentVnfPackage operation
  //
  change_current_package: lone tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration,

  // YAML create_snapshot: {'type': 'tosca.datatypes.nfv.VnfCreateSnapshotOperationConfiguration', 'description': 'Configuration parameters for the CreateVnfSnapshot operation', 'required': False}
  //
  // Configuration parameters for the CreateVnfSnapshot operation
  //
  create_snapshot: lone tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration,

  // YAML revert_to_snapshot: {'type': 'tosca.datatypes.nfv.VnfRevertToSnapshotOperationConfiguration', 'description': 'Configuration parameters for the RevertToVnfSnapshot operation', 'required': False}
  //
  // Configuration parameters for the RevertToVnfSnapshot operation
  //
  revert_to_snapshot: lone tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfLcmOperationsConfiguration */
run Show_tosca_datatypes_nfv_VnfLcmOperationsConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfLcmOperationsConfiguration
  expect 1

//
// represents information that affect the invocation of the InstantiateVnf operation.
//
sig tosca_datatypes_nfv_VnfInstantiateOperationConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML target_scale_levels_supported: {'type': 'boolean', 'description': 'Signals whether passing a value larger than one in the numScalingSteps parameter of the ScaleVnf operation is supported by this VNF.', 'required': True, 'default': False}
  //
  // Signals whether passing a value larger than one in the numScalingSteps parameter of the ScaleVnf operation is supported by this VNF.
  //
  target_scale_levels_supported: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfInstantiateOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfInstantiateOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfInstantiateOperationConfiguration
  expect 1

//
// Represents information that affect the invocation of the ScaleVnf operation
//
sig tosca_datatypes_nfv_VnfScaleOperationConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scaling_by_more_than_one_step_supported: {'type': 'boolean', 'description': 'Signals whether passing a value larger than one in the numScalingSteps parameter of the ScaleVnf operation is supported by this VNF.', 'required': True, 'default': False}
  //
  // Signals whether passing a value larger than one in the numScalingSteps parameter of the ScaleVnf operation is supported by this VNF.
  //
  scaling_by_more_than_one_step_supported: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfScaleOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfScaleOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfScaleOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the ScaleVnfToLevel operation
//
sig tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML arbitrary_target_levels_supported: {'type': 'boolean', 'description': 'Signals whether scaling according to the parameter "scaleInfo" is supported by this VNF', 'required': True}
  //
  // Signals whether scaling according to the parameter "scaleInfo" is supported by this VNF
  //
  arbitrary_target_levels_supported: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfScaleToLevelOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the HealVnf operation
//
sig tosca_datatypes_nfv_VnfHealOperationConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML causes: {'type': 'list', 'description': 'Supported "cause" parameter values', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Supported "cause" parameter values
  //
  causes: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfHealOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfHealOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfHealOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the TerminateVnf
//
sig tosca_datatypes_nfv_VnfTerminateOperationConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML min_graceful_termination_timeout: {'type': 'scalar-unit.time', 'description': 'Minimum timeout value for graceful termination of a VNF instance', 'required': True}
  //
  // Minimum timeout value for graceful termination of a VNF instance
  //
  min_graceful_termination_timeout: one scalar_unit_time,

  // YAML max_recommended_graceful_termination_timeout: {'type': 'scalar-unit.time', 'description': 'Maximum recommended timeout value that can be needed to gracefully terminate a VNF instance of a particular type under certain conditions, such as maximum load condition. This is provided by VNF provider as information for the operator facilitating the selection of optimal timeout value. This value is not used as constraint', 'required': False}
  //
  // Maximum recommended timeout value that can be needed to gracefully terminate a VNF instance of a particular type under certain conditions, such as maximum load condition. This is provided by VNF provider as information for the operator facilitating the selection of optimal timeout value. This value is not used as constraint
  //
  max_recommended_graceful_termination_timeout: lone scalar_unit_time,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfTerminateOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfTerminateOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfTerminateOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the OperateVnf operation
//
sig tosca_datatypes_nfv_VnfOperateOperationConfiguration extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML min_graceful_stop_timeout: {'type': 'scalar-unit.time', 'description': 'Minimum timeout value for graceful stop of a VNF instance', 'required': True}
  //
  // Minimum timeout value for graceful stop of a VNF instance
  //
  min_graceful_stop_timeout: one scalar_unit_time,

  // YAML max_recommended_graceful_stop_timeout: {'type': 'scalar-unit.time', 'description': 'Maximum recommended timeout value that can be needed to gracefully stop a VNF instance of a particular type under certain conditions, such as maximum load condition. This is provided by VNF provider as information for the operator facilitating the selection of optimal timeout value. This value is not used as constraint', 'required': False}
  //
  // Maximum recommended timeout value that can be needed to gracefully stop a VNF instance of a particular type under certain conditions, such as maximum load condition. This is provided by VNF provider as information for the operator facilitating the selection of optimal timeout value. This value is not used as constraint
  //
  max_recommended_graceful_stop_timeout: lone scalar_unit_time,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfOperateOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfOperateOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfOperateOperationConfiguration
  expect 1

//
// describes the details of an aspect used for horizontal scaling
//
sig tosca_datatypes_nfv_ScalingAspect extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the aspect', 'required': True}
  //
  // Human readable name of the aspect
  //
  name: one string,

  // YAML description: {'type': 'string', 'description': 'Human readable description of the aspect', 'required': True}
  //
  // Human readable description of the aspect
  //
  description: one string,

  // YAML max_scale_level: {'type': 'integer', 'description': 'Total number of scaling steps that can be applied w.r.t. this aspect. The value of this property corresponds to the number of scaling steps can be applied to this aspect when scaling it from the minimum scale level (i.e. 0) to the maximum scale level defined by this property', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Total number of scaling steps that can be applied w.r.t. this aspect. The value of this property corresponds to the number of scaling steps can be applied to this aspect when scaling it from the minimum scale level (i.e. 0) to the maximum scale level defined by this property
  //
  max_scale_level: one integer,

  // YAML step_deltas: {'type': 'list', 'description': 'List of scaling deltas to be applied for the different subsequent scaling steps of this aspect. The first entry in the array shall correspond to the first scaling step (between scale levels 0 to 1) and the last entry in the array shall correspond to the last scaling step (between maxScaleLevel-1 and maxScaleLevel)', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // List of scaling deltas to be applied for the different subsequent scaling steps of this aspect. The first entry in the array shall correspond to the first scaling step (between scale levels 0 to 1) and the last entry in the array shall correspond to the last scaling step (between maxScaleLevel-1 and maxScaleLevel)
  //
  step_deltas: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  max_scale_level.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.ScalingAspect */
run Show_tosca_datatypes_nfv_ScalingAspect {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_ScalingAspect
  expect 1

//
// indicates configuration properties for a given VNF (e.g. related to auto scaling and auto healing).
//
sig tosca_datatypes_nfv_VnfConfigurableProperties extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML is_autoscale_enabled: {'type': 'boolean', 'description': 'It permits to enable (TRUE)/disable (FALSE) the auto-scaling functionality. If the property is not present, then configuring this VNF property is not supported', 'required': False}
  //
  // It permits to enable (TRUE)/disable (FALSE) the auto-scaling functionality. If the property is not present, then configuring this VNF property is not supported
  //
  is_autoscale_enabled: lone boolean,

  // YAML is_autoheal_enabled: {'type': 'boolean', 'description': 'It permits to enable (TRUE)/disable (FALSE) the auto-healing functionality. If the property is not present, then configuring this VNF property is not supported', 'required': False}
  //
  // It permits to enable (TRUE)/disable (FALSE) the auto-healing functionality. If the property is not present, then configuring this VNF property is not supported
  //
  is_autoheal_enabled: lone boolean,

  // YAML vnfm_interface_info: {'type': 'list', 'description': 'Contains information enabling access to the NFV-MANO interfaces produced by the VNFM (e.g. URIs and credentials), If the property is not present, then configuring this VNF property is not supported.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfmInterfaceInfo'}}
  //
  // Contains information enabling access to the NFV-MANO interfaces produced by the VNFM (e.g. URIs and credentials), If the property is not present, then configuring this VNF property is not supported.
  //
  vnfm_interface_info: seq tosca_datatypes_nfv_VnfmInterfaceInfo,

  // YAML vnfm_oauth_server_info: {'type': 'tosca.datatypes.nfv.OauthServerInfo', 'description': 'Contains information to enable discovery of the authorization server protecting access to VNFM interfaces. If the property is not present, then configuring this VNF property is not supported.', 'required': False}
  //
  // Contains information to enable discovery of the authorization server protecting access to VNFM interfaces. If the property is not present, then configuring this VNF property is not supported.
  //
  vnfm_oauth_server_info: lone tosca_datatypes_nfv_OauthServerInfo,

  // YAML vnf_oauth_server_info: {'type': 'tosca.datatypes.nfv.OauthServerInfo', 'description': 'Contains information to enable discovery of the authorization server to validate the access tokens provided by the VNFM when  the VNFM accesses the VNF interfaces, if that functionality (token introspection) is supported by the authorization server. If the property is not present, then configuring this VNF property is not supported.', 'required': False}
  //
  // Contains information to enable discovery of the authorization server to validate the access tokens provided by the VNFM when  the VNFM accesses the VNF interfaces, if that functionality (token introspection) is supported by the authorization server. If the property is not present, then configuring this VNF property is not supported.
  //
  vnf_oauth_server_info: lone tosca_datatypes_nfv_OauthServerInfo,

  // YAML additional_configurable_properties: {'description': 'It provides VNF specific configurable properties that can be modified using the ModifyVnfInfo operation', 'required': False, 'type': 'tosca.datatypes.nfv.VnfAdditionalConfigurableProperties'}
  //
  // It provides VNF specific configurable properties that can be modified using the ModifyVnfInfo operation
  //
  additional_configurable_properties: lone tosca_datatypes_nfv_VnfAdditionalConfigurableProperties,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfConfigurableProperties */
run Show_tosca_datatypes_nfv_VnfConfigurableProperties {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfConfigurableProperties
  expect 1

//
// is an empty base type for deriving data types for describing additional configurable properties for a given VNF
//
sig tosca_datatypes_nfv_VnfAdditionalConfigurableProperties extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML is_writable_anytime: {'type': 'boolean', 'description': 'It specifies whether these additional configurable properties are writeable (TRUE) at any time (i.e. prior to / at instantiation time as well as after instantiation).or (FALSE) only prior to / at instantiation time. If this property is not present, the additional configurable properties are writable anytime.', 'required': True, 'default': True}
  //
  // It specifies whether these additional configurable properties are writeable (TRUE) at any time (i.e. prior to / at instantiation time as well as after instantiation).or (FALSE) only prior to / at instantiation time. If this property is not present, the additional configurable properties are writable anytime.
  //
  is_writable_anytime: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfAdditionalConfigurableProperties */
run Show_tosca_datatypes_nfv_VnfAdditionalConfigurableProperties {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfAdditionalConfigurableProperties
  expect 1

//
// Describes VNF-specific extension and metadata for a given VNF
//
sig tosca_datatypes_nfv_VnfInfoModifiableAttributes extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML extensions: {'type': 'tosca.datatypes.nfv.VnfInfoModifiableAttributesExtensions', 'description': 'Extension properties of VnfInfo that are writeable', 'required': False}
  //
  // Extension properties of VnfInfo that are writeable
  //
  extensions: lone tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions,

  // YAML metadata: {'type': 'tosca.datatypes.nfv.VnfInfoModifiableAttributesMetadata', 'description': 'Metadata properties of VnfInfo that are writeable', 'required': False}
  //
  // Metadata properties of VnfInfo that are writeable
  //
  metadata: lone tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfInfoModifiableAttributes */
run Show_tosca_datatypes_nfv_VnfInfoModifiableAttributes {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfInfoModifiableAttributes
  expect 1

//
// is an empty base type for deriving data types for describing VNF-specific extension
//
sig tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfInfoModifiableAttributesExtensions */
run Show_tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions
  expect 1

//
// is an empty base type for deriving data types for describing VNF-specific metadata
//
sig tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfInfoModifiableAttributesMetadata */
run Show_tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata
  expect 1

//
// Describes compute, memory and I/O requirements associated with a particular VDU.
//
sig tosca_datatypes_nfv_LogicalNodeData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML logical_node_requirements: {'type': 'map', 'description': 'The logical node-level compute, memory and I/O requirements. A map  of strings that contains a set of key-value pairs that describes hardware platform specific deployment requirements, including the number of CPU cores on this logical node, a memory configuration specific to a logical node  or a requirement related to the association of an I/O device with the logical node.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // The logical node-level compute, memory and I/O requirements. A map  of strings that contains a set of key-value pairs that describes hardware platform specific deployment requirements, including the number of CPU cores on this logical node, a memory configuration specific to a logical node  or a requirement related to the association of an I/O device with the logical node.
  //
  logical_node_requirements: lone TOSCA/map_string/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.LogicalNodeData */
run Show_tosca_datatypes_nfv_LogicalNodeData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_LogicalNodeData
  expect 1

//
// VirtualBlockStorageData describes block storage requirements associated with compute resources in a particular VDU, either as a local disk or as virtual attached storage
//
sig tosca_datatypes_nfv_VirtualBlockStorageData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML size_of_storage: {'type': 'scalar-unit.size', 'description': 'Size of virtualised storage resource', 'required': True, 'constraints': [{'greater_or_equal': '0 B'}]}
  //
  // Size of virtualised storage resource
  //
  size_of_storage: one scalar_unit_size,

  // YAML vdu_storage_requirements: {'type': 'map', 'description': 'The hardware platform specific storage requirements. A map of strings that contains a set of key-value pairs that represents the hardware platform specific storage deployment requirements', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // The hardware platform specific storage requirements. A map of strings that contains a set of key-value pairs that represents the hardware platform specific storage deployment requirements
  //
  vdu_storage_requirements: lone TOSCA/map_string/Map,

  // YAML rdma_enabled: {'type': 'boolean', 'description': 'Indicates if the storage support RDMA', 'required': True, 'default': False}
  //
  // Indicates if the storage support RDMA
  //
  rdma_enabled: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  size_of_storage.greater_or_equal[0, B]

}

/** There exists some tosca.datatypes.nfv.VirtualBlockStorageData */
run Show_tosca_datatypes_nfv_VirtualBlockStorageData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualBlockStorageData
  expect 1

//
// VirtualObjectStorageData describes object storage requirements associated with compute resources in a particular VDU
//
sig tosca_datatypes_nfv_VirtualObjectStorageData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML max_size_of_storage: {'type': 'scalar-unit.size', 'description': 'Maximum size of virtualized  storage resource', 'required': False, 'constraints': [{'greater_or_equal': '0 B'}]}
  //
  // Maximum size of virtualized  storage resource
  //
  max_size_of_storage: lone scalar_unit_size,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some max_size_of_storage implies max_size_of_storage.greater_or_equal[0, B]

}

/** There exists some tosca.datatypes.nfv.VirtualObjectStorageData */
run Show_tosca_datatypes_nfv_VirtualObjectStorageData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualObjectStorageData
  expect 1

//
// VirtualFileStorageData describes file storage requirements associated with compute resources in a particular VDU
//
sig tosca_datatypes_nfv_VirtualFileStorageData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML size_of_storage: {'type': 'scalar-unit.size', 'description': 'Size of virtualized storage resource', 'required': True, 'constraints': [{'greater_or_equal': '0 B'}]}
  //
  // Size of virtualized storage resource
  //
  size_of_storage: one scalar_unit_size,

  // YAML file_system_protocol: {'type': 'string', 'description': 'The shared file system protocol', 'required': True, 'constraints': [{'valid_values': ['nfs', 'cifs']}]}
  //
  // The shared file system protocol
  //
  file_system_protocol: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  size_of_storage.greater_or_equal[0, B]
  file_system_protocol.valid_values["nfs" + "cifs"]

}

/** There exists some tosca.datatypes.nfv.VirtualFileStorageData */
run Show_tosca_datatypes_nfv_VirtualFileStorageData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualFileStorageData
  expect 1

//
// Describes bitrate requirements applicable to the virtual link instantiated from a particicular VnfVirtualLink
//
sig tosca_datatypes_nfv_VirtualLinkBitrateLevel extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML bitrate_requirements: {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements', 'description': 'Virtual link bitrate requirements for an instantiation level or bitrate delta for a scaling step', 'required': True}
  //
  // Virtual link bitrate requirements for an instantiation level or bitrate delta for a scaling step
  //
  bitrate_requirements: one tosca_datatypes_nfv_LinkBitrateRequirements,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VirtualLinkBitrateLevel */
run Show_tosca_datatypes_nfv_VirtualLinkBitrateLevel {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualLinkBitrateLevel
  expect 1

//
// Is an empty base type for deriving data type for describing VNF-specific parameters to be passed when invoking lifecycle management operations
//
sig tosca_datatypes_nfv_VnfOperationAdditionalParameters extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfOperationAdditionalParameters */
run Show_tosca_datatypes_nfv_VnfOperationAdditionalParameters {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfOperationAdditionalParameters
  expect 1

//
// represents information that affect the invocation of the ChangeVnfFlavour operation
//
sig tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfChangeFlavourOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the ChangeExtVnfConnectivity operation
//
sig tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfChangeExtConnectivityOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration
  expect 1

//
// Represents information on virtualised resource related performance metrics applicable to the VNF.
//
sig tosca_datatypes_nfv_VnfcMonitoringParameter extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the monitoring parameter', 'required': True}
  //
  // Human readable name of the monitoring parameter
  //
  name: one string,

  // YAML performance_metric: {'type': 'string', 'description': 'Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.', 'required': True, 'constraints': [{'valid_values': ['v_cpu_usage_mean_vnf', 'v_cpu_usage_peak_vnf', 'v_memory_usage_mean_vnf', 'v_memory_usage_peak_vnf', 'v_disk_usage_mean_vnf', 'v_disk_usage_peak_vnf', 'byte_incoming_vnf_int_cp', 'byte_outgoing_vnf_int_cp', 'packet_incoming_vnf_int_cp', 'packet_outgoing_vnf_int_cp', 'v_cpu_usage_mean', 'v_cpu_usage_peak', 'v_memory_usage_mean', 'v_memory_usage_peak', 'v_disk_usage_mean', 'v_disk_usage_peak', 'v_net_byte_incoming', 'v_net_byte_outgoing', 'v_net_packet_incoming', 'v_net_packet_outgoing', 'usage_mean_vStorage', 'usage_peak_vStorage']}]}
  //
  // Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.
  //
  performance_metric: one string,

  // YAML collection_period: {'type': 'scalar-unit.time', 'description': 'Describes the  periodicity at which to collect the performance information.', 'required': False, 'constraints': [{'greater_than': '0 s'}]}
  //
  // Describes the  periodicity at which to collect the performance information.
  //
  collection_period: lone scalar_unit_time,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  performance_metric.valid_values["v_cpu_usage_mean_vnf" + "v_cpu_usage_peak_vnf" + "v_memory_usage_mean_vnf" + "v_memory_usage_peak_vnf" + "v_disk_usage_mean_vnf" + "v_disk_usage_peak_vnf" + "byte_incoming_vnf_int_cp" + "byte_outgoing_vnf_int_cp" + "packet_incoming_vnf_int_cp" + "packet_outgoing_vnf_int_cp" + "v_cpu_usage_mean" + "v_cpu_usage_peak" + "v_memory_usage_mean" + "v_memory_usage_peak" + "v_disk_usage_mean" + "v_disk_usage_peak" + "v_net_byte_incoming" + "v_net_byte_outgoing" + "v_net_packet_incoming" + "v_net_packet_outgoing" + "usage_mean_vStorage" + "usage_peak_vStorage"]
  some collection_period implies collection_period.greater_than[0, s]

}

/** There exists some tosca.datatypes.nfv.VnfcMonitoringParameter */
run Show_tosca_datatypes_nfv_VnfcMonitoringParameter {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfcMonitoringParameter
  expect 1

//
// Represents information on virtualised resource related performance metrics applicable to the VNF.
//
sig tosca_datatypes_nfv_VirtualLinkMonitoringParameter extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the monitoring parameter', 'required': True}
  //
  // Human readable name of the monitoring parameter
  //
  name: one string,

  // YAML performance_metric: {'type': 'string', 'description': 'Identifies a performance metric to be monitored.', 'required': True, 'constraints': [{'valid_values': ['byte_incoming', 'byte_outgoing', 'packet_incoming', 'packet_outgoing']}]}
  //
  // Identifies a performance metric to be monitored.
  //
  performance_metric: one string,

  // YAML collection_period: {'type': 'scalar-unit.time', 'description': 'Describes the periodicity at which to collect the performance information.', 'required': False, 'constraints': [{'greater_than': '0 s'}]}
  //
  // Describes the periodicity at which to collect the performance information.
  //
  collection_period: lone scalar_unit_time,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  performance_metric.valid_values["byte_incoming" + "byte_outgoing" + "packet_incoming" + "packet_outgoing"]
  some collection_period implies collection_period.greater_than[0, s]

}

/** There exists some tosca.datatypes.nfv.VirtualLinkMonitoringParameter */
run Show_tosca_datatypes_nfv_VirtualLinkMonitoringParameter {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VirtualLinkMonitoringParameter
  expect 1

//
// information used to access an interface exposed by a VNF
//
sig tosca_datatypes_nfv_InterfaceDetails extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML uri_components: {'type': 'tosca.datatypes.nfv.UriComponents', 'description': 'Provides components to build a Uniform Ressource Identifier (URI) where to access the interface end point.', 'required': False}
  //
  // Provides components to build a Uniform Ressource Identifier (URI) where to access the interface end point.
  //
  uri_components: lone tosca_datatypes_nfv_UriComponents,

  // YAML interface_specific_data: {'type': 'map', 'description': 'Provides additional details that are specific to the type of interface considered.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Provides additional details that are specific to the type of interface considered.
  //
  interface_specific_data: lone TOSCA/map_string/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.InterfaceDetails */
run Show_tosca_datatypes_nfv_InterfaceDetails {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_InterfaceDetails
  expect 1

//
// information used to build a URI that complies with IETF RFC 3986 [8].
//
sig tosca_datatypes_nfv_UriComponents extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scheme: {'type': 'string', 'description': 'scheme component of a URI.', 'required': True}
  //
  // scheme component of a URI.
  //
  scheme: one string,

  // YAML authority: {'type': 'tosca.datatypes.nfv.UriAuthority', 'description': 'Authority component of a URI', 'required': False}
  //
  // Authority component of a URI
  //
  authority: lone tosca_datatypes_nfv_UriAuthority,

  // YAML path: {'type': 'string', 'description': 'path component of a URI.', 'required': False}
  //
  // path component of a URI.
  //
  path: lone string,

  // YAML query: {'type': 'string', 'description': 'query component of a URI.', 'required': False}
  //
  // query component of a URI.
  //
  query: lone string,

  // YAML fragment: {'type': 'string', 'description': 'fragment component of a URI.', 'required': False}
  //
  // fragment component of a URI.
  //
  fragment: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.UriComponents */
run Show_tosca_datatypes_nfv_UriComponents {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_UriComponents
  expect 1

//
// information that corresponds to the authority component of a URI as specified in IETF RFC 3986 [8]
//
sig tosca_datatypes_nfv_UriAuthority extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML user_info: {'type': 'string', 'description': 'user_info field of the authority component of a URI', 'required': False}
  //
  // user_info field of the authority component of a URI
  //
  user_info: lone string,

  // YAML host: {'type': 'string', 'description': 'host field of the authority component of a URI', 'required': False}
  //
  // host field of the authority component of a URI
  //
  host: lone string,

  // YAML port: {'type': 'string', 'description': 'port field of the authority component of a URI', 'required': False}
  //
  // port field of the authority component of a URI
  //
  port: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.UriAuthority */
run Show_tosca_datatypes_nfv_UriAuthority {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_UriAuthority
  expect 1

//
// Describes information about the result of performing a checksum operation over some arbitrary data
//
sig tosca_datatypes_nfv_ChecksumData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML algorithm: {'type': 'string', 'description': 'Describes the algorithm used to obtain the checksum value', 'required': True, 'constraints': [{'valid_values': ['sha-224', 'sha-256', 'sha-384', 'sha-512']}]}
  //
  // Describes the algorithm used to obtain the checksum value
  //
  algorithm: one string,

  // YAML hash: {'type': 'string', 'description': 'Contains the result of applying the algorithm indicated by the algorithm property to the data to which this ChecksumData refers', 'required': True}
  //
  // Contains the result of applying the algorithm indicated by the algorithm property to the data to which this ChecksumData refers
  //
  hash: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  algorithm.valid_values["sha-224" + "sha-256" + "sha-384" + "sha-512"]

}

/** There exists some tosca.datatypes.nfv.ChecksumData */
run Show_tosca_datatypes_nfv_ChecksumData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_ChecksumData
  expect 1

//
// describes information enabling the VNF instance to access the NFV-MANO interfaces produced by the VNFM
//
sig tosca_datatypes_nfv_VnfmInterfaceInfo extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML interface_name: {'type': 'string', 'description': 'Identifies an interface produced by the VNFM.', 'required': True, 'constraints': [{'valid_values': ['vnf_lcm', 'vnf_pm', 'vnf_fm']}]}
  //
  // Identifies an interface produced by the VNFM.
  //
  interface_name: one string,

  // YAML details: {'type': 'tosca.datatypes.nfv.InterfaceDetails', 'description': 'Provide additional data to access the interface endpoint', 'required': False}
  //
  // Provide additional data to access the interface endpoint
  //
  details: lone tosca_datatypes_nfv_InterfaceDetails,

  // YAML credentials: {'type': 'map', 'description': 'Provides credential enabling access to the interface', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Provides credential enabling access to the interface
  //
  credentials: lone TOSCA/map_string/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  interface_name.valid_values["vnf_lcm" + "vnf_pm" + "vnf_fm"]

}

/** There exists some tosca.datatypes.nfv.VnfmInterfaceInfo */
run Show_tosca_datatypes_nfv_VnfmInterfaceInfo {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfmInterfaceInfo
  expect 1

//
// information to enable discovery of the authorization server
//
sig tosca_datatypes_nfv_OauthServerInfo extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.OauthServerInfo */
run Show_tosca_datatypes_nfv_OauthServerInfo {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_OauthServerInfo
  expect 1

//
// describes the information used to customize a virtualised compute resource at boot time.
//
sig tosca_datatypes_nfv_BootData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vim_specific_properties: {'type': 'tosca.datatypes.nfv.BootDataVimSpecificProperties', 'description': 'Properties used for selecting VIM specific capabilities when setting the boot data.', 'required': False}
  //
  // Properties used for selecting VIM specific capabilities when setting the boot data.
  //
  vim_specific_properties: lone tosca_datatypes_nfv_BootDataVimSpecificProperties,

  // YAML kvp_data: {'type': 'tosca.datatypes.nfv.KvpData', 'description': 'A set of key-value pairs for configuring a virtual compute resource.', 'required': False}
  //
  // A set of key-value pairs for configuring a virtual compute resource.
  //
  kvp_data: lone tosca_datatypes_nfv_KvpData,

  // YAML content_or_file_data: {'type': 'tosca.datatypes.nfv.ContentOrFileData', 'description': 'A string content or a file for configuring a virtual compute resource.', 'required': False}
  //
  // A string content or a file for configuring a virtual compute resource.
  //
  content_or_file_data: lone tosca_datatypes_nfv_ContentOrFileData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.BootData */
run Show_tosca_datatypes_nfv_BootData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_BootData
  expect 1

//
// describes a set of key-value pairs information used to customize a virtualised compute resource at boot time by using only key-value pairs data.
//
sig tosca_datatypes_nfv_KvpData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML data: {'type': 'map', 'description': 'A map of strings that contains a set of key-value pairs that describes the information for configuring the virtualised compute resource.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // A map of strings that contains a set of key-value pairs that describes the information for configuring the virtualised compute resource.
  //
  data: lone TOSCA/map_string/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.KvpData */
run Show_tosca_datatypes_nfv_KvpData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_KvpData
  expect 1

//
// describes a string content or a file information used to customize a virtualised compute resource at boot time by using string content or file.
//
sig tosca_datatypes_nfv_ContentOrFileData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML data: {'type': 'map', 'description': 'A map of strings that contains a set of key-value pairs that carries the dynamic deployment values which used to replace the corresponding variable parts in the file as identify by a URL as described in source_path. Shall be present if "source_path" is present and shall be absent otherwise..', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // A map of strings that contains a set of key-value pairs that carries the dynamic deployment values which used to replace the corresponding variable parts in the file as identify by a URL as described in source_path. Shall be present if "source_path" is present and shall be absent otherwise..
  //
  data: lone TOSCA/map_string/Map,

  // YAML content: {'type': 'string', 'description': 'The string information used to customize a virtualised compute resource at boot time.', 'required': False}
  //
  // The string information used to customize a virtualised compute resource at boot time.
  //
  content: lone string,

  // YAML source_path: {'type': 'string', 'description': 'The URL to a file contained in the VNF package used to customize a virtualised compute resource. The content shall comply with IETF RFC 3986 [8].', 'required': False}
  //
  // The URL to a file contained in the VNF package used to customize a virtualised compute resource. The content shall comply with IETF RFC 3986 [8].
  //
  source_path: lone string,

  // YAML destination_path: {'type': 'string', 'description': 'The URL address when inject a file into the virtualised compute resource. The content shall comply with IETF RFC 3986 [8].', 'required': False}
  //
  // The URL address when inject a file into the virtualised compute resource. The content shall comply with IETF RFC 3986 [8].
  //
  destination_path: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.ContentOrFileData */
run Show_tosca_datatypes_nfv_ContentOrFileData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_ContentOrFileData
  expect 1

//
// describes the VIM specific information used for selecting VIM specific capabilities when setting the boot data.
//
sig tosca_datatypes_nfv_BootDataVimSpecificProperties extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vim_type: {'type': 'string', 'description': 'Discriminator for the different types of the VIM information.', 'required': False}
  //
  // Discriminator for the different types of the VIM information.
  //
  vim_type: lone string,

  // YAML properties: {'type': 'map', 'description': 'Properties used for selecting VIM specific capabilities when setting the boot data', 'entry_schema': {'type': 'string'}, 'required': True}
  //
  // Properties used for selecting VIM specific capabilities when setting the boot data
  //
  properties: one TOSCA/map_string/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.BootDataVimSpecificProperties */
run Show_tosca_datatypes_nfv_BootDataVimSpecificProperties {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_BootDataVimSpecificProperties
  expect 1

//
// data type describes the source and destination VNFDs as well as source deployment flavour for a change current VNF Package.
//
sig tosca_datatypes_nfv_VnfPackageChangeSelector extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML source_descriptor_id: {'type': 'string', 'description': 'Identifier of the source VNFD and the source VNF package.', 'required': True}
  //
  // Identifier of the source VNFD and the source VNF package.
  //
  source_descriptor_id: one string,

  // YAML destination_descriptor_id: {'type': 'string', 'description': 'Identifier of the destination VNFD and the destination VNF package.', 'required': True}
  //
  // Identifier of the destination VNFD and the destination VNF package.
  //
  destination_descriptor_id: one string,

  // YAML source_flavour_id: {'type': 'string', 'description': 'Identifier of the deployment flavour in the source VNF package for which this data type applies.', 'required': True}
  //
  // Identifier of the deployment flavour in the source VNF package for which this data type applies.
  //
  source_flavour_id: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VnfPackageChangeSelector */
run Show_tosca_datatypes_nfv_VnfPackageChangeSelector {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfPackageChangeSelector
  expect 1

//
// A mapping between the identifier of a components or property in the source VNFD and the identifier of the corresponding component or property in the destination VNFD.
//
sig tosca_datatypes_nfv_VnfPackageChangeComponentMapping extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML component_type: {'type': 'string', 'description': 'The type of component or property. Possible values differentiate whether changes concern to some VNF component (e.g. VDU, internal VLD, etc.) or property (e.g. a Scaling Aspect, etc.).', 'constraints': [{'valid_values': ['vdu', 'cp', 'virtual_link', 'virtual_storage', 'instantiation_level', 'scaling_aspect']}], 'required': True}
  //
  // The type of component or property. Possible values differentiate whether changes concern to some VNF component (e.g. VDU, internal VLD, etc.) or property (e.g. a Scaling Aspect, etc.).
  //
  component_type: one string,

  // YAML source_id: {'type': 'string', 'description': 'Identifier of the component or property in the source VNFD.', 'required': True}
  //
  // Identifier of the component or property in the source VNFD.
  //
  source_id: one string,

  // YAML destination_id: {'type': 'string', 'description': 'Identifier of the component or property in the destination VNFD.', 'required': True}
  //
  // Identifier of the component or property in the destination VNFD.
  //
  destination_id: one string,

  // YAML description: {'type': 'string', 'description': 'Human readable description of the component changes.', 'required': False}
  //
  // Human readable description of the component changes.
  //
  description: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  component_type.valid_values["vdu" + "cp" + "virtual_link" + "virtual_storage" + "instantiation_level" + "scaling_aspect"]

}

/** There exists some tosca.datatypes.nfv.VnfPackageChangeComponentMapping */
run Show_tosca_datatypes_nfv_VnfPackageChangeComponentMapping {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfPackageChangeComponentMapping
  expect 1

//
// represents information that affect the invocation of the change current VNF Package operation.
//
sig tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfChangeCurrentPackageOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the CreateVnfSnapshot operation
//
sig tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfCreateSnapshotOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration
  expect 1

//
// represents information that affect the invocation of the RevertToVnfSnapshot operation
//
sig tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.VnfRevertToSnapshotOperationConfiguration */
run Show_tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration
  expect 1

//
// describes the service identifying port properties exposed by the VirtualCp
//
sig tosca_datatypes_nfv_ServicePortData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'The name of the port exposed by the VirtualCp.', 'required': True}
  //
  // The name of the port exposed by the VirtualCp.
  //
  name: one string,

  // YAML protocol: {'type': 'string', 'description': 'The L4 protocol for this port exposed by the VirtualCp.', 'required': True, 'constraints': [{'valid_values': ['tcp', 'udp', 'sctp']}]}
  //
  // The L4 protocol for this port exposed by the VirtualCp.
  //
  protocol: one string,

  // YAML port: {'type': 'integer', 'description': 'The L4 port number exposed by the VirtualCp.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // The L4 port number exposed by the VirtualCp.
  //
  port: one integer,

  // YAML portConfigurable: {'type': 'boolean', 'description': 'Specifies whether the port attribute value is allowed to be configurable.', 'required': True}
  //
  // Specifies whether the port attribute value is allowed to be configurable.
  //
  portConfigurable: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  protocol.valid_values["tcp" + "udp" + "sctp"]
  port.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.ServicePortData */
run Show_tosca_datatypes_nfv_ServicePortData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_ServicePortData
  expect 1

//
// describes the additional service data of the VirtualCp used to expose properties of the VirtualCp to NFV-MANO.
//
sig tosca_datatypes_nfv_AdditionalServiceData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML portData: {'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.ServicePortData'}, 'description': 'Service port numbers exposed by the VirtualCp.', 'required': True}
  //
  // Service port numbers exposed by the VirtualCp.
  //
  portData: seq tosca_datatypes_nfv_ServicePortData,

  // YAML serviceData: {'type': 'tosca.datatypes.nfv.ServiceData', 'description': 'Service matching information exposed by the VirtualCp.', 'required': False}
  //
  // Service matching information exposed by the VirtualCp.
  //
  serviceData: lone tosca_datatypes_nfv_ServiceData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.AdditionalServiceData */
run Show_tosca_datatypes_nfv_AdditionalServiceData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_AdditionalServiceData
  expect 1

//
// describes a set of information used for a coordination action in a VNF lifecycle management operation for a given VNF.
//
sig tosca_datatypes_nfv_VnfLcmOpCoord extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the coordination action.', 'required': False}
  //
  // Human readable description of the coordination action.
  //
  description: lone string,

  // YAML endpoint_type: {'type': 'string', 'description': 'Specifies the type of the endpoint exposing the LCM operation coordination such as other operations supporting or management systems (e.g. an EM) or the VNF instance. If the VNF produces the LCM coordination interface, this property may be omitted or may have the value "vnf". If this attribute is omitted, the type of endpoint that provides the interface is determined at deployment time. If the VNF does not produce the LCM coordination interface but coordination via this interface is needed, it is expected that a management entity such as the EM exposes the coordination interface, and consequently, this attribute shall be present and shall have the value "mgmt".', 'required': False, 'constraints': [{'valid_values': ['mgmt', 'vnf']}]}
  //
  // Specifies the type of the endpoint exposing the LCM operation coordination such as other operations supporting or management systems (e.g. an EM) or the VNF instance. If the VNF produces the LCM coordination interface, this property may be omitted or may have the value "vnf". If this attribute is omitted, the type of endpoint that provides the interface is determined at deployment time. If the VNF does not produce the LCM coordination interface but coordination via this interface is needed, it is expected that a management entity such as the EM exposes the coordination interface, and consequently, this attribute shall be present and shall have the value "mgmt".
  //
  endpoint_type: lone string,

  // YAML coordination_stage: {'type': 'string', 'description': 'Indicates whether the coordination action is invoked before or after all other changes performed by the VNF LCM operation. coordination_stage property shall be omitted if the coordination action is intended to be invoked at an intermediate stage of the LCM operation, i.e. neither at the start nor at the end. In this case, the time at which to invoke the coordination during the execution of the LCM operation is determined by means outside the scope of the present document such as VNFM-internal logic or LCM script.', 'required': False, 'constraints': [{'valid_values': ['start', 'end']}]}
  //
  // Indicates whether the coordination action is invoked before or after all other changes performed by the VNF LCM operation. coordination_stage property shall be omitted if the coordination action is intended to be invoked at an intermediate stage of the LCM operation, i.e. neither at the start nor at the end. In this case, the time at which to invoke the coordination during the execution of the LCM operation is determined by means outside the scope of the present document such as VNFM-internal logic or LCM script.
  //
  coordination_stage: lone string,

  // YAML input_parameters: {'type': 'tosca.datatypes.nfv.InputOpCoordParams', 'description': 'Input parameters to be provided in the LCM coordination request.', 'required': False}
  //
  // Input parameters to be provided in the LCM coordination request.
  //
  input_parameters: lone tosca_datatypes_nfv_InputOpCoordParams,

  // YAML output_parameters: {'type': 'tosca.datatypes.nfv.OutputOpCoordParams', 'description': 'Output parameters provided in the LCM coordination response.', 'required': False}
  //
  // Output parameters provided in the LCM coordination response.
  //
  output_parameters: lone tosca_datatypes_nfv_OutputOpCoordParams,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  endpoint_type.valid_values["mgmt" + "vnf"]
  coordination_stage.valid_values["start" + "end"]

}

/** There exists some tosca.datatypes.nfv.VnfLcmOpCoord */
run Show_tosca_datatypes_nfv_VnfLcmOpCoord {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VnfLcmOpCoord
  expect 1

//
// is an empty base type for deriving data types for describing additional input operation coordination parameters for a given coordination action
//
sig tosca_datatypes_nfv_InputOpCoordParams extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.InputOpCoordParams */
run Show_tosca_datatypes_nfv_InputOpCoordParams {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_InputOpCoordParams
  expect 1

//
// is an empty base type for deriving data types for describing additional Output operation coordination parameters for a given coordination action
//
sig tosca_datatypes_nfv_OutputOpCoordParams extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.OutputOpCoordParams */
run Show_tosca_datatypes_nfv_OutputOpCoordParams {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_OutputOpCoordParams
  expect 1

//
// Supports the specification of requirements related to extended resources of a container.
//
sig tosca_datatypes_nfv_ExtendedResourceData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML extended_resource: {'type': 'map', 'description': 'The hardware platform specific extended resource. A map of string that contains one single key-value pair that describes one hardware platform specific container requirement.', 'required': True, 'entry_schema': {'type': 'string'}, 'constraints': [{'min_length': 1}, {'max_length': 1}]}
  //
  // The hardware platform specific extended resource. A map of string that contains one single key-value pair that describes one hardware platform specific container requirement.
  //
  extended_resource: one TOSCA/map_string/Map,

  // YAML amount: {'type': 'integer', 'description': 'Requested amount of the indicated extended resource.', 'required': True, 'constraints': [{'greater_than': 0}]}
  //
  // Requested amount of the indicated extended resource.
  //
  amount: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  extended_resource.min_length[1]
  extended_resource.max_length[1]
  amount.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.ExtendedResourceData */
run Show_tosca_datatypes_nfv_ExtendedResourceData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_ExtendedResourceData
  expect 1

//
// Supports the specification of requirements on a particular hugepage size in terms of total memory needs.
//
sig tosca_datatypes_nfv_Hugepages extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML hugepage_size: {'type': 'scalar-unit.size', 'description': 'Specifies the size of the hugepage.', 'required': True}
  //
  // Specifies the size of the hugepage.
  //
  hugepage_size: one scalar_unit_size,

  // YAML requested_size: {'type': 'scalar-unit.size', 'description': 'Specifies the total size required for all the hugepages of the size indicated by hugepage_size.', 'required': True}
  //
  // Specifies the total size required for all the hugepages of the size indicated by hugepage_size.
  //
  requested_size: one scalar_unit_size,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.Hugepages */
run Show_tosca_datatypes_nfv_Hugepages {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_Hugepages
  expect 1

//
// Specifies the maximum number of instances of a given Vdu.Compute node or VnfVirtualLink node that may be impacted simultaneously without impacting the functionality of the group of a given size.
//
sig tosca_datatypes_nfv_MaxNumberOfImpactedInstances extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML group_size: {'type': 'integer', 'description': 'Determines the size of the group for which the max_number_of_impacted_instances is specified. If not present the size is not limited.', 'required': False, 'constraints': [{'greater_than': 0}]}
  //
  // Determines the size of the group for which the max_number_of_impacted_instances is specified. If not present the size is not limited.
  //
  group_size: lone integer,

  // YAML max_number_of_impacted_instances: {'type': 'integer', 'description': 'The maximum number of instances that can be impacted simultaneously within the group of the specified size.', 'required': True, 'constraints': [{'greater_than': 0}]}
  //
  // The maximum number of instances that can be impacted simultaneously within the group of the specified size.
  //
  max_number_of_impacted_instances: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some group_size implies group_size.greater_than[0]
  max_number_of_impacted_instances.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.MaxNumberOfImpactedInstances */
run Show_tosca_datatypes_nfv_MaxNumberOfImpactedInstances {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_MaxNumberOfImpactedInstances
  expect 1

//
// Specifies the minimum number of instances of a given Vdu.Compute node or VnfVirtualLink node which need to be preserved simultaneously.
//
sig tosca_datatypes_nfv_MinNumberOfPreservedInstances extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML group_size: {'type': 'integer', 'description': 'Determines the size of the group for which the min_number_of_preserved_instances is specified. If not present the size is not limited.', 'required': False, 'constraints': [{'greater_than': 0}]}
  //
  // Determines the size of the group for which the min_number_of_preserved_instances is specified. If not present the size is not limited.
  //
  group_size: lone integer,

  // YAML min_number_of_preserved_instances: {'type': 'integer', 'description': 'The minimum number of instances which need to be preserved simultaneously within the group of the specified size.', 'required': True, 'constraints': [{'greater_than': 0}]}
  //
  // The minimum number of instances which need to be preserved simultaneously within the group of the specified size.
  //
  min_number_of_preserved_instances: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some group_size implies group_size.greater_than[0]
  min_number_of_preserved_instances.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.MinNumberOfPreservedInstances */
run Show_tosca_datatypes_nfv_MinNumberOfPreservedInstances {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_MinNumberOfPreservedInstances
  expect 1

//
// Provides information related to the constraints and rules applicable to virtualised resources and their groups impacted due to NFVI maintenance operations
//
sig tosca_datatypes_nfv_NfviMaintenanceInfo extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML impact_notification_lead_time: {'type': 'scalar-unit.time', 'description': 'Specifies the minimum notification lead time requested for upcoming impact of the virtualised resource or their group (i.e. between the notification and the action causing the impact).', 'required': True}
  //
  // Specifies the minimum notification lead time requested for upcoming impact of the virtualised resource or their group (i.e. between the notification and the action causing the impact).
  //
  impact_notification_lead_time: one scalar_unit_time,

  // YAML is_impact_mitigation_requested: {'type': 'boolean', 'description': 'Indicates whether it is requested that at the time of the notification of an upcoming change that is expected to have an impact on the VNF, virtualised resource(s) of the same characteristics as the impacted ones is/are provided to compensate for the impact (TRUE) or not (FALSE).', 'required': True, 'default': False}
  //
  // Indicates whether it is requested that at the time of the notification of an upcoming change that is expected to have an impact on the VNF, virtualised resource(s) of the same characteristics as the impacted ones is/are provided to compensate for the impact (TRUE) or not (FALSE).
  //
  is_impact_mitigation_requested: one boolean,

  // YAML supported_migration_type: {'type': 'list', 'description': 'Specifies the allowed migration types in the order of preference in case of an impact starting with the most preferred type. It is applicable to the Vdu.Compute node and to the VirtualBlockStorage, VirtualObjectStorage and VirtualFileStorage nodes.', 'required': False, 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['no_migration', 'offline_migration', 'live_migration']}]}}
  //
  // Specifies the allowed migration types in the order of preference in case of an impact starting with the most preferred type. It is applicable to the Vdu.Compute node and to the VirtualBlockStorage, VirtualObjectStorage and VirtualFileStorage nodes.
  //
  supported_migration_type: seq string,

  // YAML max_undetectable_interruption_time: {'type': 'scalar-unit.time', 'description': 'Specifies the maximum interruption time that can go undetected at the VNF level and therefore which will not trigger VNF-internal recovery during live migration. It is applicable to the Vdu.Compute node and to the VirtualBlockStorage, VirtualObjectStorage and VirtualFileStorage nodes.', 'required': False}
  //
  // Specifies the maximum interruption time that can go undetected at the VNF level and therefore which will not trigger VNF-internal recovery during live migration. It is applicable to the Vdu.Compute node and to the VirtualBlockStorage, VirtualObjectStorage and VirtualFileStorage nodes.
  //
  max_undetectable_interruption_time: lone scalar_unit_time,

  // YAML min_recovery_time_between_impacts: {'type': 'scalar-unit.time', 'description': 'Specifies the time required by the group to recover from an impact, thus, the minimum time requested between consecutive impacts of the group..', 'required': False}
  //
  // Specifies the time required by the group to recover from an impact, thus, the minimum time requested between consecutive impacts of the group..
  //
  min_recovery_time_between_impacts: lone scalar_unit_time,

  // YAML max_number_of_impacted_instances: {'type': 'list', 'description': 'Specifies for different group sizes the maximum number of instances that can be impacted simultaneously within the group of virtualised resources without losing functionality.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.MaxNumberOfImpactedInstances'}}
  //
  // Specifies for different group sizes the maximum number of instances that can be impacted simultaneously within the group of virtualised resources without losing functionality.
  //
  max_number_of_impacted_instances: seq tosca_datatypes_nfv_MaxNumberOfImpactedInstances,

  // YAML min_number_of_preserved_instances: {'type': 'list', 'description': 'Specifies for different group sizes the minimum number of instances which need to be preserved simultaneously within the group of virtualised resources.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.MinNumberOfPreservedInstances'}}
  //
  // Specifies for different group sizes the minimum number of instances which need to be preserved simultaneously within the group of virtualised resources.
  //
  min_number_of_preserved_instances: seq tosca_datatypes_nfv_MinNumberOfPreservedInstances,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  supported_migration_type.elems.valid_values["no_migration" + "offline_migration" + "live_migration"]

}

/** There exists some tosca.datatypes.nfv.NfviMaintenanceInfo */
run Show_tosca_datatypes_nfv_NfviMaintenanceInfo {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_NfviMaintenanceInfo
  expect 1

//
// contains data needed to identify an MCIO when interworking with the CISM.
//
sig tosca_datatypes_nfv_McioIdentificationData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'The name of the mcio.', 'required': True}
  //
  // The name of the mcio.
  //
  name: one string,

  // YAML type: {'type': 'string', 'description': 'The type of the mcio.', 'required': True, 'constraints': [{'valid_values': ['Deployment', 'StatefulSet']}]}
  //
  // The type of the mcio.
  //
  type: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  type.valid_values["Deployment" + "StatefulSet"]

}

/** There exists some tosca.datatypes.nfv.McioIdentificationData */
run Show_tosca_datatypes_nfv_McioIdentificationData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_McioIdentificationData
  expect 1

//
// Indicates for a given VipCp in a given level the number of instances to deploy
//
sig tosca_datatypes_nfv_VipCpLevel extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML number_of_instances: {'type': 'integer', 'description': 'Number of instances of VipCp based on the referenced VipCp node template to deploy for an instantiation level or for a scaling delta.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Number of instances of VipCp based on the referenced VipCp node template to deploy for an instantiation level or for a scaling delta.
  //
  number_of_instances: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  number_of_instances.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.VipCpLevel */
run Show_tosca_datatypes_nfv_VipCpLevel {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_VipCpLevel
  expect 1

//
// Indicates the service matching information exposed by the VirtualCp
//
sig tosca_datatypes_nfv_ServiceData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML host: {'type': 'string', 'description': 'Corresponds to the fully qualified domain name of a network host', 'required': False}
  //
  // Corresponds to the fully qualified domain name of a network host
  //
  host: lone string,

  // YAML path: {'type': 'list', 'description': 'path component of a URI.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // path component of a URI.
  //
  path: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.ServiceData */
run Show_tosca_datatypes_nfv_ServiceData {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_ServiceData
  expect 1

// --------------------------------------------------
// Artifact Types
// --------------------------------------------------

//
// describes the software image which is directly loaded on the virtualisation container realizing of the VDU or is to be loaded on a virtual storage resource
//
sig tosca_artifacts_nfv_SwImage extends tosca_artifacts_Deployment_Image
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Name of this software image', 'required': True}
  //
  // Name of this software image
  //
  name: one string,

  // YAML version: {'type': 'string', 'description': 'Version of this software image', 'required': True}
  //
  // Version of this software image
  //
  version: one string,

  // YAML provider: {'type': 'string', 'description': 'Provider of this software image', 'required': False}
  //
  // Provider of this software image
  //
  provider: lone string,

  // YAML checksum: {'type': 'tosca.datatypes.nfv.ChecksumData', 'description': 'Checksum of the software image file', 'required': False}
  //
  // Checksum of the software image file
  //
  checksum: lone tosca_datatypes_nfv_ChecksumData,

  // YAML container_format: {'type': 'string', 'description': 'The container format describes the container file format in which software image is provided', 'required': True, 'constraints': [{'valid_values': ['aki', 'ami', 'ari', 'bare', 'docker', 'ova', 'ovf']}]}
  //
  // The container format describes the container file format in which software image is provided
  //
  container_format: one string,

  // YAML disk_format: {'type': 'string', 'description': 'The disk format of a software image is the format of the underlying disk image', 'required': False, 'constraints': [{'valid_values': ['aki', 'ami', 'ari', 'iso', 'qcow2', 'raw', 'vdi', 'vhd', 'vhdx', 'vmdk']}]}
  //
  // The disk format of a software image is the format of the underlying disk image
  //
  disk_format: lone string,

  // YAML min_disk: {'type': 'scalar-unit.size', 'description': 'The minimal disk size requirement for this software image', 'required': False, 'constraints': [{'greater_or_equal': '0 B'}]}
  //
  // The minimal disk size requirement for this software image
  //
  min_disk: lone scalar_unit_size,

  // YAML min_ram: {'type': 'scalar-unit.size', 'description': 'The minimal RAM requirement for this software image', 'required': False, 'constraints': [{'greater_or_equal': '0 B'}]}
  //
  // The minimal RAM requirement for this software image
  //
  min_ram: lone scalar_unit_size,

  // YAML size: {'type': 'scalar-unit.size', 'description': 'The size of this software image', 'required': False}
  //
  // The size of this software image
  //
  size: lone scalar_unit_size,

  // YAML operating_system: {'type': 'string', 'description': 'Identifies the operating system used in the software image', 'required': False}
  //
  // Identifies the operating system used in the software image
  //
  operating_system: lone string,

  // YAML supported_virtualisation_environments: {'type': 'list', 'description': 'Identifies the virtualisation environments (e.g. hypervisor) compatible with this software image', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Identifies the virtualisation environments (e.g. hypervisor) compatible with this software image
  //
  supported_virtualisation_environments: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  container_format.valid_values["aki" + "ami" + "ari" + "bare" + "docker" + "ova" + "ovf"]
  disk_format.valid_values["aki" + "ami" + "ari" + "iso" + "qcow2" + "raw" + "vdi" + "vhd" + "vhdx" + "vmdk"]
  some min_disk implies min_disk.greater_or_equal[0, B]
  some min_ram implies min_ram.greater_or_equal[0, B]

}

/** There exists some tosca.artifacts.nfv.SwImage */
run Show_tosca_artifacts_nfv_SwImage {
  tosca_artifacts_nfv_SwImage.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_artifacts_nfv_SwImage
  expect 1

//
// artifacts for Mistral workflows
//
sig tosca_artifacts_Implementation_nfv_Mistral extends tosca_artifacts_Implementation
{
} {
  // YAML mime_type: application/x-yaml
  mime_type["application/x-yaml"]

  // YAML file_ext: ['yaml']
  file_ext["yaml"]
}

/** There exists some tosca.artifacts.Implementation.nfv.Mistral */
run Show_tosca_artifacts_Implementation_nfv_Mistral {
  tosca_artifacts_Implementation_nfv_Mistral.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_artifacts_Implementation_nfv_Mistral
  expect 1

//
// describes the Helm chart artifact.
//
sig tosca_artifacts_nfv_HelmChart extends tosca_artifacts_File
{
} {
  // YAML file_ext: ['tar', 'tar.gz', 'tgz']
  file_ext["tar" + "tar.gz" + "tgz"]
}

/** There exists some tosca.artifacts.nfv.HelmChart */
run Show_tosca_artifacts_nfv_HelmChart {
  tosca_artifacts_nfv_HelmChart.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_artifacts_nfv_HelmChart
  expect 1

// --------------------------------------------------
// Capability Types
// --------------------------------------------------

//
// Indicates that the node that includes it can be pointed by a tosca.relationships.nfv.VirtualBindsTo relationship type which is used to model the VduHasCpd association
//
sig tosca_capabilities_nfv_VirtualBindable extends tosca_capabilities_Node
{
} {
}

/** There exists some tosca.capabilities.nfv.VirtualBindable */
run Show_tosca_capabilities_nfv_VirtualBindable {
  tosca_capabilities_nfv_VirtualBindable.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_VirtualBindable
  expect 1

//
// Describes the capabilities related to virtual compute resources
//
sig tosca_capabilities_nfv_VirtualCompute extends tosca_capabilities_Node
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML logical_node: {'type': 'map', 'description': 'Describes the Logical Node requirements', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.LogicalNodeData'}}
  //
  // Describes the Logical Node requirements
  //
  property_logical_node: lone TOSCA/map_data/Map,

  // YAML requested_additional_capabilities: {'type': 'map', 'description': 'Describes additional capability for a particular VDU', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.RequestedAdditionalCapability'}}
  //
  // Describes additional capability for a particular VDU
  //
  property_requested_additional_capabilities: lone TOSCA/map_data/Map,

  // YAML compute_requirements: {'type': 'map', 'required': False, 'entry_schema': {'type': 'string'}}
  property_compute_requirements: lone TOSCA/map_string/Map,

  // YAML virtual_memory: {'type': 'tosca.datatypes.nfv.VirtualMemory', 'description': 'Describes virtual memory of the virtualized compute', 'required': True}
  //
  // Describes virtual memory of the virtualized compute
  //
  property_virtual_memory: one tosca_datatypes_nfv_VirtualMemory,

  // YAML virtual_cpu: {'type': 'tosca.datatypes.nfv.VirtualCpu', 'description': 'Describes virtual CPU(s) of the virtualized compute', 'required': True}
  //
  // Describes virtual CPU(s) of the virtualized compute
  //
  property_virtual_cpu: one tosca_datatypes_nfv_VirtualCpu,

  // YAML virtual_local_storage: {'type': 'list', 'description': 'A list of virtual system disks created and destroyed as part of the VM lifecycle', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualBlockStorageData', 'description': 'virtual system disk definition'}}
  //
  // A list of virtual system disks created and destroyed as part of the VM lifecycle
  //
  property_virtual_local_storage: seq tosca_datatypes_nfv_VirtualBlockStorageData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.capabilities.nfv.VirtualCompute */
run Show_tosca_capabilities_nfv_VirtualCompute {
  tosca_capabilities_nfv_VirtualCompute.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_VirtualCompute
  expect 1

//
// Describes the attachment capabilities related to Vdu.Storage
//
sig tosca_capabilities_nfv_VirtualStorage extends tosca_capabilities_Root
{
} {
}

/** There exists some tosca.capabilities.nfv.VirtualStorage */
run Show_tosca_capabilities_nfv_VirtualStorage {
  tosca_capabilities_nfv_VirtualStorage.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_VirtualStorage
  expect 1

//
// Indicates that the node that includes it can be pointed by a tosca.relationships.nfv.TrunkBindsTo relationship type which is used to model the trunkPortTopology.
//
sig tosca_capabilities_nfv_TrunkBindable extends tosca_capabilities_Node
{
} {
}

/** There exists some tosca.capabilities.nfv.TrunkBindable */
run Show_tosca_capabilities_nfv_TrunkBindable {
  tosca_capabilities_nfv_TrunkBindable.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_TrunkBindable
  expect 1

//
// A node type that includes the ContainerDeployable capability indicates that it can be pointed by tosca.relationships.nfv.DeploysTo relationship type
//
sig tosca_capabilities_nfv_ContainerDeployable extends tosca_capabilities_Node
{
} {
}

/** There exists some tosca.capabilities.nfv.ContainerDeployable */
run Show_tosca_capabilities_nfv_ContainerDeployable {
  tosca_capabilities_nfv_ContainerDeployable.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_ContainerDeployable
  expect 1

//
// Indicates that the node that includes it can be pointed by a tosca.relationships.nfv.MciopAssociates relationship type which is used to model the associatedVdu property of the MciopProfile information element defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_capabilities_nfv_AssociableVdu extends tosca_capabilities_Node
{
} {
}

/** There exists some tosca.capabilities.nfv.AssociableVdu */
run Show_tosca_capabilities_nfv_AssociableVdu {
  tosca_capabilities_nfv_AssociableVdu.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_AssociableVdu
  expect 1

// --------------------------------------------------
// Relationship Types
// --------------------------------------------------

//
// Represents an association relationship between Vdu.Compute or Vdu.OsContainerDeployableUnit and VduCp node types
//
sig tosca_relationships_nfv_VirtualBindsTo extends tosca_relationships_DependsOn
{
} {
  valid_target_types[tosca_capabilities_nfv_VirtualBindable]
}

/** There exists some tosca.relationships.nfv.VirtualBindsTo */
run Show_tosca_relationships_nfv_VirtualBindsTo {
  tosca_relationships_nfv_VirtualBindsTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_VirtualBindsTo
  expect 1

//
// Represents an association relationship between the Vdu.Compute or Vdu.OsContainerDeployableUnit and one of the node types, Vdu.VirtualBlockStorage, Vdu.VirtualObjectStorage or Vdu.VirtualFileStorage
//
sig tosca_relationships_nfv_AttachesTo extends tosca_relationships_Root
{
} {
  valid_target_types[tosca_capabilities_nfv_VirtualStorage]
}

/** There exists some tosca.relationships.nfv.AttachesTo */
run Show_tosca_relationships_nfv_AttachesTo {
  tosca_relationships_nfv_AttachesTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_AttachesTo
  expect 1

//
// Represents the association relationship between a VduCp node used as a trunk port and other VduSubCp nodes used as subports of the same trunk.
//
sig tosca_relationships_nfv_TrunkBindsTo extends tosca_relationships_DependsOn
{
} {
  valid_target_types[tosca_capabilities_nfv_TrunkBindable]
}

/** There exists some tosca.relationships.nfv.TrunkBindsTo */
run Show_tosca_relationships_nfv_TrunkBindsTo {
  tosca_relationships_nfv_TrunkBindsTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_TrunkBindsTo
  expect 1

//
// Represents an association relationship between Vdu.OsContainerDeployableUnit and Vdu.OsContainer node types
//
sig tosca_relationships_nfv_DeploysTo extends tosca_relationships_DependsOn
{
} {
  valid_target_types[tosca_capabilities_nfv_ContainerDeployable]
}

/** There exists some tosca.relationships.nfv.DeploysTo */
run Show_tosca_relationships_nfv_DeploysTo {
  tosca_relationships_nfv_DeploysTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_DeploysTo
  expect 1

//
// Represents an association relationship between Mciop and Vdu.OsContainerDeployableUnit node types
//
sig tosca_relationships_nfv_MciopAssociates extends tosca_relationships_DependsOn
{
} {
  valid_target_types[tosca_capabilities_nfv_AssociableVdu]
}

/** There exists some tosca.relationships.nfv.MciopAssociates */
run Show_tosca_relationships_nfv_MciopAssociates {
  tosca_relationships_nfv_MciopAssociates.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_MciopAssociates
  expect 1

// --------------------------------------------------
// Interface Types
// --------------------------------------------------

//
// This interface encompasses a set of TOSCA operations corresponding to the VNF LCM operations defined in ETSI GS NFV-IFA 007 as well as to preamble and postamble procedures to the execution of the VNF LCM operations.
//
sig tosca_interfaces_nfv_Vnflcm extends tosca_interfaces_Root
{
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

  // YAML instantiate: {'description': 'Invoked upon receipt of an Instantiate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of an Instantiate VNF request
  //
  operation_instantiate: one TOSCA/Operation,

  // YAML instantiate_start: {'description': 'Invoked before instantiate'}
  //
  // Invoked before instantiate
  //
  operation_instantiate_start: one TOSCA/Operation,

  // YAML instantiate_end: {'description': 'Invoked after instantiate'}
  //
  // Invoked after instantiate
  //
  operation_instantiate_end: one TOSCA/Operation,

  // YAML terminate: {'description': 'Invoked upon receipt Terminate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt Terminate VNF request
  //
  operation_terminate: one TOSCA/Operation,

  // YAML terminate_start: {'description': 'Invoked before terminate'}
  //
  // Invoked before terminate
  //
  operation_terminate_start: one TOSCA/Operation,

  // YAML terminate_end: {'description': 'Invoked after terminate'}
  //
  // Invoked after terminate
  //
  operation_terminate_end: one TOSCA/Operation,

  // YAML modify_information: {'description': 'Invoked upon receipt of a Modify VNF Information request'}
  //
  // Invoked upon receipt of a Modify VNF Information request
  //
  operation_modify_information: one TOSCA/Operation,

  // YAML modify_information_start: {'description': 'Invoked before modify_information'}
  //
  // Invoked before modify_information
  //
  operation_modify_information_start: one TOSCA/Operation,

  // YAML modify_information_end: {'description': 'Invoked after modify_information'}
  //
  // Invoked after modify_information
  //
  operation_modify_information_end: one TOSCA/Operation,

  // YAML change_flavour: {'description': 'Invoked upon receipt of a Change VNF Flavour request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Change VNF Flavour request
  //
  operation_change_flavour: one TOSCA/Operation,

  // YAML change_flavour_start: {'description': 'Invoked before change_flavour'}
  //
  // Invoked before change_flavour
  //
  operation_change_flavour_start: one TOSCA/Operation,

  // YAML change_flavour_end: {'description': 'Invoked after change_flavour'}
  //
  // Invoked after change_flavour
  //
  operation_change_flavour_end: one TOSCA/Operation,

  // YAML change_external_connectivity: {'description': 'Invoked upon receipt of a Change External VNF Connectivity  request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Change External VNF Connectivity  request
  //
  operation_change_external_connectivity: one TOSCA/Operation,

  // YAML change_external_connectivity_start: {'description': 'Invoked before change_external_connectivity'}
  //
  // Invoked before change_external_connectivity
  //
  operation_change_external_connectivity_start: one TOSCA/Operation,

  // YAML change_external_connectivity_end: {'description': 'Invoked after change_external_connectivity'}
  //
  // Invoked after change_external_connectivity
  //
  operation_change_external_connectivity_end: one TOSCA/Operation,

  // YAML operate: {'description': 'Invoked upon receipt of an Operate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of an Operate VNF request
  //
  operation_operate: one TOSCA/Operation,

  // YAML operate_start: {'description': 'Invoked before operate'}
  //
  // Invoked before operate
  //
  operation_operate_start: one TOSCA/Operation,

  // YAML operate_end: {'description': 'Invoked after operate'}
  //
  // Invoked after operate
  //
  operation_operate_end: one TOSCA/Operation,

  // YAML heal: {'description': 'Invoked upon receipt of a Heal VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'cause': {'type': 'string', 'description': 'Indicates the reason why a healing procedure is required.', 'required': False}, 'vnfc_instance_ids': {'type': 'list', 'entry_schema': {'type': 'string'}, 'description': 'List of VNFC instances requiring a healing action.', 'required': False}}}
  //
  // Invoked upon receipt of a Heal VNF request
  //
  operation_heal: one TOSCA/Operation,

  // YAML heal_start: {'description': 'Invoked before heal'}
  //
  // Invoked before heal
  //
  operation_heal_start: one TOSCA/Operation,

  // YAML heal_end: {'description': 'Invoked after heal'}
  //
  // Invoked after heal
  //
  operation_heal_end: one TOSCA/Operation,

  // YAML scale: {'description': 'Invoked upon receipt of a Scale VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'type': {'type': 'string', 'description': 'Indicates the type of the scale operation requested.', 'required': False, 'constraints': [{'valid_values': ['scale_out', 'scale_in']}]}, 'aspect': {'type': 'string', 'description': 'Identifier of the scaling aspect.', 'required': False}, 'number_of_steps': {'type': 'integer', 'description': 'Number of scaling steps to be executed.', 'required': True, 'constraints': [{'greater_than': 0}], 'default': 1}}}
  //
  // Invoked upon receipt of a Scale VNF request
  //
  operation_scale: one TOSCA/Operation,

  // YAML scale_start: {'description': 'Invoked before scale'}
  //
  // Invoked before scale
  //
  operation_scale_start: one TOSCA/Operation,

  // YAML scale_end: {'description': 'Invoked after scale'}
  //
  // Invoked after scale
  //
  operation_scale_end: one TOSCA/Operation,

  // YAML scale_to_level: {'description': 'Invoked upon receipt of a Scale VNF to Level request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'instantiation_level': {'type': 'string', 'description': 'Identifier of the target instantiation level of the current deployment flavour to which the VNF is requested to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False}, 'scale_info': {'type': 'map', 'description': 'For each scaling aspect of the current deployment flavour, indicates the target scale level to which the VNF is to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}}}
  //
  // Invoked upon receipt of a Scale VNF to Level request
  //
  operation_scale_to_level: one TOSCA/Operation,

  // YAML scale_to_level_start: {'description': 'Invoked before scale_to_level'}
  //
  // Invoked before scale_to_level
  //
  operation_scale_to_level_start: one TOSCA/Operation,

  // YAML scale_to_level_end: {'description': 'Invoked after scale_to_level'}
  //
  // Invoked after scale_to_level
  //
  operation_scale_to_level_end: one TOSCA/Operation,

  // YAML create_snapshot: {'description': 'Invoked upon receipt of a Create VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Create VNF snapshot request
  //
  operation_create_snapshot: one TOSCA/Operation,

  // YAML create_snapshot_start: {'description': 'Invoked before create_snapshot'}
  //
  // Invoked before create_snapshot
  //
  operation_create_snapshot_start: one TOSCA/Operation,

  // YAML create_snapshot_end: {'description': 'Invoked after create_snapshot'}
  //
  // Invoked after create_snapshot
  //
  operation_create_snapshot_end: one TOSCA/Operation,

  // YAML revert_to_snapshot: {'description': 'Invoked upon receipt of a Revert to VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Revert to VNF snapshot request
  //
  operation_revert_to_snapshot: one TOSCA/Operation,

  // YAML revert_to_snapshot_start: {'description': 'Invoked before revert_to_snapshot'}
  //
  // Invoked before revert_to_snapshot
  //
  operation_revert_to_snapshot_start: one TOSCA/Operation,

  // YAML revert_to_snapshot_end: {'description': 'Invoked after revert_to_snapshot'}
  //
  // Invoked after revert_to_snapshot
  //
  operation_revert_to_snapshot_end: one TOSCA/Operation,

  // YAML change_current_package: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked by tosca.policies.nfv.VnfPackageChange
  //
  operation_change_current_package: one TOSCA/Operation,

  // YAML change_current_package_start: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  //
  // Invoked by tosca.policies.nfv.VnfPackageChange
  //
  operation_change_current_package_start: one TOSCA/Operation,

  // YAML change_current_package_end: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  //
  // Invoked by tosca.policies.nfv.VnfPackageChange
  //
  operation_change_current_package_end: one TOSCA/Operation,

} {
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

  // YAML instantiate: {'description': 'Invoked upon receipt of an Instantiate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of an Instantiate VNF request
  //
  operation_instantiate.name["instantiate"]
  operation[operation_instantiate]

  // YAML instantiate_start: {'description': 'Invoked before instantiate'}
  //
  // Invoked before instantiate
  //
  operation_instantiate_start.name["instantiate_start"]
  operation[operation_instantiate_start]

  // YAML instantiate_end: {'description': 'Invoked after instantiate'}
  //
  // Invoked after instantiate
  //
  operation_instantiate_end.name["instantiate_end"]
  operation[operation_instantiate_end]

  // YAML terminate: {'description': 'Invoked upon receipt Terminate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt Terminate VNF request
  //
  operation_terminate.name["terminate"]
  operation[operation_terminate]

  // YAML terminate_start: {'description': 'Invoked before terminate'}
  //
  // Invoked before terminate
  //
  operation_terminate_start.name["terminate_start"]
  operation[operation_terminate_start]

  // YAML terminate_end: {'description': 'Invoked after terminate'}
  //
  // Invoked after terminate
  //
  operation_terminate_end.name["terminate_end"]
  operation[operation_terminate_end]

  // YAML modify_information: {'description': 'Invoked upon receipt of a Modify VNF Information request'}
  //
  // Invoked upon receipt of a Modify VNF Information request
  //
  operation_modify_information.name["modify_information"]
  operation[operation_modify_information]

  // YAML modify_information_start: {'description': 'Invoked before modify_information'}
  //
  // Invoked before modify_information
  //
  operation_modify_information_start.name["modify_information_start"]
  operation[operation_modify_information_start]

  // YAML modify_information_end: {'description': 'Invoked after modify_information'}
  //
  // Invoked after modify_information
  //
  operation_modify_information_end.name["modify_information_end"]
  operation[operation_modify_information_end]

  // YAML change_flavour: {'description': 'Invoked upon receipt of a Change VNF Flavour request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Change VNF Flavour request
  //
  operation_change_flavour.name["change_flavour"]
  operation[operation_change_flavour]

  // YAML change_flavour_start: {'description': 'Invoked before change_flavour'}
  //
  // Invoked before change_flavour
  //
  operation_change_flavour_start.name["change_flavour_start"]
  operation[operation_change_flavour_start]

  // YAML change_flavour_end: {'description': 'Invoked after change_flavour'}
  //
  // Invoked after change_flavour
  //
  operation_change_flavour_end.name["change_flavour_end"]
  operation[operation_change_flavour_end]

  // YAML change_external_connectivity: {'description': 'Invoked upon receipt of a Change External VNF Connectivity  request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Change External VNF Connectivity  request
  //
  operation_change_external_connectivity.name["change_external_connectivity"]
  operation[operation_change_external_connectivity]

  // YAML change_external_connectivity_start: {'description': 'Invoked before change_external_connectivity'}
  //
  // Invoked before change_external_connectivity
  //
  operation_change_external_connectivity_start.name["change_external_connectivity_start"]
  operation[operation_change_external_connectivity_start]

  // YAML change_external_connectivity_end: {'description': 'Invoked after change_external_connectivity'}
  //
  // Invoked after change_external_connectivity
  //
  operation_change_external_connectivity_end.name["change_external_connectivity_end"]
  operation[operation_change_external_connectivity_end]

  // YAML operate: {'description': 'Invoked upon receipt of an Operate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of an Operate VNF request
  //
  operation_operate.name["operate"]
  operation[operation_operate]

  // YAML operate_start: {'description': 'Invoked before operate'}
  //
  // Invoked before operate
  //
  operation_operate_start.name["operate_start"]
  operation[operation_operate_start]

  // YAML operate_end: {'description': 'Invoked after operate'}
  //
  // Invoked after operate
  //
  operation_operate_end.name["operate_end"]
  operation[operation_operate_end]

  // YAML heal: {'description': 'Invoked upon receipt of a Heal VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'cause': {'type': 'string', 'description': 'Indicates the reason why a healing procedure is required.', 'required': False}, 'vnfc_instance_ids': {'type': 'list', 'entry_schema': {'type': 'string'}, 'description': 'List of VNFC instances requiring a healing action.', 'required': False}}}
  //
  // Invoked upon receipt of a Heal VNF request
  //
  operation_heal.name["heal"]
  operation[operation_heal]

  // YAML heal_start: {'description': 'Invoked before heal'}
  //
  // Invoked before heal
  //
  operation_heal_start.name["heal_start"]
  operation[operation_heal_start]

  // YAML heal_end: {'description': 'Invoked after heal'}
  //
  // Invoked after heal
  //
  operation_heal_end.name["heal_end"]
  operation[operation_heal_end]

  // YAML scale: {'description': 'Invoked upon receipt of a Scale VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'type': {'type': 'string', 'description': 'Indicates the type of the scale operation requested.', 'required': False, 'constraints': [{'valid_values': ['scale_out', 'scale_in']}]}, 'aspect': {'type': 'string', 'description': 'Identifier of the scaling aspect.', 'required': False}, 'number_of_steps': {'type': 'integer', 'description': 'Number of scaling steps to be executed.', 'required': True, 'constraints': [{'greater_than': 0}], 'default': 1}}}
  //
  // Invoked upon receipt of a Scale VNF request
  //
  operation_scale.name["scale"]
  operation[operation_scale]

  // YAML scale_start: {'description': 'Invoked before scale'}
  //
  // Invoked before scale
  //
  operation_scale_start.name["scale_start"]
  operation[operation_scale_start]

  // YAML scale_end: {'description': 'Invoked after scale'}
  //
  // Invoked after scale
  //
  operation_scale_end.name["scale_end"]
  operation[operation_scale_end]

  // YAML scale_to_level: {'description': 'Invoked upon receipt of a Scale VNF to Level request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'instantiation_level': {'type': 'string', 'description': 'Identifier of the target instantiation level of the current deployment flavour to which the VNF is requested to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False}, 'scale_info': {'type': 'map', 'description': 'For each scaling aspect of the current deployment flavour, indicates the target scale level to which the VNF is to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}}}
  //
  // Invoked upon receipt of a Scale VNF to Level request
  //
  operation_scale_to_level.name["scale_to_level"]
  operation[operation_scale_to_level]

  // YAML scale_to_level_start: {'description': 'Invoked before scale_to_level'}
  //
  // Invoked before scale_to_level
  //
  operation_scale_to_level_start.name["scale_to_level_start"]
  operation[operation_scale_to_level_start]

  // YAML scale_to_level_end: {'description': 'Invoked after scale_to_level'}
  //
  // Invoked after scale_to_level
  //
  operation_scale_to_level_end.name["scale_to_level_end"]
  operation[operation_scale_to_level_end]

  // YAML create_snapshot: {'description': 'Invoked upon receipt of a Create VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Create VNF snapshot request
  //
  operation_create_snapshot.name["create_snapshot"]
  operation[operation_create_snapshot]

  // YAML create_snapshot_start: {'description': 'Invoked before create_snapshot'}
  //
  // Invoked before create_snapshot
  //
  operation_create_snapshot_start.name["create_snapshot_start"]
  operation[operation_create_snapshot_start]

  // YAML create_snapshot_end: {'description': 'Invoked after create_snapshot'}
  //
  // Invoked after create_snapshot
  //
  operation_create_snapshot_end.name["create_snapshot_end"]
  operation[operation_create_snapshot_end]

  // YAML revert_to_snapshot: {'description': 'Invoked upon receipt of a Revert to VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked upon receipt of a Revert to VNF snapshot request
  //
  operation_revert_to_snapshot.name["revert_to_snapshot"]
  operation[operation_revert_to_snapshot]

  // YAML revert_to_snapshot_start: {'description': 'Invoked before revert_to_snapshot'}
  //
  // Invoked before revert_to_snapshot
  //
  operation_revert_to_snapshot_start.name["revert_to_snapshot_start"]
  operation[operation_revert_to_snapshot_start]

  // YAML revert_to_snapshot_end: {'description': 'Invoked after revert_to_snapshot'}
  //
  // Invoked after revert_to_snapshot
  //
  operation_revert_to_snapshot_end.name["revert_to_snapshot_end"]
  operation[operation_revert_to_snapshot_end]

  // YAML change_current_package: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  //
  // Invoked by tosca.policies.nfv.VnfPackageChange
  //
  operation_change_current_package.name["change_current_package"]
  operation[operation_change_current_package]

  // YAML change_current_package_start: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  //
  // Invoked by tosca.policies.nfv.VnfPackageChange
  //
  operation_change_current_package_start.name["change_current_package_start"]
  operation[operation_change_current_package_start]

  // YAML change_current_package_end: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  //
  // Invoked by tosca.policies.nfv.VnfPackageChange
  //
  operation_change_current_package_end.name["change_current_package_end"]
  operation[operation_change_current_package_end]

}

/** There exists some tosca.interfaces.nfv.Vnflcm */
run Show_tosca_interfaces_nfv_Vnflcm {
  tosca_interfaces_nfv_Vnflcm.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 2 TOSCA/Operation,
  exactly 8 TOSCA/Parameter,
  exactly 1 tosca_interfaces_nfv_Vnflcm
  expect 1

//
// This interface is an empty base interface type for deriving VNF specific interface types that include VNF indicator specific notifications.
//
sig tosca_interfaces_nfv_VnfIndicator extends tosca_interfaces_Root
{
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

} {
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

}

/** There exists some tosca.interfaces.nfv.VnfIndicator */
run Show_tosca_interfaces_nfv_VnfIndicator {
  tosca_interfaces_nfv_VnfIndicator.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Operation,
  exactly 8 TOSCA/Parameter,
  exactly 1 tosca_interfaces_nfv_VnfIndicator
  expect 1

//
// This interface is an empty base interface type for deriving VNF specific interface types that include VNF Change Current VNF Package specific operation.
//
sig tosca_interfaces_nfv_ChangeCurrentVnfPackage extends tosca_interfaces_Root
{
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

} {
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

}

/** There exists some tosca.interfaces.nfv.ChangeCurrentVnfPackage */
run Show_tosca_interfaces_nfv_ChangeCurrentVnfPackage {
  tosca_interfaces_nfv_ChangeCurrentVnfPackage.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Operation,
  exactly 8 TOSCA/Parameter,
  exactly 1 tosca_interfaces_nfv_ChangeCurrentVnfPackage
  expect 1

// --------------------------------------------------
// Node Types
// --------------------------------------------------

//
// The generic abstract type from which all VNF specific node types shall be derived to form, together with other node types, the TOSCA service template(s) representing the VNFD
//
sig tosca_nodes_nfv_VNF extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'type': 'string', 'description': 'Identifier of this VNFD information element. This attribute shall be globally unique', 'required': True}
  //
  // Identifier of this VNFD information element. This attribute shall be globally unique
  //
  property_descriptor_id: one string,

  // YAML ext_invariant_id: {'type': 'string', 'description': 'Identifies the VNFD in a version independent manner. This property is invariant across versions of the VNFD that fulfil certain conditions related to the external connectivity and management of the VNF. When used in a VNF node template in an NSD it allows for VNF instances during NS LCM the use of a VNFD different from the one referenced by the descriptor_id property, provided they have the same ext_invariant_id. This attribute shall be globally unique.', 'required': False}
  //
  // Identifies the VNFD in a version independent manner. This property is invariant across versions of the VNFD that fulfil certain conditions related to the external connectivity and management of the VNF. When used in a VNF node template in an NSD it allows for VNF instances during NS LCM the use of a VNFD different from the one referenced by the descriptor_id property, provided they have the same ext_invariant_id. This attribute shall be globally unique.
  //
  property_ext_invariant_id: lone string,

  // YAML descriptor_version: {'type': 'string', 'description': 'Identifies the version of the VNFD', 'required': True}
  //
  // Identifies the version of the VNFD
  //
  property_descriptor_version: one string,

  // YAML provider: {'type': 'string', 'description': 'Provider of the VNF and of the VNFD', 'required': True}
  //
  // Provider of the VNF and of the VNFD
  //
  property_provider: one string,

  // YAML product_name: {'type': 'string', 'description': 'Human readable name for the VNF Product', 'required': True}
  //
  // Human readable name for the VNF Product
  //
  property_product_name: one string,

  // YAML software_version: {'type': 'string', 'description': 'Software version of the VNF', 'required': True}
  //
  // Software version of the VNF
  //
  property_software_version: one string,

  // YAML product_info_name: {'type': 'string', 'description': 'Human readable name for the VNF Product', 'required': False}
  //
  // Human readable name for the VNF Product
  //
  property_product_info_name: lone string,

  // YAML product_info_description: {'type': 'string', 'description': 'Human readable description of the VNF Product', 'required': False}
  //
  // Human readable description of the VNF Product
  //
  property_product_info_description: lone string,

  // YAML vnfm_info: {'type': 'list', 'required': True, 'description': 'Identifies VNFM(s) compatible with the VNF', 'entry_schema': {'type': 'string', 'constraints': [{'pattern': '(^etsivnfm:v[0-9]?[0-9]\\.[0-9]?[0-9]\\.[0-9]?[0-9]$)|(^[0-9]+:[a-zA-Z0-9.-]+$)'}]}}
  //
  // Identifies VNFM(s) compatible with the VNF
  //
  property_vnfm_info: seq string,

  // YAML localization_languages: {'type': 'list', 'description': 'Information about localization languages of the VNF', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Information about localization languages of the VNF
  //
  property_localization_languages: seq string,

  // YAML default_localization_language: {'type': 'string', 'description': 'Default localization language that is instantiated if no information about selected localization language is available', 'required': False}
  //
  // Default localization language that is instantiated if no information about selected localization language is available
  //
  property_default_localization_language: lone string,

  // YAML configurable_properties: {'type': 'tosca.datatypes.nfv.VnfConfigurableProperties', 'description': 'Describes the configurable properties of the VNF', 'required': False}
  //
  // Describes the configurable properties of the VNF
  //
  property_configurable_properties: lone tosca_datatypes_nfv_VnfConfigurableProperties,

  // YAML modifiable_attributes: {'type': 'tosca.datatypes.nfv.VnfInfoModifiableAttributes', 'description': 'Describes the modifiable attributes of the VNF', 'required': False}
  //
  // Describes the modifiable attributes of the VNF
  //
  property_modifiable_attributes: lone tosca_datatypes_nfv_VnfInfoModifiableAttributes,

  // YAML lcm_operations_configuration: {'type': 'tosca.datatypes.nfv.VnfLcmOperationsConfiguration', 'description': 'Describes the configuration parameters for the VNF LCM operations', 'required': False}
  //
  // Describes the configuration parameters for the VNF LCM operations
  //
  property_lcm_operations_configuration: lone tosca_datatypes_nfv_VnfLcmOperationsConfiguration,

  // YAML monitoring_parameters: {'type': 'map', 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfMonitoringParameter'}, 'description': 'Describes monitoring parameters applicable to the VNF.', 'required': False}
  //
  // Describes monitoring parameters applicable to the VNF.
  //
  property_monitoring_parameters: lone TOSCA/map_data/Map,

  // YAML flavour_id: {'type': 'string', 'description': 'Identifier of the Deployment Flavour within the VNFD', 'required': True}
  //
  // Identifier of the Deployment Flavour within the VNFD
  //
  property_flavour_id: one string,

  // YAML flavour_description: {'type': 'string', 'description': 'Human readable description of the DF', 'required': True}
  //
  // Human readable description of the DF
  //
  property_flavour_description: one string,

  // YAML vnf_profile: {'type': 'tosca.datatypes.nfv.VnfProfile', 'description': 'Describes a profile for instantiating VNFs of a particular NS DF according to a specific VNFD and VNF DF', 'required': False}
  //
  // Describes a profile for instantiating VNFs of a particular NS DF according to a specific VNFD and VNF DF
  //
  property_vnf_profile: lone tosca_datatypes_nfv_VnfProfile,

  // --------------------------------------------------
  // Attributes
  // --------------------------------------------------

  // YAML scale_status: {'type': 'map', 'description': 'Scale status of the VNF, one entry per aspect. Represents for every scaling aspect how "big" the VNF has been scaled w.r.t. that aspect.', 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}
  //
  // Scale status of the VNF, one entry per aspect. Represents for every scaling aspect how "big" the VNF has been scaled w.r.t. that aspect.
  //
  attribute_scale_status: one TOSCA/map_data/Map,


  // --------------------------------------------------
  // Interfaces
  // --------------------------------------------------

  // YAML Vnflcm: {'type': 'tosca.interfaces.nfv.Vnflcm'}
  interface_Vnflcm: one tosca_interfaces_nfv_Vnflcm,

  // YAML VnfIndicator: {'type': 'tosca.interfaces.nfv.VnfIndicator'}
  interface_VnfIndicator: one tosca_interfaces_nfv_VnfIndicator,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_virtual_link: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_vnfm_info.elems.pattern["(^etsivnfm:v[0-9]?[0-9]\\.[0-9]?[0-9]\\.[0-9]?[0-9]$)|(^[0-9]+:[a-zA-Z0-9.-]+$)"]

  // --------------------------------------------------
  // Attributes
  // --------------------------------------------------

  //
  // Scale status of the VNF, one entry per aspect. Represents for every scaling aspect how "big" the VNF has been scaled w.r.t. that aspect.
  //

  // --------------------------------------------------
  // Interfaces
  // --------------------------------------------------

  // YAML Vnflcm: {'type': 'tosca.interfaces.nfv.Vnflcm'}
  interface[interface_Vnflcm]
  interface_Vnflcm.name["Vnflcm"]

  // YAML VnfIndicator: {'type': 'tosca.interfaces.nfv.VnfIndicator'}
  interface[interface_VnfIndicator]
  interface_VnfIndicator.name["VnfIndicator"]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.VNF */
run Show_tosca_nodes_nfv_VNF {
  tosca_nodes_nfv_VNF.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VNF
  expect 1

//
// Describes a logical external connection point, exposed by the VNF enabling connection with an external Virtual Link
//
sig tosca_nodes_nfv_VnfExtCp extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML virtual_network_interface_requirements: {'type': 'list', 'description': 'The actual virtual NIC requirements that is been assigned when instantiating the connection point', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualNetworkInterfaceRequirements'}}
  //
  // The actual virtual NIC requirements that is been assigned when instantiating the connection point
  //
  property_virtual_network_interface_requirements: seq tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_external_virtual_link: lone TOSCA/Requirement,

  // YAML internal_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement_internal_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement["external_virtual_link", requirement_external_virtual_link]
  requirement_external_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_external_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

  // YAML internal_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement["internal_virtual_link", requirement_internal_virtual_link]
  requirement_internal_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_internal_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.VnfExtCp */
run Show_tosca_nodes_nfv_VnfExtCp {
  tosca_nodes_nfv_VnfExtCp.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 2 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 2 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VnfExtCp
  expect 1

//
// Describes the virtual compute part of a VDU which is a construct  supporting the description of the deployment and operational behavior of a VNFC
//
sig tosca_nodes_nfv_Vdu_Compute extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the VDU', 'required': True}
  //
  // Human readable name of the VDU
  //
  property_name: one string,

  // YAML description: {'type': 'string', 'description': 'Human readable description of the VDU', 'required': True}
  //
  // Human readable description of the VDU
  //
  property_description: one string,

  // YAML boot_order: {'type': 'boolean', 'description': 'indicates whether the order of the virtual_storage requirements is used as the boot index (the first requirement represents the lowest index and defines highest boot priority)', 'required': True, 'default': False}
  //
  // indicates whether the order of the virtual_storage requirements is used as the boot index (the first requirement represents the lowest index and defines highest boot priority)
  //
  property_boot_order: one boolean,

  // YAML nfvi_constraints: {'type': 'map', 'description': 'Describes constraints on the NFVI for the VNFC instance(s) created from this VDU. This property is reserved for future use in the present document.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Describes constraints on the NFVI for the VNFC instance(s) created from this VDU. This property is reserved for future use in the present document.
  //
  property_nfvi_constraints: lone TOSCA/map_string/Map,

  // YAML monitoring_parameters: {'type': 'map', 'description': 'Describes monitoring parameters applicable to a VNFC instantiated from this VDU', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfcMonitoringParameter'}}
  //
  // Describes monitoring parameters applicable to a VNFC instantiated from this VDU
  //
  property_monitoring_parameters: lone TOSCA/map_data/Map,

  // YAML configurable_properties: {'type': 'tosca.datatypes.nfv.VnfcConfigurableProperties', 'required': False}
  property_configurable_properties: lone tosca_datatypes_nfv_VnfcConfigurableProperties,

  // YAML vdu_profile: {'type': 'tosca.datatypes.nfv.VduProfile', 'description': 'Defines additional instantiation data for the VDU.Compute node', 'required': True}
  //
  // Defines additional instantiation data for the VDU.Compute node
  //
  property_vdu_profile: one tosca_datatypes_nfv_VduProfile,

  // YAML boot_data: {'type': 'tosca.datatypes.nfv.BootData', 'description': 'Contains the information used to customize a virtualised compute resource at boot time. The bootData may contain variable parts that are replaced by deployment specific values before being sent to the VIM.', 'required': False}
  //
  // Contains the information used to customize a virtualised compute resource at boot time. The bootData may contain variable parts that are replaced by deployment specific values before being sent to the VIM.
  //
  property_boot_data: lone tosca_datatypes_nfv_BootData,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_compute: {'type': 'tosca.capabilities.nfv.VirtualCompute', 'occurrences': [1, 1]}
  capability_virtual_compute: one tosca_capabilities_nfv_VirtualCompute,

  // YAML virtual_binding: {'type': 'tosca.capabilities.nfv.VirtualBindable', 'occurrences': [1, 'UNBOUNDED']}
  capability_virtual_binding: some tosca_capabilities_nfv_VirtualBindable,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_storage: {'capability': 'tosca.capabilities.nfv.VirtualStorage', 'relationship': 'tosca.relationships.nfv.AttachesTo', 'occurrences': [0, 'UNBOUNDED']}
  requirement_virtual_storage: set TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_compute: {'type': 'tosca.capabilities.nfv.VirtualCompute', 'occurrences': [1, 1]}
  capability_virtual_compute.name["virtual_compute"]
  capability[capability_virtual_compute]

  // YAML virtual_binding: {'type': 'tosca.capabilities.nfv.VirtualBindable', 'occurrences': [1, 'UNBOUNDED']}
  capability_virtual_binding.name["virtual_binding"]
  capability[capability_virtual_binding]
  // YAML occurrences: [1, 'UNBOUNDED']

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_storage: {'capability': 'tosca.capabilities.nfv.VirtualStorage', 'relationship': 'tosca.relationships.nfv.AttachesTo', 'occurrences': [0, 'UNBOUNDED']}
  requirement["virtual_storage", requirement_virtual_storage]
  requirement_virtual_storage.capability[tosca_capabilities_nfv_VirtualStorage]
  requirement_virtual_storage.relationship[tosca_relationships_nfv_AttachesTo]
  // YAML occurrences: [0, 'UNBOUNDED']

}

/** There exists some tosca.nodes.nfv.Vdu.Compute */
run Show_tosca_nodes_nfv_Vdu_Compute {
  tosca_nodes_nfv_Vdu_Compute.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Vdu_Compute
  expect 1

//
// This node type describes the specifications of requirements related to virtual block storage resources
//
sig tosca_nodes_nfv_Vdu_VirtualBlockStorage extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML virtual_block_storage_data: {'type': 'tosca.datatypes.nfv.VirtualBlockStorageData', 'description': 'Describes the block storage characteristics.', 'required': True}
  //
  // Describes the block storage characteristics.
  //
  property_virtual_block_storage_data: one tosca_datatypes_nfv_VirtualBlockStorageData,

  // YAML per_vnfc_instance: {'type': 'boolean', 'description': 'Indicates whether the virtual storage descriptor shall be instantiated per VNFC instance.', 'required': True, 'default': True}
  //
  // Indicates whether the virtual storage descriptor shall be instantiated per VNFC instance.
  //
  property_per_vnfc_instance: one boolean,

  // YAML nfvi_maintenance_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the rules to be observed when an instance based on this VirtualBlockStorage is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the rules to be observed when an instance based on this VirtualBlockStorage is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  property_nfvi_maintenance_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_storage: {'type': 'tosca.capabilities.nfv.VirtualStorage', 'description': 'Defines the capabilities of virtual_storage.'}
  //
  // Defines the capabilities of virtual_storage.
  //
  capability_virtual_storage: some tosca_capabilities_nfv_VirtualStorage,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  //
  // Defines the capabilities of virtual_storage.
  //
  // YAML virtual_storage: {'type': 'tosca.capabilities.nfv.VirtualStorage', 'description': 'Defines the capabilities of virtual_storage.'}
  capability_virtual_storage.name["virtual_storage"]
  capability[capability_virtual_storage]

}

/** There exists some tosca.nodes.nfv.Vdu.VirtualBlockStorage */
run Show_tosca_nodes_nfv_Vdu_VirtualBlockStorage {
  tosca_nodes_nfv_Vdu_VirtualBlockStorage.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Vdu_VirtualBlockStorage
  expect 1

//
// This node type describes the specifications of requirements related to virtual object storage resources
//
sig tosca_nodes_nfv_Vdu_VirtualObjectStorage extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML virtual_object_storage_data: {'type': 'tosca.datatypes.nfv.VirtualObjectStorageData', 'description': 'Describes the object storage characteristics.', 'required': True}
  //
  // Describes the object storage characteristics.
  //
  property_virtual_object_storage_data: one tosca_datatypes_nfv_VirtualObjectStorageData,

  // YAML per_vnfc_instance: {'type': 'boolean', 'description': 'Indicates whether the virtual storage descriptor shall be instantiated per VNFC instance.', 'required': True, 'default': True}
  //
  // Indicates whether the virtual storage descriptor shall be instantiated per VNFC instance.
  //
  property_per_vnfc_instance: one boolean,

  // YAML nfvi_maintenance_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the rules to be observed when an instance based on this VirtualObjectStorage is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the rules to be observed when an instance based on this VirtualObjectStorage is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  property_nfvi_maintenance_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_storage: {'type': 'tosca.capabilities.nfv.VirtualStorage', 'description': 'Defines the capabilities of virtual_storage.'}
  //
  // Defines the capabilities of virtual_storage.
  //
  capability_virtual_storage: some tosca_capabilities_nfv_VirtualStorage,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  //
  // Defines the capabilities of virtual_storage.
  //
  // YAML virtual_storage: {'type': 'tosca.capabilities.nfv.VirtualStorage', 'description': 'Defines the capabilities of virtual_storage.'}
  capability_virtual_storage.name["virtual_storage"]
  capability[capability_virtual_storage]

}

/** There exists some tosca.nodes.nfv.Vdu.VirtualObjectStorage */
run Show_tosca_nodes_nfv_Vdu_VirtualObjectStorage {
  tosca_nodes_nfv_Vdu_VirtualObjectStorage.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Vdu_VirtualObjectStorage
  expect 1

//
// This node type describes the specifications of requirements related to virtual file storage resources
//
sig tosca_nodes_nfv_Vdu_VirtualFileStorage extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML virtual_file_storage_data: {'type': 'tosca.datatypes.nfv.VirtualFileStorageData', 'description': 'Describes the file  storage characteristics.', 'required': True}
  //
  // Describes the file  storage characteristics.
  //
  property_virtual_file_storage_data: one tosca_datatypes_nfv_VirtualFileStorageData,

  // YAML per_vnfc_instance: {'type': 'boolean', 'description': 'Indicates whether the virtual storage descriptor shall be instantiated per VNFC instance.', 'required': True, 'default': True}
  //
  // Indicates whether the virtual storage descriptor shall be instantiated per VNFC instance.
  //
  property_per_vnfc_instance: one boolean,

  // YAML nfvi_maintenance_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the rules to be observed when an instance based on this VirtualFileStorage is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the rules to be observed when an instance based on this VirtualFileStorage is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  property_nfvi_maintenance_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_storage: {'type': 'tosca.capabilities.nfv.VirtualStorage', 'description': 'Defines the capabilities of virtual_storage.'}
  //
  // Defines the capabilities of virtual_storage.
  //
  capability_virtual_storage: some tosca_capabilities_nfv_VirtualStorage,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  //
  // Defines the capabilities of virtual_storage.
  //
  // YAML virtual_storage: {'type': 'tosca.capabilities.nfv.VirtualStorage', 'description': 'Defines the capabilities of virtual_storage.'}
  capability_virtual_storage.name["virtual_storage"]
  capability[capability_virtual_storage]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.Vdu.VirtualFileStorage */
run Show_tosca_nodes_nfv_Vdu_VirtualFileStorage {
  tosca_nodes_nfv_Vdu_VirtualFileStorage.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 2 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 2 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Vdu_VirtualFileStorage
  expect 1

//
// describes network connectivity between a VNFC instance based on this VDU and an internal VL
//
sig tosca_nodes_nfv_VduCp extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML bitrate_requirement: {'type': 'integer', 'description': 'Bitrate requirement in bit per second on this connection point', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Bitrate requirement in bit per second on this connection point
  //
  property_bitrate_requirement: lone integer,

  // YAML virtual_network_interface_requirements: {'type': 'list', 'description': 'Specifies requirements on a virtual network interface realising the CPs instantiated from this CPD', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualNetworkInterfaceRequirements'}}
  //
  // Specifies requirements on a virtual network interface realising the CPs instantiated from this CPD
  //
  property_virtual_network_interface_requirements: seq tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements,

  // YAML order: {'type': 'integer', 'description': 'The order of the NIC on the compute instance (e.g.eth2)', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // The order of the NIC on the compute instance (e.g.eth2)
  //
  property_order: lone integer,

  // YAML vnic_type: {'type': 'string', 'description': 'Describes the type of the virtual network interface realizing the CPs instantiated from this CPD', 'required': False, 'constraints': [{'valid_values': ['normal', 'macvtap', 'direct', 'baremetal', 'virtio-forwarder', 'direct-physical', 'smart-nic', 'bridge', 'ipvlan', 'loopback', 'macvlan', 'ptp', 'vlan', 'host-device']}]}
  //
  // Describes the type of the virtual network interface realizing the CPs instantiated from this CPD
  //
  property_vnic_type: lone string,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML trunk_binding: {'type': 'tosca.capabilities.nfv.TrunkBindable', 'occurrences': [0, 'UNBOUNDED']}
  capability_trunk_binding: set tosca_capabilities_nfv_TrunkBindable,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement_virtual_link: one TOSCA/Requirement,

  // YAML virtual_binding: {'capability': 'tosca.capabilities.nfv.VirtualBindable', 'relationship': 'tosca.relationships.nfv.VirtualBindsTo', 'occurrences': [0, 1]}
  requirement_virtual_binding: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some property_bitrate_requirement implies property_bitrate_requirement.greater_or_equal[0]
  some property_order implies property_order.greater_or_equal[0]
  property_vnic_type.valid_values["normal" + "macvtap" + "direct" + "baremetal" + "virtio-forwarder" + "direct-physical" + "smart-nic" + "bridge" + "ipvlan" + "loopback" + "macvlan" + "ptp" + "vlan" + "host-device"]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML trunk_binding: {'type': 'tosca.capabilities.nfv.TrunkBindable', 'occurrences': [0, 'UNBOUNDED']}
  capability_trunk_binding.name["trunk_binding"]
  capability[capability_trunk_binding]
  // YAML occurrences: [0, 'UNBOUNDED']

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

  // YAML virtual_binding: {'capability': 'tosca.capabilities.nfv.VirtualBindable', 'relationship': 'tosca.relationships.nfv.VirtualBindsTo', 'occurrences': [0, 1]}
  requirement["virtual_binding", requirement_virtual_binding]
  requirement_virtual_binding.capability[tosca_capabilities_nfv_VirtualBindable]
  requirement_virtual_binding.relationship[tosca_relationships_nfv_VirtualBindsTo]

}

/** There exists some tosca.nodes.nfv.VduCp */
run Show_tosca_nodes_nfv_VduCp {
  tosca_nodes_nfv_VduCp.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 2 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 2 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VduCp
  expect 1

//
// Describes the information about an internal VNF VL
//
sig tosca_nodes_nfv_VnfVirtualLink extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML connectivity_type: {'type': 'tosca.datatypes.nfv.ConnectivityType', 'description': 'Specifies the protocol exposed by the VL and the flow pattern supported by the VL', 'required': True}
  //
  // Specifies the protocol exposed by the VL and the flow pattern supported by the VL
  //
  property_connectivity_type: one tosca_datatypes_nfv_ConnectivityType,

  // YAML description: {'type': 'string', 'description': 'Provides human-readable information on the purpose of the VL', 'required': False}
  //
  // Provides human-readable information on the purpose of the VL
  //
  property_description: lone string,

  // YAML test_access: {'type': 'list', 'description': 'Test access facilities available on the VL', 'required': False, 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['passive_monitoring', 'active_loopback']}]}}
  //
  // Test access facilities available on the VL
  //
  property_test_access: seq string,

  // YAML vl_profile: {'type': 'tosca.datatypes.nfv.VlProfile', 'description': 'Defines additional data for the VL', 'required': True}
  //
  // Defines additional data for the VL
  //
  property_vl_profile: one tosca_datatypes_nfv_VlProfile,

  // YAML monitoring_parameters: {'type': 'map', 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualLinkMonitoringParameter'}, 'description': 'Describes monitoring parameters applicable to the VL', 'required': False}
  //
  // Describes monitoring parameters applicable to the VL
  //
  property_monitoring_parameters: lone TOSCA/map_data/Map,

  // YAML nfvi_maintenance_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the rules to be observed when an instance based on this VnfVirtualLink is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the rules to be observed when an instance based on this VnfVirtualLink is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  property_nfvi_maintenance_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

  // YAML externally_managed: {'type': 'string', 'description': 'Specifies the intent of the VNF designer w.r.t. the external management of the internal VL instances created from this descriptor, i.e. whether it is "allowed" or "required" that these are externally managed. If this property is absent, the value "allowed" is assumed. If the VNFD does not reference any LCM script and if the "vnfm_info" property in the VNF-specific node type derived from the tosca.nodes.nfv.VNF node type indicates that the VNF can be managed by any ETSI NFV compliant VNFM, this property shall not be present.', 'required': False, 'constraints': [{'valid_values': ['allowed', 'required']}]}
  //
  // Specifies the intent of the VNF designer w.r.t. the external management of the internal VL instances created from this descriptor, i.e. whether it is "allowed" or "required" that these are externally managed. If this property is absent, the value "allowed" is assumed. If the VNFD does not reference any LCM script and if the "vnfm_info" property in the VNF-specific node type derived from the tosca.nodes.nfv.VNF node type indicates that the VNF can be managed by any ETSI NFV compliant VNFM, this property shall not be present.
  //
  property_externally_managed: lone string,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable: some tosca_capabilities_nfv_VirtualLinkable,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_test_access.elems.valid_values["passive_monitoring" + "active_loopback"]
  property_externally_managed.valid_values["allowed" + "required"]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable.name["virtual_linkable"]
  capability[capability_virtual_linkable]

}

/** There exists some tosca.nodes.nfv.VnfVirtualLink */
run Show_tosca_nodes_nfv_VnfVirtualLink {
  tosca_nodes_nfv_VnfVirtualLink.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VnfVirtualLink
  expect 1

//
// Describes a connection point to allocate one or a set of virtual IP addresses
//
sig tosca_nodes_nfv_VipCp extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML dedicated_ip_address: {'type': 'boolean', 'description': 'Indicates whether the VIP address shall be different from the addresses allocated to all associated VduCp instances or shall be the same as one of them.', 'required': True, 'default': True}
  //
  // Indicates whether the VIP address shall be different from the addresses allocated to all associated VduCp instances or shall be the same as one of them.
  //
  property_dedicated_ip_address: one boolean,

  // YAML vip_function: {'type': 'string', 'description': 'Indicates the function the virtual IP address is used for: high availability or load balancing. When used for high availability, only one of the internal VDU CP instances or VNF external CP instances that share the virtual IP is bound to the VIP address at a time. When used for load balancing purposes all CP instances that share the virtual IP are bound to it.', 'required': True, 'constraints': [{'valid_values': ['high_availability', 'load_balance']}]}
  //
  // Indicates the function the virtual IP address is used for: high availability or load balancing. When used for high availability, only one of the internal VDU CP instances or VNF external CP instances that share the virtual IP is bound to the VIP address at a time. When used for load balancing purposes all CP instances that share the virtual IP are bound to it.
  //
  property_vip_function: one string,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML target: {'capability': 'tosca.capabilities.Node', 'node': 'tosca.nodes.nfv.VduCp', 'relationship': 'tosca.relationships.DependsOn', 'occurrences': [1, 'UNBOUNDED']}
  requirement_target: some TOSCA/Requirement,

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VipVirtualLinksTo', 'occurrences': [1, 1]}
  requirement_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_vip_function.valid_values["high_availability" + "load_balance"]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML target: {'capability': 'tosca.capabilities.Node', 'node': 'tosca.nodes.nfv.VduCp', 'relationship': 'tosca.relationships.DependsOn', 'occurrences': [1, 'UNBOUNDED']}
  requirement["target", requirement_target]
  requirement_target.capability[tosca_capabilities_Node]
  requirement_target.relationship[tosca_relationships_DependsOn]
  requirement_target.node[tosca_nodes_nfv_VduCp]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_target >= 1

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VipVirtualLinksTo', 'occurrences': [1, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VipVirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.VipCp */
run Show_tosca_nodes_nfv_VipCp {
  tosca_nodes_nfv_VipCp.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 2 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 2 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VipCp
  expect 1

//
// describes network connectivity between a VNFC instance based on this VDU and an internal VL through a trunk port
//
sig tosca_nodes_nfv_VduSubCp extends tosca_nodes_nfv_VduCp
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML segmentation_type: {'type': 'string', 'description': 'Specifies the encapsulation type for the traffics coming in and out of the trunk subport.', 'required': False, 'constraints': [{'valid_values': ['vlan', 'inherit']}]}
  //
  // Specifies the encapsulation type for the traffics coming in and out of the trunk subport.
  //
  property_segmentation_type: lone string,

  // YAML segmentation_id: {'type': 'integer', 'description': 'Specifies the segmentation ID for the subport, which is used to differentiate the traffics on different networks coming in and out of the trunk port.', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Specifies the segmentation ID for the subport, which is used to differentiate the traffics on different networks coming in and out of the trunk port.
  //
  property_segmentation_id: lone integer,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML trunk_binding: {'capability': 'tosca.capabilities.nfv.TrunkBindable', 'relationship': 'tosca.relationships.nfv.TrunkBindsTo', 'node': 'tosca.nodes.nfv.VduCp', 'occurrences': [1, 1]}
  requirement_trunk_binding: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_segmentation_type.valid_values["vlan" + "inherit"]
  some property_segmentation_id implies property_segmentation_id.greater_or_equal[0]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML trunk_binding: {'capability': 'tosca.capabilities.nfv.TrunkBindable', 'relationship': 'tosca.relationships.nfv.TrunkBindsTo', 'node': 'tosca.nodes.nfv.VduCp', 'occurrences': [1, 1]}
  requirement["trunk_binding", requirement_trunk_binding]
  requirement_trunk_binding.capability[tosca_capabilities_nfv_TrunkBindable]
  requirement_trunk_binding.relationship[tosca_relationships_nfv_TrunkBindsTo]
  requirement_trunk_binding.node[tosca_nodes_nfv_VduCp]

}

/** There exists some tosca.nodes.nfv.VduSubCp */
run Show_tosca_nodes_nfv_VduSubCp {
  tosca_nodes_nfv_VduSubCp.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 3 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VduSubCp
  expect 1

//
// Describes the resources of a single OS container within a VDU
//
sig tosca_nodes_nfv_Vdu_OsContainer extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the OS container', 'required': True}
  //
  // Human readable name of the OS container
  //
  property_name: one string,

  // YAML description: {'type': 'string', 'description': 'Human readable description of the OS container', 'required': True}
  //
  // Human readable description of the OS container
  //
  property_description: one string,

  // YAML requested_cpu_resources: {'type': 'integer', 'description': 'Number of CPU resources requested for the OS container in milli-CPU.', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Number of CPU resources requested for the OS container in milli-CPU.
  //
  property_requested_cpu_resources: lone integer,

  // YAML cpu_resource_limit: {'type': 'integer', 'description': 'Number of CPU resources the OS container can maximally use in milli-CPU.', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Number of CPU resources the OS container can maximally use in milli-CPU.
  //
  property_cpu_resource_limit: lone integer,

  // YAML requested_memory_resources: {'type': 'scalar-unit.size', 'description': 'Amount of memory resources requested for the OS container (e.g. in MB).', 'required': False}
  //
  // Amount of memory resources requested for the OS container (e.g. in MB).
  //
  property_requested_memory_resources: lone scalar_unit_size,

  // YAML memory_resource_limit: {'type': 'scalar-unit.size', 'description': 'Amount of memory resources the OS container can maximum use (e.g. in MB).', 'required': False}
  //
  // Amount of memory resources the OS container can maximum use (e.g. in MB).
  //
  property_memory_resource_limit: lone scalar_unit_size,

  // YAML requested_ephemeral_storage_resources: {'type': 'scalar-unit.size', 'description': 'Size of ephemeral storage resources requested for the OS container (e.g. in GB).', 'required': False}
  //
  // Size of ephemeral storage resources requested for the OS container (e.g. in GB).
  //
  property_requested_ephemeral_storage_resources: lone scalar_unit_size,

  // YAML ephemeral_storage_resource_limit: {'type': 'scalar-unit.size', 'description': 'Size of ephemeral storage resources the OS container can maximum use (e.g. in GB).', 'required': False}
  //
  // Size of ephemeral storage resources the OS container can maximum use (e.g. in GB).
  //
  property_ephemeral_storage_resource_limit: lone scalar_unit_size,

  // YAML extended_resource_requests: {'type': 'list', 'description': 'Extended resources and their respective amount required by the container.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ExtendedResourceData'}, 'constraints': [{'min_length': 1}]}
  //
  // Extended resources and their respective amount required by the container.
  //
  property_extended_resource_requests: seq tosca_datatypes_nfv_ExtendedResourceData,

  // YAML huge_pages_resources: {'type': 'list', 'description': 'The requirement for huge pages resources. Each element in the list indicates a hugepage size and the total memory requested for hugepages of that size.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.Hugepages'}}
  //
  // The requirement for huge pages resources. Each element in the list indicates a hugepage size and the total memory requested for hugepages of that size.
  //
  property_huge_pages_resources: seq tosca_datatypes_nfv_Hugepages,

  // YAML cpu_pinning_requirements: {'type': 'tosca.datatypes.nfv.VirtualCpuPinning', 'description': 'Requirements for CPU pinning configuration.', 'required': False}
  //
  // Requirements for CPU pinning configuration.
  //
  property_cpu_pinning_requirements: lone tosca_datatypes_nfv_VirtualCpuPinning,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML container_deployable: {'type': 'tosca.capabilities.nfv.ContainerDeployable', 'occurrences': [1, 'UNBOUNDED']}
  capability_container_deployable: some tosca_capabilities_nfv_ContainerDeployable,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some property_requested_cpu_resources implies property_requested_cpu_resources.greater_or_equal[0]
  some property_cpu_resource_limit implies property_cpu_resource_limit.greater_or_equal[0]
  some property_extended_resource_requests implies property_extended_resource_requests.min_length[1]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML container_deployable: {'type': 'tosca.capabilities.nfv.ContainerDeployable', 'occurrences': [1, 'UNBOUNDED']}
  capability_container_deployable.name["container_deployable"]
  capability[capability_container_deployable]
  // YAML occurrences: [1, 'UNBOUNDED']

}

/** There exists some tosca.nodes.nfv.Vdu.OsContainer */
run Show_tosca_nodes_nfv_Vdu_OsContainer {
  tosca_nodes_nfv_Vdu_OsContainer.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Vdu_OsContainer
  expect 1

//
// Describes the aggregate of container of a VDU (when realized as OS containers) which supporting the description of the deployment and operational behavior of a VNFC
//
sig tosca_nodes_nfv_Vdu_OsContainerDeployableUnit extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the VDU', 'required': True}
  //
  // Human readable name of the VDU
  //
  property_name: one string,

  // YAML description: {'type': 'string', 'description': 'Human readable description of the VDU', 'required': True}
  //
  // Human readable description of the VDU
  //
  property_description: one string,

  // YAML logical_node: {'type': 'map', 'description': 'Describes the Logical Node requirements', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.LogicalNodeData'}}
  //
  // Describes the Logical Node requirements
  //
  property_logical_node: lone TOSCA/map_data/Map,

  // YAML requested_additional_capabilities: {'type': 'map', 'description': 'Describes additional capability for a particular OS container', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.RequestedAdditionalCapability'}}
  //
  // Describes additional capability for a particular OS container
  //
  property_requested_additional_capabilities: lone TOSCA/map_data/Map,

  // YAML nfvi_constraints: {'type': 'map', 'description': 'Describes constraints on the NFVI for the VNFC instance(s) created from this VDU. This property is reserved for future use in the present document.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Describes constraints on the NFVI for the VNFC instance(s) created from this VDU. This property is reserved for future use in the present document.
  //
  property_nfvi_constraints: lone TOSCA/map_string/Map,

  // YAML configurable_properties: {'type': 'tosca.datatypes.nfv.VnfcConfigurableProperties', 'required': False}
  property_configurable_properties: lone tosca_datatypes_nfv_VnfcConfigurableProperties,

  // YAML vdu_profile: {'type': 'tosca.datatypes.nfv.VduProfile', 'description': 'Defines additional instantiation data for the Vdu.OsContainerDeployableUnit node', 'required': True}
  //
  // Defines additional instantiation data for the Vdu.OsContainerDeployableUnit node
  //
  property_vdu_profile: one tosca_datatypes_nfv_VduProfile,

  // YAML mcio_constraint_params: {'type': 'list', 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['affinity_nfvi_pop', 'affinity_zone', 'affinity_zone_group', 'affinity_nfvi_node', 'affinity_cis_node', 'anti_affinity_nfvi_pop', 'anti_affinity_zone', 'anti_affinity_zone_group', 'anti_affinity_nfvi_node', 'anti_affinity_cis_node', 'local_affinity_nfvi_pop', 'local_affinity_zone', 'local_affinity_zoneGroup', 'local_affinity_nfvi_node', 'local_affinity_cis_node', 'local_anti_affinity_nfvi_pop', 'local_anti_affinity_zone', 'local_anti_affinity_zone_group', 'local_anti_affinity_nfvi_node', 'local_anti_affinity_cis_node', 'node_additional_capability_ssd', 'node_additional_capability_dpdk', 'node_additional_capability_sriov', 'node_additional_capability_gpu', 'node_additional_capability_fpga', 'node_additional_capability_cpu_pin', 'node_capability_logical_numa', 'node_pool']}]}, 'description': 'Defines the parameter names for constraints expected to be assigned to MCIOs realizing this Vdu.OsContainerDeployableUnit. The value specifies the standardized semantical context of the MCIO constraints.', 'required': False}
  //
  // Defines the parameter names for constraints expected to be assigned to MCIOs realizing this Vdu.OsContainerDeployableUnit. The value specifies the standardized semantical context of the MCIO constraints.
  //
  property_mcio_constraint_params: seq string,

  // YAML mcio_identification_data: {'type': 'tosca.datatypes.nfv.McioIdentificationData', 'description': 'Name and type of the MCIO that realizes this Vdu.OsContainerDeployableUnit. It allows the VNFM to identify the MCIO e.g. when querying the CISM.'}
  //
  // Name and type of the MCIO that realizes this Vdu.OsContainerDeployableUnit. It allows the VNFM to identify the MCIO e.g. when querying the CISM.
  //
  property_mcio_identification_data: one tosca_datatypes_nfv_McioIdentificationData,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_binding: {'type': 'tosca.capabilities.nfv.VirtualBindable', 'occurrences': [0, 'UNBOUNDED']}
  capability_virtual_binding: set tosca_capabilities_nfv_VirtualBindable,

  // YAML associable: {'type': 'tosca.capabilities.nfv.AssociableVdu', 'occurrences': [1, 1]}
  capability_associable: one tosca_capabilities_nfv_AssociableVdu,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_storage: {'capability': 'tosca.capabilities.nfv.VirtualStorage', 'relationship': 'tosca.relationships.nfv.AttachesTo', 'occurrences': [0, 'UNBOUNDED']}
  requirement_virtual_storage: set TOSCA/Requirement,

  // YAML container: {'capability': 'tosca.capabilities.nfv.ContainerDeployable', 'relationship': 'tosca.relationships.nfv.DeploysTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement_container: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_mcio_constraint_params.elems.valid_values["affinity_nfvi_pop" + "affinity_zone" + "affinity_zone_group" + "affinity_nfvi_node" + "affinity_cis_node" + "anti_affinity_nfvi_pop" + "anti_affinity_zone" + "anti_affinity_zone_group" + "anti_affinity_nfvi_node" + "anti_affinity_cis_node" + "local_affinity_nfvi_pop" + "local_affinity_zone" + "local_affinity_zoneGroup" + "local_affinity_nfvi_node" + "local_affinity_cis_node" + "local_anti_affinity_nfvi_pop" + "local_anti_affinity_zone" + "local_anti_affinity_zone_group" + "local_anti_affinity_nfvi_node" + "local_anti_affinity_cis_node" + "node_additional_capability_ssd" + "node_additional_capability_dpdk" + "node_additional_capability_sriov" + "node_additional_capability_gpu" + "node_additional_capability_fpga" + "node_additional_capability_cpu_pin" + "node_capability_logical_numa" + "node_pool"]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_binding: {'type': 'tosca.capabilities.nfv.VirtualBindable', 'occurrences': [0, 'UNBOUNDED']}
  capability_virtual_binding.name["virtual_binding"]
  capability[capability_virtual_binding]
  // YAML occurrences: [0, 'UNBOUNDED']

  // YAML associable: {'type': 'tosca.capabilities.nfv.AssociableVdu', 'occurrences': [1, 1]}
  capability_associable.name["associable"]
  capability[capability_associable]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_storage: {'capability': 'tosca.capabilities.nfv.VirtualStorage', 'relationship': 'tosca.relationships.nfv.AttachesTo', 'occurrences': [0, 'UNBOUNDED']}
  requirement["virtual_storage", requirement_virtual_storage]
  requirement_virtual_storage.capability[tosca_capabilities_nfv_VirtualStorage]
  requirement_virtual_storage.relationship[tosca_relationships_nfv_AttachesTo]
  // YAML occurrences: [0, 'UNBOUNDED']

  // YAML container: {'capability': 'tosca.capabilities.nfv.ContainerDeployable', 'relationship': 'tosca.relationships.nfv.DeploysTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement["container", requirement_container]
  requirement_container.capability[tosca_capabilities_nfv_ContainerDeployable]
  requirement_container.relationship[tosca_relationships_nfv_DeploysTo]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_container >= 1

}

/** There exists some tosca.nodes.nfv.Vdu.OsContainerDeployableUnit */
run Show_tosca_nodes_nfv_Vdu_OsContainerDeployableUnit {
  tosca_nodes_nfv_Vdu_OsContainerDeployableUnit.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Vdu_OsContainerDeployableUnit
  expect 1

//
// Representation of the object described by the mciop artifact, capable of being profiled by the properties of the MciopProfile information element defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_nodes_nfv_Mciop extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML associatedVdu: {'capability': 'tosca.capabilities.nfv.AssociableVdu', 'relationship': 'tosca.relationships.nfv.MciopAssociates', 'node': 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit', 'occurrences': [1, 'UNBOUNDED']}
  requirement_associatedVdu: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML associatedVdu: {'capability': 'tosca.capabilities.nfv.AssociableVdu', 'relationship': 'tosca.relationships.nfv.MciopAssociates', 'node': 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit', 'occurrences': [1, 'UNBOUNDED']}
  requirement["associatedVdu", requirement_associatedVdu]
  requirement_associatedVdu.capability[tosca_capabilities_nfv_AssociableVdu]
  requirement_associatedVdu.relationship[tosca_relationships_nfv_MciopAssociates]
  requirement_associatedVdu.node[tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_associatedVdu >= 1

}

/** There exists some tosca.nodes.nfv.Mciop */
run Show_tosca_nodes_nfv_Mciop {
  tosca_nodes_nfv_Mciop.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Mciop
  expect 1

//
// Describes a virtual connection point allowing access to a number of VNFC instances (based on their respective VDUs).
//
sig tosca_nodes_nfv_VirtualCp extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML additionalServiceData: {'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.AdditionalServiceData'}, 'description': 'Additional service identification data of the VirtualCp exposed to NFV-MANO', 'required': False}
  //
  // Additional service identification data of the VirtualCp exposed to NFV-MANO
  //
  property_additionalServiceData: seq tosca_datatypes_nfv_AdditionalServiceData,

  // YAML address_pool_name_configurable: {'type': 'boolean', 'description': 'Indicates whether the corresponding MCIO supports configuration of an address pool name.', 'required': True, 'default': False}
  //
  // Indicates whether the corresponding MCIO supports configuration of an address pool name.
  //
  property_address_pool_name_configurable: one boolean,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML target: {'capability': 'tosca.capabilities.Node', 'relationship': 'tosca.relationships.DependsOn', 'node': 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit', 'occurrences': [1, 'UNBOUNDED']}
  requirement_target: some TOSCA/Requirement,

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_virtual_link: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML target: {'capability': 'tosca.capabilities.Node', 'relationship': 'tosca.relationships.DependsOn', 'node': 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit', 'occurrences': [1, 'UNBOUNDED']}
  requirement["target", requirement_target]
  requirement_target.capability[tosca_capabilities_Node]
  requirement_target.relationship[tosca_relationships_DependsOn]
  requirement_target.node[tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_target >= 1

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.VirtualCp */
run Show_tosca_nodes_nfv_VirtualCp {
  tosca_nodes_nfv_VirtualCp.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_VirtualCp
  expect 1

// --------------------------------------------------
// Group Types
// --------------------------------------------------

//
// PlacementGroup is used for describing the affinity or anti-affinity relationship applicable between the virtualization containers to be created based on different VDUs, or between internal VLs to be created based on different VnfVirtualLinkDesc(s) or between the workloads being deployed based on different Mciops
//
sig tosca_groups_nfv_PlacementGroup extends tosca_groups_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the group', 'required': True}
  //
  // Human readable description of the group
  //
  property_description: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  members_type[tosca_nodes_nfv_Vdu_Compute + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit + tosca_nodes_nfv_VnfVirtualLink + tosca_nodes_nfv_Mciop]
}

/** There exists some tosca.groups.nfv.PlacementGroup */
run Show_tosca_groups_nfv_PlacementGroup {
  tosca_groups_nfv_PlacementGroup.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_groups_nfv_PlacementGroup
  expect 1

// --------------------------------------------------
// Policy Types
// --------------------------------------------------

//
// The InstantiationLevels type is a policy type representing all the instantiation levels of resources to be instantiated within a deployment flavour and including default instantiation level in term of the number of VNFC instances to be created as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_InstantiationLevels extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML levels: {'type': 'map', 'description': 'Describes the various levels of resources that can be used to instantiate the VNF using this flavour.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.InstantiationLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the various levels of resources that can be used to instantiate the VNF using this flavour.
  //
  property_levels: one TOSCA/map_data/Map,

  // YAML default_level: {'type': 'string', 'description': 'The default instantiation level for this flavour.', 'required': False}
  //
  // The default instantiation level for this flavour.
  //
  property_default_level: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_levels.min_length[1]

}

/** There exists some tosca.policies.nfv.InstantiationLevels */
run Show_tosca_policies_nfv_InstantiationLevels {
  tosca_policies_nfv_InstantiationLevels.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_InstantiationLevels
  expect 1

//
// The VduInstantiationLevels type is a policy type representing all the instantiation levels of resources to be instantiated within a deployment flavour in term of the number of VNFC instances to be created from each vdu.Compute. as defined in ETSI GS NFV-IFA 011 [1]
//
sig tosca_policies_nfv_VduInstantiationLevels extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML levels: {'type': 'map', 'description': 'Describes the Vdu.Compute levels of resources that can be used to instantiate the VNF using this flavour', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VduLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the Vdu.Compute levels of resources that can be used to instantiate the VNF using this flavour
  //
  property_levels: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_levels.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.Vdu.Compute', 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit']
  targets_type[tosca_nodes_nfv_Vdu_Compute + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
}

/** There exists some tosca.policies.nfv.VduInstantiationLevels */
run Show_tosca_policies_nfv_VduInstantiationLevels {
  tosca_policies_nfv_VduInstantiationLevels.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VduInstantiationLevels
  expect 1

//
// The VirtualLinkInstantiationLevels type is a policy type representing all the instantiation levels of virtual link resources to be instantiated within a deployment flavour as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_VirtualLinkInstantiationLevels extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML levels: {'type': 'map', 'description': 'Describes the virtual link levels of resources that can be used to instantiate the VNF using this flavour.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualLinkBitrateLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the virtual link levels of resources that can be used to instantiate the VNF using this flavour.
  //
  property_levels: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_levels.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.VnfVirtualLink']
  targets_type[tosca_nodes_nfv_VnfVirtualLink]
}

/** There exists some tosca.policies.nfv.VirtualLinkInstantiationLevels */
run Show_tosca_policies_nfv_VirtualLinkInstantiationLevels {
  tosca_policies_nfv_VirtualLinkInstantiationLevels.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VirtualLinkInstantiationLevels
  expect 1

//
// The ScalingAspects type is a policy type representing the scaling aspects used for horizontal scaling as defined in ETSI GS NFV-IFA 011 [1]
//
sig tosca_policies_nfv_ScalingAspects extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspects: {'type': 'map', 'description': 'Describe maximum scale level for total number of scaling steps that can be applied to a particular aspect', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScalingAspect'}, 'constraints': [{'min_length': 1}]}
  //
  // Describe maximum scale level for total number of scaling steps that can be applied to a particular aspect
  //
  property_aspects: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_aspects.min_length[1]

}

/** There exists some tosca.policies.nfv.ScalingAspects */
run Show_tosca_policies_nfv_ScalingAspects {
  tosca_policies_nfv_ScalingAspects.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_ScalingAspects
  expect 1

//
// The VduScalingAspectDeltas type is a policy type representing the Vdu.Compute detail of an aspect deltas used for horizontal scaling, as defined in ETSI GS NFV-IFA 011 [1]
//
sig tosca_policies_nfv_VduScalingAspectDeltas extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspect: {'type': 'string', 'description': 'Represents the scaling aspect to which this policy applies', 'required': True}
  //
  // Represents the scaling aspect to which this policy applies
  //
  property_aspect: one string,

  // YAML deltas: {'type': 'map', 'description': 'Describes the Vdu.Compute scaling deltas to be applied for every scaling steps of a particular aspect.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VduLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the Vdu.Compute scaling deltas to be applied for every scaling steps of a particular aspect.
  //
  property_deltas: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_deltas.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.Vdu.Compute', 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit']
  targets_type[tosca_nodes_nfv_Vdu_Compute + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
}

/** There exists some tosca.policies.nfv.VduScalingAspectDeltas */
run Show_tosca_policies_nfv_VduScalingAspectDeltas {
  tosca_policies_nfv_VduScalingAspectDeltas.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VduScalingAspectDeltas
  expect 1

//
// The VirtualLinkBitrateScalingAspectDeltas type is a policy type representing the VnfVirtualLink detail of an aspect deltas used for horizontal scaling, as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspect: {'type': 'string', 'description': 'Represents the scaling aspect to which this policy applies.', 'required': True}
  //
  // Represents the scaling aspect to which this policy applies.
  //
  property_aspect: one string,

  // YAML deltas: {'type': 'map', 'description': 'Describes the VnfVirtualLink scaling deltas to be applied for every scaling steps of a particular aspect.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VirtualLinkBitrateLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the VnfVirtualLink scaling deltas to be applied for every scaling steps of a particular aspect.
  //
  property_deltas: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_deltas.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.VnfVirtualLink']
  targets_type[tosca_nodes_nfv_VnfVirtualLink]
}

/** There exists some tosca.policies.nfv.VirtualLinkBitrateScalingAspectDeltas */
run Show_tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas {
  tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas
  expect 1

//
// The VduInitialDelta type is a policy type representing the Vdu.Compute detail of an initial delta used for horizontal scaling, as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_VduInitialDelta extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML initial_delta: {'type': 'tosca.datatypes.nfv.VduLevel', 'description': 'Represents the initial minimum size of the VNF.', 'required': True}
  //
  // Represents the initial minimum size of the VNF.
  //
  property_initial_delta: one tosca_datatypes_nfv_VduLevel,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // YAML targets: ['tosca.nodes.nfv.Vdu.Compute', 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit']
  targets_type[tosca_nodes_nfv_Vdu_Compute + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
}

/** There exists some tosca.policies.nfv.VduInitialDelta */
run Show_tosca_policies_nfv_VduInitialDelta {
  tosca_policies_nfv_VduInitialDelta.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VduInitialDelta
  expect 1

//
// The VirtualLinkBitrateInitialDelta type is a policy type representing the VnfVirtualLink detail of an initial deltas used for horizontal scaling, as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_VirtualLinkBitrateInitialDelta extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML initial_delta: {'type': 'tosca.datatypes.nfv.VirtualLinkBitrateLevel', 'description': 'Represents the initial minimum size of the VNF.', 'required': True}
  //
  // Represents the initial minimum size of the VNF.
  //
  property_initial_delta: one tosca_datatypes_nfv_VirtualLinkBitrateLevel,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // YAML targets: ['tosca.nodes.nfv.VnfVirtualLink']
  targets_type[tosca_nodes_nfv_VnfVirtualLink]
}

/** There exists some tosca.policies.nfv.VirtualLinkBitrateInitialDelta */
run Show_tosca_policies_nfv_VirtualLinkBitrateInitialDelta {
  tosca_policies_nfv_VirtualLinkBitrateInitialDelta.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VirtualLinkBitrateInitialDelta
  expect 1

//
// The AffinityRule describes the affinity rules applicable for the defined targets
//
sig tosca_policies_nfv_AffinityRule extends tosca_policies_Placement
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scope: {'type': 'string', 'description': 'scope of the rule is an NFVI_node, an NFVI_PoP, etc.', 'required': True, 'constraints': [{'valid_values': ['nfvi_node', 'zone', 'zone_group', 'nfvi_pop', 'network_link_and_node', 'container_namespace', 'cis_node']}]}
  //
  // scope of the rule is an NFVI_node, an NFVI_PoP, etc.
  //
  property_scope: one string,

  // YAML nfvi_maintenance_group_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the impact tolerance and rules to be observed when a group of instances based on the same Vdu.Compute (for VM based VDU) node is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the impact tolerance and rules to be observed when a group of instances based on the same Vdu.Compute (for VM based VDU) node is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  property_nfvi_maintenance_group_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_scope.valid_values["nfvi_node" + "zone" + "zone_group" + "nfvi_pop" + "network_link_and_node" + "container_namespace" + "cis_node"]

  // YAML targets: ['tosca.nodes.nfv.Vdu.Compute', 'tosca.nodes.nfv.VnfVirtualLink', 'tosca.groups.nfv.PlacementGroup', 'tosca.nodes.nfv.Mciop', 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit']
  targets_type[tosca_nodes_nfv_Vdu_Compute + tosca_nodes_nfv_VnfVirtualLink + tosca_groups_nfv_PlacementGroup + tosca_nodes_nfv_Mciop + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
}

/** There exists some tosca.policies.nfv.AffinityRule */
run Show_tosca_policies_nfv_AffinityRule {
  tosca_policies_nfv_AffinityRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_AffinityRule
  expect 1

//
// The AntiAffinityRule describes the anti-affinity rules applicable for the defined targets
//
sig tosca_policies_nfv_AntiAffinityRule extends tosca_policies_Placement
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scope: {'type': 'string', 'description': 'scope of the rule is an NFVI_node, an NFVI_PoP, etc.', 'required': True, 'constraints': [{'valid_values': ['nfvi_node', 'zone', 'zone_group', 'nfvi_pop', 'network_link_and_node', 'container_namespace', 'cis_node']}]}
  //
  // scope of the rule is an NFVI_node, an NFVI_PoP, etc.
  //
  property_scope: one string,

  // YAML nfvi_maintenance_group_info: {'type': 'tosca.datatypes.nfv.NfviMaintenanceInfo', 'description': 'Provides information on the impact tolerance and rules to be observed when a group of instances based on the same Vdu.Compute node is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).', 'required': False}
  //
  // Provides information on the impact tolerance and rules to be observed when a group of instances based on the same Vdu.Compute node is impacted during NFVI operation and maintenance (e.g. NFVI resource upgrades).
  //
  property_nfvi_maintenance_group_info: lone tosca_datatypes_nfv_NfviMaintenanceInfo,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_scope.valid_values["nfvi_node" + "zone" + "zone_group" + "nfvi_pop" + "network_link_and_node" + "container_namespace" + "cis_node"]

  // YAML targets: ['tosca.nodes.nfv.Vdu.Compute', 'tosca.nodes.nfv.VnfVirtualLink', 'tosca.groups.nfv.PlacementGroup', 'tosca.nodes.nfv.Mciop', 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit']
  targets_type[tosca_nodes_nfv_Vdu_Compute + tosca_nodes_nfv_VnfVirtualLink + tosca_groups_nfv_PlacementGroup + tosca_nodes_nfv_Mciop + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
}

/** There exists some tosca.policies.nfv.AntiAffinityRule */
run Show_tosca_policies_nfv_AntiAffinityRule {
  tosca_policies_nfv_AntiAffinityRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_AntiAffinityRule
  expect 1

//
// this policy type represents interfaces produced by a VNF, the details to access them and the applicable connection points to use to access these interfaces
//
sig tosca_policies_nfv_SupportedVnfInterface extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML interface_name: {'type': 'string', 'description': 'Identifies an interface produced by the VNF.', 'required': True, 'constraints': [{'valid_values': ['vnf_indicator', 'vnf_configuration', 'vnf_lcm_coordination']}]}
  //
  // Identifies an interface produced by the VNF.
  //
  property_interface_name: one string,

  // YAML details: {'type': 'tosca.datatypes.nfv.InterfaceDetails', 'description': 'Provide additional data to access the interface endpoint', 'required': False}
  //
  // Provide additional data to access the interface endpoint
  //
  property_details: lone tosca_datatypes_nfv_InterfaceDetails,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_interface_name.valid_values["vnf_indicator" + "vnf_configuration" + "vnf_lcm_coordination"]

  // YAML targets: ['tosca.nodes.nfv.VnfExtCp', 'tosca.nodes.nfv.VduCp']
  targets_type[tosca_nodes_nfv_VnfExtCp + tosca_nodes_nfv_VduCp]
}

/** There exists some tosca.policies.nfv.SupportedVnfInterface */
run Show_tosca_policies_nfv_SupportedVnfInterface {
  tosca_policies_nfv_SupportedVnfInterface.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_SupportedVnfInterface
  expect 1

//
// The SecurityGroupRule type is a policy type specified the matching criteria for the ingress and/or egress traffic to/from visited connection points as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_SecurityGroupRule extends tosca_policies_nfv_Abstract_SecurityGroupRule
{
} {
  // YAML targets: ['tosca.nodes.nfv.VduCp', 'tosca.nodes.nfv.VnfExtCp', 'tosca.nodes.nfv.Vdu.OsContainerDeployableUnit']
  targets_type[tosca_nodes_nfv_VduCp + tosca_nodes_nfv_VnfExtCp + tosca_nodes_nfv_Vdu_OsContainerDeployableUnit]
}

/** There exists some tosca.policies.nfv.SecurityGroupRule */
run Show_tosca_policies_nfv_SecurityGroupRule {
  tosca_policies_nfv_SecurityGroupRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_SecurityGroupRule
  expect 1

//
// The VnfIndicator policy type is a base policy type for defining VNF indicator specific policies that define the conditions to assess and the action to perform when a VNF indicator changes value as defined in ETSI GS NFV-IFA 011 [1].
//
sig tosca_policies_nfv_VnfIndicator extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML source: {'type': 'string', 'description': 'Describe the source of the indicator.', 'required': True, 'constraints': [{'valid_values': ['vnf', 'em', 'both_vnf_and_em']}]}
  //
  // Describe the source of the indicator.
  //
  property_source: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_source.valid_values["vnf" + "em" + "both_vnf_and_em"]

  // YAML targets: ['tosca.nodes.nfv.VNF']
  targets_type[tosca_nodes_nfv_VNF]
}

/** There exists some tosca.policies.nfv.VnfIndicator */
run Show_tosca_policies_nfv_VnfIndicator {
  tosca_policies_nfv_VnfIndicator.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VnfIndicator
  expect 1

//
// policy type specifying the processes and rules to be used for performing the resource related tasks, to change VNF instance to a different VNF Package (destination package)
//
sig tosca_policies_nfv_VnfPackageChange extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML selector: {'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfPackageChangeSelector'}, 'description': 'Information to identify the source and destination VNFD for the change, and the related deployment flavours.', 'required': True, 'constraints': [{'min_length': 1}]}
  //
  // Information to identify the source and destination VNFD for the change, and the related deployment flavours.
  //
  property_selector: seq tosca_datatypes_nfv_VnfPackageChangeSelector,

  // YAML modification_qualifier: {'type': 'string', 'description': 'Specifies the type of modification resulting from transitioning from srcVnfdId to dstVnfdId. The possible values are UP indicating that the destination VNF version is newer than the source version, DOWN indicating that the destination VNF version is older than the source version.', 'constraints': [{'valid_values': ['up', 'down']}], 'required': True}
  //
  // Specifies the type of modification resulting from transitioning from srcVnfdId to dstVnfdId. The possible values are UP indicating that the destination VNF version is newer than the source version, DOWN indicating that the destination VNF version is older than the source version.
  //
  property_modification_qualifier: one string,

  // YAML additional_modification_description: {'type': 'string', 'description': 'Additional information to qualify further the change between the two versions.', 'required': False}
  //
  // Additional information to qualify further the change between the two versions.
  //
  property_additional_modification_description: lone string,

  // YAML component_mappings: {'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfPackageChangeComponentMapping'}, 'description': 'Mapping information related to identifiers of components in source VNFD and destination VNFD that concern to the change process.', 'required': False}
  //
  // Mapping information related to identifiers of components in source VNFD and destination VNFD that concern to the change process.
  //
  property_component_mappings: seq tosca_datatypes_nfv_VnfPackageChangeComponentMapping,

  // YAML destination_flavour_id: {'type': 'string', 'description': 'Identifies the deployment flavour in the destination VNF package for which this change applies. The flavour ID is defined in the destination VNF package.', 'required': True}
  //
  // Identifies the deployment flavour in the destination VNF package for which this change applies. The flavour ID is defined in the destination VNF package.
  //
  property_destination_flavour_id: one string,

  // YAML actions: {'type': 'list', 'description': 'List of applicable supported LCM coordination action names (action_name) specified in this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // List of applicable supported LCM coordination action names (action_name) specified in this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.
  //
  property_actions: seq string,

  // YAML referenced_coordination_actions: {'type': 'list', 'description': 'List of names of coordination actions not specified within this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // List of names of coordination actions not specified within this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.
  //
  property_referenced_coordination_actions: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_selector.min_length[1]
  property_modification_qualifier.valid_values["up" + "down"]

  // YAML targets: ['tosca.nodes.nfv.VNF']
  targets_type[tosca_nodes_nfv_VNF]
}

/** There exists some tosca.policies.nfv.VnfPackageChange */
run Show_tosca_policies_nfv_VnfPackageChange {
  tosca_policies_nfv_VnfPackageChange.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VnfPackageChange
  expect 1

//
// The LcmCoordinationAction type is a policy type representing the LCM coordination actions supported by a VNF and/or expected to be supported by its EM for a particular VNF LCM operation. This policy concerns the whole VNF (deployment flavour) represented by the topology_template and thus has no explicit target list.
//
sig tosca_policies_nfv_LcmCoordinationAction extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML action_name: {'type': 'string', 'description': 'Coordination action name.', 'required': True}
  //
  // Coordination action name.
  //
  property_action_name: one string,

  // YAML action: {'type': 'tosca.datatypes.nfv.VnfLcmOpCoord', 'description': 'Describes a set of information needed for coordination action in the VNF LCM operation.', 'required': True}
  //
  // Describes a set of information needed for coordination action in the VNF LCM operation.
  //
  property_action: one tosca_datatypes_nfv_VnfLcmOpCoord,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.policies.nfv.LcmCoordinationAction */
run Show_tosca_policies_nfv_LcmCoordinationAction {
  tosca_policies_nfv_LcmCoordinationAction.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_LcmCoordinationAction
  expect 1

//
// The LcmCoordinationsForLcmOperation type is a policy type representing supported LCM coordination actions associated to a VNF LCM operation. This policy concerns the whole VNF (deployment flavour) represented by the topology_template and thus has no explicit target list.
//
sig tosca_policies_nfv_LcmCoordinationsForLcmOperation extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vnf_lcm_operation: {'type': 'string', 'description': 'The VNF LCM operation the LCM coordination actions are associated with.', 'required': True, 'constraints': [{'valid_values': ['instantiate', 'scale', 'scale_to_level', 'change_flavour', 'terminate', 'heal', 'operate', 'change_ext_conn', 'modify_info', 'create_snapshot', 'revert_to_snapshot']}]}
  //
  // The VNF LCM operation the LCM coordination actions are associated with.
  //
  property_vnf_lcm_operation: one string,

  // YAML actions: {'type': 'list', 'description': 'List of applicable supported LCM coordination action names (action_name) specified in this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // List of applicable supported LCM coordination action names (action_name) specified in this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.
  //
  property_actions: seq string,

  // YAML referenced_coordination_actions: {'type': 'list', 'description': 'List of names of coordination actions not specified within this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // List of names of coordination actions not specified within this VNFD as a TOSCA policy of a type derived from tosca.policies.nfv.LcmCoordinationAction.
  //
  property_referenced_coordination_actions: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_vnf_lcm_operation.valid_values["instantiate" + "scale" + "scale_to_level" + "change_flavour" + "terminate" + "heal" + "operate" + "change_ext_conn" + "modify_info" + "create_snapshot" + "revert_to_snapshot"]

}

/** There exists some tosca.policies.nfv.LcmCoordinationsForLcmOperation */
run Show_tosca_policies_nfv_LcmCoordinationsForLcmOperation {
  tosca_policies_nfv_LcmCoordinationsForLcmOperation.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_LcmCoordinationsForLcmOperation
  expect 1

//
// The VipCpScalingAspectDeltas type is a policy type representing the VipCp detail of an aspect deltas used for horizontal scaling, as defined in ETSI GS NFV-IFA 011 [1]
//
sig tosca_policies_nfv_VipCpScalingAspectDeltas extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspect: {'type': 'string', 'description': 'Represents the scaling aspect to which this policy applies', 'required': True}
  //
  // Represents the scaling aspect to which this policy applies
  //
  property_aspect: one string,

  // YAML deltas: {'type': 'map', 'description': 'Describes the VipCp scaling deltas to be applied for every scaling steps of a particular aspect.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VipCpLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the VipCp scaling deltas to be applied for every scaling steps of a particular aspect.
  //
  property_deltas: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_deltas.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.VipCp']
  targets_type[tosca_nodes_nfv_VipCp]
}

/** There exists some tosca.policies.nfv.VipCpScalingAspectDeltas */
run Show_tosca_policies_nfv_VipCpScalingAspectDeltas {
  tosca_policies_nfv_VipCpScalingAspectDeltas.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VipCpScalingAspectDeltas
  expect 1

//
// The VipCpInitialDelta type is a policy type representing the VipCp detail of an initial delta used for horizontal scaling, as defined in ETSI GS NFV-IFA 011 [1]
//
sig tosca_policies_nfv_VipCpInitialDelta extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML initial_delta: {'type': 'tosca.datatypes.nfv.VipCpLevel', 'description': 'Represents the initial minimum size of the VNF.', 'required': True}
  //
  // Represents the initial minimum size of the VNF.
  //
  property_initial_delta: one tosca_datatypes_nfv_VipCpLevel,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // YAML targets: ['tosca.nodes.nfv.VipCp']
  targets_type[tosca_nodes_nfv_VipCp]
}

/** There exists some tosca.policies.nfv.VipCpInitialDelta */
run Show_tosca_policies_nfv_VipCpInitialDelta {
  tosca_policies_nfv_VipCpInitialDelta.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VipCpInitialDelta
  expect 1

//
// The VipCpInstantiationLevels type is a policy type representing all the instantiation levels of resources to be instantiated within a deployment flavour in term of the number of VipCp instances to be created from each VipCp as defined in ETSI GS NFV-IFA 011.
//
sig tosca_policies_nfv_VipCpInstantiationLevels extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML levels: {'type': 'map', 'description': 'Describes the VipCp levels of resources that can be used to instantiate the VNF using this flavour', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VipCpLevel'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the VipCp levels of resources that can be used to instantiate the VNF using this flavour
  //
  property_levels: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_levels.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.VipCp']
  targets_type[tosca_nodes_nfv_VipCp]
}

/** There exists some tosca.policies.nfv.VipCpInstantiationLevels */
run Show_tosca_policies_nfv_VipCpInstantiationLevels {
  tosca_policies_nfv_VipCpInstantiationLevels.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VipCpInstantiationLevels
  expect 1

