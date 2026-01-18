// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: ETSI NFV SOL 001 common types definitions version 4.4.1

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Data Types
// --------------------------------------------------

//
// Describes the information on the MAC addresses to be assigned to a connection point.
//
sig tosca_datatypes_nfv_L2AddressData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML mac_address_assignment: {'type': 'boolean', 'description': 'Specifies which mode is used for the MAC address assignment. If it is set to True, a MAC address is expected to be provided by a management entity via the NFV MANO interfaces towards the VNFM using attributes standardized for this purpose in the NFV-MANO information model and is further transferred from the VNFM to the VIM/CISM. A MAC address will be automatically assigned by the VIM/NFVI/CISM as fallback if not provided. If it is set to False, a MAC address is expected to it will be assigned by means specific to the VNF itself (e.g., by an LCM script, by the EM) and is further transferred from the VNFM to the VIM/CISM. A MAC address will be automatically assigned by the VIM/NFVI/CISM as fallback if not provided to the VIM/CISM.', 'required': True}
  //
  // Specifies which mode is used for the MAC address assignment. If it is set to True, a MAC address is expected to be provided by a management entity via the NFV MANO interfaces towards the VNFM using attributes standardized for this purpose in the NFV-MANO information model and is further transferred from the VNFM to the VIM/CISM. A MAC address will be automatically assigned by the VIM/NFVI/CISM as fallback if not provided. If it is set to False, a MAC address is expected to it will be assigned by means specific to the VNF itself (e.g., by an LCM script, by the EM) and is further transferred from the VNFM to the VIM/CISM. A MAC address will be automatically assigned by the VIM/NFVI/CISM as fallback if not provided to the VIM/CISM.
  //
  mac_address_assignment: one boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.L2AddressData */
run Show_tosca_datatypes_nfv_L2AddressData {
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
  exactly 1 tosca_datatypes_nfv_L2AddressData
  expect 1

//
// Provides information about Layer 3 level addressing scheme and parameters applicable to a CP
//
sig tosca_datatypes_nfv_L3AddressData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ip_address_assignment: {'type': 'boolean', 'description': 'Specify which mode is used for the IP address assignment. If it is set to True and this property is not used in the context of the VirtualCp node type, IP configuration information shall be provided for the VNF by a management entity using the NFV MANO interfaces towards the VNFM. If it is set to True and this property is used in the context of the VirtualCp node type, IP configuration information should be provided for the VNF by a management entity using the NFV MANO interfaces towards the VNFM. If it is not provided, the CISM assigns an IP address. If it is set to False, the value of the ip_address_assignment_subtype property defines the method of IP address assignment. Shall be present if the fixed_ip_address property is not present and should be absent otherwise.', 'required': False}
  //
  // Specify which mode is used for the IP address assignment. If it is set to True and this property is not used in the context of the VirtualCp node type, IP configuration information shall be provided for the VNF by a management entity using the NFV MANO interfaces towards the VNFM. If it is set to True and this property is used in the context of the VirtualCp node type, IP configuration information should be provided for the VNF by a management entity using the NFV MANO interfaces towards the VNFM. If it is not provided, the CISM assigns an IP address. If it is set to False, the value of the ip_address_assignment_subtype property defines the method of IP address assignment. Shall be present if the fixed_ip_address property is not present and should be absent otherwise.
  //
  ip_address_assignment: lone boolean,

  // YAML ip_address_assignment_subtype: {'type': 'string', 'description': 'Method of IP address assignment in case the IP configuration is not provided using the NFV MANO interfaces towards the VNFM. Description of the valid values: (1) dynamic: the VNF gets an IP address that is dynamically assigned by the NFVI/VIM/CISM without receiving IP configuration information from the MANO interfaces, (2) vnf_pkg: an IP address defined by the VNF provider is assigned by means included as part of the VNF package (e.g., LCM script); (3) external: an IP address is provided by an external management entity (such as EM) directly towards the VNF. Shall be present in case the ip_address_assignment property is set to False and shall be absent otherwise.', 'required': False, 'constraints': [{'valid_values': ['dynamic', 'vnf_pkg', 'external']}]}
  //
  // Method of IP address assignment in case the IP configuration is not provided using the NFV MANO interfaces towards the VNFM. Description of the valid values: (1) dynamic: the VNF gets an IP address that is dynamically assigned by the NFVI/VIM/CISM without receiving IP configuration information from the MANO interfaces, (2) vnf_pkg: an IP address defined by the VNF provider is assigned by means included as part of the VNF package (e.g., LCM script); (3) external: an IP address is provided by an external management entity (such as EM) directly towards the VNF. Shall be present in case the ip_address_assignment property is set to False and shall be absent otherwise.
  //
  ip_address_assignment_subtype: lone string,

  // YAML floating_ip_activated: {'type': 'boolean', 'description': 'Specifies if the floating IP scheme is activated on the Connection Point or not', 'required': True}
  //
  // Specifies if the floating IP scheme is activated on the Connection Point or not
  //
  floating_ip_activated: one boolean,

  // YAML ip_address_type: {'type': 'string', 'description': 'Defines address type. The address type should be aligned with the address type supported by the layer_protocols properties of the connetion point', 'required': False, 'constraints': [{'valid_values': ['ipv4', 'ipv6']}]}
  //
  // Defines address type. The address type should be aligned with the address type supported by the layer_protocols properties of the connetion point
  //
  ip_address_type: lone string,

  // YAML number_of_ip_address: {'type': 'integer', 'description': 'Minimum number of IP addresses to be assigned', 'required': False, 'constraints': [{'greater_than': 0}]}
  //
  // Minimum number of IP addresses to be assigned
  //
  number_of_ip_address: lone integer,

  // YAML fixed_ip_address: {'type': 'list', 'description': 'Fixed IP addresses to be assigned to the internal CP instance. This property enables the VNF provider to define fixed IP addresses for internal CP instances to be assigned by the VNFM or the NFVO. This attribute property is only permitted for Cpds without external connectivity, i.e. connectivity outside the VNF. If present, it shall be compatible with the values of the L3ProtocolData of the VnfVirtualLink referred to by the Cp, if L3ProtocolData is included in the VnfVirtualLink', 'required': False, 'entry_schema': {'type': 'string'}}
  //
  // Fixed IP addresses to be assigned to the internal CP instance. This property enables the VNF provider to define fixed IP addresses for internal CP instances to be assigned by the VNFM or the NFVO. This attribute property is only permitted for Cpds without external connectivity, i.e. connectivity outside the VNF. If present, it shall be compatible with the values of the L3ProtocolData of the VnfVirtualLink referred to by the Cp, if L3ProtocolData is included in the VnfVirtualLink
  //
  fixed_ip_address: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  ip_address_assignment_subtype.valid_values["dynamic" + "vnf_pkg" + "external"]
  ip_address_type.valid_values["ipv4" + "ipv6"]
  some number_of_ip_address implies number_of_ip_address.greater_than[0]

}

/** There exists some tosca.datatypes.nfv.L3AddressData */
run Show_tosca_datatypes_nfv_L3AddressData {
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
  exactly 1 tosca_datatypes_nfv_L3AddressData
  expect 1

//
// Describes information about the addressing scheme and parameters applicable to a CP
//
sig tosca_datatypes_nfv_AddressData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML address_type: {'type': 'string', 'description': 'Describes the type of the address to be assigned to a connection point. The content type shall be aligned with the address type supported by the layerProtocol property of the connection point', 'required': True, 'constraints': [{'valid_values': ['mac_address', 'ip_address']}]}
  //
  // Describes the type of the address to be assigned to a connection point. The content type shall be aligned with the address type supported by the layerProtocol property of the connection point
  //
  address_type: one string,

  // YAML l2_address_data: {'type': 'tosca.datatypes.nfv.L2AddressData', 'description': 'Provides the information on the MAC addresses to be assigned to a connection point.', 'required': False}
  //
  // Provides the information on the MAC addresses to be assigned to a connection point.
  //
  l2_address_data: lone tosca_datatypes_nfv_L2AddressData,

  // YAML l3_address_data: {'type': 'tosca.datatypes.nfv.L3AddressData', 'description': 'Provides the information on the IP addresses to be assigned to a connection point', 'required': False}
  //
  // Provides the information on the IP addresses to be assigned to a connection point
  //
  l3_address_data: lone tosca_datatypes_nfv_L3AddressData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  address_type.valid_values["mac_address" + "ip_address"]

}

/** There exists some tosca.datatypes.nfv.AddressData */
run Show_tosca_datatypes_nfv_AddressData {
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
  exactly 1 tosca_datatypes_nfv_AddressData
  expect 1

//
// describes additional connectivity information of a virtualLink
//
sig tosca_datatypes_nfv_ConnectivityType extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML layer_protocols: {'type': 'list', 'description': 'Identifies the protocol a virtualLink gives access to (ethernet, mpls, odu2, ipv4, ipv6, pseudo-wire).The top layer protocol of the virtualLink protocol stack shall always be provided. The lower layer protocols may be included when there are specific requirements on these layers.', 'required': True, 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['ethernet', 'mpls', 'odu2', 'ipv4', 'ipv6', 'pseudo-wire']}]}}
  //
  // Identifies the protocol a virtualLink gives access to (ethernet, mpls, odu2, ipv4, ipv6, pseudo-wire).The top layer protocol of the virtualLink protocol stack shall always be provided. The lower layer protocols may be included when there are specific requirements on these layers.
  //
  layer_protocols: seq string,

  // YAML flow_pattern: {'type': 'string', 'description': 'Identifies the flow pattern of the connectivity', 'required': False, 'constraints': [{'valid_values': ['line', 'tree', 'mesh']}]}
  //
  // Identifies the flow pattern of the connectivity
  //
  flow_pattern: lone string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  layer_protocols.elems.valid_values["ethernet" + "mpls" + "odu2" + "ipv4" + "ipv6" + "pseudo-wire"]
  flow_pattern.valid_values["line" + "tree" + "mesh"]

}

/** There exists some tosca.datatypes.nfv.ConnectivityType */
run Show_tosca_datatypes_nfv_ConnectivityType {
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
  exactly 1 tosca_datatypes_nfv_ConnectivityType
  expect 1

//
// describes the requirements in terms of bitrate for a virtual link
//
sig tosca_datatypes_nfv_LinkBitrateRequirements extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML root: {'type': 'integer', 'description': 'Specifies the throughput requirement in bits per second of the link (e.g. bitrate of E-Line, root bitrate of E-Tree, aggregate capacity of E-LAN).', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Specifies the throughput requirement in bits per second of the link (e.g. bitrate of E-Line, root bitrate of E-Tree, aggregate capacity of E-LAN).
  //
  root: one integer,

  // YAML leaf: {'type': 'integer', 'description': 'Specifies the throughput requirement in bits per second of leaf connections to the link when applicable to the connectivity type (e.g. for E-Tree and E LAN branches).', 'required': False, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Specifies the throughput requirement in bits per second of leaf connections to the link when applicable to the connectivity type (e.g. for E-Tree and E LAN branches).
  //
  leaf: lone integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  root.greater_or_equal[0]
  some leaf implies leaf.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.LinkBitrateRequirements */
run Show_tosca_datatypes_nfv_LinkBitrateRequirements {
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
  exactly 1 tosca_datatypes_nfv_LinkBitrateRequirements
  expect 1

//
// Describes and associates the protocol layer that a CP uses together with other protocol and connection point information
//
sig tosca_datatypes_nfv_CpProtocolData extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML associated_layer_protocol: {'type': 'string', 'required': True, 'description': 'One of the values of the property layer_protocols of the CP', 'constraints': [{'valid_values': ['ethernet', 'mpls', 'odu2', 'ipv4', 'ipv6', 'pseudo-wire']}]}
  //
  // One of the values of the property layer_protocols of the CP
  //
  associated_layer_protocol: one string,

  // YAML address_data: {'type': 'list', 'description': 'Provides information on the addresses to be assigned to the CP', 'entry_schema': {'type': 'tosca.datatypes.nfv.AddressData'}, 'required': False}
  //
  // Provides information on the addresses to be assigned to the CP
  //
  address_data: seq tosca_datatypes_nfv_AddressData,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  associated_layer_protocol.valid_values["ethernet" + "mpls" + "odu2" + "ipv4" + "ipv6" + "pseudo-wire"]

}

/** There exists some tosca.datatypes.nfv.CpProtocolData */
run Show_tosca_datatypes_nfv_CpProtocolData {
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
  exactly 1 tosca_datatypes_nfv_CpProtocolData
  expect 1

//
// describes a profile for instantiating VNFs of a particular NS DF according to a specific VNFD and VNF DF.
//
sig tosca_datatypes_nfv_VnfProfile extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML instantiation_level: {'type': 'string', 'description': 'Identifier of the instantiation level of the VNF DF to be used for instantiation. If not present, the default instantiation level as declared in the VNFD shall be used.', 'required': False}
  //
  // Identifier of the instantiation level of the VNF DF to be used for instantiation. If not present, the default instantiation level as declared in the VNFD shall be used.
  //
  instantiation_level: lone string,

  // YAML target_vnf_scale_level_info: {'type': 'map', 'description': 'For each scaling aspect of the current VNF deployment flavour, it specifies the scale level of VNF constituents (e.g., VDU level) to be instantiated. If the property is present it shall contain all scaling aspects', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}
  //
  // For each scaling aspect of the current VNF deployment flavour, it specifies the scale level of VNF constituents (e.g., VDU level) to be instantiated. If the property is present it shall contain all scaling aspects
  //
  target_vnf_scale_level_info: lone TOSCA/map_data/Map,

  // YAML min_number_of_instances: {'type': 'integer', 'description': 'Minimum number of instances of the VNF based on this VNFD that is permitted to exist for this VnfProfile.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Minimum number of instances of the VNF based on this VNFD that is permitted to exist for this VnfProfile.
  //
  min_number_of_instances: one integer,

  // YAML max_number_of_instances: {'type': 'integer', 'description': 'Maximum number of instances of the VNF based on this VNFD that is permitted to exist for this VnfProfile.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Maximum number of instances of the VNF based on this VNFD that is permitted to exist for this VnfProfile.
  //
  max_number_of_instances: one integer,

  // YAML service_availability_level: {'type': 'integer', 'description': 'Specifies the service availability level for the VNF instance created from this profile.', 'required': False, 'constraints': [{'greater_or_equal': 1}]}
  //
  // Specifies the service availability level for the VNF instance created from this profile.
  //
  service_availability_level: lone integer,

  // YAML version_dependency: {'type': 'list', 'description': 'Identifies versions of descriptors of other constituents in the NSD upon which the VNF depends. The dependencies may be described for the VNFD referenced with descriptor_id in the VNF node where this profile is defined and for VNFDs with the same ext_invariant_id.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VersionDependency'}}
  //
  // Identifies versions of descriptors of other constituents in the NSD upon which the VNF depends. The dependencies may be described for the VNFD referenced with descriptor_id in the VNF node where this profile is defined and for VNFDs with the same ext_invariant_id.
  //
  version_dependency: seq tosca_datatypes_nfv_VersionDependency,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  min_number_of_instances.greater_or_equal[0]
  max_number_of_instances.greater_or_equal[0]
  some service_availability_level implies service_availability_level.greater_or_equal[1]

}

/** There exists some tosca.datatypes.nfv.VnfProfile */
run Show_tosca_datatypes_nfv_VnfProfile {
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
  exactly 1 tosca_datatypes_nfv_VnfProfile
  expect 1

//
// describes QoS data for a given VL used in a VNF deployment flavour
//
sig tosca_datatypes_nfv_Qos extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML latency: {'type': 'scalar-unit.time', 'description': 'Specifies the maximum latency', 'required': True, 'constraints': [{'greater_than': '0 s'}]}
  //
  // Specifies the maximum latency
  //
  latency: one scalar_unit_time,

  // YAML packet_delay_variation: {'type': 'scalar-unit.time', 'description': 'Specifies the maximum jitter', 'required': True, 'constraints': [{'greater_or_equal': '0 s'}]}
  //
  // Specifies the maximum jitter
  //
  packet_delay_variation: one scalar_unit_time,

  // YAML packet_loss_ratio: {'type': 'float', 'description': 'Specifies the maximum packet loss ratio', 'required': False, 'constraints': [{'in_range': [0.0, 1.0]}]}
  //
  // Specifies the maximum packet loss ratio
  //
  packet_loss_ratio: lone float,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  latency.greater_than[0, s]
  packet_delay_variation.greater_or_equal[0, s]
  some packet_loss_ratio implies packet_loss_ratio.in_range["0.0", "1.0"]

}

/** There exists some tosca.datatypes.nfv.Qos */
run Show_tosca_datatypes_nfv_Qos {
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
  exactly 1 tosca_datatypes_nfv_Qos
  expect 1

//
// Represents information on virtualised resource related performance metrics applicable to the VNF.
//
sig tosca_datatypes_nfv_VnfMonitoringParameter extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the monitoring parameter', 'required': True}
  //
  // Human readable name of the monitoring parameter
  //
  name: one string,

  // YAML performance_metric: {'type': 'string', 'description': 'Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.', 'required': True, 'constraints': [{'valid_values': ['v_cpu_usage_mean_vnf', 'v_cpu_usage_peak_vnf', 'v_memory_usage_mean_vnf', 'v_memory_usage_peak_vnf', 'v_disk_usage_mean_vnf', 'v_disk_usage_peak_vnf', 'byte_incoming_vnf_ext_cp', 'byte_outgoing_vnf_ext_cp', 'packet_incoming_vnf_ext_cp', 'packet_outgoing_vnf_ext_cp']}]}
  //
  // Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.
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

  performance_metric.valid_values["v_cpu_usage_mean_vnf" + "v_cpu_usage_peak_vnf" + "v_memory_usage_mean_vnf" + "v_memory_usage_peak_vnf" + "v_disk_usage_mean_vnf" + "v_disk_usage_peak_vnf" + "byte_incoming_vnf_ext_cp" + "byte_outgoing_vnf_ext_cp" + "packet_incoming_vnf_ext_cp" + "packet_outgoing_vnf_ext_cp"]
  some collection_period implies collection_period.greater_than[0, s]

}

/** There exists some tosca.datatypes.nfv.VnfMonitoringParameter */
run Show_tosca_datatypes_nfv_VnfMonitoringParameter {
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
  exactly 1 tosca_datatypes_nfv_VnfMonitoringParameter
  expect 1

//
// Describes and associates the protocol layer that a CP uses together with other protocol and connection point information.
//
sig tosca_datatypes_nfv_VersionDependency extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML dependent_constituent_id: {'type': 'string', 'description': 'Identifier of the NSD constituent which has version dependencies on other NSD constituents.', 'required': True}
  //
  // Identifier of the NSD constituent which has version dependencies on other NSD constituents.
  //
  dependent_constituent_id: one string,

  // YAML version_dependency_statement: {'type': 'list', 'description': 'Identifies one or multiple versions of an NSD constituent upon which the dependent constituent  identified by dependent_constituent_id has a dependency.', 'entry_schema': {'type': 'tosca.datatypes.nfv.VersionDependencyStatement'}, 'required': True}
  //
  // Identifies one or multiple versions of an NSD constituent upon which the dependent constituent  identified by dependent_constituent_id has a dependency.
  //
  version_dependency_statement: seq tosca_datatypes_nfv_VersionDependencyStatement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VersionDependency */
run Show_tosca_datatypes_nfv_VersionDependency {
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
  exactly 1 tosca_datatypes_nfv_VersionDependency
  expect 1

//
// Lists one or more VNF, NS or PNF descriptor identifiers which describe one single dependency.
//
sig tosca_datatypes_nfv_VersionDependencyStatement extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'description': 'List of identifiers of VNFDs, NSDs or PNFDs upon which the entity using this information element depends. When more than one descriptor is indicated, they shall correspond to versions of the same VNF, NS or PNF and they represent. alternatives, i.e. the presence of one of them fulfills the dependency.', 'type': 'list', 'entry_schema': {'type': 'string'}, 'required': True}
  //
  // List of identifiers of VNFDs, NSDs or PNFDs upon which the entity using this information element depends. When more than one descriptor is indicated, they shall correspond to versions of the same VNF, NS or PNF and they represent. alternatives, i.e. the presence of one of them fulfills the dependency.
  //
  descriptor_id: seq string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.VersionDependencyStatement */
run Show_tosca_datatypes_nfv_VersionDependencyStatement {
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
  exactly 1 tosca_datatypes_nfv_VersionDependencyStatement
  expect 1

//
// Indicates for a given scaleAspect the corresponding scaleLevel
//
sig tosca_datatypes_nfv_ScaleInfo extends tosca_datatypes_Root
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

/** There exists some tosca.datatypes.nfv.ScaleInfo */
run Show_tosca_datatypes_nfv_ScaleInfo {
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
  exactly 1 tosca_datatypes_nfv_ScaleInfo
  expect 1

// --------------------------------------------------
// Capability Types
// --------------------------------------------------

//
// A node type that includes the VirtualLinkable capability indicates that it can be pointed by tosca.relationships.nfv.VirtualLinksTo relationship type
//
sig tosca_capabilities_nfv_VirtualLinkable extends tosca_capabilities_Node
{
} {
}

/** There exists some tosca.capabilities.nfv.VirtualLinkable */
run Show_tosca_capabilities_nfv_VirtualLinkable {
  tosca_capabilities_nfv_VirtualLinkable.no_name[]
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
  exactly 1 tosca_capabilities_nfv_VirtualLinkable
  expect 1

// --------------------------------------------------
// Relationship Types
// --------------------------------------------------

//
// Represents an association relationship between the VduCp or the VnfExtCp and the VnfVirtualLink node types or the association between either a VnfExtCp, a VduCp, a VirtualCp, a PnfExtCp or a Sap and an NsVirtualLink node types.
//
sig tosca_relationships_nfv_VirtualLinksTo extends tosca_relationships_DependsOn
{
} {
  valid_target_types[tosca_capabilities_nfv_VirtualLinkable]
}

/** There exists some tosca.relationships.nfv.VirtualLinksTo */
run Show_tosca_relationships_nfv_VirtualLinksTo {
  tosca_relationships_nfv_VirtualLinksTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_VirtualLinksTo
  expect 1

//
// Represents an association relationship between the VipCp and a VnfVirtualLink node types or between the former and a NsVirtualLink node types.
//
sig tosca_relationships_nfv_VipVirtualLinksTo extends tosca_relationships_DependsOn
{
} {
  valid_target_types[tosca_capabilities_nfv_VirtualLinkable]
}

/** There exists some tosca.relationships.nfv.VipVirtualLinksTo */
run Show_tosca_relationships_nfv_VipVirtualLinksTo {
  tosca_relationships_nfv_VipVirtualLinksTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_VipVirtualLinksTo
  expect 1

// --------------------------------------------------
// Node Types
// --------------------------------------------------

//
// Provides information regarding the purpose of the connection point
//
sig tosca_nodes_nfv_Cp extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML layer_protocols: {'type': 'list', 'description': 'Identifies which protocol the connection point uses for connectivity purposes', 'required': True, 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['ethernet', 'mpls', 'odu2', 'ipv4', 'ipv6', 'pseudo-wire']}]}}
  //
  // Identifies which protocol the connection point uses for connectivity purposes
  //
  property_layer_protocols: seq string,

  // YAML ip_stack_mode: {'type': 'string', 'description': 'Specifies the capability of the CP to support IP dual stack or tunnelling', 'required': False, 'constraints': [{'valid_values': ['ipv4_xor_ipv6', 'ipv4_or_ipv6', 'tunnel_ipv6_over_ipv4', 'tunnel_ipv4_over_ipv6']}]}
  //
  // Specifies the capability of the CP to support IP dual stack or tunnelling
  //
  property_ip_stack_mode: lone string,

  // YAML role: {'type': 'string', 'description': 'Identifies the role of the port in the context of the traffic flow patterns in the VNF or parent NS', 'required': False, 'constraints': [{'valid_values': ['root', 'leaf']}]}
  //
  // Identifies the role of the port in the context of the traffic flow patterns in the VNF or parent NS
  //
  property_role: lone string,

  // YAML description: {'type': 'string', 'description': 'Provides human-readable information on the purpose of the connection point', 'required': False}
  //
  // Provides human-readable information on the purpose of the connection point
  //
  property_description: lone string,

  // YAML protocol: {'type': 'list', 'description': 'Provides information on the addresses to be assigned to the connection point(s) instantiated from this Connection Point Descriptor', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.CpProtocolData'}}
  //
  // Provides information on the addresses to be assigned to the connection point(s) instantiated from this Connection Point Descriptor
  //
  property_protocol: seq tosca_datatypes_nfv_CpProtocolData,

  // YAML trunk_mode: {'type': 'boolean', 'description': 'Provides information about whether the CP instantiated from this Cp is in Trunk mode (802.1Q or other), When operating in "trunk mode", the Cp is capable of carrying traffic for several VLANs. Absence of this property implies that trunkMode is not configured for the Cp i.e. It is equivalent to boolean value "false".', 'required': False}
  //
  // Provides information about whether the CP instantiated from this Cp is in Trunk mode (802.1Q or other), When operating in "trunk mode", the Cp is capable of carrying traffic for several VLANs. Absence of this property implies that trunkMode is not configured for the Cp i.e. It is equivalent to boolean value "false".
  //
  property_trunk_mode: lone boolean,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_layer_protocols.elems.valid_values["ethernet" + "mpls" + "odu2" + "ipv4" + "ipv6" + "pseudo-wire"]
  property_ip_stack_mode.valid_values["ipv4_xor_ipv6" + "ipv4_or_ipv6" + "tunnel_ipv6_over_ipv4" + "tunnel_ipv4_over_ipv6"]
  property_role.valid_values["root" + "leaf"]

}

/** There exists some tosca.nodes.nfv.Cp */
run Show_tosca_nodes_nfv_Cp {
  tosca_nodes_nfv_Cp.no_name[]
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
  exactly 1 tosca_nodes_nfv_Cp
  expect 1

// --------------------------------------------------
// Policy Types
// --------------------------------------------------

//
// The Abstract.SecurityGroupRule type represents an abstract policy type without any target requirements
//
sig tosca_policies_nfv_Abstract_SecurityGroupRule extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the security group rule.', 'required': False}
  //
  // Human readable description of the security group rule.
  //
  property_description: lone string,

  // YAML direction: {'type': 'string', 'description': "The direction in which the security group rule is applied. The direction of 'ingress' or 'egress' is specified against the associated CP. I.e., 'ingress' means the packets entering a CP, while 'egress' means the packets sent out of a CP.", 'required': True, 'constraints': [{'valid_values': ['ingress', 'egress']}], 'default': 'ingress'}
  //
  // The direction in which the security group rule is applied. The direction of 'ingress' or 'egress' is specified against the associated CP. I.e., 'ingress' means the packets entering a CP, while 'egress' means the packets sent out of a CP.
  //
  property_direction: one string,

  // YAML ether_type: {'type': 'string', 'description': 'Indicates the protocol carried over the Ethernet layer.', 'required': True, 'constraints': [{'valid_values': ['ipv4', 'ipv6']}], 'default': 'ipv4'}
  //
  // Indicates the protocol carried over the Ethernet layer.
  //
  property_ether_type: one string,

  // YAML protocol: {'type': 'string', 'description': 'Indicates the protocol carried over the IP layer. Permitted values include any protocol defined in the IANA protocol registry, e.g. TCP, UDP, ICMP, etc.', 'required': True, 'constraints': [{'valid_values': ['hopopt', 'icmp', 'igmp', 'ggp', 'ipv4', 'st', 'tcp', 'cbt', 'egp', 'igp', 'bbn_rcc_mon', 'nvp_ii', 'pup', 'argus', 'emcon', 'xnet', 'chaos', 'udp', 'mux', 'dcn_meas', 'hmp', 'prm', 'xns_idp', 'trunk_1', 'trunk_2', 'leaf_1', 'leaf_2', 'rdp', 'irtp', 'iso_tp4', 'netblt', 'mfe_nsp', 'merit_inp', 'dccp', '3pc', 'idpr', 'xtp', 'ddp', 'idpr_cmtp', 'tp++', 'il', 'ipv6', 'sdrp', 'ipv6_route', 'ipv6_frag', 'idrp', 'rsvp', 'gre', 'dsr', 'bna', 'esp', 'ah', 'i_nlsp', 'swipe', 'narp', 'mobile', 'tlsp', 'skip', 'ipv6_icmp', 'ipv6_no_nxt', 'ipv6_opts', 'cftp', 'sat_expak', 'kryptolan', 'rvd', 'ippc', 'sat_mon', 'visa', 'ipcv', 'cpnx', 'cphb', 'wsn', 'pvp', 'br_sat_mon', 'sun_nd', 'wb_mon', 'wb_expak', 'iso_ip', 'vmtp', 'secure_vmtp', 'vines', 'ttp', 'iptm', 'nsfnet_igp', 'dgp', 'tcf', 'eigrp', 'ospfigp', 'sprite_rpc', 'larp', 'mtp', 'ax.25', 'ipip', 'micp', 'scc_sp', 'etherip', 'encap', 'gmtp', 'ifmp', 'pnni', 'pim', 'aris', 'scps', 'qnx', 'a/n', 'ip_comp', 'snp', 'compaq_peer', 'ipx_in_ip', 'vrrp', 'pgm', 'l2tp', 'ddx', 'iatp', 'stp', 'srp', 'uti', 'smp', 'sm', 'ptp', 'isis', 'fire', 'crtp', 'crudp', 'sscopmce', 'iplt', 'sps', 'pipe', 'sctp', 'fc', 'rsvp_e2e_ignore', 'mobility', 'udp_lite', 'mpls_in_ip', 'manet', 'hip', 'shim6', 'wesp', 'rohc']}], 'default': 'tcp'}
  //
  // Indicates the protocol carried over the IP layer. Permitted values include any protocol defined in the IANA protocol registry, e.g. TCP, UDP, ICMP, etc.
  //
  property_protocol: one string,

  // YAML port_range_min: {'type': 'integer', 'description': 'Indicates minimum port number in the range that is matched by the security group rule. If a value is provided at design-time, this value may be overridden at run-time based on other deployment requirements or constraints.', 'required': True, 'constraints': [{'greater_or_equal': 0}, {'less_or_equal': 65535}], 'default': 0}
  //
  // Indicates minimum port number in the range that is matched by the security group rule. If a value is provided at design-time, this value may be overridden at run-time based on other deployment requirements or constraints.
  //
  property_port_range_min: one integer,

  // YAML port_range_max: {'type': 'integer', 'description': 'Indicates maximum port number in the range that is matched by the security group rule. If a value is provided at design-time, this value may be overridden at run-time based on other deployment requirements or constraints.', 'required': True, 'constraints': [{'greater_or_equal': 0}, {'less_or_equal': 65535}], 'default': 65535}
  //
  // Indicates maximum port number in the range that is matched by the security group rule. If a value is provided at design-time, this value may be overridden at run-time based on other deployment requirements or constraints.
  //
  property_port_range_max: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_direction.valid_values["ingress" + "egress"]
  property_ether_type.valid_values["ipv4" + "ipv6"]
  property_protocol.valid_values["hopopt" + "icmp" + "igmp" + "ggp" + "ipv4" + "st" + "tcp" + "cbt" + "egp" + "igp" + "bbn_rcc_mon" + "nvp_ii" + "pup" + "argus" + "emcon" + "xnet" + "chaos" + "udp" + "mux" + "dcn_meas" + "hmp" + "prm" + "xns_idp" + "trunk_1" + "trunk_2" + "leaf_1" + "leaf_2" + "rdp" + "irtp" + "iso_tp4" + "netblt" + "mfe_nsp" + "merit_inp" + "dccp" + "3pc" + "idpr" + "xtp" + "ddp" + "idpr_cmtp" + "tp++" + "il" + "ipv6" + "sdrp" + "ipv6_route" + "ipv6_frag" + "idrp" + "rsvp" + "gre" + "dsr" + "bna" + "esp" + "ah" + "i_nlsp" + "swipe" + "narp" + "mobile" + "tlsp" + "skip" + "ipv6_icmp" + "ipv6_no_nxt" + "ipv6_opts" + "cftp" + "sat_expak" + "kryptolan" + "rvd" + "ippc" + "sat_mon" + "visa" + "ipcv" + "cpnx" + "cphb" + "wsn" + "pvp" + "br_sat_mon" + "sun_nd" + "wb_mon" + "wb_expak" + "iso_ip" + "vmtp" + "secure_vmtp" + "vines" + "ttp" + "iptm" + "nsfnet_igp" + "dgp" + "tcf" + "eigrp" + "ospfigp" + "sprite_rpc" + "larp" + "mtp" + "ax.25" + "ipip" + "micp" + "scc_sp" + "etherip" + "encap" + "gmtp" + "ifmp" + "pnni" + "pim" + "aris" + "scps" + "qnx" + "a/n" + "ip_comp" + "snp" + "compaq_peer" + "ipx_in_ip" + "vrrp" + "pgm" + "l2tp" + "ddx" + "iatp" + "stp" + "srp" + "uti" + "smp" + "sm" + "ptp" + "isis" + "fire" + "crtp" + "crudp" + "sscopmce" + "iplt" + "sps" + "pipe" + "sctp" + "fc" + "rsvp_e2e_ignore" + "mobility" + "udp_lite" + "mpls_in_ip" + "manet" + "hip" + "shim6" + "wesp" + "rohc"]
  property_port_range_min.greater_or_equal[0]
  property_port_range_min.less_or_equal[127]
  property_port_range_max.greater_or_equal[0]
  property_port_range_max.less_or_equal[127]

}

/** There exists some tosca.policies.nfv.Abstract.SecurityGroupRule */
run Show_tosca_policies_nfv_Abstract_SecurityGroupRule {
  tosca_policies_nfv_Abstract_SecurityGroupRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_Abstract_SecurityGroupRule
  expect 1

