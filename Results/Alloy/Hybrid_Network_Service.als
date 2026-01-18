// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: Network Service Descriptor for interconnecting VNF1, VNF2, and CNF

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_nsd_types_4_4_1
open VNF1_scalable
open VNF2_scalable
open CNF3_scalable

// --------------------------------------------------
// Node Types
// --------------------------------------------------

sig tosca_nodes_nfv_MultiVNF_NS extends tosca_nodes_nfv_NS
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'type': 'string', 'default': 'multi-vnf-ns-001'}
  // NOTE: descriptor_id overloaded

  // YAML designer: {'type': 'string', 'default': 'MyCompany'}
  // NOTE: designer overloaded

  // YAML version: {'type': 'string', 'default': '1.0'}
  // NOTE: version overloaded

  // YAML name: {'type': 'string', 'default': 'Multi-VNF Network Service'}
  // NOTE: name overloaded

  // YAML invariant_id: {'type': 'string', 'default': 'multi-vnf-ns-invariant-001'}
  // NOTE: invariant_id overloaded

  // YAML flavour_id: {'type': 'string', 'default': 'default_flavour'}
  // NOTE: flavour_id overloaded

  // YAML flavour_description: {'type': 'string', 'default': 'Default flavour for multi-VNF network service'}
  property_flavour_description: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.nodes.nfv.MultiVNF_NS */
run Show_tosca_nodes_nfv_MultiVNF_NS {
  tosca_nodes_nfv_MultiVNF_NS.no_name[]
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
  exactly 1 tosca_nodes_nfv_MultiVNF_NS
  expect 1

// --------------------------------------------------
// Topology Template
// --------------------------------------------------

sig Hybrid_Network_Service_topology_template extends TOSCA/TopologyTemplate
{
  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  // YAML vl_mgmt_network: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'mesh'}, 'description': 'Management network for all VNFs and CNF', 'vl_profile': {'max_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'min_bitrate_requirements': {'root': 100000, 'leaf': 10000}, 'qos': {'priority': 2, 'latency': '10 ms', 'packet_delay_variation': '5 ms', 'packet_loss_ratio': 0.001}, 'service_availability_level': 7}, 'test_access': []}}
  // YAML type: tosca.nodes.nfv.NsVirtualLink
  vl_mgmt_network: one tosca_nodes_nfv_NsVirtualLink,

  // YAML vl_data_network: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}, 'description': 'Data plane network connecting VNF1, VNF2, and CNF', 'vl_profile': {'max_bitrate_requirements': {'root': 10000000, 'leaf': 1000000}, 'min_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'qos': {'priority': 1, 'latency': '5 ms', 'packet_delay_variation': '2 ms', 'packet_loss_ratio': 0.0001}, 'service_availability_level': 7}, 'test_access': []}}
  // YAML type: tosca.nodes.nfv.NsVirtualLink
  vl_data_network: one tosca_nodes_nfv_NsVirtualLink,

  // YAML vl_vnf1_to_vnf2: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}, 'description': 'Direct link from VNF1 to VNF2', 'vl_profile': {'max_bitrate_requirements': {'root': 5000000, 'leaf': 500000}, 'min_bitrate_requirements': {'root': 500000, 'leaf': 50000}, 'qos': {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}}, 'test_access': []}}
  // YAML type: tosca.nodes.nfv.NsVirtualLink
  vl_vnf1_to_vnf2: one tosca_nodes_nfv_NsVirtualLink,

  // YAML vl_vnf2_to_cnf: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}, 'description': 'Direct link from VNF2 to CNF', 'vl_profile': {'max_bitrate_requirements': {'root': 5000000, 'leaf': 500000}, 'min_bitrate_requirements': {'root': 500000, 'leaf': 50000}, 'qos': {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}}, 'test_access': []}}
  // YAML type: tosca.nodes.nfv.NsVirtualLink
  vl_vnf2_to_cnf: one tosca_nodes_nfv_NsVirtualLink,

  // YAML vnf1_instance: {'type': 'tosca.nodes.nfv.example_VNF1', 'properties': {'flavour_id': 'scalable_ha'}, 'requirements': [{'virtual_link': 'vl_mgmt_network'}, {'virtual_link_external': 'vl_mgmt_network'}]}
  // YAML type: tosca.nodes.nfv.example_VNF1
  vnf1_instance: one tosca_nodes_nfv_example_VNF1,

  // YAML vnf2_instance: {'type': 'tosca.nodes.nfv.example_VNF2', 'properties': {'flavour_id': 'scalable_ha'}, 'requirements': [{'virtual_link': 'vl_data_network'}, {'virtual_link_external': 'vl_mgmt_network'}]}
  // YAML type: tosca.nodes.nfv.example_VNF2
  vnf2_instance: one tosca_nodes_nfv_example_VNF2,

  // YAML cnf_instance: {'type': 'tosca.nodes.nfv.example_CNF', 'properties': {'flavour_id': 'scalable_ha_container'}, 'requirements': [{'virtual_link': 'vl_vnf2_to_cnf'}, {'virtual_link_external': 'vl_mgmt_network'}]}
  // YAML type: tosca.nodes.nfv.example_CNF
  cnf_instance: one tosca_nodes_nfv_example_CNF,

  // YAML sap_mgmt: {'type': 'tosca.nodes.nfv.Sap', 'properties': {'layer_protocols': ['ipv4'], 'role': 'root', 'description': 'Service access point for management', 'protocol': [], 'trunk_mode': False}, 'requirements': [{'internal_virtual_link': 'vl_mgmt_network'}]}
  // YAML type: tosca.nodes.nfv.Sap
  sap_mgmt: one tosca_nodes_nfv_Sap,

  // YAML sap_data: {'type': 'tosca.nodes.nfv.Sap', 'properties': {'layer_protocols': ['ipv4'], 'role': 'root', 'description': 'Service access point for data plane', 'protocol': [], 'trunk_mode': False}, 'requirements': [{'internal_virtual_link': 'vl_data_network'}]}
  // YAML type: tosca.nodes.nfv.Sap
  sap_data: one tosca_nodes_nfv_Sap,

  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML policies:
  // --------------------------------------------------

  // YAML ns_instantiation_levels: {'type': 'tosca.policies.nfv.NsInstantiationLevels', 'properties': {'ns_levels': {'default': {'description': 'Default instantiation level'}, 'small': {'description': 'Small deployment with minimal resources'}, 'medium': {'description': 'Medium deployment with moderate resources'}, 'large': {'description': 'Large deployment with maximum resources'}}, 'default_level': 'default'}}
  // YAML type: tosca.policies.nfv.NsInstantiationLevels
  policy_ns_instantiation_levels: one tosca_policies_nfv_NsInstantiationLevels,

  // YAML vnf1_to_level_mapping: {'type': 'tosca.policies.nfv.VnfToLevelMapping', 'targets': ['vnf1_instance'], 'properties': {'aspect': 'ns_scaling_aspect', 'number_of_instances': {'default': 1, 'small': 1, 'medium': 2, 'large': 3}}}
  // YAML type: tosca.policies.nfv.VnfToLevelMapping
  policy_vnf1_to_level_mapping: one tosca_policies_nfv_VnfToLevelMapping,

  // YAML vnf2_to_level_mapping: {'type': 'tosca.policies.nfv.VnfToLevelMapping', 'targets': ['vnf2_instance'], 'properties': {'aspect': 'ns_scaling_aspect', 'number_of_instances': {'default': 1, 'small': 1, 'medium': 2, 'large': 3}}}
  // YAML type: tosca.policies.nfv.VnfToLevelMapping
  policy_vnf2_to_level_mapping: one tosca_policies_nfv_VnfToLevelMapping,

  // YAML cnf_to_level_mapping: {'type': 'tosca.policies.nfv.VnfToLevelMapping', 'targets': ['cnf_instance'], 'properties': {'aspect': 'ns_scaling_aspect', 'number_of_instances': {'default': 1, 'small': 1, 'medium': 2, 'large': 3}}}
  // YAML type: tosca.policies.nfv.VnfToLevelMapping
  policy_cnf_to_level_mapping: one tosca_policies_nfv_VnfToLevelMapping,

  // YAML vl_mgmt_to_level_mapping: {'type': 'tosca.policies.nfv.VirtualLinkToLevelMapping', 'targets': ['vl_mgmt_network'], 'properties': {'aspect': 'ns_scaling_aspect', 'bit_rate_requirements': {'default': {'root': 100000, 'leaf': 10000}, 'small': {'root': 100000, 'leaf': 10000}, 'medium': {'root': 500000, 'leaf': 50000}, 'large': {'root': 1000000, 'leaf': 100000}}}}
  // YAML type: tosca.policies.nfv.VirtualLinkToLevelMapping
  policy_vl_mgmt_to_level_mapping: one tosca_policies_nfv_VirtualLinkToLevelMapping,

  // YAML vl_data_to_level_mapping: {'type': 'tosca.policies.nfv.VirtualLinkToLevelMapping', 'targets': ['vl_data_network'], 'properties': {'aspect': 'ns_scaling_aspect', 'bit_rate_requirements': {'default': {'root': 1000000, 'leaf': 100000}, 'small': {'root': 1000000, 'leaf': 100000}, 'medium': {'root': 5000000, 'leaf': 500000}, 'large': {'root': 10000000, 'leaf': 1000000}}}}
  // YAML type: tosca.policies.nfv.VirtualLinkToLevelMapping
  policy_vl_data_to_level_mapping: one tosca_policies_nfv_VirtualLinkToLevelMapping,

  // YAML ns_scaling_aspects: {'type': 'tosca.policies.nfv.NsScalingAspects', 'properties': {'aspects': {'ns_scaling_aspect': {'name': 'ns_scaling_aspect', 'description': 'Network Service horizontal scaling', 'ns_scale_levels': {0: {'description': 'Base level'}, 1: {'description': 'Scale level 1'}, 2: {'description': 'Scale level 2'}, 3: {'description': 'Maximum scale level'}}}}}}
  // YAML type: tosca.policies.nfv.NsScalingAspects
  policy_ns_scaling_aspects: one tosca_policies_nfv_NsScalingAspects,

  // --------------------------------------------------
  // YAML outputs:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML substitution_mappings:
  // --------------------------------------------------

  // YAML substitution_mappings: {'node_type': 'tosca.nodes.nfv.MultiVNF_NS', 'requirements': [{'virtual_link': ['sap_mgmt', 'external_virtual_link']}]}
  // YAML node_type: tosca.nodes.nfv.MultiVNF_NS
  substitution_mappings: one tosca_nodes_nfv_MultiVNF_NS,

} {
  // YAML description: None
  no description

  // --------------------------------------------------
  // YAML inputs:
  // --------------------------------------------------

  #inputs = 2
  // YAML inputs:
  // YAML   external_mgmt_network:
  one input_external_mgmt_network : input["external_mgmt_network"] {
    // YAML type: string
    input_external_mgmt_network.type = "string"
    input_external_mgmt_network.type[string]
    // YAML description: External management network ID
    input_external_mgmt_network.description = "External management network ID"
    // YAML required: true
    input_external_mgmt_network.required[true]
    // YAML  default: ext-mgmt-net
    (string<:input_external_mgmt_network.default) = "ext-mgmt-net"
    // YAML status: supported
    input_external_mgmt_network.status = "supported"
    no input_external_mgmt_network.external_schema
    no input_external_mgmt_network.metadata
  }
  // YAML   external_data_network:
  one input_external_data_network : input["external_data_network"] {
    // YAML type: string
    input_external_data_network.type = "string"
    input_external_data_network.type[string]
    // YAML description: External data network ID
    input_external_data_network.description = "External data network ID"
    // YAML required: true
    input_external_data_network.required[true]
    // YAML  default: ext-data-net
    (string<:input_external_data_network.default) = "ext-data-net"
    // YAML status: supported
    input_external_data_network.status = "supported"
    no input_external_data_network.external_schema
    no input_external_data_network.metadata
  }

  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  #nodes = 9
  // YAML vl_mgmt_network: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'mesh'}, 'description': 'Management network for all VNFs and CNF', 'vl_profile': {'max_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'min_bitrate_requirements': {'root': 100000, 'leaf': 10000}, 'qos': {'priority': 2, 'latency': '10 ms', 'packet_delay_variation': '5 ms', 'packet_loss_ratio': 0.001}, 'service_availability_level': 7}, 'test_access': []}}
  node[vl_mgmt_network]
  vl_mgmt_network.name["vl_mgmt_network"]
  vl_mgmt_network.node_type_name = "tosca.nodes.nfv.NsVirtualLink"
  // YAML properties:
  // YAML vl_profile: {'max_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'min_bitrate_requirements': {'root': 100000, 'leaf': 10000}, 'qos': {'priority': 2, 'latency': '10 ms', 'packet_delay_variation': '5 ms', 'packet_loss_ratio': 0.001}, 'service_availability_level': 7}
  // YAML max_bitrate_requirements: {'root': 1000000, 'leaf': 100000}
  // YAML root: 1000000
  vl_mgmt_network.property_vl_profile.max_bitrate_requirements.root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  vl_mgmt_network.property_vl_profile.max_bitrate_requirements.leaf = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML min_bitrate_requirements: {'root': 100000, 'leaf': 10000}
  // YAML root: 100000
  vl_mgmt_network.property_vl_profile.min_bitrate_requirements.root = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML leaf: 10000
  vl_mgmt_network.property_vl_profile.min_bitrate_requirements.leaf = 127 // ISSUE: 10000 is a too big integer!!!
  // YAML qos: {'priority': 2, 'latency': '10 ms', 'packet_delay_variation': '5 ms', 'packet_loss_ratio': 0.001}
  // YAML latency: 10 ms
  vl_mgmt_network.property_vl_profile.qos.latency.init[10, ms]
  // YAML packet_delay_variation: 5 ms
  vl_mgmt_network.property_vl_profile.qos.packet_delay_variation.init[5, ms]
  // YAML packet_loss_ratio: 0.001
  vl_mgmt_network.property_vl_profile.qos.packet_loss_ratio = "0.001"
  // YAML priority: 2
  vl_mgmt_network.property_vl_profile.qos.priority = 2
  // YAML service_availability_level: 7
  vl_mgmt_network.property_vl_profile.service_availability_level = 7
  // NOTE: The property 'virtual_link_protocol_data' is not required.
  no   vl_mgmt_network.property_vl_profile.virtual_link_protocol_data
  // NOTE: The property 'data_flow_mirroring' is not required.
  no   vl_mgmt_network.property_vl_profile.data_flow_mirroring
  // YAML connectivity_type: {'layer_protocols': ['ipv4'], 'flow_pattern': 'mesh'}
  // YAML layer_protocols: ['ipv4']
  #vl_mgmt_network.property_connectivity_type.layer_protocols = 1
  vl_mgmt_network.property_connectivity_type.layer_protocols[0] = "ipv4"
  // YAML flow_pattern: mesh
  vl_mgmt_network.property_connectivity_type.flow_pattern = "mesh"
  // YAML test_access: []
  no vl_mgmt_network.property_test_access
  // YAML description: Management network for all VNFs and CNF
  vl_mgmt_network.property_description = "Management network for all VNFs and CNF"
  // YAML interfaces:
  #vl_mgmt_network.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vl_mgmt_network.interface_Standard.operation_create.implementation
  no vl_mgmt_network.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vl_mgmt_network.interface_Standard.operation_configure.implementation
  no vl_mgmt_network.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vl_mgmt_network.interface_Standard.operation_start.implementation
  no vl_mgmt_network.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vl_mgmt_network.interface_Standard.operation_stop.implementation
  no vl_mgmt_network.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vl_mgmt_network.interface_Standard.operation_delete.implementation
  no vl_mgmt_network.interface_Standard.operation_delete.inputs
  #vl_mgmt_network.interface_Standard.operations = 5
  // YAML artifacts:
  no vl_mgmt_network.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_linkable: None

  // YAML vl_data_network: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}, 'description': 'Data plane network connecting VNF1, VNF2, and CNF', 'vl_profile': {'max_bitrate_requirements': {'root': 10000000, 'leaf': 1000000}, 'min_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'qos': {'priority': 1, 'latency': '5 ms', 'packet_delay_variation': '2 ms', 'packet_loss_ratio': 0.0001}, 'service_availability_level': 7}, 'test_access': []}}
  node[vl_data_network]
  vl_data_network.name["vl_data_network"]
  vl_data_network.node_type_name = "tosca.nodes.nfv.NsVirtualLink"
  // YAML properties:
  // YAML vl_profile: {'max_bitrate_requirements': {'root': 10000000, 'leaf': 1000000}, 'min_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'qos': {'priority': 1, 'latency': '5 ms', 'packet_delay_variation': '2 ms', 'packet_loss_ratio': 0.0001}, 'service_availability_level': 7}
  // YAML max_bitrate_requirements: {'root': 10000000, 'leaf': 1000000}
  // YAML root: 10000000
  vl_data_network.property_vl_profile.max_bitrate_requirements.root = 127 // ISSUE: 10000000 is a too big integer!!!
  // YAML leaf: 1000000
  vl_data_network.property_vl_profile.max_bitrate_requirements.leaf = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML min_bitrate_requirements: {'root': 1000000, 'leaf': 100000}
  // YAML root: 1000000
  vl_data_network.property_vl_profile.min_bitrate_requirements.root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  vl_data_network.property_vl_profile.min_bitrate_requirements.leaf = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML qos: {'priority': 1, 'latency': '5 ms', 'packet_delay_variation': '2 ms', 'packet_loss_ratio': 0.0001}
  // YAML latency: 5 ms
  vl_data_network.property_vl_profile.qos.latency.init[5, ms]
  // YAML packet_delay_variation: 2 ms
  vl_data_network.property_vl_profile.qos.packet_delay_variation.init[2, ms]
  // YAML packet_loss_ratio: 0.0001
  vl_data_network.property_vl_profile.qos.packet_loss_ratio = "0.0001"
  // YAML priority: 1
  vl_data_network.property_vl_profile.qos.priority = 1
  // YAML service_availability_level: 7
  vl_data_network.property_vl_profile.service_availability_level = 7
  // NOTE: The property 'virtual_link_protocol_data' is not required.
  no   vl_data_network.property_vl_profile.virtual_link_protocol_data
  // NOTE: The property 'data_flow_mirroring' is not required.
  no   vl_data_network.property_vl_profile.data_flow_mirroring
  // YAML connectivity_type: {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}
  // YAML layer_protocols: ['ipv4']
  #vl_data_network.property_connectivity_type.layer_protocols = 1
  vl_data_network.property_connectivity_type.layer_protocols[0] = "ipv4"
  // YAML flow_pattern: line
  vl_data_network.property_connectivity_type.flow_pattern = "line"
  // YAML test_access: []
  no vl_data_network.property_test_access
  // YAML description: Data plane network connecting VNF1, VNF2, and CNF
  vl_data_network.property_description = "Data plane network connecting VNF1, VNF2, and CNF"
  // YAML interfaces:
  #vl_data_network.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vl_data_network.interface_Standard.operation_create.implementation
  no vl_data_network.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vl_data_network.interface_Standard.operation_configure.implementation
  no vl_data_network.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vl_data_network.interface_Standard.operation_start.implementation
  no vl_data_network.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vl_data_network.interface_Standard.operation_stop.implementation
  no vl_data_network.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vl_data_network.interface_Standard.operation_delete.implementation
  no vl_data_network.interface_Standard.operation_delete.inputs
  #vl_data_network.interface_Standard.operations = 5
  // YAML artifacts:
  no vl_data_network.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_linkable: None

  // YAML vl_vnf1_to_vnf2: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}, 'description': 'Direct link from VNF1 to VNF2', 'vl_profile': {'max_bitrate_requirements': {'root': 5000000, 'leaf': 500000}, 'min_bitrate_requirements': {'root': 500000, 'leaf': 50000}, 'qos': {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}}, 'test_access': []}}
  node[vl_vnf1_to_vnf2]
  vl_vnf1_to_vnf2.name["vl_vnf1_to_vnf2"]
  vl_vnf1_to_vnf2.node_type_name = "tosca.nodes.nfv.NsVirtualLink"
  // YAML properties:
  // YAML vl_profile: {'max_bitrate_requirements': {'root': 5000000, 'leaf': 500000}, 'min_bitrate_requirements': {'root': 500000, 'leaf': 50000}, 'qos': {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}}
  // YAML max_bitrate_requirements: {'root': 5000000, 'leaf': 500000}
  // YAML root: 5000000
  vl_vnf1_to_vnf2.property_vl_profile.max_bitrate_requirements.root = 127 // ISSUE: 5000000 is a too big integer!!!
  // YAML leaf: 500000
  vl_vnf1_to_vnf2.property_vl_profile.max_bitrate_requirements.leaf = 127 // ISSUE: 500000 is a too big integer!!!
  // YAML min_bitrate_requirements: {'root': 500000, 'leaf': 50000}
  // YAML root: 500000
  vl_vnf1_to_vnf2.property_vl_profile.min_bitrate_requirements.root = 127 // ISSUE: 500000 is a too big integer!!!
  // YAML leaf: 50000
  vl_vnf1_to_vnf2.property_vl_profile.min_bitrate_requirements.leaf = 127 // ISSUE: 50000 is a too big integer!!!
  // YAML qos: {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}
  // YAML latency: 3 ms
  vl_vnf1_to_vnf2.property_vl_profile.qos.latency.init[3, ms]
  // YAML packet_delay_variation: 1 ms
  vl_vnf1_to_vnf2.property_vl_profile.qos.packet_delay_variation.init[1, ms]
  // YAML packet_loss_ratio: 0.0001
  vl_vnf1_to_vnf2.property_vl_profile.qos.packet_loss_ratio = "0.0001"
  // YAML priority: 1
  vl_vnf1_to_vnf2.property_vl_profile.qos.priority = 1
  // NOTE: The property 'service_availability_level' is not required.
  no   vl_vnf1_to_vnf2.property_vl_profile.service_availability_level
  // NOTE: The property 'virtual_link_protocol_data' is not required.
  no   vl_vnf1_to_vnf2.property_vl_profile.virtual_link_protocol_data
  // NOTE: The property 'data_flow_mirroring' is not required.
  no   vl_vnf1_to_vnf2.property_vl_profile.data_flow_mirroring
  // YAML connectivity_type: {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}
  // YAML layer_protocols: ['ipv4']
  #vl_vnf1_to_vnf2.property_connectivity_type.layer_protocols = 1
  vl_vnf1_to_vnf2.property_connectivity_type.layer_protocols[0] = "ipv4"
  // YAML flow_pattern: line
  vl_vnf1_to_vnf2.property_connectivity_type.flow_pattern = "line"
  // YAML test_access: []
  no vl_vnf1_to_vnf2.property_test_access
  // YAML description: Direct link from VNF1 to VNF2
  vl_vnf1_to_vnf2.property_description = "Direct link from VNF1 to VNF2"
  // YAML interfaces:
  #vl_vnf1_to_vnf2.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vl_vnf1_to_vnf2.interface_Standard.operation_create.implementation
  no vl_vnf1_to_vnf2.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vl_vnf1_to_vnf2.interface_Standard.operation_configure.implementation
  no vl_vnf1_to_vnf2.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vl_vnf1_to_vnf2.interface_Standard.operation_start.implementation
  no vl_vnf1_to_vnf2.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vl_vnf1_to_vnf2.interface_Standard.operation_stop.implementation
  no vl_vnf1_to_vnf2.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vl_vnf1_to_vnf2.interface_Standard.operation_delete.implementation
  no vl_vnf1_to_vnf2.interface_Standard.operation_delete.inputs
  #vl_vnf1_to_vnf2.interface_Standard.operations = 5
  // YAML artifacts:
  no vl_vnf1_to_vnf2.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_linkable: None

  // YAML vl_vnf2_to_cnf: {'type': 'tosca.nodes.nfv.NsVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}, 'description': 'Direct link from VNF2 to CNF', 'vl_profile': {'max_bitrate_requirements': {'root': 5000000, 'leaf': 500000}, 'min_bitrate_requirements': {'root': 500000, 'leaf': 50000}, 'qos': {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}}, 'test_access': []}}
  node[vl_vnf2_to_cnf]
  vl_vnf2_to_cnf.name["vl_vnf2_to_cnf"]
  vl_vnf2_to_cnf.node_type_name = "tosca.nodes.nfv.NsVirtualLink"
  // YAML properties:
  // YAML vl_profile: {'max_bitrate_requirements': {'root': 5000000, 'leaf': 500000}, 'min_bitrate_requirements': {'root': 500000, 'leaf': 50000}, 'qos': {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}}
  // YAML max_bitrate_requirements: {'root': 5000000, 'leaf': 500000}
  // YAML root: 5000000
  vl_vnf2_to_cnf.property_vl_profile.max_bitrate_requirements.root = 127 // ISSUE: 5000000 is a too big integer!!!
  // YAML leaf: 500000
  vl_vnf2_to_cnf.property_vl_profile.max_bitrate_requirements.leaf = 127 // ISSUE: 500000 is a too big integer!!!
  // YAML min_bitrate_requirements: {'root': 500000, 'leaf': 50000}
  // YAML root: 500000
  vl_vnf2_to_cnf.property_vl_profile.min_bitrate_requirements.root = 127 // ISSUE: 500000 is a too big integer!!!
  // YAML leaf: 50000
  vl_vnf2_to_cnf.property_vl_profile.min_bitrate_requirements.leaf = 127 // ISSUE: 50000 is a too big integer!!!
  // YAML qos: {'priority': 1, 'latency': '3 ms', 'packet_delay_variation': '1 ms', 'packet_loss_ratio': 0.0001}
  // YAML latency: 3 ms
  vl_vnf2_to_cnf.property_vl_profile.qos.latency.init[3, ms]
  // YAML packet_delay_variation: 1 ms
  vl_vnf2_to_cnf.property_vl_profile.qos.packet_delay_variation.init[1, ms]
  // YAML packet_loss_ratio: 0.0001
  vl_vnf2_to_cnf.property_vl_profile.qos.packet_loss_ratio = "0.0001"
  // YAML priority: 1
  vl_vnf2_to_cnf.property_vl_profile.qos.priority = 1
  // NOTE: The property 'service_availability_level' is not required.
  no   vl_vnf2_to_cnf.property_vl_profile.service_availability_level
  // NOTE: The property 'virtual_link_protocol_data' is not required.
  no   vl_vnf2_to_cnf.property_vl_profile.virtual_link_protocol_data
  // NOTE: The property 'data_flow_mirroring' is not required.
  no   vl_vnf2_to_cnf.property_vl_profile.data_flow_mirroring
  // YAML connectivity_type: {'layer_protocols': ['ipv4'], 'flow_pattern': 'line'}
  // YAML layer_protocols: ['ipv4']
  #vl_vnf2_to_cnf.property_connectivity_type.layer_protocols = 1
  vl_vnf2_to_cnf.property_connectivity_type.layer_protocols[0] = "ipv4"
  // YAML flow_pattern: line
  vl_vnf2_to_cnf.property_connectivity_type.flow_pattern = "line"
  // YAML test_access: []
  no vl_vnf2_to_cnf.property_test_access
  // YAML description: Direct link from VNF2 to CNF
  vl_vnf2_to_cnf.property_description = "Direct link from VNF2 to CNF"
  // YAML interfaces:
  #vl_vnf2_to_cnf.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vl_vnf2_to_cnf.interface_Standard.operation_create.implementation
  no vl_vnf2_to_cnf.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vl_vnf2_to_cnf.interface_Standard.operation_configure.implementation
  no vl_vnf2_to_cnf.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vl_vnf2_to_cnf.interface_Standard.operation_start.implementation
  no vl_vnf2_to_cnf.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vl_vnf2_to_cnf.interface_Standard.operation_stop.implementation
  no vl_vnf2_to_cnf.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vl_vnf2_to_cnf.interface_Standard.operation_delete.implementation
  no vl_vnf2_to_cnf.interface_Standard.operation_delete.inputs
  #vl_vnf2_to_cnf.interface_Standard.operations = 5
  // YAML artifacts:
  no vl_vnf2_to_cnf.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_linkable: None

  // YAML vnf1_instance: {'type': 'tosca.nodes.nfv.example_VNF1', 'properties': {'flavour_id': 'scalable_ha'}, 'requirements': [{'virtual_link': 'vl_mgmt_network'}, {'virtual_link_external': 'vl_mgmt_network'}]}
  node[vnf1_instance]
  vnf1_instance.name["vnf1_instance"]
  vnf1_instance.node_type_name = "tosca.nodes.nfv.example_VNF1"
  // YAML properties:
  // NOTE: The property 'descriptor_id' is set to its default value.
  vnf1_instance.property_descriptor_id = "vnf1-vm-based"
  // NOTE: The property 'ext_invariant_id' is not required.
  no   vnf1_instance.property_ext_invariant_id
  // NOTE: The property 'descriptor_version' is set to its default value.
  vnf1_instance.property_descriptor_version = "1.0"
  // NOTE: The property 'provider' is set to its default value.
  vnf1_instance.property_provider = "MyCompany"
  // NOTE: The property 'product_name' is set to its default value.
  vnf1_instance.property_product_name = "VNF1_VM"
  // NOTE: The property 'software_version' is set to its default value.
  vnf1_instance.property_software_version = "1.0"
  // NOTE: The property 'product_info_name' is not required.
  no   vnf1_instance.property_product_info_name
  // NOTE: The property 'product_info_description' is not required.
  no   vnf1_instance.property_product_info_description
  // NOTE: The property 'vnfm_info' is set to its default value.
  #vnf1_instance.property_vnfm_info = 1
  vnf1_instance.property_vnfm_info[0] = "etsivnfm:v3.3.1"
  // NOTE: The property 'localization_languages' is not required.
  no   vnf1_instance.property_localization_languages
  // NOTE: The property 'default_localization_language' is not required.
  no   vnf1_instance.property_default_localization_language
  // NOTE: The property 'configurable_properties' is not required.
  no   vnf1_instance.property_configurable_properties
  // NOTE: The property 'modifiable_attributes' is not required.
  no   vnf1_instance.property_modifiable_attributes
  // NOTE: The property 'lcm_operations_configuration' is not required.
  no   vnf1_instance.property_lcm_operations_configuration
  // NOTE: The property 'monitoring_parameters' is not required.
  no   vnf1_instance.property_monitoring_parameters
  // YAML flavour_id: scalable_ha
  vnf1_instance.property_flavour_id = "scalable_ha"
  // NOTE: The property 'flavour_description' is set to its default value.
  vnf1_instance.property_flavour_description = "Scalable flavour with HA support"
  // NOTE: The property 'vnf_profile' is not required.
  no   vnf1_instance.property_vnf_profile
  // YAML interfaces:
  #vnf1_instance.interfaces = 3
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vnf1_instance.interface_Standard.operation_create.implementation
  no vnf1_instance.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vnf1_instance.interface_Standard.operation_configure.implementation
  no vnf1_instance.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vnf1_instance.interface_Standard.operation_start.implementation
  no vnf1_instance.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vnf1_instance.interface_Standard.operation_stop.implementation
  no vnf1_instance.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vnf1_instance.interface_Standard.operation_delete.implementation
  no vnf1_instance.interface_Standard.operation_delete.inputs
  #vnf1_instance.interface_Standard.operations = 5
  // YAML Vnflcm:
  // YAML instantiate: {'description': 'Invoked upon receipt of an Instantiate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_instantiate.implementation
  no vnf1_instance.interface_Vnflcm.operation_instantiate.inputs
  // YAML instantiate_start: {'description': 'Invoked before instantiate'}
  no vnf1_instance.interface_Vnflcm.operation_instantiate_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_instantiate_start.inputs
  // YAML instantiate_end: {'description': 'Invoked after instantiate'}
  no vnf1_instance.interface_Vnflcm.operation_instantiate_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_instantiate_end.inputs
  // YAML terminate: {'description': 'Invoked upon receipt Terminate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_terminate.implementation
  no vnf1_instance.interface_Vnflcm.operation_terminate.inputs
  // YAML terminate_start: {'description': 'Invoked before terminate'}
  no vnf1_instance.interface_Vnflcm.operation_terminate_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_terminate_start.inputs
  // YAML terminate_end: {'description': 'Invoked after terminate'}
  no vnf1_instance.interface_Vnflcm.operation_terminate_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_terminate_end.inputs
  // YAML modify_information: {'description': 'Invoked upon receipt of a Modify VNF Information request'}
  no vnf1_instance.interface_Vnflcm.operation_modify_information.implementation
  no vnf1_instance.interface_Vnflcm.operation_modify_information.inputs
  // YAML modify_information_start: {'description': 'Invoked before modify_information'}
  no vnf1_instance.interface_Vnflcm.operation_modify_information_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_modify_information_start.inputs
  // YAML modify_information_end: {'description': 'Invoked after modify_information'}
  no vnf1_instance.interface_Vnflcm.operation_modify_information_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_modify_information_end.inputs
  // YAML change_flavour: {'description': 'Invoked upon receipt of a Change VNF Flavour request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_change_flavour.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_flavour.inputs
  // YAML change_flavour_start: {'description': 'Invoked before change_flavour'}
  no vnf1_instance.interface_Vnflcm.operation_change_flavour_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_flavour_start.inputs
  // YAML change_flavour_end: {'description': 'Invoked after change_flavour'}
  no vnf1_instance.interface_Vnflcm.operation_change_flavour_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_flavour_end.inputs
  // YAML change_external_connectivity: {'description': 'Invoked upon receipt of a Change External VNF Connectivity  request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_change_external_connectivity.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_external_connectivity.inputs
  // YAML change_external_connectivity_start: {'description': 'Invoked before change_external_connectivity'}
  no vnf1_instance.interface_Vnflcm.operation_change_external_connectivity_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_external_connectivity_start.inputs
  // YAML change_external_connectivity_end: {'description': 'Invoked after change_external_connectivity'}
  no vnf1_instance.interface_Vnflcm.operation_change_external_connectivity_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_external_connectivity_end.inputs
  // YAML operate: {'description': 'Invoked upon receipt of an Operate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_operate.implementation
  no vnf1_instance.interface_Vnflcm.operation_operate.inputs
  // YAML operate_start: {'description': 'Invoked before operate'}
  no vnf1_instance.interface_Vnflcm.operation_operate_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_operate_start.inputs
  // YAML operate_end: {'description': 'Invoked after operate'}
  no vnf1_instance.interface_Vnflcm.operation_operate_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_operate_end.inputs
  // YAML heal: {'description': 'Invoked upon receipt of a Heal VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'cause': {'type': 'string', 'description': 'Indicates the reason why a healing procedure is required.', 'required': False}, 'vnfc_instance_ids': {'type': 'list', 'entry_schema': {'type': 'string'}, 'description': 'List of VNFC instances requiring a healing action.', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_heal.implementation
  no vnf1_instance.interface_Vnflcm.operation_heal.inputs
  // YAML heal_start: {'description': 'Invoked before heal'}
  no vnf1_instance.interface_Vnflcm.operation_heal_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_heal_start.inputs
  // YAML heal_end: {'description': 'Invoked after heal'}
  no vnf1_instance.interface_Vnflcm.operation_heal_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_heal_end.inputs
  // YAML scale: {'description': 'Invoked upon receipt of a Scale VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'type': {'type': 'string', 'description': 'Indicates the type of the scale operation requested.', 'required': False, 'constraints': [{'valid_values': ['scale_out', 'scale_in']}]}, 'aspect': {'type': 'string', 'description': 'Identifier of the scaling aspect.', 'required': False}, 'number_of_steps': {'type': 'integer', 'description': 'Number of scaling steps to be executed.', 'required': True, 'constraints': [{'greater_than': 0}], 'default': 1}}}
  no vnf1_instance.interface_Vnflcm.operation_scale.implementation
  no vnf1_instance.interface_Vnflcm.operation_scale.inputs
  // YAML scale_start: {'description': 'Invoked before scale'}
  no vnf1_instance.interface_Vnflcm.operation_scale_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_scale_start.inputs
  // YAML scale_end: {'description': 'Invoked after scale'}
  no vnf1_instance.interface_Vnflcm.operation_scale_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_scale_end.inputs
  // YAML scale_to_level: {'description': 'Invoked upon receipt of a Scale VNF to Level request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'instantiation_level': {'type': 'string', 'description': 'Identifier of the target instantiation level of the current deployment flavour to which the VNF is requested to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False}, 'scale_info': {'type': 'map', 'description': 'For each scaling aspect of the current deployment flavour, indicates the target scale level to which the VNF is to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}}}
  no vnf1_instance.interface_Vnflcm.operation_scale_to_level.implementation
  no vnf1_instance.interface_Vnflcm.operation_scale_to_level.inputs
  // YAML scale_to_level_start: {'description': 'Invoked before scale_to_level'}
  no vnf1_instance.interface_Vnflcm.operation_scale_to_level_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_scale_to_level_start.inputs
  // YAML scale_to_level_end: {'description': 'Invoked after scale_to_level'}
  no vnf1_instance.interface_Vnflcm.operation_scale_to_level_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_scale_to_level_end.inputs
  // YAML create_snapshot: {'description': 'Invoked upon receipt of a Create VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_create_snapshot.implementation
  no vnf1_instance.interface_Vnflcm.operation_create_snapshot.inputs
  // YAML create_snapshot_start: {'description': 'Invoked before create_snapshot'}
  no vnf1_instance.interface_Vnflcm.operation_create_snapshot_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_create_snapshot_start.inputs
  // YAML create_snapshot_end: {'description': 'Invoked after create_snapshot'}
  no vnf1_instance.interface_Vnflcm.operation_create_snapshot_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_create_snapshot_end.inputs
  // YAML revert_to_snapshot: {'description': 'Invoked upon receipt of a Revert to VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_revert_to_snapshot.implementation
  no vnf1_instance.interface_Vnflcm.operation_revert_to_snapshot.inputs
  // YAML revert_to_snapshot_start: {'description': 'Invoked before revert_to_snapshot'}
  no vnf1_instance.interface_Vnflcm.operation_revert_to_snapshot_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_revert_to_snapshot_start.inputs
  // YAML revert_to_snapshot_end: {'description': 'Invoked after revert_to_snapshot'}
  no vnf1_instance.interface_Vnflcm.operation_revert_to_snapshot_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_revert_to_snapshot_end.inputs
  // YAML change_current_package: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf1_instance.interface_Vnflcm.operation_change_current_package.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_current_package.inputs
  // YAML change_current_package_start: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  no vnf1_instance.interface_Vnflcm.operation_change_current_package_start.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_current_package_start.inputs
  // YAML change_current_package_end: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  no vnf1_instance.interface_Vnflcm.operation_change_current_package_end.implementation
  no vnf1_instance.interface_Vnflcm.operation_change_current_package_end.inputs
  #vnf1_instance.interface_Vnflcm.operations = 36
  // YAML VnfIndicator:
  no vnf1_instance.interface_VnfIndicator.operations
  // YAML artifacts:
  no vnf1_instance.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML virtual_link: vl_mgmt_network
  connect[vnf1_instance.requirement_virtual_link, vl_mgmt_network.capability_virtual_linkable]
  vnf1_instance.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #vnf1_instance.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #vnf1_instance.requirement_virtual_link.relationship.interface_Configure.operations = 8
  // YAML virtual_link_external: vl_mgmt_network
  connect[vnf1_instance.requirement_virtual_link_external, vl_mgmt_network.capability_virtual_linkable]
  vnf1_instance.requirement_virtual_link_external.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #vnf1_instance.requirement_virtual_link_external.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_source.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_target.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_source.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_target.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_target.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_source.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_target_changed.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_remove_target.implementation
  no vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_remove_target.inputs
  #vnf1_instance.requirement_virtual_link_external.relationship.interface_Configure.operations = 8

  // YAML vnf2_instance: {'type': 'tosca.nodes.nfv.example_VNF2', 'properties': {'flavour_id': 'scalable_ha'}, 'requirements': [{'virtual_link': 'vl_data_network'}, {'virtual_link_external': 'vl_mgmt_network'}]}
  node[vnf2_instance]
  vnf2_instance.name["vnf2_instance"]
  vnf2_instance.node_type_name = "tosca.nodes.nfv.example_VNF2"
  // YAML properties:
  // NOTE: The property 'descriptor_id' is set to its default value.
  vnf2_instance.property_descriptor_id = "vnf2-vm-based"
  // NOTE: The property 'ext_invariant_id' is not required.
  no   vnf2_instance.property_ext_invariant_id
  // NOTE: The property 'descriptor_version' is set to its default value.
  vnf2_instance.property_descriptor_version = "1.0"
  // NOTE: The property 'provider' is set to its default value.
  vnf2_instance.property_provider = "MyCompany"
  // NOTE: The property 'product_name' is set to its default value.
  vnf2_instance.property_product_name = "VNF2_VM"
  // NOTE: The property 'software_version' is set to its default value.
  vnf2_instance.property_software_version = "1.0"
  // NOTE: The property 'product_info_name' is not required.
  no   vnf2_instance.property_product_info_name
  // NOTE: The property 'product_info_description' is not required.
  no   vnf2_instance.property_product_info_description
  // NOTE: The property 'vnfm_info' is set to its default value.
  #vnf2_instance.property_vnfm_info = 1
  vnf2_instance.property_vnfm_info[0] = "etsivnfm:v3.3.1"
  // NOTE: The property 'localization_languages' is not required.
  no   vnf2_instance.property_localization_languages
  // NOTE: The property 'default_localization_language' is not required.
  no   vnf2_instance.property_default_localization_language
  // NOTE: The property 'configurable_properties' is not required.
  no   vnf2_instance.property_configurable_properties
  // NOTE: The property 'modifiable_attributes' is not required.
  no   vnf2_instance.property_modifiable_attributes
  // NOTE: The property 'lcm_operations_configuration' is not required.
  no   vnf2_instance.property_lcm_operations_configuration
  // NOTE: The property 'monitoring_parameters' is not required.
  no   vnf2_instance.property_monitoring_parameters
  // YAML flavour_id: scalable_ha
  vnf2_instance.property_flavour_id = "scalable_ha"
  // NOTE: The property 'flavour_description' is set to its default value.
  vnf2_instance.property_flavour_description = "Scalable flavour with HA support"
  // NOTE: The property 'vnf_profile' is not required.
  no   vnf2_instance.property_vnf_profile
  // YAML interfaces:
  #vnf2_instance.interfaces = 3
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vnf2_instance.interface_Standard.operation_create.implementation
  no vnf2_instance.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vnf2_instance.interface_Standard.operation_configure.implementation
  no vnf2_instance.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vnf2_instance.interface_Standard.operation_start.implementation
  no vnf2_instance.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vnf2_instance.interface_Standard.operation_stop.implementation
  no vnf2_instance.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vnf2_instance.interface_Standard.operation_delete.implementation
  no vnf2_instance.interface_Standard.operation_delete.inputs
  #vnf2_instance.interface_Standard.operations = 5
  // YAML Vnflcm:
  // YAML instantiate: {'description': 'Invoked upon receipt of an Instantiate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_instantiate.implementation
  no vnf2_instance.interface_Vnflcm.operation_instantiate.inputs
  // YAML instantiate_start: {'description': 'Invoked before instantiate'}
  no vnf2_instance.interface_Vnflcm.operation_instantiate_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_instantiate_start.inputs
  // YAML instantiate_end: {'description': 'Invoked after instantiate'}
  no vnf2_instance.interface_Vnflcm.operation_instantiate_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_instantiate_end.inputs
  // YAML terminate: {'description': 'Invoked upon receipt Terminate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_terminate.implementation
  no vnf2_instance.interface_Vnflcm.operation_terminate.inputs
  // YAML terminate_start: {'description': 'Invoked before terminate'}
  no vnf2_instance.interface_Vnflcm.operation_terminate_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_terminate_start.inputs
  // YAML terminate_end: {'description': 'Invoked after terminate'}
  no vnf2_instance.interface_Vnflcm.operation_terminate_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_terminate_end.inputs
  // YAML modify_information: {'description': 'Invoked upon receipt of a Modify VNF Information request'}
  no vnf2_instance.interface_Vnflcm.operation_modify_information.implementation
  no vnf2_instance.interface_Vnflcm.operation_modify_information.inputs
  // YAML modify_information_start: {'description': 'Invoked before modify_information'}
  no vnf2_instance.interface_Vnflcm.operation_modify_information_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_modify_information_start.inputs
  // YAML modify_information_end: {'description': 'Invoked after modify_information'}
  no vnf2_instance.interface_Vnflcm.operation_modify_information_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_modify_information_end.inputs
  // YAML change_flavour: {'description': 'Invoked upon receipt of a Change VNF Flavour request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_change_flavour.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_flavour.inputs
  // YAML change_flavour_start: {'description': 'Invoked before change_flavour'}
  no vnf2_instance.interface_Vnflcm.operation_change_flavour_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_flavour_start.inputs
  // YAML change_flavour_end: {'description': 'Invoked after change_flavour'}
  no vnf2_instance.interface_Vnflcm.operation_change_flavour_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_flavour_end.inputs
  // YAML change_external_connectivity: {'description': 'Invoked upon receipt of a Change External VNF Connectivity  request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_change_external_connectivity.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_external_connectivity.inputs
  // YAML change_external_connectivity_start: {'description': 'Invoked before change_external_connectivity'}
  no vnf2_instance.interface_Vnflcm.operation_change_external_connectivity_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_external_connectivity_start.inputs
  // YAML change_external_connectivity_end: {'description': 'Invoked after change_external_connectivity'}
  no vnf2_instance.interface_Vnflcm.operation_change_external_connectivity_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_external_connectivity_end.inputs
  // YAML operate: {'description': 'Invoked upon receipt of an Operate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_operate.implementation
  no vnf2_instance.interface_Vnflcm.operation_operate.inputs
  // YAML operate_start: {'description': 'Invoked before operate'}
  no vnf2_instance.interface_Vnflcm.operation_operate_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_operate_start.inputs
  // YAML operate_end: {'description': 'Invoked after operate'}
  no vnf2_instance.interface_Vnflcm.operation_operate_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_operate_end.inputs
  // YAML heal: {'description': 'Invoked upon receipt of a Heal VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'cause': {'type': 'string', 'description': 'Indicates the reason why a healing procedure is required.', 'required': False}, 'vnfc_instance_ids': {'type': 'list', 'entry_schema': {'type': 'string'}, 'description': 'List of VNFC instances requiring a healing action.', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_heal.implementation
  no vnf2_instance.interface_Vnflcm.operation_heal.inputs
  // YAML heal_start: {'description': 'Invoked before heal'}
  no vnf2_instance.interface_Vnflcm.operation_heal_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_heal_start.inputs
  // YAML heal_end: {'description': 'Invoked after heal'}
  no vnf2_instance.interface_Vnflcm.operation_heal_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_heal_end.inputs
  // YAML scale: {'description': 'Invoked upon receipt of a Scale VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'type': {'type': 'string', 'description': 'Indicates the type of the scale operation requested.', 'required': False, 'constraints': [{'valid_values': ['scale_out', 'scale_in']}]}, 'aspect': {'type': 'string', 'description': 'Identifier of the scaling aspect.', 'required': False}, 'number_of_steps': {'type': 'integer', 'description': 'Number of scaling steps to be executed.', 'required': True, 'constraints': [{'greater_than': 0}], 'default': 1}}}
  no vnf2_instance.interface_Vnflcm.operation_scale.implementation
  no vnf2_instance.interface_Vnflcm.operation_scale.inputs
  // YAML scale_start: {'description': 'Invoked before scale'}
  no vnf2_instance.interface_Vnflcm.operation_scale_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_scale_start.inputs
  // YAML scale_end: {'description': 'Invoked after scale'}
  no vnf2_instance.interface_Vnflcm.operation_scale_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_scale_end.inputs
  // YAML scale_to_level: {'description': 'Invoked upon receipt of a Scale VNF to Level request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'instantiation_level': {'type': 'string', 'description': 'Identifier of the target instantiation level of the current deployment flavour to which the VNF is requested to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False}, 'scale_info': {'type': 'map', 'description': 'For each scaling aspect of the current deployment flavour, indicates the target scale level to which the VNF is to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}}}
  no vnf2_instance.interface_Vnflcm.operation_scale_to_level.implementation
  no vnf2_instance.interface_Vnflcm.operation_scale_to_level.inputs
  // YAML scale_to_level_start: {'description': 'Invoked before scale_to_level'}
  no vnf2_instance.interface_Vnflcm.operation_scale_to_level_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_scale_to_level_start.inputs
  // YAML scale_to_level_end: {'description': 'Invoked after scale_to_level'}
  no vnf2_instance.interface_Vnflcm.operation_scale_to_level_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_scale_to_level_end.inputs
  // YAML create_snapshot: {'description': 'Invoked upon receipt of a Create VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_create_snapshot.implementation
  no vnf2_instance.interface_Vnflcm.operation_create_snapshot.inputs
  // YAML create_snapshot_start: {'description': 'Invoked before create_snapshot'}
  no vnf2_instance.interface_Vnflcm.operation_create_snapshot_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_create_snapshot_start.inputs
  // YAML create_snapshot_end: {'description': 'Invoked after create_snapshot'}
  no vnf2_instance.interface_Vnflcm.operation_create_snapshot_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_create_snapshot_end.inputs
  // YAML revert_to_snapshot: {'description': 'Invoked upon receipt of a Revert to VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_revert_to_snapshot.implementation
  no vnf2_instance.interface_Vnflcm.operation_revert_to_snapshot.inputs
  // YAML revert_to_snapshot_start: {'description': 'Invoked before revert_to_snapshot'}
  no vnf2_instance.interface_Vnflcm.operation_revert_to_snapshot_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_revert_to_snapshot_start.inputs
  // YAML revert_to_snapshot_end: {'description': 'Invoked after revert_to_snapshot'}
  no vnf2_instance.interface_Vnflcm.operation_revert_to_snapshot_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_revert_to_snapshot_end.inputs
  // YAML change_current_package: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no vnf2_instance.interface_Vnflcm.operation_change_current_package.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_current_package.inputs
  // YAML change_current_package_start: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  no vnf2_instance.interface_Vnflcm.operation_change_current_package_start.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_current_package_start.inputs
  // YAML change_current_package_end: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  no vnf2_instance.interface_Vnflcm.operation_change_current_package_end.implementation
  no vnf2_instance.interface_Vnflcm.operation_change_current_package_end.inputs
  #vnf2_instance.interface_Vnflcm.operations = 36
  // YAML VnfIndicator:
  no vnf2_instance.interface_VnfIndicator.operations
  // YAML artifacts:
  no vnf2_instance.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML virtual_link: vl_data_network
  connect[vnf2_instance.requirement_virtual_link, vl_data_network.capability_virtual_linkable]
  vnf2_instance.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #vnf2_instance.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #vnf2_instance.requirement_virtual_link.relationship.interface_Configure.operations = 8
  // YAML virtual_link_external: vl_mgmt_network
  connect[vnf2_instance.requirement_virtual_link_external, vl_mgmt_network.capability_virtual_linkable]
  vnf2_instance.requirement_virtual_link_external.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #vnf2_instance.requirement_virtual_link_external.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_source.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_target.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_source.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_target.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_target.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_source.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_target_changed.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_remove_target.implementation
  no vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_remove_target.inputs
  #vnf2_instance.requirement_virtual_link_external.relationship.interface_Configure.operations = 8

  // YAML cnf_instance: {'type': 'tosca.nodes.nfv.example_CNF', 'properties': {'flavour_id': 'scalable_ha_container'}, 'requirements': [{'virtual_link': 'vl_vnf2_to_cnf'}, {'virtual_link_external': 'vl_mgmt_network'}]}
  node[cnf_instance]
  cnf_instance.name["cnf_instance"]
  cnf_instance.node_type_name = "tosca.nodes.nfv.example_CNF"
  // YAML properties:
  // NOTE: The property 'descriptor_id' is set to its default value.
  cnf_instance.property_descriptor_id = "cnf-container-based"
  // NOTE: The property 'ext_invariant_id' is not required.
  no   cnf_instance.property_ext_invariant_id
  // NOTE: The property 'descriptor_version' is set to its default value.
  cnf_instance.property_descriptor_version = "1.0"
  // NOTE: The property 'provider' is set to its default value.
  cnf_instance.property_provider = "MyCompany"
  // NOTE: The property 'product_name' is set to its default value.
  cnf_instance.property_product_name = "CNF_Container"
  // NOTE: The property 'software_version' is set to its default value.
  cnf_instance.property_software_version = "1.0"
  // NOTE: The property 'product_info_name' is not required.
  no   cnf_instance.property_product_info_name
  // NOTE: The property 'product_info_description' is not required.
  no   cnf_instance.property_product_info_description
  // NOTE: The property 'vnfm_info' is set to its default value.
  #cnf_instance.property_vnfm_info = 1
  cnf_instance.property_vnfm_info[0] = "etsivnfm:v3.3.1"
  // NOTE: The property 'localization_languages' is not required.
  no   cnf_instance.property_localization_languages
  // NOTE: The property 'default_localization_language' is not required.
  no   cnf_instance.property_default_localization_language
  // NOTE: The property 'configurable_properties' is not required.
  no   cnf_instance.property_configurable_properties
  // NOTE: The property 'modifiable_attributes' is not required.
  no   cnf_instance.property_modifiable_attributes
  // NOTE: The property 'lcm_operations_configuration' is not required.
  no   cnf_instance.property_lcm_operations_configuration
  // NOTE: The property 'monitoring_parameters' is not required.
  no   cnf_instance.property_monitoring_parameters
  // YAML flavour_id: scalable_ha_container
  cnf_instance.property_flavour_id = "scalable_ha_container"
  // NOTE: The property 'flavour_description' is set to its default value.
  cnf_instance.property_flavour_description = "Scalable containerized flavour with HA support"
  // NOTE: The property 'vnf_profile' is not required.
  no   cnf_instance.property_vnf_profile
  // YAML interfaces:
  #cnf_instance.interfaces = 3
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no cnf_instance.interface_Standard.operation_create.implementation
  no cnf_instance.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no cnf_instance.interface_Standard.operation_configure.implementation
  no cnf_instance.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no cnf_instance.interface_Standard.operation_start.implementation
  no cnf_instance.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no cnf_instance.interface_Standard.operation_stop.implementation
  no cnf_instance.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no cnf_instance.interface_Standard.operation_delete.implementation
  no cnf_instance.interface_Standard.operation_delete.inputs
  #cnf_instance.interface_Standard.operations = 5
  // YAML Vnflcm:
  // YAML instantiate: {'description': 'Invoked upon receipt of an Instantiate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_instantiate.implementation
  no cnf_instance.interface_Vnflcm.operation_instantiate.inputs
  // YAML instantiate_start: {'description': 'Invoked before instantiate'}
  no cnf_instance.interface_Vnflcm.operation_instantiate_start.implementation
  no cnf_instance.interface_Vnflcm.operation_instantiate_start.inputs
  // YAML instantiate_end: {'description': 'Invoked after instantiate'}
  no cnf_instance.interface_Vnflcm.operation_instantiate_end.implementation
  no cnf_instance.interface_Vnflcm.operation_instantiate_end.inputs
  // YAML terminate: {'description': 'Invoked upon receipt Terminate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_terminate.implementation
  no cnf_instance.interface_Vnflcm.operation_terminate.inputs
  // YAML terminate_start: {'description': 'Invoked before terminate'}
  no cnf_instance.interface_Vnflcm.operation_terminate_start.implementation
  no cnf_instance.interface_Vnflcm.operation_terminate_start.inputs
  // YAML terminate_end: {'description': 'Invoked after terminate'}
  no cnf_instance.interface_Vnflcm.operation_terminate_end.implementation
  no cnf_instance.interface_Vnflcm.operation_terminate_end.inputs
  // YAML modify_information: {'description': 'Invoked upon receipt of a Modify VNF Information request'}
  no cnf_instance.interface_Vnflcm.operation_modify_information.implementation
  no cnf_instance.interface_Vnflcm.operation_modify_information.inputs
  // YAML modify_information_start: {'description': 'Invoked before modify_information'}
  no cnf_instance.interface_Vnflcm.operation_modify_information_start.implementation
  no cnf_instance.interface_Vnflcm.operation_modify_information_start.inputs
  // YAML modify_information_end: {'description': 'Invoked after modify_information'}
  no cnf_instance.interface_Vnflcm.operation_modify_information_end.implementation
  no cnf_instance.interface_Vnflcm.operation_modify_information_end.inputs
  // YAML change_flavour: {'description': 'Invoked upon receipt of a Change VNF Flavour request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_change_flavour.implementation
  no cnf_instance.interface_Vnflcm.operation_change_flavour.inputs
  // YAML change_flavour_start: {'description': 'Invoked before change_flavour'}
  no cnf_instance.interface_Vnflcm.operation_change_flavour_start.implementation
  no cnf_instance.interface_Vnflcm.operation_change_flavour_start.inputs
  // YAML change_flavour_end: {'description': 'Invoked after change_flavour'}
  no cnf_instance.interface_Vnflcm.operation_change_flavour_end.implementation
  no cnf_instance.interface_Vnflcm.operation_change_flavour_end.inputs
  // YAML change_external_connectivity: {'description': 'Invoked upon receipt of a Change External VNF Connectivity  request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_change_external_connectivity.implementation
  no cnf_instance.interface_Vnflcm.operation_change_external_connectivity.inputs
  // YAML change_external_connectivity_start: {'description': 'Invoked before change_external_connectivity'}
  no cnf_instance.interface_Vnflcm.operation_change_external_connectivity_start.implementation
  no cnf_instance.interface_Vnflcm.operation_change_external_connectivity_start.inputs
  // YAML change_external_connectivity_end: {'description': 'Invoked after change_external_connectivity'}
  no cnf_instance.interface_Vnflcm.operation_change_external_connectivity_end.implementation
  no cnf_instance.interface_Vnflcm.operation_change_external_connectivity_end.inputs
  // YAML operate: {'description': 'Invoked upon receipt of an Operate VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_operate.implementation
  no cnf_instance.interface_Vnflcm.operation_operate.inputs
  // YAML operate_start: {'description': 'Invoked before operate'}
  no cnf_instance.interface_Vnflcm.operation_operate_start.implementation
  no cnf_instance.interface_Vnflcm.operation_operate_start.inputs
  // YAML operate_end: {'description': 'Invoked after operate'}
  no cnf_instance.interface_Vnflcm.operation_operate_end.implementation
  no cnf_instance.interface_Vnflcm.operation_operate_end.inputs
  // YAML heal: {'description': 'Invoked upon receipt of a Heal VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'cause': {'type': 'string', 'description': 'Indicates the reason why a healing procedure is required.', 'required': False}, 'vnfc_instance_ids': {'type': 'list', 'entry_schema': {'type': 'string'}, 'description': 'List of VNFC instances requiring a healing action.', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_heal.implementation
  no cnf_instance.interface_Vnflcm.operation_heal.inputs
  // YAML heal_start: {'description': 'Invoked before heal'}
  no cnf_instance.interface_Vnflcm.operation_heal_start.implementation
  no cnf_instance.interface_Vnflcm.operation_heal_start.inputs
  // YAML heal_end: {'description': 'Invoked after heal'}
  no cnf_instance.interface_Vnflcm.operation_heal_end.implementation
  no cnf_instance.interface_Vnflcm.operation_heal_end.inputs
  // YAML scale: {'description': 'Invoked upon receipt of a Scale VNF request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'type': {'type': 'string', 'description': 'Indicates the type of the scale operation requested.', 'required': False, 'constraints': [{'valid_values': ['scale_out', 'scale_in']}]}, 'aspect': {'type': 'string', 'description': 'Identifier of the scaling aspect.', 'required': False}, 'number_of_steps': {'type': 'integer', 'description': 'Number of scaling steps to be executed.', 'required': True, 'constraints': [{'greater_than': 0}], 'default': 1}}}
  no cnf_instance.interface_Vnflcm.operation_scale.implementation
  no cnf_instance.interface_Vnflcm.operation_scale.inputs
  // YAML scale_start: {'description': 'Invoked before scale'}
  no cnf_instance.interface_Vnflcm.operation_scale_start.implementation
  no cnf_instance.interface_Vnflcm.operation_scale_start.inputs
  // YAML scale_end: {'description': 'Invoked after scale'}
  no cnf_instance.interface_Vnflcm.operation_scale_end.implementation
  no cnf_instance.interface_Vnflcm.operation_scale_end.inputs
  // YAML scale_to_level: {'description': 'Invoked upon receipt of a Scale VNF to Level request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}, 'instantiation_level': {'type': 'string', 'description': 'Identifier of the target instantiation level of the current deployment flavour to which the VNF is requested to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False}, 'scale_info': {'type': 'map', 'description': 'For each scaling aspect of the current deployment flavour, indicates the target scale level to which the VNF is to be scaled. Either instantiation_level or scale_info shall be provided.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.ScaleInfo'}}}}
  no cnf_instance.interface_Vnflcm.operation_scale_to_level.implementation
  no cnf_instance.interface_Vnflcm.operation_scale_to_level.inputs
  // YAML scale_to_level_start: {'description': 'Invoked before scale_to_level'}
  no cnf_instance.interface_Vnflcm.operation_scale_to_level_start.implementation
  no cnf_instance.interface_Vnflcm.operation_scale_to_level_start.inputs
  // YAML scale_to_level_end: {'description': 'Invoked after scale_to_level'}
  no cnf_instance.interface_Vnflcm.operation_scale_to_level_end.implementation
  no cnf_instance.interface_Vnflcm.operation_scale_to_level_end.inputs
  // YAML create_snapshot: {'description': 'Invoked upon receipt of a Create VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_create_snapshot.implementation
  no cnf_instance.interface_Vnflcm.operation_create_snapshot.inputs
  // YAML create_snapshot_start: {'description': 'Invoked before create_snapshot'}
  no cnf_instance.interface_Vnflcm.operation_create_snapshot_start.implementation
  no cnf_instance.interface_Vnflcm.operation_create_snapshot_start.inputs
  // YAML create_snapshot_end: {'description': 'Invoked after create_snapshot'}
  no cnf_instance.interface_Vnflcm.operation_create_snapshot_end.implementation
  no cnf_instance.interface_Vnflcm.operation_create_snapshot_end.inputs
  // YAML revert_to_snapshot: {'description': 'Invoked upon receipt of a Revert to VNF snapshot request', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_revert_to_snapshot.implementation
  no cnf_instance.interface_Vnflcm.operation_revert_to_snapshot.inputs
  // YAML revert_to_snapshot_start: {'description': 'Invoked before revert_to_snapshot'}
  no cnf_instance.interface_Vnflcm.operation_revert_to_snapshot_start.implementation
  no cnf_instance.interface_Vnflcm.operation_revert_to_snapshot_start.inputs
  // YAML revert_to_snapshot_end: {'description': 'Invoked after revert_to_snapshot'}
  no cnf_instance.interface_Vnflcm.operation_revert_to_snapshot_end.implementation
  no cnf_instance.interface_Vnflcm.operation_revert_to_snapshot_end.inputs
  // YAML change_current_package: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange', 'inputs': {'additional_parameters': {'type': 'tosca.datatypes.nfv.VnfOperationAdditionalParameters', 'required': False}}}
  no cnf_instance.interface_Vnflcm.operation_change_current_package.implementation
  no cnf_instance.interface_Vnflcm.operation_change_current_package.inputs
  // YAML change_current_package_start: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  no cnf_instance.interface_Vnflcm.operation_change_current_package_start.implementation
  no cnf_instance.interface_Vnflcm.operation_change_current_package_start.inputs
  // YAML change_current_package_end: {'description': 'Invoked by tosca.policies.nfv.VnfPackageChange'}
  no cnf_instance.interface_Vnflcm.operation_change_current_package_end.implementation
  no cnf_instance.interface_Vnflcm.operation_change_current_package_end.inputs
  #cnf_instance.interface_Vnflcm.operations = 36
  // YAML VnfIndicator:
  no cnf_instance.interface_VnfIndicator.operations
  // YAML artifacts:
  no cnf_instance.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML virtual_link: vl_vnf2_to_cnf
  connect[cnf_instance.requirement_virtual_link, vl_vnf2_to_cnf.capability_virtual_linkable]
  cnf_instance.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cnf_instance.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no cnf_instance.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #cnf_instance.requirement_virtual_link.relationship.interface_Configure.operations = 8
  // YAML virtual_link_external: vl_mgmt_network
  connect[cnf_instance.requirement_virtual_link_external, vl_mgmt_network.capability_virtual_linkable]
  cnf_instance.requirement_virtual_link_external.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cnf_instance.requirement_virtual_link_external.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_source.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_target.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_target.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_source.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_target_changed.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_remove_target.implementation
  no cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operation_remove_target.inputs
  #cnf_instance.requirement_virtual_link_external.relationship.interface_Configure.operations = 8

  // YAML sap_mgmt: {'type': 'tosca.nodes.nfv.Sap', 'properties': {'layer_protocols': ['ipv4'], 'role': 'root', 'description': 'Service access point for management', 'protocol': [], 'trunk_mode': False}, 'requirements': [{'internal_virtual_link': 'vl_mgmt_network'}]}
  node[sap_mgmt]
  sap_mgmt.name["sap_mgmt"]
  sap_mgmt.node_type_name = "tosca.nodes.nfv.Sap"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #sap_mgmt.property_layer_protocols = 1
  sap_mgmt.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   sap_mgmt.property_ip_stack_mode
  // YAML role: root
  sap_mgmt.property_role = "root"
  // YAML description: Service access point for management
  sap_mgmt.property_description = "Service access point for management"
  // YAML protocol: []
  no sap_mgmt.property_protocol
  // YAML trunk_mode: False
  sap_mgmt.property_trunk_mode = false
  // YAML interfaces:
  #sap_mgmt.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no sap_mgmt.interface_Standard.operation_create.implementation
  no sap_mgmt.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no sap_mgmt.interface_Standard.operation_configure.implementation
  no sap_mgmt.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no sap_mgmt.interface_Standard.operation_start.implementation
  no sap_mgmt.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no sap_mgmt.interface_Standard.operation_stop.implementation
  no sap_mgmt.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no sap_mgmt.interface_Standard.operation_delete.implementation
  no sap_mgmt.interface_Standard.operation_delete.inputs
  #sap_mgmt.interface_Standard.operations = 5
  // YAML artifacts:
  no sap_mgmt.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   forwarding: None
  // YAML internal_virtual_link: vl_mgmt_network
  connect[sap_mgmt.requirement_internal_virtual_link, vl_mgmt_network.capability_virtual_linkable]
  sap_mgmt.requirement_internal_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #sap_mgmt.requirement_internal_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #sap_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operations = 8

  // YAML sap_data: {'type': 'tosca.nodes.nfv.Sap', 'properties': {'layer_protocols': ['ipv4'], 'role': 'root', 'description': 'Service access point for data plane', 'protocol': [], 'trunk_mode': False}, 'requirements': [{'internal_virtual_link': 'vl_data_network'}]}
  node[sap_data]
  sap_data.name["sap_data"]
  sap_data.node_type_name = "tosca.nodes.nfv.Sap"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #sap_data.property_layer_protocols = 1
  sap_data.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   sap_data.property_ip_stack_mode
  // YAML role: root
  sap_data.property_role = "root"
  // YAML description: Service access point for data plane
  sap_data.property_description = "Service access point for data plane"
  // YAML protocol: []
  no sap_data.property_protocol
  // YAML trunk_mode: False
  sap_data.property_trunk_mode = false
  // YAML interfaces:
  #sap_data.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no sap_data.interface_Standard.operation_create.implementation
  no sap_data.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no sap_data.interface_Standard.operation_configure.implementation
  no sap_data.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no sap_data.interface_Standard.operation_start.implementation
  no sap_data.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no sap_data.interface_Standard.operation_stop.implementation
  no sap_data.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no sap_data.interface_Standard.operation_delete.implementation
  no sap_data.interface_Standard.operation_delete.inputs
  #sap_data.interface_Standard.operations = 5
  // YAML artifacts:
  no sap_data.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   forwarding: None
  // YAML internal_virtual_link: vl_data_network
  connect[sap_data.requirement_internal_virtual_link, vl_data_network.capability_virtual_linkable]
  sap_data.requirement_internal_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #sap_data.requirement_internal_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #sap_data.requirement_internal_virtual_link.relationship.interface_Configure.operations = 8


  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  no relationships

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  no groups

  // --------------------------------------------------
  // YAML policies:
  // --------------------------------------------------

  #policies = 7
  // YAML ns_instantiation_levels: {'type': 'tosca.policies.nfv.NsInstantiationLevels', 'properties': {'ns_levels': {'default': {'description': 'Default instantiation level'}, 'small': {'description': 'Small deployment with minimal resources'}, 'medium': {'description': 'Medium deployment with moderate resources'}, 'large': {'description': 'Large deployment with maximum resources'}}, 'default_level': 'default'}}
  policy[policy_ns_instantiation_levels]
  policy_ns_instantiation_levels.name["ns_instantiation_levels"]
  // YAML properties:
  // YAML ns_levels: {'default': {'description': 'Default instantiation level'}, 'small': {'description': 'Small deployment with minimal resources'}, 'medium': {'description': 'Medium deployment with moderate resources'}, 'large': {'description': 'Large deployment with maximum resources'}}
  policy_ns_instantiation_levels.property_ns_levels.size[4]
  policy_ns_instantiation_levels.property_ns_levels.one_entry["default"]
  // YAML description: Default instantiation level
  (tosca_datatypes_nfv_NsLevels<:(policy_ns_instantiation_levels.property_ns_levels.entry["default"])).description = "Default instantiation level"
  policy_ns_instantiation_levels.property_ns_levels.one_entry["small"]
  // YAML description: Small deployment with minimal resources
  (tosca_datatypes_nfv_NsLevels<:(policy_ns_instantiation_levels.property_ns_levels.entry["small"])).description = "Small deployment with minimal resources"
  policy_ns_instantiation_levels.property_ns_levels.one_entry["medium"]
  // YAML description: Medium deployment with moderate resources
  (tosca_datatypes_nfv_NsLevels<:(policy_ns_instantiation_levels.property_ns_levels.entry["medium"])).description = "Medium deployment with moderate resources"
  policy_ns_instantiation_levels.property_ns_levels.one_entry["large"]
  // YAML description: Large deployment with maximum resources
  (tosca_datatypes_nfv_NsLevels<:(policy_ns_instantiation_levels.property_ns_levels.entry["large"])).description = "Large deployment with maximum resources"
  policy_ns_instantiation_levels.property_ns_levels.keys["default" + "small" + "medium" + "large"]
  // YAML default_level: default
  policy_ns_instantiation_levels.property_default_level = "default"
  // YAML interfaces:
  no policy_ns_instantiation_levels.interfaces
  // YAML targets: None
  no policy_ns_instantiation_levels.targets

  // YAML vnf1_to_level_mapping: {'type': 'tosca.policies.nfv.VnfToLevelMapping', 'targets': ['vnf1_instance'], 'properties': {'aspect': 'ns_scaling_aspect', 'number_of_instances': {'default': 1, 'small': 1, 'medium': 2, 'large': 3}}}
  policy[policy_vnf1_to_level_mapping]
  policy_vnf1_to_level_mapping.name["vnf1_to_level_mapping"]
  // YAML properties:
  // YAML aspect: ns_scaling_aspect
  policy_vnf1_to_level_mapping.property_aspect = "ns_scaling_aspect"
  // YAML number_of_instances: {'default': 1, 'small': 1, 'medium': 2, 'large': 3}
  policy_vnf1_to_level_mapping.property_number_of_instances.size[4]
  policy_vnf1_to_level_mapping.property_number_of_instances.one_entry["default"]
  (integer<:(policy_vnf1_to_level_mapping.property_number_of_instances.entry["default"])) = 1
  policy_vnf1_to_level_mapping.property_number_of_instances.one_entry["small"]
  (integer<:(policy_vnf1_to_level_mapping.property_number_of_instances.entry["small"])) = 1
  policy_vnf1_to_level_mapping.property_number_of_instances.one_entry["medium"]
  (integer<:(policy_vnf1_to_level_mapping.property_number_of_instances.entry["medium"])) = 2
  policy_vnf1_to_level_mapping.property_number_of_instances.one_entry["large"]
  (integer<:(policy_vnf1_to_level_mapping.property_number_of_instances.entry["large"])) = 3
  policy_vnf1_to_level_mapping.property_number_of_instances.keys["default" + "small" + "medium" + "large"]
  // YAML interfaces:
  no policy_vnf1_to_level_mapping.interfaces
  // YAML targets: ['vnf1_instance']
  policy_vnf1_to_level_mapping.targets[vnf1_instance]

  // YAML vnf2_to_level_mapping: {'type': 'tosca.policies.nfv.VnfToLevelMapping', 'targets': ['vnf2_instance'], 'properties': {'aspect': 'ns_scaling_aspect', 'number_of_instances': {'default': 1, 'small': 1, 'medium': 2, 'large': 3}}}
  policy[policy_vnf2_to_level_mapping]
  policy_vnf2_to_level_mapping.name["vnf2_to_level_mapping"]
  // YAML properties:
  // YAML aspect: ns_scaling_aspect
  policy_vnf2_to_level_mapping.property_aspect = "ns_scaling_aspect"
  // YAML number_of_instances: {'default': 1, 'small': 1, 'medium': 2, 'large': 3}
  policy_vnf2_to_level_mapping.property_number_of_instances.size[4]
  policy_vnf2_to_level_mapping.property_number_of_instances.one_entry["default"]
  (integer<:(policy_vnf2_to_level_mapping.property_number_of_instances.entry["default"])) = 1
  policy_vnf2_to_level_mapping.property_number_of_instances.one_entry["small"]
  (integer<:(policy_vnf2_to_level_mapping.property_number_of_instances.entry["small"])) = 1
  policy_vnf2_to_level_mapping.property_number_of_instances.one_entry["medium"]
  (integer<:(policy_vnf2_to_level_mapping.property_number_of_instances.entry["medium"])) = 2
  policy_vnf2_to_level_mapping.property_number_of_instances.one_entry["large"]
  (integer<:(policy_vnf2_to_level_mapping.property_number_of_instances.entry["large"])) = 3
  policy_vnf2_to_level_mapping.property_number_of_instances.keys["default" + "small" + "medium" + "large"]
  // YAML interfaces:
  no policy_vnf2_to_level_mapping.interfaces
  // YAML targets: ['vnf2_instance']
  policy_vnf2_to_level_mapping.targets[vnf2_instance]

  // YAML cnf_to_level_mapping: {'type': 'tosca.policies.nfv.VnfToLevelMapping', 'targets': ['cnf_instance'], 'properties': {'aspect': 'ns_scaling_aspect', 'number_of_instances': {'default': 1, 'small': 1, 'medium': 2, 'large': 3}}}
  policy[policy_cnf_to_level_mapping]
  policy_cnf_to_level_mapping.name["cnf_to_level_mapping"]
  // YAML properties:
  // YAML aspect: ns_scaling_aspect
  policy_cnf_to_level_mapping.property_aspect = "ns_scaling_aspect"
  // YAML number_of_instances: {'default': 1, 'small': 1, 'medium': 2, 'large': 3}
  policy_cnf_to_level_mapping.property_number_of_instances.size[4]
  policy_cnf_to_level_mapping.property_number_of_instances.one_entry["default"]
  (integer<:(policy_cnf_to_level_mapping.property_number_of_instances.entry["default"])) = 1
  policy_cnf_to_level_mapping.property_number_of_instances.one_entry["small"]
  (integer<:(policy_cnf_to_level_mapping.property_number_of_instances.entry["small"])) = 1
  policy_cnf_to_level_mapping.property_number_of_instances.one_entry["medium"]
  (integer<:(policy_cnf_to_level_mapping.property_number_of_instances.entry["medium"])) = 2
  policy_cnf_to_level_mapping.property_number_of_instances.one_entry["large"]
  (integer<:(policy_cnf_to_level_mapping.property_number_of_instances.entry["large"])) = 3
  policy_cnf_to_level_mapping.property_number_of_instances.keys["default" + "small" + "medium" + "large"]
  // YAML interfaces:
  no policy_cnf_to_level_mapping.interfaces
  // YAML targets: ['cnf_instance']
  policy_cnf_to_level_mapping.targets[cnf_instance]

  // YAML vl_mgmt_to_level_mapping: {'type': 'tosca.policies.nfv.VirtualLinkToLevelMapping', 'targets': ['vl_mgmt_network'], 'properties': {'aspect': 'ns_scaling_aspect', 'bit_rate_requirements': {'default': {'root': 100000, 'leaf': 10000}, 'small': {'root': 100000, 'leaf': 10000}, 'medium': {'root': 500000, 'leaf': 50000}, 'large': {'root': 1000000, 'leaf': 100000}}}}
  policy[policy_vl_mgmt_to_level_mapping]
  policy_vl_mgmt_to_level_mapping.name["vl_mgmt_to_level_mapping"]
  // YAML properties:
  // YAML aspect: ns_scaling_aspect
  policy_vl_mgmt_to_level_mapping.property_aspect = "ns_scaling_aspect"
  // YAML bit_rate_requirements: {'default': {'root': 100000, 'leaf': 10000}, 'small': {'root': 100000, 'leaf': 10000}, 'medium': {'root': 500000, 'leaf': 50000}, 'large': {'root': 1000000, 'leaf': 100000}}
  policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.size[4]
  policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.one_entry["default"]
  // YAML root: 100000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["default"])).root = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML leaf: 10000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["default"])).leaf = 127 // ISSUE: 10000 is a too big integer!!!
  policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.one_entry["small"]
  // YAML root: 100000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["small"])).root = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML leaf: 10000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["small"])).leaf = 127 // ISSUE: 10000 is a too big integer!!!
  policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.one_entry["medium"]
  // YAML root: 500000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["medium"])).root = 127 // ISSUE: 500000 is a too big integer!!!
  // YAML leaf: 50000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["medium"])).leaf = 127 // ISSUE: 50000 is a too big integer!!!
  policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.one_entry["large"]
  // YAML root: 1000000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["large"])).root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.entry["large"])).leaf = 127 // ISSUE: 100000 is a too big integer!!!
  policy_vl_mgmt_to_level_mapping.property_bit_rate_requirements.keys["default" + "small" + "medium" + "large"]
  // YAML interfaces:
  no policy_vl_mgmt_to_level_mapping.interfaces
  // YAML targets: ['vl_mgmt_network']
  policy_vl_mgmt_to_level_mapping.targets[vl_mgmt_network]

  // YAML vl_data_to_level_mapping: {'type': 'tosca.policies.nfv.VirtualLinkToLevelMapping', 'targets': ['vl_data_network'], 'properties': {'aspect': 'ns_scaling_aspect', 'bit_rate_requirements': {'default': {'root': 1000000, 'leaf': 100000}, 'small': {'root': 1000000, 'leaf': 100000}, 'medium': {'root': 5000000, 'leaf': 500000}, 'large': {'root': 10000000, 'leaf': 1000000}}}}
  policy[policy_vl_data_to_level_mapping]
  policy_vl_data_to_level_mapping.name["vl_data_to_level_mapping"]
  // YAML properties:
  // YAML aspect: ns_scaling_aspect
  policy_vl_data_to_level_mapping.property_aspect = "ns_scaling_aspect"
  // YAML bit_rate_requirements: {'default': {'root': 1000000, 'leaf': 100000}, 'small': {'root': 1000000, 'leaf': 100000}, 'medium': {'root': 5000000, 'leaf': 500000}, 'large': {'root': 10000000, 'leaf': 1000000}}
  policy_vl_data_to_level_mapping.property_bit_rate_requirements.size[4]
  policy_vl_data_to_level_mapping.property_bit_rate_requirements.one_entry["default"]
  // YAML root: 1000000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["default"])).root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["default"])).leaf = 127 // ISSUE: 100000 is a too big integer!!!
  policy_vl_data_to_level_mapping.property_bit_rate_requirements.one_entry["small"]
  // YAML root: 1000000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["small"])).root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["small"])).leaf = 127 // ISSUE: 100000 is a too big integer!!!
  policy_vl_data_to_level_mapping.property_bit_rate_requirements.one_entry["medium"]
  // YAML root: 5000000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["medium"])).root = 127 // ISSUE: 5000000 is a too big integer!!!
  // YAML leaf: 500000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["medium"])).leaf = 127 // ISSUE: 500000 is a too big integer!!!
  policy_vl_data_to_level_mapping.property_bit_rate_requirements.one_entry["large"]
  // YAML root: 10000000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["large"])).root = 127 // ISSUE: 10000000 is a too big integer!!!
  // YAML leaf: 1000000
  (tosca_datatypes_nfv_LinkBitrateRequirements<:(policy_vl_data_to_level_mapping.property_bit_rate_requirements.entry["large"])).leaf = 127 // ISSUE: 1000000 is a too big integer!!!
  policy_vl_data_to_level_mapping.property_bit_rate_requirements.keys["default" + "small" + "medium" + "large"]
  // YAML interfaces:
  no policy_vl_data_to_level_mapping.interfaces
  // YAML targets: ['vl_data_network']
  policy_vl_data_to_level_mapping.targets[vl_data_network]

  // YAML ns_scaling_aspects: {'type': 'tosca.policies.nfv.NsScalingAspects', 'properties': {'aspects': {'ns_scaling_aspect': {'name': 'ns_scaling_aspect', 'description': 'Network Service horizontal scaling', 'ns_scale_levels': {0: {'description': 'Base level'}, 1: {'description': 'Scale level 1'}, 2: {'description': 'Scale level 2'}, 3: {'description': 'Maximum scale level'}}}}}}
  policy[policy_ns_scaling_aspects]
  policy_ns_scaling_aspects.name["ns_scaling_aspects"]
  // YAML properties:
  // YAML aspects: {'ns_scaling_aspect': {'name': 'ns_scaling_aspect', 'description': 'Network Service horizontal scaling', 'ns_scale_levels': {0: {'description': 'Base level'}, 1: {'description': 'Scale level 1'}, 2: {'description': 'Scale level 2'}, 3: {'description': 'Maximum scale level'}}}}
  policy_ns_scaling_aspects.property_aspects.size[1]
  policy_ns_scaling_aspects.property_aspects.one_entry["ns_scaling_aspect"]
  // YAML name: ns_scaling_aspect
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).name = "ns_scaling_aspect"
  // YAML description: Network Service horizontal scaling
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).description = "Network Service horizontal scaling"
  // YAML ns_scale_levels: {0: {'description': 'Base level'}, 1: {'description': 'Scale level 1'}, 2: {'description': 'Scale level 2'}, 3: {'description': 'Maximum scale level'}}
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.size[4]
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.one_entry["0"]
  // YAML description: Base level
  (tosca_datatypes_nfv_NsLevels<:((tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.entry["0"])).description = "Base level"
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.one_entry["1"]
  // YAML description: Scale level 1
  (tosca_datatypes_nfv_NsLevels<:((tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.entry["1"])).description = "Scale level 1"
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.one_entry["2"]
  // YAML description: Scale level 2
  (tosca_datatypes_nfv_NsLevels<:((tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.entry["2"])).description = "Scale level 2"
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.one_entry["3"]
  // YAML description: Maximum scale level
  (tosca_datatypes_nfv_NsLevels<:((tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.entry["3"])).description = "Maximum scale level"
  (tosca_datatypes_nfv_NsScalingAspect<:(policy_ns_scaling_aspects.property_aspects.entry["ns_scaling_aspect"])).ns_scale_levels.keys["0" + "1" + "2" + "3"]
  policy_ns_scaling_aspects.property_aspects.keys["ns_scaling_aspect"]
  // YAML interfaces:
  no policy_ns_scaling_aspects.interfaces
  // YAML targets: None
  no policy_ns_scaling_aspects.targets

  // --------------------------------------------------
  // YAML outputs:
  // --------------------------------------------------

  no outputs

  // --------------------------------------------------
  // Substitution Mappings
  // --------------------------------------------------

  // YAML substitution_mappings: {'node_type': 'tosca.nodes.nfv.MultiVNF_NS', 'requirements': [{'virtual_link': ['sap_mgmt', 'external_virtual_link']}]}
  substitution_mappings[substitution_mappings]
  substitution_mappings.node_type_name = "tosca.nodes.nfv.MultiVNF_NS"
  // YAML   requirements:
  // YAML     virtual_link: ['sap_mgmt', 'external_virtual_link']
  connectRequirement[substitution_mappings.requirement_virtual_link, sap_mgmt.requirement_external_virtual_link]
}

/** There exists some Hybrid_Network_Service_topology_template */
run Show_Hybrid_Network_Service_topology_template {
} for 0 but
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 1 LocationGraphs/LocationGraph,
  exactly 25 LocationGraphs/Location,
  exactly 166 LocationGraphs/Value,
  exactly 24 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 32 LocationGraphs/Role,
  exactly 8 TOSCA/Scalar,
  exactly 0 TOSCA/scalar_unit_size,
  exactly 0 TOSCA/scalar_unit_frequency,
  exactly 8 TOSCA/scalar_unit_time,
  exactly 4 TOSCA/map_integer/Map,
  exactly 0 TOSCA/map_string/Map,
  exactly 8 TOSCA/map_data/Map,
  exactly 0 TOSCA/map_map_data/Map,
  exactly 25 TOSCA/ToscaComponent,
  exactly 32 TOSCA/ToscaRole,
  exactly 71 TOSCA/ToscaValue,
  exactly 1 TOSCA/TopologyTemplate,
  exactly 10 TOSCA/Node,
  exactly 9 TOSCA/Requirement,
  exactly 23 TOSCA/Capability,
  exactly 8 TOSCA/Relationship,
  exactly 0 TOSCA/Group,
  exactly 7 TOSCA/Policy,
  exactly 5 TOSCA/Interface,
  exactly 64 TOSCA/Operation,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Artifact,
  exactly 37 TOSCA/Data,
  exactly 2 TOSCA/AbstractProperty,
  exactly 0 TOSCA/Property,
  exactly 2 TOSCA/Parameter,
  exactly 0 tosca_artifacts_Root,
  exactly 0 tosca_artifacts_File,
  exactly 0 tosca_artifacts_Deployment,
  exactly 0 tosca_artifacts_Deployment_Image,
  exactly 0 tosca_artifacts_Deployment_Image_VM,
  exactly 0 tosca_artifacts_Implementation,
  exactly 0 tosca_artifacts_Implementation_Bash,
  exactly 0 tosca_artifacts_Implementation_Python,
  exactly 0 tosca_artifacts_template,
  exactly 0 tosca_artifacts_nfv_SwImage,
  exactly 0 tosca_artifacts_Implementation_nfv_Mistral,
  exactly 0 tosca_artifacts_nfv_HelmChart,
  exactly 37 tosca_datatypes_Root,
  exactly 0 tosca_datatypes_Credential,
  exactly 0 tosca_datatypes_TimeInterval,
  exactly 0 tosca_datatypes_network_NetworkInfo,
  exactly 0 tosca_datatypes_network_PortInfo,
  exactly 0 tosca_datatypes_network_PortSpec,
  exactly 0 tosca_datatypes_nfv_L2AddressData,
  exactly 0 tosca_datatypes_nfv_L3AddressData,
  exactly 0 tosca_datatypes_nfv_AddressData,
  exactly 4 tosca_datatypes_nfv_ConnectivityType,
  exactly 16 tosca_datatypes_nfv_LinkBitrateRequirements,
  exactly 0 tosca_datatypes_nfv_CpProtocolData,
  exactly 0 tosca_datatypes_nfv_VnfProfile,
  exactly 4 tosca_datatypes_nfv_Qos,
  exactly 0 tosca_datatypes_nfv_VnfMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VersionDependency,
  exactly 0 tosca_datatypes_nfv_VersionDependencyStatement,
  exactly 0 tosca_datatypes_nfv_ScaleInfo,
  exactly 0 tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements,
  exactly 0 tosca_datatypes_nfv_RequestedAdditionalCapability,
  exactly 0 tosca_datatypes_nfv_VirtualMemory,
  exactly 0 tosca_datatypes_nfv_VirtualCpu,
  exactly 0 tosca_datatypes_nfv_VirtualCpuPinning,
  exactly 0 tosca_datatypes_nfv_VnfcConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VduProfile,
  exactly 0 tosca_datatypes_nfv_VlProfile,
  exactly 0 tosca_datatypes_nfv_VirtualLinkProtocolData,
  exactly 0 tosca_datatypes_nfv_L2ProtocolData,
  exactly 0 tosca_datatypes_nfv_L3ProtocolData,
  exactly 0 tosca_datatypes_nfv_IpAllocationPool,
  exactly 0 tosca_datatypes_nfv_InstantiationLevel,
  exactly 0 tosca_datatypes_nfv_VduLevel,
  exactly 0 tosca_datatypes_nfv_VnfLcmOperationsConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfInstantiateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfHealOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfTerminateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfOperateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_ScalingAspect,
  exactly 0 tosca_datatypes_nfv_VnfConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfAdditionalConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributes,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata,
  exactly 0 tosca_datatypes_nfv_LogicalNodeData,
  exactly 0 tosca_datatypes_nfv_VirtualBlockStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualObjectStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualFileStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualLinkBitrateLevel,
  exactly 0 tosca_datatypes_nfv_VnfOperationAdditionalParameters,
  exactly 0 tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfcMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VirtualLinkMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_InterfaceDetails,
  exactly 0 tosca_datatypes_nfv_UriComponents,
  exactly 0 tosca_datatypes_nfv_UriAuthority,
  exactly 0 tosca_datatypes_nfv_ChecksumData,
  exactly 0 tosca_datatypes_nfv_VnfmInterfaceInfo,
  exactly 0 tosca_datatypes_nfv_OauthServerInfo,
  exactly 0 tosca_datatypes_nfv_BootData,
  exactly 0 tosca_datatypes_nfv_KvpData,
  exactly 0 tosca_datatypes_nfv_ContentOrFileData,
  exactly 0 tosca_datatypes_nfv_BootDataVimSpecificProperties,
  exactly 0 tosca_datatypes_nfv_VnfPackageChangeSelector,
  exactly 0 tosca_datatypes_nfv_VnfPackageChangeComponentMapping,
  exactly 0 tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_ServicePortData,
  exactly 0 tosca_datatypes_nfv_AdditionalServiceData,
  exactly 0 tosca_datatypes_nfv_VnfLcmOpCoord,
  exactly 0 tosca_datatypes_nfv_InputOpCoordParams,
  exactly 0 tosca_datatypes_nfv_OutputOpCoordParams,
  exactly 0 tosca_datatypes_nfv_ExtendedResourceData,
  exactly 0 tosca_datatypes_nfv_Hugepages,
  exactly 0 tosca_datatypes_nfv_MaxNumberOfImpactedInstances,
  exactly 0 tosca_datatypes_nfv_MinNumberOfPreservedInstances,
  exactly 0 tosca_datatypes_nfv_NfviMaintenanceInfo,
  exactly 0 tosca_datatypes_nfv_McioIdentificationData,
  exactly 0 tosca_datatypes_nfv_VipCpLevel,
  exactly 0 tosca_datatypes_nfv_ServiceData,
  exactly 0 tosca_datatypes_nfv_LocationInfo,
  exactly 0 tosca_datatypes_nfv_CivicAddressElement,
  exactly 0 tosca_datatypes_nfv_GeographicCoordinates,
  exactly 4 tosca_datatypes_nfv_NsVlProfile,
  exactly 4 tosca_datatypes_nfv_NsVirtualLinkQos,
  exactly 0 tosca_datatypes_nfv_NsProfile,
  exactly 0 tosca_datatypes_nfv_Mask,
  exactly 0 tosca_datatypes_nfv_NsOperationAdditionalParameters,
  exactly 0 tosca_datatypes_nfv_NsMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_NsVirtualLinkProtocolData,
  exactly 0 tosca_datatypes_nfv_NsL2ProtocolData,
  exactly 0 tosca_datatypes_nfv_NsL3ProtocolData,
  exactly 0 tosca_datatypes_nfv_NsIpAllocationPool,
  exactly 1 tosca_datatypes_nfv_NsScalingAspect,
  exactly 8 tosca_datatypes_nfv_NsLevels,
  exactly 0 tosca_datatypes_nfv_ScaleNsByStepsData,
  exactly 0 tosca_datatypes_nfv_ScaleNsToLevelData,
  exactly 0 tosca_datatypes_nfv_NsDataFlowMirroring,
  exactly 0 tosca_datatypes_nfv_NsScaleInfo,
  exactly 23 tosca_capabilities_Root,
  exactly 21 tosca_capabilities_Node,
  exactly 0 tosca_capabilities_Container,
  exactly 0 tosca_capabilities_Compute,
  exactly 0 tosca_capabilities_Network,
  exactly 0 tosca_capabilities_Storage,
  exactly 0 tosca_capabilities_Endpoint,
  exactly 0 tosca_capabilities_Endpoint_Public,
  exactly 0 tosca_capabilities_Endpoint_Admin,
  exactly 0 tosca_capabilities_Endpoint_Database,
  exactly 0 tosca_capabilities_Attachment,
  exactly 0 tosca_capabilities_OperatingSystem,
  exactly 0 tosca_capabilities_Scalable,
  exactly 0 tosca_capabilities_network_Bindable,
  exactly 0 tosca_capabilities_network_Linkable,
  exactly 12 tosca_capabilities_nfv_VirtualLinkable,
  exactly 0 tosca_capabilities_nfv_VirtualBindable,
  exactly 0 tosca_capabilities_nfv_VirtualCompute,
  exactly 0 tosca_capabilities_nfv_VirtualStorage,
  exactly 0 tosca_capabilities_nfv_TrunkBindable,
  exactly 0 tosca_capabilities_nfv_ContainerDeployable,
  exactly 0 tosca_capabilities_nfv_AssociableVdu,
  exactly 2 tosca_capabilities_nfv_Forwarding,
  exactly 5 tosca_interfaces_Root,
  exactly 1 tosca_interfaces_node_lifecycle_Standard,
  exactly 1 tosca_interfaces_relationship_Configure,
  exactly 1 tosca_interfaces_nfv_Vnflcm,
  exactly 1 tosca_interfaces_nfv_VnfIndicator,
  exactly 0 tosca_interfaces_nfv_ChangeCurrentVnfPackage,
  exactly 1 tosca_interfaces_nfv_Nslcm,
  exactly 0 tosca_interfaces_nfv_NsVnfIndicator,
  exactly 8 tosca_relationships_Root,
  exactly 8 tosca_relationships_DependsOn,
  exactly 0 tosca_relationships_HostedOn,
  exactly 0 tosca_relationships_ConnectsTo,
  exactly 0 tosca_relationships_AttachesTo,
  exactly 0 tosca_relationships_RoutesTo,
  exactly 0 tosca_relationships_network_LinksTo,
  exactly 0 tosca_relationships_network_BindsTo,
  exactly 8 tosca_relationships_nfv_VirtualLinksTo,
  exactly 0 tosca_relationships_nfv_VipVirtualLinksTo,
  exactly 0 tosca_relationships_nfv_VirtualBindsTo,
  exactly 0 tosca_relationships_nfv_AttachesTo,
  exactly 0 tosca_relationships_nfv_TrunkBindsTo,
  exactly 0 tosca_relationships_nfv_DeploysTo,
  exactly 0 tosca_relationships_nfv_MciopAssociates,
  exactly 0 tosca_relationships_nfv_ForwardTo,
  exactly 10 tosca_nodes_Root,
  exactly 0 tosca_nodes_Abstract_Compute,
  exactly 0 tosca_nodes_Compute,
  exactly 0 tosca_nodes_SoftwareComponent,
  exactly 0 tosca_nodes_WebServer,
  exactly 0 tosca_nodes_WebApplication,
  exactly 0 tosca_nodes_DBMS,
  exactly 0 tosca_nodes_Database,
  exactly 0 tosca_nodes_Abstract_Storage,
  exactly 0 tosca_nodes_Storage_ObjectStorage,
  exactly 0 tosca_nodes_Storage_BlockStorage,
  exactly 0 tosca_nodes_Container_Runtime,
  exactly 0 tosca_nodes_Container_Application,
  exactly 0 tosca_nodes_LoadBalancer,
  exactly 0 tosca_nodes_network_Network,
  exactly 0 tosca_nodes_network_Port,
  exactly 2 tosca_nodes_nfv_Cp,
  exactly 3 tosca_nodes_nfv_VNF,
  exactly 0 tosca_nodes_nfv_VnfExtCp,
  exactly 0 tosca_nodes_nfv_Vdu_Compute,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualBlockStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualObjectStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualFileStorage,
  exactly 0 tosca_nodes_nfv_VduCp,
  exactly 0 tosca_nodes_nfv_VnfVirtualLink,
  exactly 0 tosca_nodes_nfv_VipCp,
  exactly 0 tosca_nodes_nfv_VduSubCp,
  exactly 0 tosca_nodes_nfv_Vdu_OsContainer,
  exactly 0 tosca_nodes_nfv_Vdu_OsContainerDeployableUnit,
  exactly 0 tosca_nodes_nfv_Mciop,
  exactly 0 tosca_nodes_nfv_VirtualCp,
  exactly 0 tosca_nodes_nfv_PNF,
  exactly 0 tosca_nodes_nfv_PnfExtCp,
  exactly 1 tosca_nodes_nfv_NS,
  exactly 2 tosca_nodes_nfv_Sap,
  exactly 4 tosca_nodes_nfv_NsVirtualLink,
  exactly 0 tosca_nodes_nfv_NfpPositionElement,
  exactly 0 tosca_nodes_nfv_NfpPosition,
  exactly 0 tosca_nodes_nfv_NFP,
  exactly 0 tosca_nodes_nfv_Forwarding,
  exactly 1 tosca_nodes_nfv_example_VNF1,
  exactly 1 tosca_nodes_nfv_example_VNF2,
  exactly 1 tosca_nodes_nfv_example_CNF,
  exactly 1 tosca_nodes_nfv_MultiVNF_NS,
  exactly 0 tosca_groups_Root,
  exactly 0 tosca_groups_nfv_PlacementGroup,
  exactly 0 tosca_groups_nfv_NsPlacementGroup,
  exactly 0 tosca_groups_nfv_VNFFG,
  exactly 7 tosca_policies_Root,
  exactly 0 tosca_policies_Placement,
  exactly 0 tosca_policies_Scaling,
  exactly 0 tosca_policies_Update,
  exactly 0 tosca_policies_Performance,
  exactly 0 tosca_policies_nfv_Abstract_SecurityGroupRule,
  exactly 0 tosca_policies_nfv_InstantiationLevels,
  exactly 0 tosca_policies_nfv_VduInstantiationLevels,
  exactly 0 tosca_policies_nfv_VirtualLinkInstantiationLevels,
  exactly 0 tosca_policies_nfv_ScalingAspects,
  exactly 0 tosca_policies_nfv_VduScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VduInitialDelta,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateInitialDelta,
  exactly 0 tosca_policies_nfv_AffinityRule,
  exactly 0 tosca_policies_nfv_AntiAffinityRule,
  exactly 0 tosca_policies_nfv_SupportedVnfInterface,
  exactly 0 tosca_policies_nfv_SecurityGroupRule,
  exactly 0 tosca_policies_nfv_VnfIndicator,
  exactly 0 tosca_policies_nfv_VnfPackageChange,
  exactly 0 tosca_policies_nfv_LcmCoordinationAction,
  exactly 0 tosca_policies_nfv_LcmCoordinationsForLcmOperation,
  exactly 0 tosca_policies_nfv_VipCpScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VipCpInitialDelta,
  exactly 0 tosca_policies_nfv_VipCpInstantiationLevels,
  exactly 0 tosca_policies_nfv_PnfSecurityGroupRule,
  exactly 0 tosca_policies_nfv_NsAffinityRule,
  exactly 0 tosca_policies_nfv_NsAntiAffinityRule,
  exactly 0 tosca_policies_nfv_NsSecurityGroupRule,
  exactly 0 tosca_policies_nfv_NfpRule,
  exactly 0 tosca_policies_nfv_NsMonitoring,
  exactly 0 tosca_policies_nfv_VnfMonitoring,
  exactly 1 tosca_policies_nfv_NsScalingAspects,
  exactly 3 tosca_policies_nfv_VnfToLevelMapping,
  exactly 0 tosca_policies_nfv_NsToLevelMapping,
  exactly 2 tosca_policies_nfv_VirtualLinkToLevelMapping,
  exactly 1 tosca_policies_nfv_NsInstantiationLevels,
  exactly 0 tosca_policies_nfv_VnfToInstantiationLevelMapping,
  exactly 0 tosca_policies_nfv_NsToInstantiationLevelMapping,
  exactly 0 tosca_policies_nfv_VirtualLinkToInstantiationLevelMapping,
  exactly 0 tosca_policies_nfv_NsAutoScale,
  exactly 0 tosca_policies_nfv_DataFlowInfo,
  exactly 1 Hybrid_Network_Service_topology_template,
  8 Int,
  1 seq
  expect 1

/** Substitute Hybrid_Network_Service_topology_template */
run Substitute_Hybrid_Network_Service_topology_template {
  apply_substitution[Hybrid_Network_Service_topology_template]
} for 0 but
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 4 LocationGraphs/LocationGraph,
  exactly 108 LocationGraphs/Location,
  exactly 479 LocationGraphs/Value,
  exactly 104 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 135 LocationGraphs/Role,
  exactly 31 TOSCA/Scalar,
  exactly 23 TOSCA/scalar_unit_size,
  exactly 0 TOSCA/scalar_unit_frequency,
  exactly 8 TOSCA/scalar_unit_time,
  exactly 4 TOSCA/map_integer/Map,
  exactly 2 TOSCA/map_string/Map,
  exactly 40 TOSCA/map_data/Map,
  exactly 0 TOSCA/map_map_data/Map,
  exactly 108 TOSCA/ToscaComponent,
  exactly 135 TOSCA/ToscaRole,
  exactly 85 TOSCA/ToscaValue,
  exactly 4 TOSCA/TopologyTemplate,
  exactly 41 TOSCA/Node,
  exactly 40 TOSCA/Requirement,
  exactly 95 TOSCA/Capability,
  exactly 34 TOSCA/Relationship,
  exactly 0 TOSCA/Group,
  exactly 33 TOSCA/Policy,
  exactly 5 TOSCA/Interface,
  exactly 64 TOSCA/Operation,
  exactly 0 TOSCA/Attribute,
  exactly 6 TOSCA/Artifact,
  exactly 153 TOSCA/Data,
  exactly 10 TOSCA/AbstractProperty,
  exactly 0 TOSCA/Property,
  exactly 10 TOSCA/Parameter,
  exactly 6 tosca_artifacts_Root,
  exactly 0 tosca_artifacts_File,
  exactly 6 tosca_artifacts_Deployment,
  exactly 6 tosca_artifacts_Deployment_Image,
  exactly 0 tosca_artifacts_Deployment_Image_VM,
  exactly 0 tosca_artifacts_Implementation,
  exactly 0 tosca_artifacts_Implementation_Bash,
  exactly 0 tosca_artifacts_Implementation_Python,
  exactly 0 tosca_artifacts_template,
  exactly 6 tosca_artifacts_nfv_SwImage,
  exactly 0 tosca_artifacts_Implementation_nfv_Mistral,
  exactly 0 tosca_artifacts_nfv_HelmChart,
  exactly 153 tosca_datatypes_Root,
  exactly 0 tosca_datatypes_Credential,
  exactly 0 tosca_datatypes_TimeInterval,
  exactly 0 tosca_datatypes_network_NetworkInfo,
  exactly 0 tosca_datatypes_network_PortInfo,
  exactly 0 tosca_datatypes_network_PortSpec,
  exactly 0 tosca_datatypes_nfv_L2AddressData,
  exactly 0 tosca_datatypes_nfv_L3AddressData,
  exactly 0 tosca_datatypes_nfv_AddressData,
  exactly 10 tosca_datatypes_nfv_ConnectivityType,
  exactly 28 tosca_datatypes_nfv_LinkBitrateRequirements,
  exactly 0 tosca_datatypes_nfv_CpProtocolData,
  exactly 0 tosca_datatypes_nfv_VnfProfile,
  exactly 4 tosca_datatypes_nfv_Qos,
  exactly 0 tosca_datatypes_nfv_VnfMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VersionDependency,
  exactly 0 tosca_datatypes_nfv_VersionDependencyStatement,
  exactly 18 tosca_datatypes_nfv_ScaleInfo,
  exactly 0 tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements,
  exactly 2 tosca_datatypes_nfv_RequestedAdditionalCapability,
  exactly 6 tosca_datatypes_nfv_VirtualMemory,
  exactly 6 tosca_datatypes_nfv_VirtualCpu,
  exactly 0 tosca_datatypes_nfv_VirtualCpuPinning,
  exactly 0 tosca_datatypes_nfv_VnfcConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties,
  exactly 6 tosca_datatypes_nfv_VduProfile,
  exactly 6 tosca_datatypes_nfv_VlProfile,
  exactly 0 tosca_datatypes_nfv_VirtualLinkProtocolData,
  exactly 0 tosca_datatypes_nfv_L2ProtocolData,
  exactly 0 tosca_datatypes_nfv_L3ProtocolData,
  exactly 0 tosca_datatypes_nfv_IpAllocationPool,
  exactly 9 tosca_datatypes_nfv_InstantiationLevel,
  exactly 30 tosca_datatypes_nfv_VduLevel,
  exactly 0 tosca_datatypes_nfv_VnfLcmOperationsConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfInstantiateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfHealOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfTerminateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfOperateOperationConfiguration,
  exactly 6 tosca_datatypes_nfv_ScalingAspect,
  exactly 0 tosca_datatypes_nfv_VnfConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfAdditionalConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributes,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata,
  exactly 0 tosca_datatypes_nfv_LogicalNodeData,
  exactly 5 tosca_datatypes_nfv_VirtualBlockStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualObjectStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualFileStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualLinkBitrateLevel,
  exactly 0 tosca_datatypes_nfv_VnfOperationAdditionalParameters,
  exactly 0 tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfcMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VirtualLinkMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_InterfaceDetails,
  exactly 0 tosca_datatypes_nfv_UriComponents,
  exactly 0 tosca_datatypes_nfv_UriAuthority,
  exactly 4 tosca_datatypes_nfv_ChecksumData,
  exactly 0 tosca_datatypes_nfv_VnfmInterfaceInfo,
  exactly 0 tosca_datatypes_nfv_OauthServerInfo,
  exactly 0 tosca_datatypes_nfv_BootData,
  exactly 0 tosca_datatypes_nfv_KvpData,
  exactly 0 tosca_datatypes_nfv_ContentOrFileData,
  exactly 0 tosca_datatypes_nfv_BootDataVimSpecificProperties,
  exactly 0 tosca_datatypes_nfv_VnfPackageChangeSelector,
  exactly 0 tosca_datatypes_nfv_VnfPackageChangeComponentMapping,
  exactly 0 tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_ServicePortData,
  exactly 0 tosca_datatypes_nfv_AdditionalServiceData,
  exactly 0 tosca_datatypes_nfv_VnfLcmOpCoord,
  exactly 0 tosca_datatypes_nfv_InputOpCoordParams,
  exactly 0 tosca_datatypes_nfv_OutputOpCoordParams,
  exactly 0 tosca_datatypes_nfv_ExtendedResourceData,
  exactly 0 tosca_datatypes_nfv_Hugepages,
  exactly 0 tosca_datatypes_nfv_MaxNumberOfImpactedInstances,
  exactly 0 tosca_datatypes_nfv_MinNumberOfPreservedInstances,
  exactly 0 tosca_datatypes_nfv_NfviMaintenanceInfo,
  exactly 0 tosca_datatypes_nfv_McioIdentificationData,
  exactly 0 tosca_datatypes_nfv_VipCpLevel,
  exactly 0 tosca_datatypes_nfv_ServiceData,
  exactly 0 tosca_datatypes_nfv_LocationInfo,
  exactly 0 tosca_datatypes_nfv_CivicAddressElement,
  exactly 0 tosca_datatypes_nfv_GeographicCoordinates,
  exactly 4 tosca_datatypes_nfv_NsVlProfile,
  exactly 4 tosca_datatypes_nfv_NsVirtualLinkQos,
  exactly 0 tosca_datatypes_nfv_NsProfile,
  exactly 0 tosca_datatypes_nfv_Mask,
  exactly 0 tosca_datatypes_nfv_NsOperationAdditionalParameters,
  exactly 0 tosca_datatypes_nfv_NsMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_NsVirtualLinkProtocolData,
  exactly 0 tosca_datatypes_nfv_NsL2ProtocolData,
  exactly 0 tosca_datatypes_nfv_NsL3ProtocolData,
  exactly 0 tosca_datatypes_nfv_NsIpAllocationPool,
  exactly 1 tosca_datatypes_nfv_NsScalingAspect,
  exactly 8 tosca_datatypes_nfv_NsLevels,
  exactly 0 tosca_datatypes_nfv_ScaleNsByStepsData,
  exactly 0 tosca_datatypes_nfv_ScaleNsToLevelData,
  exactly 0 tosca_datatypes_nfv_NsDataFlowMirroring,
  exactly 0 tosca_datatypes_nfv_NsScaleInfo,
  exactly 95 tosca_capabilities_Root,
  exactly 93 tosca_capabilities_Node,
  exactly 0 tosca_capabilities_Container,
  exactly 0 tosca_capabilities_Compute,
  exactly 0 tosca_capabilities_Network,
  exactly 0 tosca_capabilities_Storage,
  exactly 0 tosca_capabilities_Endpoint,
  exactly 0 tosca_capabilities_Endpoint_Public,
  exactly 0 tosca_capabilities_Endpoint_Admin,
  exactly 0 tosca_capabilities_Endpoint_Database,
  exactly 0 tosca_capabilities_Attachment,
  exactly 0 tosca_capabilities_OperatingSystem,
  exactly 0 tosca_capabilities_Scalable,
  exactly 0 tosca_capabilities_network_Bindable,
  exactly 0 tosca_capabilities_network_Linkable,
  exactly 32 tosca_capabilities_nfv_VirtualLinkable,
  exactly 18 tosca_capabilities_nfv_VirtualBindable,
  exactly 6 tosca_capabilities_nfv_VirtualCompute,
  exactly 0 tosca_capabilities_nfv_VirtualStorage,
  exactly 0 tosca_capabilities_nfv_TrunkBindable,
  exactly 0 tosca_capabilities_nfv_ContainerDeployable,
  exactly 0 tosca_capabilities_nfv_AssociableVdu,
  exactly 2 tosca_capabilities_nfv_Forwarding,
  exactly 5 tosca_interfaces_Root,
  exactly 1 tosca_interfaces_node_lifecycle_Standard,
  exactly 1 tosca_interfaces_relationship_Configure,
  exactly 1 tosca_interfaces_nfv_Vnflcm,
  exactly 1 tosca_interfaces_nfv_VnfIndicator,
  exactly 0 tosca_interfaces_nfv_ChangeCurrentVnfPackage,
  exactly 1 tosca_interfaces_nfv_Nslcm,
  exactly 0 tosca_interfaces_nfv_NsVnfIndicator,
  exactly 34 tosca_relationships_Root,
  exactly 34 tosca_relationships_DependsOn,
  exactly 0 tosca_relationships_HostedOn,
  exactly 0 tosca_relationships_ConnectsTo,
  exactly 0 tosca_relationships_AttachesTo,
  exactly 0 tosca_relationships_RoutesTo,
  exactly 0 tosca_relationships_network_LinksTo,
  exactly 0 tosca_relationships_network_BindsTo,
  exactly 22 tosca_relationships_nfv_VirtualLinksTo,
  exactly 0 tosca_relationships_nfv_VipVirtualLinksTo,
  exactly 12 tosca_relationships_nfv_VirtualBindsTo,
  exactly 0 tosca_relationships_nfv_AttachesTo,
  exactly 0 tosca_relationships_nfv_TrunkBindsTo,
  exactly 0 tosca_relationships_nfv_DeploysTo,
  exactly 0 tosca_relationships_nfv_MciopAssociates,
  exactly 0 tosca_relationships_nfv_ForwardTo,
  exactly 41 tosca_nodes_Root,
  exactly 0 tosca_nodes_Abstract_Compute,
  exactly 0 tosca_nodes_Compute,
  exactly 0 tosca_nodes_SoftwareComponent,
  exactly 0 tosca_nodes_WebServer,
  exactly 0 tosca_nodes_WebApplication,
  exactly 0 tosca_nodes_DBMS,
  exactly 0 tosca_nodes_Database,
  exactly 0 tosca_nodes_Abstract_Storage,
  exactly 0 tosca_nodes_Storage_ObjectStorage,
  exactly 0 tosca_nodes_Storage_BlockStorage,
  exactly 0 tosca_nodes_Container_Runtime,
  exactly 0 tosca_nodes_Container_Application,
  exactly 0 tosca_nodes_LoadBalancer,
  exactly 0 tosca_nodes_network_Network,
  exactly 0 tosca_nodes_network_Port,
  exactly 18 tosca_nodes_nfv_Cp,
  exactly 6 tosca_nodes_nfv_VNF,
  exactly 4 tosca_nodes_nfv_VnfExtCp,
  exactly 6 tosca_nodes_nfv_Vdu_Compute,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualBlockStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualObjectStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualFileStorage,
  exactly 12 tosca_nodes_nfv_VduCp,
  exactly 6 tosca_nodes_nfv_VnfVirtualLink,
  exactly 0 tosca_nodes_nfv_VipCp,
  exactly 0 tosca_nodes_nfv_VduSubCp,
  exactly 0 tosca_nodes_nfv_Vdu_OsContainer,
  exactly 0 tosca_nodes_nfv_Vdu_OsContainerDeployableUnit,
  exactly 0 tosca_nodes_nfv_Mciop,
  exactly 0 tosca_nodes_nfv_VirtualCp,
  exactly 0 tosca_nodes_nfv_PNF,
  exactly 0 tosca_nodes_nfv_PnfExtCp,
  exactly 1 tosca_nodes_nfv_NS,
  exactly 2 tosca_nodes_nfv_Sap,
  exactly 4 tosca_nodes_nfv_NsVirtualLink,
  exactly 0 tosca_nodes_nfv_NfpPositionElement,
  exactly 0 tosca_nodes_nfv_NfpPosition,
  exactly 0 tosca_nodes_nfv_NFP,
  exactly 0 tosca_nodes_nfv_Forwarding,
  exactly 2 tosca_nodes_nfv_example_VNF1,
  exactly 2 tosca_nodes_nfv_example_VNF2,
  exactly 2 tosca_nodes_nfv_example_CNF,
  exactly 1 tosca_nodes_nfv_MultiVNF_NS,
  exactly 0 tosca_groups_Root,
  exactly 0 tosca_groups_nfv_PlacementGroup,
  exactly 0 tosca_groups_nfv_NsPlacementGroup,
  exactly 0 tosca_groups_nfv_VNFFG,
  exactly 33 tosca_policies_Root,
  exactly 2 tosca_policies_Placement,
  exactly 0 tosca_policies_Scaling,
  exactly 0 tosca_policies_Update,
  exactly 0 tosca_policies_Performance,
  exactly 0 tosca_policies_nfv_Abstract_SecurityGroupRule,
  exactly 3 tosca_policies_nfv_InstantiationLevels,
  exactly 6 tosca_policies_nfv_VduInstantiationLevels,
  exactly 0 tosca_policies_nfv_VirtualLinkInstantiationLevels,
  exactly 3 tosca_policies_nfv_ScalingAspects,
  exactly 6 tosca_policies_nfv_VduScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas,
  exactly 6 tosca_policies_nfv_VduInitialDelta,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateInitialDelta,
  exactly 0 tosca_policies_nfv_AffinityRule,
  exactly 2 tosca_policies_nfv_AntiAffinityRule,
  exactly 0 tosca_policies_nfv_SupportedVnfInterface,
  exactly 0 tosca_policies_nfv_SecurityGroupRule,
  exactly 0 tosca_policies_nfv_VnfIndicator,
  exactly 0 tosca_policies_nfv_VnfPackageChange,
  exactly 0 tosca_policies_nfv_LcmCoordinationAction,
  exactly 0 tosca_policies_nfv_LcmCoordinationsForLcmOperation,
  exactly 0 tosca_policies_nfv_VipCpScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VipCpInitialDelta,
  exactly 0 tosca_policies_nfv_VipCpInstantiationLevels,
  exactly 0 tosca_policies_nfv_PnfSecurityGroupRule,
  exactly 0 tosca_policies_nfv_NsAffinityRule,
  exactly 0 tosca_policies_nfv_NsAntiAffinityRule,
  exactly 0 tosca_policies_nfv_NsSecurityGroupRule,
  exactly 0 tosca_policies_nfv_NfpRule,
  exactly 0 tosca_policies_nfv_NsMonitoring,
  exactly 0 tosca_policies_nfv_VnfMonitoring,
  exactly 1 tosca_policies_nfv_NsScalingAspects,
  exactly 3 tosca_policies_nfv_VnfToLevelMapping,
  exactly 0 tosca_policies_nfv_NsToLevelMapping,
  exactly 2 tosca_policies_nfv_VirtualLinkToLevelMapping,
  exactly 1 tosca_policies_nfv_NsInstantiationLevels,
  exactly 0 tosca_policies_nfv_VnfToInstantiationLevelMapping,
  exactly 0 tosca_policies_nfv_NsToInstantiationLevelMapping,
  exactly 0 tosca_policies_nfv_VirtualLinkToInstantiationLevelMapping,
  exactly 0 tosca_policies_nfv_NsAutoScale,
  exactly 0 tosca_policies_nfv_DataFlowInfo,
  exactly 1 Hybrid_Network_Service_topology_template,
  exactly 1 VNF1_scalable_topology_template,
  exactly 1 VNF2_scalable_topology_template,
  exactly 1 CNF3_scalable_topology_template,
  8 Int,
  1 seq
  expect 1


