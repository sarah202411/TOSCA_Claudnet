// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: ETSI NFV SOL 001 nsd types definitions version 4.4.1

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_common_types_4_4_1
open etsi_nfv_sol001_vnfd_types_4_4_1
open etsi_nfv_sol001_pnfd_types_4_4_1

// --------------------------------------------------
// Data Types
// --------------------------------------------------

//
// Describes additional instantiation data for a given NsVirtualLink used in a specific NS deployment flavour.
//
sig tosca_datatypes_nfv_NsVlProfile extends tosca_datatypes_Root
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

  // YAML qos: {'type': 'tosca.datatypes.nfv.NsVirtualLinkQos', 'description': 'Specifies the QoS requirements of a VL instantiated according to this profile.', 'required': False}
  //
  // Specifies the QoS requirements of a VL instantiated according to this profile.
  //
  qos: lone tosca_datatypes_nfv_NsVirtualLinkQos,

  // YAML service_availability_level: {'type': 'integer', 'description': 'Specifies the service availability level for the VL instance created from this profile', 'required': False, 'constraints': [{'greater_or_equal': 1}]}
  //
  // Specifies the service availability level for the VL instance created from this profile
  //
  service_availability_level: lone integer,

  // YAML virtual_link_protocol_data: {'type': 'list', 'description': 'Specifies the protocol data for a virtual link.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsVirtualLinkProtocolData'}}
  //
  // Specifies the protocol data for a virtual link.
  //
  virtual_link_protocol_data: seq tosca_datatypes_nfv_NsVirtualLinkProtocolData,

  // YAML data_flow_mirroring: {'type': 'list', 'description': 'It describes the data flow mirroring to be associated to the NS instance containing the NS VL created from this NsVlProfile..', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsDataFlowMirroring'}}
  //
  // It describes the data flow mirroring to be associated to the NS instance containing the NS VL created from this NsVlProfile..
  //
  data_flow_mirroring: seq tosca_datatypes_nfv_NsDataFlowMirroring,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some service_availability_level implies service_availability_level.greater_or_equal[1]

}

/** There exists some tosca.datatypes.nfv.NsVlProfile */
run Show_tosca_datatypes_nfv_NsVlProfile {
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
  exactly 1 tosca_datatypes_nfv_NsVlProfile
  expect 1

//
// describes QoS data for a given VL used in a VNF deployment flavour
//
sig tosca_datatypes_nfv_NsVirtualLinkQos extends tosca_datatypes_nfv_Qos
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML priority: {'type': 'integer', 'constraints': [{'greater_or_equal': 0}], 'description': 'Specifies the priority level in case of congestion on the underlying physical links', 'required': False}
  //
  // Specifies the priority level in case of congestion on the underlying physical links
  //
  priority: lone integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some priority implies priority.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.NsVirtualLinkQos */
run Show_tosca_datatypes_nfv_NsVirtualLinkQos {
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
  exactly 1 tosca_datatypes_nfv_NsVirtualLinkQos
  expect 1

//
// describes a profile for instantiating NSs of a particular NS DF according to a specific NSD and NS DF.
//
sig tosca_datatypes_nfv_NsProfile extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ns_instantiation_level: {'type': 'string', 'description': 'Identifier of the instantiation level of the NS DF to be used for instantiation. If not present, the default instantiation level as declared in the NSD shall be used.', 'required': False}
  //
  // Identifier of the instantiation level of the NS DF to be used for instantiation. If not present, the default instantiation level as declared in the NSD shall be used.
  //
  ns_instantiation_level: lone string,

  // YAML target_ns_scale_level: {'type': 'map', 'description': 'For each NS scaling aspect of the deployment flavour applicable to this NS instance, defines the target NS scale level to which the NS instance to be instantiated. If the property is present it shall contain all NS scaling aspects.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsScaleInfo'}}
  //
  // For each NS scaling aspect of the deployment flavour applicable to this NS instance, defines the target NS scale level to which the NS instance to be instantiated. If the property is present it shall contain all NS scaling aspects.
  //
  target_ns_scale_level: lone TOSCA/map_data/Map,

  // YAML min_number_of_instances: {'type': 'integer', 'description': 'Minimum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Minimum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.
  //
  min_number_of_instances: one integer,

  // YAML max_number_of_instances: {'type': 'integer', 'description': 'Maximum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Maximum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.
  //
  max_number_of_instances: one integer,

  // YAML version_dependency: {'type': 'list', 'description': 'Identifies versions of descriptors of other constituents in the NSD upon which the nested NS depends. The dependencies may be described for the NSD referenced with descriptor_id in the NS node where this profile is defined and for NSDs with the same ext_invariant_id.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VersionDependency'}}
  //
  // Identifies versions of descriptors of other constituents in the NSD upon which the nested NS depends. The dependencies may be described for the NSD referenced with descriptor_id in the NS node where this profile is defined and for NSDs with the same ext_invariant_id.
  //
  version_dependency: seq tosca_datatypes_nfv_VersionDependency,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  min_number_of_instances.greater_or_equal[0]
  max_number_of_instances.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.NsProfile */
run Show_tosca_datatypes_nfv_NsProfile {
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
  exactly 1 tosca_datatypes_nfv_NsProfile
  expect 1

sig tosca_datatypes_nfv_Mask extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML starting_point: {'description': 'Indicates the offset between the last bit of the source mac address and the first bit of the sequence of bits to be matched.', 'type': 'integer', 'constraints': [{'greater_or_equal': 1}], 'required': True}
  //
  // Indicates the offset between the last bit of the source mac address and the first bit of the sequence of bits to be matched.
  //
  starting_point: one integer,

  // YAML length: {'description': 'Indicates the number of bits to be matched.', 'type': 'integer', 'constraints': [{'greater_or_equal': 1}], 'required': True}
  //
  // Indicates the number of bits to be matched.
  //
  length: one integer,

  // YAML value: {'description': 'Provide the sequence of bit values to be matched.', 'type': 'string', 'required': True}
  //
  // Provide the sequence of bit values to be matched.
  //
  value: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  starting_point.greater_or_equal[1]
  length.greater_or_equal[1]

}

/** There exists some tosca.datatypes.nfv.Mask */
run Show_tosca_datatypes_nfv_Mask {
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
  exactly 1 tosca_datatypes_nfv_Mask
  expect 1

//
// Is an empty base type for deriving data types for describing NS-specific additional parameters to be passed when invoking NS lifecycle management operations
//
sig tosca_datatypes_nfv_NsOperationAdditionalParameters extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.NsOperationAdditionalParameters */
run Show_tosca_datatypes_nfv_NsOperationAdditionalParameters {
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
  exactly 1 tosca_datatypes_nfv_NsOperationAdditionalParameters
  expect 1

//
// Represents information on virtualised resource related performance metrics applicable to the NS.
//
sig tosca_datatypes_nfv_NsMonitoringParameter extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the monitoring parameter', 'required': True}
  //
  // Human readable name of the monitoring parameter
  //
  name: one string,

  // YAML performance_metric: {'type': 'string', 'description': 'Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.', 'required': True, 'constraints': [{'valid_values': ['byte_incoming_sap', 'byte_outgoing_sap', 'packet_incoming_sap', 'packet_outgoing_sap', 'byte_incoming', 'byte_outgoing', 'packet_incoming', 'packet_outgoing']}]}
  //
  // Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.
  //
  performance_metric: one string,

  // YAML collection_period: {'type': 'scalar-unit.time', 'description': 'Describes the periodicity at which to collect the performance information.', 'required': False}
  //
  // Describes the periodicity at which to collect the performance information.
  //
  collection_period: lone scalar_unit_time,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  performance_metric.valid_values["byte_incoming_sap" + "byte_outgoing_sap" + "packet_incoming_sap" + "packet_outgoing_sap" + "byte_incoming" + "byte_outgoing" + "packet_incoming" + "packet_outgoing"]

}

/** There exists some tosca.datatypes.nfv.NsMonitoringParameter */
run Show_tosca_datatypes_nfv_NsMonitoringParameter {
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
  exactly 1 tosca_datatypes_nfv_NsMonitoringParameter
  expect 1

//
// describes one protocol layer and associated protocol data for a given virtual link used in a specific NS deployment flavour
//
sig tosca_datatypes_nfv_NsVirtualLinkProtocolData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML associated_layer_protocol: {'type': 'string', 'description': 'Identifies one of the protocols a virtualLink gives access to (ethernet, mpls, odu2, ipv4, ipv6, pseudo-wire) as specified by the connectivity_type property.', 'required': True, 'constraints': [{'valid_values': ['ethernet', 'mpls', 'odu2', 'ipv4', 'ipv6', 'pseudo-wire']}]}
  //
  // Identifies one of the protocols a virtualLink gives access to (ethernet, mpls, odu2, ipv4, ipv6, pseudo-wire) as specified by the connectivity_type property.
  //
  associated_layer_protocol: one string,

  // YAML l2_protocol_data: {'type': 'tosca.datatypes.nfv.NsL2ProtocolData', 'description': 'Specifies the L2 protocol data for a virtual link. Shall be present when the associatedLayerProtocol attribute indicates a L2 protocol and shall be absent otherwise.', 'required': False}
  //
  // Specifies the L2 protocol data for a virtual link. Shall be present when the associatedLayerProtocol attribute indicates a L2 protocol and shall be absent otherwise.
  //
  l2_protocol_data: lone tosca_datatypes_nfv_NsL2ProtocolData,

  // YAML l3_protocol_data: {'type': 'tosca.datatypes.nfv.NsL3ProtocolData', 'description': 'Specifies the L3 protocol data for this virtual link. Shall be present when the associatedLayerProtocol attribute indicates a L3 protocol and shall be absent otherwise.', 'required': False}
  //
  // Specifies the L3 protocol data for this virtual link. Shall be present when the associatedLayerProtocol attribute indicates a L3 protocol and shall be absent otherwise.
  //
  l3_protocol_data: lone tosca_datatypes_nfv_NsL3ProtocolData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  associated_layer_protocol.valid_values["ethernet" + "mpls" + "odu2" + "ipv4" + "ipv6" + "pseudo-wire"]

}

/** There exists some tosca.datatypes.nfv.NsVirtualLinkProtocolData */
run Show_tosca_datatypes_nfv_NsVirtualLinkProtocolData {
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
  exactly 1 tosca_datatypes_nfv_NsVirtualLinkProtocolData
  expect 1

//
// describes L2 protocol data for a given virtual link used in a specific NS deployment flavour.
//
sig tosca_datatypes_nfv_NsL2ProtocolData extends tosca_datatypes_Root
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

  // YAML vlan_transparent: {'type': 'boolean', 'description': 'Specifies whether to support VLAN transparency for this L2 protocol or not.', 'required': False, 'default': False}
  //
  // Specifies whether to support VLAN transparency for this L2 protocol or not.
  //
  vlan_transparent: lone boolean,

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

/** There exists some tosca.datatypes.nfv.NsL2ProtocolData */
run Show_tosca_datatypes_nfv_NsL2ProtocolData {
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
  exactly 1 tosca_datatypes_nfv_NsL2ProtocolData
  expect 1

//
// describes L3 protocol data for a given virtual link used in a specific NS deployment flavour.
//
sig tosca_datatypes_nfv_NsL3ProtocolData extends tosca_datatypes_Root
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

  // YAML ip_allocation_pools: {'type': 'list', 'description': 'Specifies the allocation pools with start and end IP addresses for this L3 protocol. The value may be overridden at run-time.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsIpAllocationPool'}}
  //
  // Specifies the allocation pools with start and end IP addresses for this L3 protocol. The value may be overridden at run-time.
  //
  ip_allocation_pools: seq tosca_datatypes_nfv_NsIpAllocationPool,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  ip_version.valid_values["ipv4" + "ipv6"]

}

/** There exists some tosca.datatypes.nfv.NsL3ProtocolData */
run Show_tosca_datatypes_nfv_NsL3ProtocolData {
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
  exactly 1 tosca_datatypes_nfv_NsL3ProtocolData
  expect 1

//
// Specifies a range of IP addresses
//
sig tosca_datatypes_nfv_NsIpAllocationPool extends tosca_datatypes_Root
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

/** There exists some tosca.datatypes.nfv.NsIpAllocationPool */
run Show_tosca_datatypes_nfv_NsIpAllocationPool {
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
  exactly 1 tosca_datatypes_nfv_NsIpAllocationPool
  expect 1

//
// describes the details of an aspect used for horizontal scaling
//
sig tosca_datatypes_nfv_NsScalingAspect extends tosca_datatypes_Root
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

  // YAML ns_scale_levels: {'type': 'map', 'description': 'Description of the NS levels for this scaling aspect.', 'required': True, 'key_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsLevels'}}
  //
  // Description of the NS levels for this scaling aspect.
  //
  ns_scale_levels: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.NsScalingAspect */
run Show_tosca_datatypes_nfv_NsScalingAspect {
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
  exactly 1 tosca_datatypes_nfv_NsScalingAspect
  expect 1

//
// describes the Ns levels
//
sig tosca_datatypes_nfv_NsLevels extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the Ns level', 'required': True}
  //
  // Human readable description of the Ns level
  //
  description: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.NsLevels */
run Show_tosca_datatypes_nfv_NsLevels {
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
  exactly 1 tosca_datatypes_nfv_NsLevels
  expect 1

//
// describes the information needed to scale an NS instance by one or more scaling steps, with respect to a particular NS scaling aspect
//
sig tosca_datatypes_nfv_ScaleNsByStepsData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scaling_direction: {'type': 'string', 'description': 'Indicates the type of the scale operation requested.', 'required': True, 'constraints': [{'valid_values': ['scale_out', 'scale_in']}]}
  //
  // Indicates the type of the scale operation requested.
  //
  scaling_direction: one string,

  // YAML aspect: {'type': 'string', 'description': 'Identifier of the scaling aspect.', 'required': True}
  //
  // Identifier of the scaling aspect.
  //
  aspect: one string,

  // YAML number_of_steps: {'type': 'integer', 'description': 'Number of scaling steps to be executed.', 'required': True, 'constraints': [{'greater_than': 0}], 'default': 1}
  //
  // Number of scaling steps to be executed.
  //
  number_of_steps: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  scaling_direction.valid_values["scale_out" + "scale_in"]
  number_of_steps.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.ScaleNsByStepsData */
run Show_tosca_datatypes_nfv_ScaleNsByStepsData {
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
  exactly 1 tosca_datatypes_nfv_ScaleNsByStepsData
  expect 1

//
// describes the information needed to scale an NS instance to a target size.
//
sig tosca_datatypes_nfv_ScaleNsToLevelData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML instantiation_level: {'type': 'string', 'description': 'Identifier of the target instantiation level of the current deployment flavour to which the NS is requested to be scaled. Either instantiation_level or ns_scale_info shall be provided.', 'required': False}
  //
  // Identifier of the target instantiation level of the current deployment flavour to which the NS is requested to be scaled. Either instantiation_level or ns_scale_info shall be provided.
  //
  instantiation_level: lone string,

  // YAML ns_scale_info: {'type': 'map', 'description': 'For each scaling aspect of the current deployment flavour, indicates the target scale level to which the NS is to be scaled. Either instantiation_level or ns_scale_info shall be provided.', 'required': False, 'entry_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}}
  //
  // For each scaling aspect of the current deployment flavour, indicates the target scale level to which the NS is to be scaled. Either instantiation_level or ns_scale_info shall be provided.
  //
  ns_scale_info: lone TOSCA/map_integer/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  ns_scale_info.elems.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.ScaleNsToLevelData */
run Show_tosca_datatypes_nfv_ScaleNsToLevelData {
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
  exactly 1 tosca_datatypes_nfv_ScaleNsToLevelData
  expect 1

//
// describes the data flow mirroring information to be associated to the NS instance.
//
sig tosca_datatypes_nfv_NsDataFlowMirroring extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML mirroring_job_name: {'type': 'string', 'description': 'Name of Data Flow Mirroring Job', 'required': True}
  //
  // Name of Data Flow Mirroring Job
  //
  mirroring_job_name: one string,

  // YAML description: {'type': 'string', 'description': 'Information description of Data Flow Mirroring Job', 'required': False}
  //
  // Information description of Data Flow Mirroring Job
  //
  description: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.NsDataFlowMirroring */
run Show_tosca_datatypes_nfv_NsDataFlowMirroring {
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
  exactly 1 tosca_datatypes_nfv_NsDataFlowMirroring
  expect 1

//
// Indicates for a given nsScalingAspect the corresponding NS scaleLevel
//
sig tosca_datatypes_nfv_NsScaleInfo extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scale_level: {'type': 'integer', 'description': 'The scale level for a particular aspect', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // The scale level for a particular aspect
  //
  scale_level: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  scale_level.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.NsScaleInfo */
run Show_tosca_datatypes_nfv_NsScaleInfo {
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
  exactly 1 tosca_datatypes_nfv_NsScaleInfo
  expect 1

// --------------------------------------------------
// Capability Types
// --------------------------------------------------

sig tosca_capabilities_nfv_Forwarding extends tosca_capabilities_Root
{
} {
}

/** There exists some tosca.capabilities.nfv.Forwarding */
run Show_tosca_capabilities_nfv_Forwarding {
  tosca_capabilities_nfv_Forwarding.no_name[]
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
  exactly 1 tosca_capabilities_nfv_Forwarding
  expect 1

// --------------------------------------------------
// Relationship Types
// --------------------------------------------------

sig tosca_relationships_nfv_ForwardTo extends tosca_relationships_Root
{
} {
  valid_target_types[tosca_capabilities_nfv_Forwarding]
}

/** There exists some tosca.relationships.nfv.ForwardTo */
run Show_tosca_relationships_nfv_ForwardTo {
  tosca_relationships_nfv_ForwardTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_ForwardTo
  expect 1

// --------------------------------------------------
// Interface Types
// --------------------------------------------------

//
// This interface encompasses a set of TOSCA operations corresponding to NS LCM operations defined in ETSI GS NFV-IFA 013. as well as to preamble and postamble procedures to the execution of the NS LCM operations.
//
sig tosca_interfaces_nfv_Nslcm extends tosca_interfaces_Root
{
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

  // YAML instantiate_start: {'description': 'Preamble to execution of the instantiate operation'}
  //
  // Preamble to execution of the instantiate operation
  //
  operation_instantiate_start: one TOSCA/Operation,

  // YAML instantiate: {'description': 'Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.NsOperationAdditionalParameters', 'required': False}}}
  //
  // Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_instantiate: one TOSCA/Operation,

  // YAML instantiate_end: {'description': 'Postamble to the execution of the instantiate operation'}
  //
  // Postamble to the execution of the instantiate operation
  //
  operation_instantiate_end: one TOSCA/Operation,

  // YAML terminate_start: {'description': 'Preamble to execution of the terminate operation'}
  //
  // Preamble to execution of the terminate operation
  //
  operation_terminate_start: one TOSCA/Operation,

  // YAML terminate: {'description': 'Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_terminate: one TOSCA/Operation,

  // YAML terminate_end: {'description': 'Postamble to the execution of the terminate operation'}
  //
  // Postamble to the execution of the terminate operation
  //
  operation_terminate_end: one TOSCA/Operation,

  // YAML update_start: {'description': 'Preamble to execution of the update operation'}
  //
  // Preamble to execution of the update operation
  //
  operation_update_start: one TOSCA/Operation,

  // YAML update: {'description': 'Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_update: one TOSCA/Operation,

  // YAML update_end: {'description': 'Postamble to the execution of the update operation'}
  //
  // Postamble to the execution of the update operation
  //
  operation_update_end: one TOSCA/Operation,

  // YAML scale_start: {'description': 'Preamble to execution of the scale operation'}
  //
  // Preamble to execution of the scale operation
  //
  operation_scale_start: one TOSCA/Operation,

  // YAML scale: {'description': 'Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.NsOperationAdditionalParameters', 'required': False}, 'scale_ns_by_steps_data': {'type': 'tosca.datatypes.nfv.ScaleNsByStepsData', 'description': 'Describes the information needed to scale an NS instance by one or more scaling steps, with respect to a particular NS scaling aspect as defined in ETSI GS NFV-IFA 013. Either scale_ns_by_steps_data or scale_ns_to_level_data shall be provided.', 'required': False}, 'scale_ns_to_level_data': {'type': 'tosca.datatypes.nfv.ScaleNsToLevelData', 'description': 'Describes the information needed to scale an NS instance to a target size as defined in ETSI GS NFV-IFA 013. Either scale_ns_by_steps_data or scale_ns_to_level_data shall be provided.', 'required': False}}}
  //
  // Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_scale: one TOSCA/Operation,

  // YAML scale_end: {'description': 'Postamble to the execution of the scale operation'}
  //
  // Postamble to the execution of the scale operation
  //
  operation_scale_end: one TOSCA/Operation,

  // YAML heal_start: {'description': 'Preamble to execution of the heal operation'}
  //
  // Preamble to execution of the heal operation
  //
  operation_heal_start: one TOSCA/Operation,

  // YAML heal: {'description': 'Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.NsOperationAdditionalParameters', 'required': False}}}
  //
  // Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_heal: one TOSCA/Operation,

  // YAML heal_end: {'description': 'Postamble to the execution of the heal operation'}
  //
  // Postamble to the execution of the heal operation
  //
  operation_heal_end: one TOSCA/Operation,

} {
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

  // YAML instantiate_start: {'description': 'Preamble to execution of the instantiate operation'}
  //
  // Preamble to execution of the instantiate operation
  //
  operation_instantiate_start.name["instantiate_start"]
  operation[operation_instantiate_start]

  // YAML instantiate: {'description': 'Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.NsOperationAdditionalParameters', 'required': False}}}
  //
  // Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_instantiate.name["instantiate"]
  operation[operation_instantiate]

  // YAML instantiate_end: {'description': 'Postamble to the execution of the instantiate operation'}
  //
  // Postamble to the execution of the instantiate operation
  //
  operation_instantiate_end.name["instantiate_end"]
  operation[operation_instantiate_end]

  // YAML terminate_start: {'description': 'Preamble to execution of the terminate operation'}
  //
  // Preamble to execution of the terminate operation
  //
  operation_terminate_start.name["terminate_start"]
  operation[operation_terminate_start]

  // YAML terminate: {'description': 'Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_terminate.name["terminate"]
  operation[operation_terminate]

  // YAML terminate_end: {'description': 'Postamble to the execution of the terminate operation'}
  //
  // Postamble to the execution of the terminate operation
  //
  operation_terminate_end.name["terminate_end"]
  operation[operation_terminate_end]

  // YAML update_start: {'description': 'Preamble to execution of the update operation'}
  //
  // Preamble to execution of the update operation
  //
  operation_update_start.name["update_start"]
  operation[operation_update_start]

  // YAML update: {'description': 'Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_update.name["update"]
  operation[operation_update]

  // YAML update_end: {'description': 'Postamble to the execution of the update operation'}
  //
  // Postamble to the execution of the update operation
  //
  operation_update_end.name["update_end"]
  operation[operation_update_end]

  // YAML scale_start: {'description': 'Preamble to execution of the scale operation'}
  //
  // Preamble to execution of the scale operation
  //
  operation_scale_start.name["scale_start"]
  operation[operation_scale_start]

  // YAML scale: {'description': 'Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.NsOperationAdditionalParameters', 'required': False}, 'scale_ns_by_steps_data': {'type': 'tosca.datatypes.nfv.ScaleNsByStepsData', 'description': 'Describes the information needed to scale an NS instance by one or more scaling steps, with respect to a particular NS scaling aspect as defined in ETSI GS NFV-IFA 013. Either scale_ns_by_steps_data or scale_ns_to_level_data shall be provided.', 'required': False}, 'scale_ns_to_level_data': {'type': 'tosca.datatypes.nfv.ScaleNsToLevelData', 'description': 'Describes the information needed to scale an NS instance to a target size as defined in ETSI GS NFV-IFA 013. Either scale_ns_by_steps_data or scale_ns_to_level_data shall be provided.', 'required': False}}}
  //
  // Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_scale.name["scale"]
  operation[operation_scale]

  // YAML scale_end: {'description': 'Postamble to the execution of the scale operation'}
  //
  // Postamble to the execution of the scale operation
  //
  operation_scale_end.name["scale_end"]
  operation[operation_scale_end]

  // YAML heal_start: {'description': 'Preamble to execution of the heal operation'}
  //
  // Preamble to execution of the heal operation
  //
  operation_heal_start.name["heal_start"]
  operation[operation_heal_start]

  // YAML heal: {'description': 'Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.NsOperationAdditionalParameters', 'required': False}}}
  //
  // Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_heal.name["heal"]
  operation[operation_heal]

  // YAML heal_end: {'description': 'Postamble to the execution of the heal operation'}
  //
  // Postamble to the execution of the heal operation
  //
  operation_heal_end.name["heal_end"]
  operation[operation_heal_end]

}

/** There exists some tosca.interfaces.nfv.Nslcm */
run Show_tosca_interfaces_nfv_Nslcm {
  tosca_interfaces_nfv_Nslcm.no_name[]
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
  exactly 1 TOSCA/Operation,
  exactly 8 TOSCA/Parameter,
  exactly 1 tosca_interfaces_nfv_Nslcm
  expect 1

//
// This interface is an empty base interface type for deriving NS specific interface types that include VNF indicator specific notifications which will be used in a NS.
//
sig tosca_interfaces_nfv_NsVnfIndicator extends tosca_interfaces_Root
{
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

} {
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

}

/** There exists some tosca.interfaces.nfv.NsVnfIndicator */
run Show_tosca_interfaces_nfv_NsVnfIndicator {
  tosca_interfaces_nfv_NsVnfIndicator.no_name[]
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
  exactly 1 tosca_interfaces_nfv_NsVnfIndicator
  expect 1

// --------------------------------------------------
// Node Types
// --------------------------------------------------

sig tosca_nodes_nfv_NS extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'type': 'string', 'description': 'Identifier of this NS descriptor', 'required': True}
  //
  // Identifier of this NS descriptor
  //
  property_descriptor_id: one string,

  // YAML designer: {'type': 'string', 'description': 'Identifies the designer of the NSD.', 'required': True}
  //
  // Identifies the designer of the NSD.
  //
  property_designer: one string,

  // YAML version: {'type': 'string', 'description': 'Identifies the version of the NSD.', 'required': True}
  //
  // Identifies the version of the NSD.
  //
  property_version: one string,

  // YAML name: {'type': 'string', 'description': 'Provides the human readable name of the NSD.', 'required': True}
  //
  // Provides the human readable name of the NSD.
  //
  property_name: one string,

  // YAML invariant_id: {'type': 'string', 'description': 'Identifies an NSD in a version independent manner. This attribute is invariant across versions of NSD with no constraints on the changes across versions.', 'required': True}
  //
  // Identifies an NSD in a version independent manner. This attribute is invariant across versions of NSD with no constraints on the changes across versions.
  //
  property_invariant_id: one string,

  // YAML ext_invariant_id: {'type': 'string', 'description': 'Identifies an NSD in a version independent manner. This attribute is invariant across versions of the NSD that fulfil certain conditions related to the external connectivity and management of the NS. When used in a nested NS node template in a composite NSD it allows for nested NS instances during NS LCM the use of an NSD different from the one referenced by the descriptor_id property, provided they have the same ext_invariant_id.', 'required': False}
  //
  // Identifies an NSD in a version independent manner. This attribute is invariant across versions of the NSD that fulfil certain conditions related to the external connectivity and management of the NS. When used in a nested NS node template in a composite NSD it allows for nested NS instances during NS LCM the use of an NSD different from the one referenced by the descriptor_id property, provided they have the same ext_invariant_id.
  //
  property_ext_invariant_id: lone string,

  // YAML flavour_id: {'type': 'string', 'description': 'Identifier of the NS Deployment Flavour within the NSD', 'required': True}
  //
  // Identifier of the NS Deployment Flavour within the NSD
  //
  property_flavour_id: one string,

  // YAML ns_profile: {'type': 'tosca.datatypes.nfv.NsProfile', 'description': 'Specifies a profile of a NS, when this NS is used as nested NS within another NS.', 'required': False}
  //
  // Specifies a profile of a NS, when this NS is used as nested NS within another NS.
  //
  property_ns_profile: lone tosca_datatypes_nfv_NsProfile,

  // YAML service_availability_level: {'type': 'integer', 'description': 'Specifies the service availability level for the NS instance.', 'required': False, 'constraints': [{'greater_or_equal': 1}]}
  //
  // Specifies the service availability level for the NS instance.
  //
  property_service_availability_level: lone integer,

  // YAML priority: {'type': 'integer', 'description': 'Specifies the priority for the NS instance. Examples for the usage of priority include conflict resolution in case of resource shortage.', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Specifies the priority for the NS instance. Examples for the usage of priority include conflict resolution in case of resource shortage.
  //
  property_priority: lone integer,

  // YAML strict_nsd_constituent_onboarding: {'type': 'boolean', 'description': 'Indicates if all NSD constituents referenced by this NSD shall be onboarded before onboarding the NSD identified by this information element. If true all referenced constituents shall be onboarded.', 'required': True, 'default': True}
  //
  // Indicates if all NSD constituents referenced by this NSD shall be onboarded before onboarding the NSD identified by this information element. If true all referenced constituents shall be onboarded.
  //
  property_strict_nsd_constituent_onboarding: one boolean,

  // --------------------------------------------------
  // Attributes
  // --------------------------------------------------

  // YAML scale_status: {'type': 'map', 'description': 'Scale status of the NS, one entry per aspect. Represents for every scaling aspect how "big" the NS has been scaled w.r.t. that aspect.', 'entry_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}}
  //
  // Scale status of the NS, one entry per aspect. Represents for every scaling aspect how "big" the NS has been scaled w.r.t. that aspect.
  //
  attribute_scale_status: one TOSCA/map_integer/Map,


  // --------------------------------------------------
  // Interfaces
  // --------------------------------------------------

  // YAML Nslcm: {'type': 'tosca.interfaces.nfv.Nslcm'}
  interface_Nslcm: one tosca_interfaces_nfv_Nslcm,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'node': 'tosca.nodes.nfv.NsVirtualLink', 'occurrences': [0, 1]}
  requirement_virtual_link: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some property_service_availability_level implies property_service_availability_level.greater_or_equal[1]
  some property_priority implies property_priority.greater_or_equal[0]

  // --------------------------------------------------
  // Attributes
  // --------------------------------------------------

  //
  // Scale status of the NS, one entry per aspect. Represents for every scaling aspect how "big" the NS has been scaled w.r.t. that aspect.
  //
  attribute_scale_status.elems.greater_or_equal[0]

  // --------------------------------------------------
  // Interfaces
  // --------------------------------------------------

  // YAML Nslcm: {'type': 'tosca.interfaces.nfv.Nslcm'}
  interface[interface_Nslcm]
  interface_Nslcm.name["Nslcm"]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'node': 'tosca.nodes.nfv.NsVirtualLink', 'occurrences': [0, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]
  requirement_virtual_link.node[tosca_nodes_nfv_NsVirtualLink]

}

/** There exists some tosca.nodes.nfv.NS */
run Show_tosca_nodes_nfv_NS {
  tosca_nodes_nfv_NS.no_name[]
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
  exactly 1 tosca_nodes_nfv_NS
  expect 1

//
// node definition of SAP.
//
sig tosca_nodes_nfv_Sap extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_external_virtual_link: lone TOSCA/Requirement,

  // YAML internal_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement_internal_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]

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

/** There exists some tosca.nodes.nfv.Sap */
run Show_tosca_nodes_nfv_Sap {
  tosca_nodes_nfv_Sap.no_name[]
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
  exactly 1 tosca_nodes_nfv_Sap
  expect 1

//
// node definition of Virtual Links
//
sig tosca_nodes_nfv_NsVirtualLink extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vl_profile: {'type': 'tosca.datatypes.nfv.NsVlProfile', 'description': 'Specifies instantiation parameters for a virtual link of a particular NS deployment flavour.', 'required': True}
  //
  // Specifies instantiation parameters for a virtual link of a particular NS deployment flavour.
  //
  property_vl_profile: one tosca_datatypes_nfv_NsVlProfile,

  // YAML connectivity_type: {'type': 'tosca.datatypes.nfv.ConnectivityType', 'required': True}
  property_connectivity_type: one tosca_datatypes_nfv_ConnectivityType,

  // YAML test_access: {'type': 'list', 'description': 'Test access facilities available on the VL', 'required': False, 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['passive_monitoring', 'active_loopback']}]}}
  //
  // Test access facilities available on the VL
  //
  property_test_access: seq string,

  // YAML description: {'type': 'string', 'required': False, 'description': 'Human readable information on the purpose of the virtual link (e.g. VL for control plane traffic).'}
  //
  // Human readable information on the purpose of the virtual link (e.g. VL for control plane traffic).
  //
  property_description: lone string,

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

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable.name["virtual_linkable"]
  capability[capability_virtual_linkable]

}

/** There exists some tosca.nodes.nfv.NsVirtualLink */
run Show_tosca_nodes_nfv_NsVirtualLink {
  tosca_nodes_nfv_NsVirtualLink.no_name[]
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
  exactly 1 tosca_nodes_nfv_NsVirtualLink
  expect 1

//
// node definition of NfpPositionElement
//
sig tosca_nodes_nfv_NfpPositionElement extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML profile_element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 2]}
  requirement_profile_element: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML profile_element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 2]}
  requirement["profile_element", requirement_profile_element]
  requirement_profile_element.capability[tosca_capabilities_nfv_Forwarding]
  requirement_profile_element.relationship[tosca_relationships_nfv_ForwardTo]
  // YAML occurrences: [1, 2]
  #requirement_profile_element >= 1
  #requirement_profile_element <= 2

}

/** There exists some tosca.nodes.nfv.NfpPositionElement */
run Show_tosca_nodes_nfv_NfpPositionElement {
  tosca_nodes_nfv_NfpPositionElement.no_name[]
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
  exactly 1 tosca_nodes_nfv_NfpPositionElement
  expect 1

//
// node definition of NFP position
//
sig tosca_nodes_nfv_NfpPosition extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML forwarding_behaviour: {'type': 'string', 'description': 'Identifies a rule to apply to forward traffic to CP or SAP instances corresponding to the referenced NfpPositionElement(s).', 'constraints': [{'valid_values': ['all', 'lb', 'ff']}], 'required': False}
  //
  // Identifies a rule to apply to forward traffic to CP or SAP instances corresponding to the referenced NfpPositionElement(s).
  //
  property_forwarding_behaviour: lone string,

  // YAML forwarding_behaviour_input_parameters: {'description': 'Provides input parameters to configure the forwarding behaviour.', 'type': 'map', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Provides input parameters to configure the forwarding behaviour.
  //
  property_forwarding_behaviour_input_parameters: lone TOSCA/map_string/Map,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPositionElement', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement_element: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_forwarding_behaviour.valid_values["all" + "lb" + "ff"]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPositionElement', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement["element", requirement_element]
  requirement_element.capability[tosca_capabilities_nfv_Forwarding]
  requirement_element.relationship[tosca_relationships_nfv_ForwardTo]
  requirement_element.node[tosca_nodes_nfv_NfpPositionElement]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_element >= 1

}

/** There exists some tosca.nodes.nfv.NfpPosition */
run Show_tosca_nodes_nfv_NfpPosition {
  tosca_nodes_nfv_NfpPosition.no_name[]
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
  exactly 1 tosca_nodes_nfv_NfpPosition
  expect 1

//
// node definition of NFP
//
sig tosca_nodes_nfv_NFP extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML nfp_position: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPosition', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement_nfp_position: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML nfp_position: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPosition', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement["nfp_position", requirement_nfp_position]
  requirement_nfp_position.capability[tosca_capabilities_nfv_Forwarding]
  requirement_nfp_position.relationship[tosca_relationships_nfv_ForwardTo]
  requirement_nfp_position.node[tosca_nodes_nfv_NfpPosition]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_nfp_position >= 1

}

/** There exists some tosca.nodes.nfv.NFP */
run Show_tosca_nodes_nfv_NFP {
  tosca_nodes_nfv_NFP.no_name[]
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
  exactly 1 tosca_nodes_nfv_NFP
  expect 1

sig tosca_nodes_nfv_Forwarding extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable: some tosca_capabilities_nfv_VirtualLinkable,

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo'}
  requirement_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable.name["virtual_linkable"]
  capability[capability_virtual_linkable]

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo'}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.Forwarding */
run Show_tosca_nodes_nfv_Forwarding {
  tosca_nodes_nfv_Forwarding.no_name[]
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
  exactly 1 tosca_nodes_nfv_Forwarding
  expect 1

// --------------------------------------------------
// Group Types
// --------------------------------------------------

//
// NsPlacementGroup is used for describing the affinity or anti-affinity relationship applicable between VNF instances created using different VNFDs, the Virtual Link instances created using different VLDs or the nested NS instances created using different NSDs when used in a NSD.
//
sig tosca_groups_nfv_NsPlacementGroup extends tosca_groups_Root
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


  members_type[tosca_nodes_nfv_VNF + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NS + tosca_nodes_nfv_Forwarding + tosca_nodes_nfv_Sap]
}

/** There exists some tosca.groups.nfv.NsPlacementGroup */
run Show_tosca_groups_nfv_NsPlacementGroup {
  tosca_groups_nfv_NsPlacementGroup.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_groups_nfv_NsPlacementGroup
  expect 1

//
// the VNFFG group type describes a topology of the NS or a portion of the NS, and optionally forwarding rules, applicable to the traffic conveyed over this topology
//
sig tosca_groups_nfv_VNFFG extends tosca_groups_Root
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


  members_type[tosca_nodes_nfv_NFP + tosca_nodes_nfv_VNF + tosca_nodes_nfv_PNF + tosca_nodes_nfv_NS + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NfpPositionElement]
}

/** There exists some tosca.groups.nfv.VNFFG */
run Show_tosca_groups_nfv_VNFFG {
  tosca_groups_nfv_VNFFG.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_groups_nfv_VNFFG
  expect 1

// --------------------------------------------------
// Policy Types
// --------------------------------------------------

//
// The NsAffinityRule describes the affinity rules applicable for the defined targets
//
sig tosca_policies_nfv_NsAffinityRule extends tosca_policies_Placement
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scope: {'type': 'string', 'description': 'Specifies the scope of the local affinity rule.', 'required': True, 'constraints': [{'valid_values': ['nfvi_node', 'zone', 'zone_group', 'nfvi_pop', 'network_link_and_node', 'container_namespace', 'l2_network']}]}
  //
  // Specifies the scope of the local affinity rule.
  //
  property_scope: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_scope.valid_values["nfvi_node" + "zone" + "zone_group" + "nfvi_pop" + "network_link_and_node" + "container_namespace" + "l2_network"]

  // YAML targets: ['tosca.nodes.nfv.VNF', 'tosca.nodes.nfv.NsVirtualLink', 'tosca.nodes.nfv.NS', 'tosca.groups.nfv.NsPlacementGroup', 'tosca.nodes.nfv.Sap', 'tosca.nodes.nfv.Forwarding']
  targets_type[tosca_nodes_nfv_VNF + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NS + tosca_groups_nfv_NsPlacementGroup + tosca_nodes_nfv_Sap + tosca_nodes_nfv_Forwarding]
}

/** There exists some tosca.policies.nfv.NsAffinityRule */
run Show_tosca_policies_nfv_NsAffinityRule {
  tosca_policies_nfv_NsAffinityRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsAffinityRule
  expect 1

//
// The NsAntiAffinityRule describes the anti-affinity rules applicable for the defined targets
//
sig tosca_policies_nfv_NsAntiAffinityRule extends tosca_policies_Placement
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scope: {'type': 'string', 'description': 'Specifies the scope of the local affinity rule..', 'required': True, 'constraints': [{'valid_values': ['nfvi_node', 'zone', 'zone_group', 'nfvi_pop', 'network_link_and_node', 'container_namespace', 'l2_network']}]}
  //
  // Specifies the scope of the local affinity rule..
  //
  property_scope: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_scope.valid_values["nfvi_node" + "zone" + "zone_group" + "nfvi_pop" + "network_link_and_node" + "container_namespace" + "l2_network"]

  // YAML targets: ['tosca.nodes.nfv.VNF', 'tosca.nodes.nfv.NsVirtualLink', 'tosca.nodes.nfv.NS', 'tosca.groups.nfv.NsPlacementGroup', 'tosca.nodes.nfv.Sap', 'tosca.nodes.nfv.Forwarding']
  targets_type[tosca_nodes_nfv_VNF + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NS + tosca_groups_nfv_NsPlacementGroup + tosca_nodes_nfv_Sap + tosca_nodes_nfv_Forwarding]
}

/** There exists some tosca.policies.nfv.NsAntiAffinityRule */
run Show_tosca_policies_nfv_NsAntiAffinityRule {
  tosca_policies_nfv_NsAntiAffinityRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsAntiAffinityRule
  expect 1

//
// The NsSecurityGroupRule type is a policy type specified the matching criteria for the ingress and/or egress traffic to/from visited SAPs.
//
sig tosca_policies_nfv_NsSecurityGroupRule extends tosca_policies_nfv_Abstract_SecurityGroupRule
{
} {
  // YAML targets: ['tosca.nodes.nfv.Sap']
  targets_type[tosca_nodes_nfv_Sap]
}

/** There exists some tosca.policies.nfv.NsSecurityGroupRule */
run Show_tosca_policies_nfv_NsSecurityGroupRule {
  tosca_policies_nfv_NsSecurityGroupRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsSecurityGroupRule
  expect 1

//
// policy definition of NfpRule
//
sig tosca_policies_nfv_NfpRule extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ether_destination_address: {'description': 'Indicates a destination Mac address.', 'type': 'string', 'required': False}
  //
  // Indicates a destination Mac address.
  //
  property_ether_destination_address: lone string,

  // YAML ether_source_address: {'description': 'Indicates a source Mac address.', 'type': 'string', 'required': False}
  //
  // Indicates a source Mac address.
  //
  property_ether_source_address: lone string,

  // YAML ether_type: {'description': 'Indicates the protocol carried over the Ethernet layer.', 'type': 'string', 'constraints': [{'valid_values': ['ipv4', 'ipv6']}], 'required': False}
  //
  // Indicates the protocol carried over the Ethernet layer.
  //
  property_ether_type: lone string,

  // YAML vlan_tag: {'description': 'Indicates a VLAN identifier in an IEEE 802.1Q-2014 tag [14]. Multiple tags can be included for QinQ stacking.', 'type': 'list', 'entry_schema': {'type': 'string'}, 'required': False}
  //
  // Indicates a VLAN identifier in an IEEE 802.1Q-2014 tag [14]. Multiple tags can be included for QinQ stacking.
  //
  property_vlan_tag: seq string,

  // YAML protocol: {'description': 'Indicates the L4 protocol, For IPv4 [15] this corresponds to the field called "Protocol" to identify the next level protocol. For IPv6 [16] this corresponds to the field is called the "Next Header" field. Permitted values: Any keyword defined in the IANA [17] protocol registry.', 'type': 'string', 'required': False}
  //
  // Indicates the L4 protocol, For IPv4 [15] this corresponds to the field called "Protocol" to identify the next level protocol. For IPv6 [16] this corresponds to the field is called the "Next Header" field. Permitted values: Any keyword defined in the IANA [17] protocol registry.
  //
  property_protocol: lone string,

  // YAML dscp: {'description': 'For IPv4 [15] a string of "0" and "1" digits that corresponds to the 6-bit Differentiated Services Code Point (DSCP) field of the IP header. For IPv6 [16] a string of "0" and "1" digits that corresponds to the 6 differentiated services bits of the traffic class header field.', 'type': 'string', 'required': False}
  //
  // For IPv4 [15] a string of "0" and "1" digits that corresponds to the 6-bit Differentiated Services Code Point (DSCP) field of the IP header. For IPv6 [16] a string of "0" and "1" digits that corresponds to the 6 differentiated services bits of the traffic class header field.
  //
  property_dscp: lone string,

  // YAML source_port_range: {'description': 'Indicates a range of source ports.', 'type': 'range', 'required': False, 'constraints': [{'in_range': [0, 65535]}]}
  //
  // Indicates a range of source ports.
  //
  property_source_port_range: lone range,

  // YAML destination_port_range: {'description': 'Indicates a range of destination ports.', 'type': 'range', 'required': False, 'constraints': [{'in_range': [0, 65535]}]}
  //
  // Indicates a range of destination ports.
  //
  property_destination_port_range: lone range,

  // YAML source_ip_address_prefix: {'description': 'Indicates the source IP address range in CIDR format.', 'type': 'string', 'required': False}
  //
  // Indicates the source IP address range in CIDR format.
  //
  property_source_ip_address_prefix: lone string,

  // YAML destination_ip_address_prefix: {'description': 'Indicates the destination IP address range in CIDR format.', 'type': 'string', 'required': False}
  //
  // Indicates the destination IP address range in CIDR format.
  //
  property_destination_ip_address_prefix: lone string,

  // YAML extended_criteria: {'description': 'Indicates values of specific bits in a frame.', 'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.Mask'}, 'required': False}
  //
  // Indicates values of specific bits in a frame.
  //
  property_extended_criteria: seq tosca_datatypes_nfv_Mask,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_ether_type.valid_values["ipv4" + "ipv6"]
  some property_source_port_range implies property_source_port_range.in_range[0, 65535]
  some property_destination_port_range implies property_destination_port_range.in_range[0, 65535]

  // YAML targets: ['tosca.nodes.nfv.NFP']
  targets_type[tosca_nodes_nfv_NFP]
}

/** There exists some tosca.policies.nfv.NfpRule */
run Show_tosca_policies_nfv_NfpRule {
  tosca_policies_nfv_NfpRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NfpRule
  expect 1

//
// Policy type is used to identify information to be monitored during the lifetime of a network service instance as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_NsMonitoring extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ns_monitoring_parameters: {'type': 'map', 'description': 'Specifies a virtualised resource related performance metric to be monitored on the NS level.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsMonitoringParameter'}, 'constraints': [{'min_length': 1}]}
  //
  // Specifies a virtualised resource related performance metric to be monitored on the NS level.
  //
  property_ns_monitoring_parameters: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_ns_monitoring_parameters.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.NS']
  targets_type[tosca_nodes_nfv_NS]
}

/** There exists some tosca.policies.nfv.NsMonitoring */
run Show_tosca_policies_nfv_NsMonitoring {
  tosca_policies_nfv_NsMonitoring.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsMonitoring
  expect 1

//
// Policy type is used to identify information to be monitored during the lifetime of a VNF instance as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_VnfMonitoring extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vnf_monitoring_parameters: {'type': 'map', 'description': 'Specifies a virtualised resource related performance metric to be monitored on the NS level.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfMonitoringParameter'}, 'constraints': [{'min_length': 1}]}
  //
  // Specifies a virtualised resource related performance metric to be monitored on the NS level.
  //
  property_vnf_monitoring_parameters: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_vnf_monitoring_parameters.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.VNF']
  targets_type[tosca_nodes_nfv_VNF]
}

/** There exists some tosca.policies.nfv.VnfMonitoring */
run Show_tosca_policies_nfv_VnfMonitoring {
  tosca_policies_nfv_VnfMonitoring.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VnfMonitoring
  expect 1

//
// The NsScalingAspects type is a policy type representing the scaling aspects used for horizontal scaling as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_NsScalingAspects extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspects: {'type': 'map', 'description': 'Describe the details of a particular aspect including the corresponding NS levels.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsScalingAspect'}, 'constraints': [{'min_length': 1}]}
  //
  // Describe the details of a particular aspect including the corresponding NS levels.
  //
  property_aspects: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_aspects.min_length[1]

}

/** There exists some tosca.policies.nfv.NsScalingAspects */
run Show_tosca_policies_nfv_NsScalingAspects {
  tosca_policies_nfv_NsScalingAspects.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsScalingAspects
  expect 1

//
// The VnfToLevelMapping type is a policy type representing the number of VNF instances to be deployed at each NS level, as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_VnfToLevelMapping extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspect: {'type': 'string', 'description': 'Represents the scaling aspect to which this policy applies', 'required': True}
  //
  // Represents the scaling aspect to which this policy applies
  //
  property_aspect: one string,

  // YAML number_of_instances: {'type': 'map', 'description': 'Number of VNF instances to be deployed for each NS level.', 'required': True, 'key_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'entry_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'constraints': [{'min_length': 1}]}
  //
  // Number of VNF instances to be deployed for each NS level.
  //
  property_number_of_instances: one TOSCA/map_integer/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_number_of_instances.min_length[1]
  property_number_of_instances.elems.greater_or_equal[0]

  // YAML targets: ['tosca.nodes.nfv.VNF']
  targets_type[tosca_nodes_nfv_VNF]
}

/** There exists some tosca.policies.nfv.VnfToLevelMapping */
run Show_tosca_policies_nfv_VnfToLevelMapping {
  tosca_policies_nfv_VnfToLevelMapping.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VnfToLevelMapping
  expect 1

//
// The NsToLevelMapping type is a policy type representing the number of NS instances of a nested NS to be deployed at each NS level of the composite NS, as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_NsToLevelMapping extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspect: {'type': 'string', 'description': 'Represents the scaling aspect to which this policy applies', 'required': True}
  //
  // Represents the scaling aspect to which this policy applies
  //
  property_aspect: one string,

  // YAML number_of_instances: {'type': 'map', 'description': 'Number of NS instances of a nested NS to be deployed for each NS level of the composite NS.', 'required': True, 'key_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'entry_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'constraints': [{'min_length': 1}]}
  //
  // Number of NS instances of a nested NS to be deployed for each NS level of the composite NS.
  //
  property_number_of_instances: one TOSCA/map_integer/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_number_of_instances.min_length[1]
  property_number_of_instances.elems.greater_or_equal[0]

  // YAML targets: ['tosca.nodes.nfv.NS']
  targets_type[tosca_nodes_nfv_NS]
}

/** There exists some tosca.policies.nfv.NsToLevelMapping */
run Show_tosca_policies_nfv_NsToLevelMapping {
  tosca_policies_nfv_NsToLevelMapping.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsToLevelMapping
  expect 1

//
// The VirtualLinkToLevelMapping type is a policy type representing the number of NS instances of a nested NS to be deployed at each NS level of the composite NS, as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_VirtualLinkToLevelMapping extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML aspect: {'type': 'string', 'description': 'Represents the scaling aspect to which this policy applies', 'required': True}
  //
  // Represents the scaling aspect to which this policy applies
  //
  property_aspect: one string,

  // YAML bit_rate_requirements: {'type': 'map', 'description': 'Bitrate requirements of a VL for each NS level.', 'required': True, 'key_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'entry_schema': {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements'}, 'constraints': [{'min_length': 1}]}
  //
  // Bitrate requirements of a VL for each NS level.
  //
  property_bit_rate_requirements: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_bit_rate_requirements.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.NsVirtualLink']
  targets_type[tosca_nodes_nfv_NsVirtualLink]
}

/** There exists some tosca.policies.nfv.VirtualLinkToLevelMapping */
run Show_tosca_policies_nfv_VirtualLinkToLevelMapping {
  tosca_policies_nfv_VirtualLinkToLevelMapping.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VirtualLinkToLevelMapping
  expect 1

//
// The NsInstantiationLevels type is a policy type representing all the instantiation levels of resources to be instantiated within a deployment flavour and including default instantiation level in term of the number of VNF and nested NS instances to be created as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_NsInstantiationLevels extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ns_levels: {'type': 'map', 'description': 'Describes the various levels of resources that can be used to instantiate the VNF using this flavour.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsLevels'}, 'constraints': [{'min_length': 1}]}
  //
  // Describes the various levels of resources that can be used to instantiate the VNF using this flavour.
  //
  property_ns_levels: one TOSCA/map_data/Map,

  // YAML default_level: {'type': 'string', 'description': 'The default instantiation level for this flavour.', 'required': False}
  //
  // The default instantiation level for this flavour.
  //
  property_default_level: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_ns_levels.min_length[1]

}

/** There exists some tosca.policies.nfv.NsInstantiationLevels */
run Show_tosca_policies_nfv_NsInstantiationLevels {
  tosca_policies_nfv_NsInstantiationLevels.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsInstantiationLevels
  expect 1

//
// The VnfToInstantiationLevelMapping type is a policy type representing the number of VNF instances to be deployed at each NS instantiation level, as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_VnfToInstantiationLevelMapping extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML number_of_instances: {'type': 'map', 'description': 'Number of VNF instances to be deployed for each NS instantiation level.', 'required': True, 'entry_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'constraints': [{'min_length': 1}]}
  //
  // Number of VNF instances to be deployed for each NS instantiation level.
  //
  property_number_of_instances: one TOSCA/map_integer/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_number_of_instances.min_length[1]
  property_number_of_instances.elems.greater_or_equal[0]

  // YAML targets: ['tosca.nodes.nfv.VNF']
  targets_type[tosca_nodes_nfv_VNF]
}

/** There exists some tosca.policies.nfv.VnfToInstantiationLevelMapping */
run Show_tosca_policies_nfv_VnfToInstantiationLevelMapping {
  tosca_policies_nfv_VnfToInstantiationLevelMapping.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VnfToInstantiationLevelMapping
  expect 1

//
// The NsToInstantiationLevelMapping type is a policy type representing the number of NS instances of a nested NS to be deployed at each NS instantiation level of the composite NS, as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_NsToInstantiationLevelMapping extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML number_of_instances: {'type': 'map', 'description': 'Number of NS instances of a nested NS to be deployed for each NS instantiation level of the composite NS.', 'required': True, 'entry_schema': {'type': 'integer', 'constraints': [{'greater_or_equal': 0}]}, 'constraints': [{'min_length': 1}]}
  //
  // Number of NS instances of a nested NS to be deployed for each NS instantiation level of the composite NS.
  //
  property_number_of_instances: one TOSCA/map_integer/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_number_of_instances.min_length[1]
  property_number_of_instances.elems.greater_or_equal[0]

  // YAML targets: ['tosca.nodes.nfv.NS']
  targets_type[tosca_nodes_nfv_NS]
}

/** There exists some tosca.policies.nfv.NsToInstantiationLevelMapping */
run Show_tosca_policies_nfv_NsToInstantiationLevelMapping {
  tosca_policies_nfv_NsToInstantiationLevelMapping.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsToInstantiationLevelMapping
  expect 1

//
// The VirtualLinkToInstantiationLevelMapping type is a policy type describing the bitrate requirements of a VL at each NS instantiation level of the composite NS, as defined in ETSI GS NFV-IFA 014 [2]
//
sig tosca_policies_nfv_VirtualLinkToInstantiationLevelMapping extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML bit_rate_requirements: {'type': 'map', 'description': 'Bitrate requirements of a VL for each NS instantiation level.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements'}, 'constraints': [{'min_length': 1}]}
  //
  // Bitrate requirements of a VL for each NS instantiation level.
  //
  property_bit_rate_requirements: one TOSCA/map_data/Map,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_bit_rate_requirements.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.NsVirtualLink']
  targets_type[tosca_nodes_nfv_NsVirtualLink]
}

/** There exists some tosca.policies.nfv.VirtualLinkToInstantiationLevelMapping */
run Show_tosca_policies_nfv_VirtualLinkToInstantiationLevelMapping {
  tosca_policies_nfv_VirtualLinkToInstantiationLevelMapping.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VirtualLinkToInstantiationLevelMapping
  expect 1

//
// The NsAutoScale policy type is a base policy type for defining NS auto-scale specific policies as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_NsAutoScale extends tosca_policies_Root
{
} {
  // YAML targets: ['tosca.nodes.nfv.NS']
  targets_type[tosca_nodes_nfv_NS]
}

/** There exists some tosca.policies.nfv.NsAutoScale */
run Show_tosca_policies_nfv_NsAutoScale {
  tosca_policies_nfv_NsAutoScale.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsAutoScale
  expect 1

//
// The NsDataFlowMirroring type is a policy type representing the the information to identify an external connection point of the VNF/PNF or a Sap from which the data flows are expected to be mirrored as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_DataFlowInfo extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML data_flow_info_id: {'type': 'string', 'description': 'Identifier of the Data flow information', 'required': True}
  //
  // Identifier of the Data flow information
  //
  property_data_flow_info_id: one string,

  // YAML associated_mirroring_job_name: {'type': 'string', 'description': 'Associated data mirroring job name as defined in NsVirtualLink node', 'required': True}
  //
  // Associated data mirroring job name as defined in NsVirtualLink node
  //
  property_associated_mirroring_job_name: one string,

  // YAML direction: {'type': 'string', 'description': "The direction of the data flow that are requested to be mirrored. The direction is specified against the associated CP. I.e., 'in' means the data flow that enters the target connection point needs to be mirrored. 'out' means the data flow that sends out the target connection point needs to be mirrored. 'both' means the data flows that both enters and sends out the target connection point all need to be mirrored.", 'required': True, 'constraints': [{'valid_values': ['in', 'out', 'both']}]}
  //
  // The direction of the data flow that are requested to be mirrored. The direction is specified against the associated CP. I.e., 'in' means the data flow that enters the target connection point needs to be mirrored. 'out' means the data flow that sends out the target connection point needs to be mirrored. 'both' means the data flows that both enters and sends out the target connection point all need to be mirrored.
  //
  property_direction: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_direction.valid_values["in" + "out" + "both"]

  // YAML targets: ['tosca.nodes.nfv.Forwarding', 'tosca.nodes.nfv.Sap']
  targets_type[tosca_nodes_nfv_Forwarding + tosca_nodes_nfv_Sap]
}

/** There exists some tosca.policies.nfv.DataFlowInfo */
run Show_tosca_policies_nfv_DataFlowInfo {
  tosca_policies_nfv_DataFlowInfo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_DataFlowInfo
  expect 1

