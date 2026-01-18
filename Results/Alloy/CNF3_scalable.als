// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: CNF Proxy scalable et tolérant aux pannes basé sur des conteneurs (Frontend & Backend/Cache)

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_vnfd_types_4_4_1

// --------------------------------------------------
// Node Types
// --------------------------------------------------

sig tosca_nodes_nfv_Proxy_CNF extends tosca_nodes_nfv_VNF
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'type': 'string', 'default': 'proxy-container-based'}
  // NOTE: descriptor_id overloaded

  // YAML provider: {'type': 'string', 'default': 'MyCompany'}
  // NOTE: provider overloaded

  // YAML product_name: {'type': 'string', 'default': 'Proxy_CNF'}
  // NOTE: product_name overloaded

  // YAML software_version: {'type': 'string', 'default': '1.0'}
  // NOTE: software_version overloaded

  // YAML descriptor_version: {'type': 'string', 'default': '1.0'}
  // NOTE: descriptor_version overloaded

  // YAML flavour_id: {'type': 'string', 'default': 'scalable_ha_container'}
  // NOTE: flavour_id overloaded

  // YAML flavour_description: {'type': 'string', 'default': 'Scalable containerized flavour with HA support for Proxy'}
  // NOTE: flavour_description overloaded

  // YAML vnfm_info: {'type': 'list', 'entry_schema': {'type': 'string'}, 'default': ['etsivnfm:v3.3.1']}
  // NOTE: vnfm_info overloaded

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link_external: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo'}
  requirement_virtual_link_external: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link_external: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo'}
  requirement["virtual_link_external", requirement_virtual_link_external]
  requirement_virtual_link_external.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link_external.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.Proxy_CNF */
run Show_tosca_nodes_nfv_Proxy_CNF {
  tosca_nodes_nfv_Proxy_CNF.no_name[]
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
  exactly 1 tosca_nodes_nfv_Proxy_CNF
  expect 1

// --------------------------------------------------
// Topology Template
// --------------------------------------------------

sig CNF3_scalable_topology_template extends TOSCA/TopologyTemplate
{
  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  // YAML extCp_mgmt: {'type': 'tosca.nodes.nfv.VnfExtCp', 'properties': {'layer_protocols': ['ipv4'], 'description': 'Proxy Management interface'}, 'requirements': [{'internal_virtual_link': 'intVL_mgmt'}]}
  // YAML type: tosca.nodes.nfv.VnfExtCp
  extCp_mgmt: one tosca_nodes_nfv_VnfExtCp,

  // YAML extCp_data: {'type': 'tosca.nodes.nfv.VnfExtCp', 'properties': {'layer_protocols': ['ipv4'], 'description': 'Proxy Data plane interface'}, 'requirements': [{'internal_virtual_link': 'intVL_data'}]}
  // YAML type: tosca.nodes.nfv.VnfExtCp
  extCp_data: one tosca_nodes_nfv_VnfExtCp,

  // YAML intVL_mgmt: {'type': 'tosca.nodes.nfv.VnfVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4']}, 'description': 'Proxy Management network', 'vl_profile': {'max_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'min_bitrate_requirements': {'root': 100000, 'leaf': 10000}}}}
  // YAML type: tosca.nodes.nfv.VnfVirtualLink
  intVL_mgmt: one tosca_nodes_nfv_VnfVirtualLink,

  // YAML intVL_data: {'type': 'tosca.nodes.nfv.VnfVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4']}, 'description': 'Proxy Data plane network', 'vl_profile': {'max_bitrate_requirements': {'root': 10000000, 'leaf': 1000000}, 'min_bitrate_requirements': {'root': 1000000, 'leaf': 100000}}}}
  // YAML type: tosca.nodes.nfv.VnfVirtualLink
  intVL_data: one tosca_nodes_nfv_VnfVirtualLink,

  // YAML vdu_proxy_frontend: {'type': 'tosca.nodes.nfv.Vdu.Compute', 'properties': {'name': 'proxy-frontend', 'description': 'Proxy Frontend (Entry point/SSL Termination)', 'vdu_profile': {'min_number_of_instances': 3, 'max_number_of_instances': 10}}, 'capabilities': {'virtual_compute': {'properties': {'virtual_memory': {'virtual_mem_size': '4 GB'}, 'virtual_cpu': {'num_virtual_cpu': 2}, 'requested_additional_capabilities': {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}}}}, 'artifacts': {'sw_image': {'type': 'tosca.artifacts.nfv.SwImage', 'file': 'docker.io/mycompany/proxy-frontend:v1.0', 'properties': {'name': 'proxy-frontend-img', 'version': '1.0', 'container_format': 'docker', 'size': '500 MB', 'min_ram': '2 GB', 'operating_system': 'linux'}}}}
  // YAML type: tosca.nodes.nfv.Vdu.Compute
  vdu_proxy_frontend: one tosca_nodes_nfv_Vdu_Compute,

  // YAML vdu_proxy_backend: {'type': 'tosca.nodes.nfv.Vdu.Compute', 'properties': {'name': 'proxy-backend', 'description': 'Proxy Backend (Caching and Content processing)', 'vdu_profile': {'min_number_of_instances': 3, 'max_number_of_instances': 8}}, 'capabilities': {'virtual_compute': {'properties': {'virtual_memory': {'virtual_mem_size': '8 GB'}, 'virtual_cpu': {'num_virtual_cpu': 4}, 'virtual_local_storage': [{'size_of_storage': '50 GB'}], 'requested_additional_capabilities': {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}}}}, 'artifacts': {'sw_image': {'type': 'tosca.artifacts.nfv.SwImage', 'file': 'docker.io/mycompany/proxy-backend:v1.0', 'properties': {'name': 'proxy-backend-img', 'version': '1.0', 'container_format': 'docker', 'size': '800 MB', 'min_ram': '4 GB', 'operating_system': 'linux'}}}}
  // YAML type: tosca.nodes.nfv.Vdu.Compute
  vdu_proxy_backend: one tosca_nodes_nfv_Vdu_Compute,

  // YAML cp_proxy_frontend_mgmt: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 0, 'description': 'Proxy Frontend management interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_frontend'}, {'virtual_link': 'intVL_mgmt'}]}
  // YAML type: tosca.nodes.nfv.VduCp
  cp_proxy_frontend_mgmt: one tosca_nodes_nfv_VduCp,

  // YAML cp_proxy_frontend_data: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 1, 'description': 'Proxy Frontend data interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_frontend'}, {'virtual_link': 'intVL_data'}]}
  // YAML type: tosca.nodes.nfv.VduCp
  cp_proxy_frontend_data: one tosca_nodes_nfv_VduCp,

  // YAML cp_proxy_backend_mgmt: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 0, 'description': 'Proxy Backend management interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_backend'}, {'virtual_link': 'intVL_mgmt'}]}
  // YAML type: tosca.nodes.nfv.VduCp
  cp_proxy_backend_mgmt: one tosca_nodes_nfv_VduCp,

  // YAML cp_proxy_backend_data: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 1, 'description': 'Proxy Backend data interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_backend'}, {'virtual_link': 'intVL_data'}]}
  // YAML type: tosca.nodes.nfv.VduCp
  cp_proxy_backend_data: one tosca_nodes_nfv_VduCp,

  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML policies:
  // --------------------------------------------------

  // YAML scaling_aspects: {'type': 'tosca.policies.nfv.ScalingAspects', 'properties': {'aspects': {'proxy_frontend_scaling': {'name': 'proxy_frontend_scaling_aspect', 'description': 'Horizontal Pod Autoscaling for Proxy frontend', 'max_scale_level': 7, 'step_deltas': ['delta_1']}, 'proxy_backend_scaling': {'name': 'proxy_backend_scaling_aspect', 'description': 'Horizontal Pod Autoscaling for Proxy backend', 'max_scale_level': 5, 'step_deltas': ['delta_1']}}}}
  // YAML type: tosca.policies.nfv.ScalingAspects
  policy_scaling_aspects: one tosca_policies_nfv_ScalingAspects,

  // YAML vdu_proxy_frontend_initial_delta: {'type': 'tosca.policies.nfv.VduInitialDelta', 'properties': {'initial_delta': {'number_of_instances': 3}}, 'targets': ['vdu_proxy_frontend']}
  // YAML type: tosca.policies.nfv.VduInitialDelta
  policy_vdu_proxy_frontend_initial_delta: one tosca_policies_nfv_VduInitialDelta,

  // YAML vdu_proxy_frontend_scaling_delta: {'type': 'tosca.policies.nfv.VduScalingAspectDeltas', 'properties': {'aspect': 'proxy_frontend_scaling', 'deltas': {'delta_1': {'number_of_instances': 1}}}, 'targets': ['vdu_proxy_frontend']}
  // YAML type: tosca.policies.nfv.VduScalingAspectDeltas
  policy_vdu_proxy_frontend_scaling_delta: one tosca_policies_nfv_VduScalingAspectDeltas,

  // YAML vdu_proxy_backend_initial_delta: {'type': 'tosca.policies.nfv.VduInitialDelta', 'properties': {'initial_delta': {'number_of_instances': 3}}, 'targets': ['vdu_proxy_backend']}
  // YAML type: tosca.policies.nfv.VduInitialDelta
  policy_vdu_proxy_backend_initial_delta: one tosca_policies_nfv_VduInitialDelta,

  // YAML vdu_proxy_backend_scaling_delta: {'type': 'tosca.policies.nfv.VduScalingAspectDeltas', 'properties': {'aspect': 'proxy_backend_scaling', 'deltas': {'delta_1': {'number_of_instances': 1}}}, 'targets': ['vdu_proxy_backend']}
  // YAML type: tosca.policies.nfv.VduScalingAspectDeltas
  policy_vdu_proxy_backend_scaling_delta: one tosca_policies_nfv_VduScalingAspectDeltas,

  // YAML instantiation_levels: {'type': 'tosca.policies.nfv.InstantiationLevels', 'properties': {'levels': {'small': {'description': 'Small instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 0}, 'proxy_backend_scaling': {'scale_level': 0}}}, 'medium': {'description': 'Medium instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 3}, 'proxy_backend_scaling': {'scale_level': 2}}}, 'large': {'description': 'Large instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 7}, 'proxy_backend_scaling': {'scale_level': 5}}}}, 'default_level': 'small'}}
  // YAML type: tosca.policies.nfv.InstantiationLevels
  policy_instantiation_levels: one tosca_policies_nfv_InstantiationLevels,

  // YAML vdu_proxy_frontend_instantiation_levels: {'type': 'tosca.policies.nfv.VduInstantiationLevels', 'properties': {'levels': {'small': {'number_of_instances': 3}, 'medium': {'number_of_instances': 6}, 'large': {'number_of_instances': 10}}}, 'targets': ['vdu_proxy_frontend']}
  // YAML type: tosca.policies.nfv.VduInstantiationLevels
  policy_vdu_proxy_frontend_instantiation_levels: one tosca_policies_nfv_VduInstantiationLevels,

  // YAML vdu_proxy_backend_instantiation_levels: {'type': 'tosca.policies.nfv.VduInstantiationLevels', 'properties': {'levels': {'small': {'number_of_instances': 3}, 'medium': {'number_of_instances': 5}, 'large': {'number_of_instances': 8}}}, 'targets': ['vdu_proxy_backend']}
  // YAML type: tosca.policies.nfv.VduInstantiationLevels
  policy_vdu_proxy_backend_instantiation_levels: one tosca_policies_nfv_VduInstantiationLevels,

  // YAML proxy_frontend_anti_affinity: {'type': 'tosca.policies.nfv.AntiAffinityRule', 'properties': {'scope': 'nfvi_node'}, 'targets': ['vdu_proxy_frontend']}
  // YAML type: tosca.policies.nfv.AntiAffinityRule
  policy_proxy_frontend_anti_affinity: one tosca_policies_nfv_AntiAffinityRule,

  // YAML proxy_backend_anti_affinity: {'type': 'tosca.policies.nfv.AntiAffinityRule', 'properties': {'scope': 'nfvi_node'}, 'targets': ['vdu_proxy_backend']}
  // YAML type: tosca.policies.nfv.AntiAffinityRule
  policy_proxy_backend_anti_affinity: one tosca_policies_nfv_AntiAffinityRule,

  // --------------------------------------------------
  // YAML outputs:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML substitution_mappings:
  // --------------------------------------------------

  // YAML substitution_mappings: {'node_type': 'tosca.nodes.nfv.Proxy_CNF', 'requirements': {'virtual_link_external': ['extCp_data', 'external_virtual_link']}}
  // YAML node_type: tosca.nodes.nfv.Proxy_CNF
  substitution_mappings: one tosca_nodes_nfv_Proxy_CNF,

} {
  // YAML description: None
  no description

  // --------------------------------------------------
  // YAML inputs:
  // --------------------------------------------------

  #inputs = 4
  // YAML inputs:
  // YAML   proxy_frontend_cpu_limit:
  one input_proxy_frontend_cpu_limit : input["proxy_frontend_cpu_limit"] {
    // YAML type: string
    input_proxy_frontend_cpu_limit.type = "string"
    input_proxy_frontend_cpu_limit.type[string]
    // YAML description: None
    no input_proxy_frontend_cpu_limit.description
    // YAML required: true
    input_proxy_frontend_cpu_limit.required[true]
    // YAML  default: 2000m
    (string<:input_proxy_frontend_cpu_limit.default) = "2000m"
    // YAML status: supported
    input_proxy_frontend_cpu_limit.status = "supported"
    no input_proxy_frontend_cpu_limit.external_schema
    no input_proxy_frontend_cpu_limit.metadata
  }
  // YAML   proxy_frontend_memory_limit:
  one input_proxy_frontend_memory_limit : input["proxy_frontend_memory_limit"] {
    // YAML type: string
    input_proxy_frontend_memory_limit.type = "string"
    input_proxy_frontend_memory_limit.type[string]
    // YAML description: None
    no input_proxy_frontend_memory_limit.description
    // YAML required: true
    input_proxy_frontend_memory_limit.required[true]
    // YAML  default: 4Gi
    (string<:input_proxy_frontend_memory_limit.default) = "4Gi"
    // YAML status: supported
    input_proxy_frontend_memory_limit.status = "supported"
    no input_proxy_frontend_memory_limit.external_schema
    no input_proxy_frontend_memory_limit.metadata
  }
  // YAML   proxy_backend_cpu_limit:
  one input_proxy_backend_cpu_limit : input["proxy_backend_cpu_limit"] {
    // YAML type: string
    input_proxy_backend_cpu_limit.type = "string"
    input_proxy_backend_cpu_limit.type[string]
    // YAML description: None
    no input_proxy_backend_cpu_limit.description
    // YAML required: true
    input_proxy_backend_cpu_limit.required[true]
    // YAML  default: 4000m
    (string<:input_proxy_backend_cpu_limit.default) = "4000m"
    // YAML status: supported
    input_proxy_backend_cpu_limit.status = "supported"
    no input_proxy_backend_cpu_limit.external_schema
    no input_proxy_backend_cpu_limit.metadata
  }
  // YAML   proxy_backend_memory_limit:
  one input_proxy_backend_memory_limit : input["proxy_backend_memory_limit"] {
    // YAML type: string
    input_proxy_backend_memory_limit.type = "string"
    input_proxy_backend_memory_limit.type[string]
    // YAML description: None
    no input_proxy_backend_memory_limit.description
    // YAML required: true
    input_proxy_backend_memory_limit.required[true]
    // YAML  default: 8Gi
    (string<:input_proxy_backend_memory_limit.default) = "8Gi"
    // YAML status: supported
    input_proxy_backend_memory_limit.status = "supported"
    no input_proxy_backend_memory_limit.external_schema
    no input_proxy_backend_memory_limit.metadata
  }

  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  #nodes = 10
  // YAML extCp_mgmt: {'type': 'tosca.nodes.nfv.VnfExtCp', 'properties': {'layer_protocols': ['ipv4'], 'description': 'Proxy Management interface'}, 'requirements': [{'internal_virtual_link': 'intVL_mgmt'}]}
  node[extCp_mgmt]
  extCp_mgmt.name["extCp_mgmt"]
  extCp_mgmt.node_type_name = "tosca.nodes.nfv.VnfExtCp"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #extCp_mgmt.property_layer_protocols = 1
  extCp_mgmt.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   extCp_mgmt.property_ip_stack_mode
  // NOTE: The property 'role' is not required.
  no   extCp_mgmt.property_role
  // YAML description: Proxy Management interface
  extCp_mgmt.property_description = "Proxy Management interface"
  // NOTE: The property 'protocol' is not required.
  no   extCp_mgmt.property_protocol
  // NOTE: The property 'trunk_mode' is not required.
  no   extCp_mgmt.property_trunk_mode
  // NOTE: The property 'virtual_network_interface_requirements' is not required.
  no   extCp_mgmt.property_virtual_network_interface_requirements
  // YAML interfaces:
  #extCp_mgmt.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no extCp_mgmt.interface_Standard.operation_create.implementation
  no extCp_mgmt.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no extCp_mgmt.interface_Standard.operation_configure.implementation
  no extCp_mgmt.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no extCp_mgmt.interface_Standard.operation_start.implementation
  no extCp_mgmt.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no extCp_mgmt.interface_Standard.operation_stop.implementation
  no extCp_mgmt.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no extCp_mgmt.interface_Standard.operation_delete.implementation
  no extCp_mgmt.interface_Standard.operation_delete.inputs
  #extCp_mgmt.interface_Standard.operations = 5
  // YAML artifacts:
  no extCp_mgmt.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML internal_virtual_link: intVL_mgmt
  connect[extCp_mgmt.requirement_internal_virtual_link, intVL_mgmt.capability_virtual_linkable]
  extCp_mgmt.requirement_internal_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #extCp_mgmt.requirement_internal_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #extCp_mgmt.requirement_internal_virtual_link.relationship.interface_Configure.operations = 8

  // YAML extCp_data: {'type': 'tosca.nodes.nfv.VnfExtCp', 'properties': {'layer_protocols': ['ipv4'], 'description': 'Proxy Data plane interface'}, 'requirements': [{'internal_virtual_link': 'intVL_data'}]}
  node[extCp_data]
  extCp_data.name["extCp_data"]
  extCp_data.node_type_name = "tosca.nodes.nfv.VnfExtCp"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #extCp_data.property_layer_protocols = 1
  extCp_data.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   extCp_data.property_ip_stack_mode
  // NOTE: The property 'role' is not required.
  no   extCp_data.property_role
  // YAML description: Proxy Data plane interface
  extCp_data.property_description = "Proxy Data plane interface"
  // NOTE: The property 'protocol' is not required.
  no   extCp_data.property_protocol
  // NOTE: The property 'trunk_mode' is not required.
  no   extCp_data.property_trunk_mode
  // NOTE: The property 'virtual_network_interface_requirements' is not required.
  no   extCp_data.property_virtual_network_interface_requirements
  // YAML interfaces:
  #extCp_data.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no extCp_data.interface_Standard.operation_create.implementation
  no extCp_data.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no extCp_data.interface_Standard.operation_configure.implementation
  no extCp_data.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no extCp_data.interface_Standard.operation_start.implementation
  no extCp_data.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no extCp_data.interface_Standard.operation_stop.implementation
  no extCp_data.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no extCp_data.interface_Standard.operation_delete.implementation
  no extCp_data.interface_Standard.operation_delete.inputs
  #extCp_data.interface_Standard.operations = 5
  // YAML artifacts:
  no extCp_data.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML internal_virtual_link: intVL_data
  connect[extCp_data.requirement_internal_virtual_link, intVL_data.capability_virtual_linkable]
  extCp_data.requirement_internal_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #extCp_data.requirement_internal_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #extCp_data.requirement_internal_virtual_link.relationship.interface_Configure.operations = 8

  // YAML intVL_mgmt: {'type': 'tosca.nodes.nfv.VnfVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4']}, 'description': 'Proxy Management network', 'vl_profile': {'max_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'min_bitrate_requirements': {'root': 100000, 'leaf': 10000}}}}
  node[intVL_mgmt]
  intVL_mgmt.name["intVL_mgmt"]
  intVL_mgmt.node_type_name = "tosca.nodes.nfv.VnfVirtualLink"
  // YAML properties:
  // YAML connectivity_type: {'layer_protocols': ['ipv4']}
  // YAML layer_protocols: ['ipv4']
  #intVL_mgmt.property_connectivity_type.layer_protocols = 1
  intVL_mgmt.property_connectivity_type.layer_protocols[0] = "ipv4"
  // NOTE: The property 'flow_pattern' is not required.
  no   intVL_mgmt.property_connectivity_type.flow_pattern
  // YAML description: Proxy Management network
  intVL_mgmt.property_description = "Proxy Management network"
  // NOTE: The property 'test_access' is not required.
  no   intVL_mgmt.property_test_access
  // YAML vl_profile: {'max_bitrate_requirements': {'root': 1000000, 'leaf': 100000}, 'min_bitrate_requirements': {'root': 100000, 'leaf': 10000}}
  // YAML max_bitrate_requirements: {'root': 1000000, 'leaf': 100000}
  // YAML root: 1000000
  intVL_mgmt.property_vl_profile.max_bitrate_requirements.root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  intVL_mgmt.property_vl_profile.max_bitrate_requirements.leaf = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML min_bitrate_requirements: {'root': 100000, 'leaf': 10000}
  // YAML root: 100000
  intVL_mgmt.property_vl_profile.min_bitrate_requirements.root = 127 // ISSUE: 100000 is a too big integer!!!
  // YAML leaf: 10000
  intVL_mgmt.property_vl_profile.min_bitrate_requirements.leaf = 127 // ISSUE: 10000 is a too big integer!!!
  // NOTE: The property 'qos' is not required.
  no   intVL_mgmt.property_vl_profile.qos
  // NOTE: The property 'virtual_link_protocol_data' is not required.
  no   intVL_mgmt.property_vl_profile.virtual_link_protocol_data
  // NOTE: The property 'monitoring_parameters' is not required.
  no   intVL_mgmt.property_monitoring_parameters
  // NOTE: The property 'nfvi_maintenance_info' is not required.
  no   intVL_mgmt.property_nfvi_maintenance_info
  // NOTE: The property 'externally_managed' is not required.
  no   intVL_mgmt.property_externally_managed
  // YAML interfaces:
  #intVL_mgmt.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no intVL_mgmt.interface_Standard.operation_create.implementation
  no intVL_mgmt.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no intVL_mgmt.interface_Standard.operation_configure.implementation
  no intVL_mgmt.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no intVL_mgmt.interface_Standard.operation_start.implementation
  no intVL_mgmt.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no intVL_mgmt.interface_Standard.operation_stop.implementation
  no intVL_mgmt.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no intVL_mgmt.interface_Standard.operation_delete.implementation
  no intVL_mgmt.interface_Standard.operation_delete.inputs
  #intVL_mgmt.interface_Standard.operations = 5
  // YAML artifacts:
  no intVL_mgmt.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_linkable: None

  // YAML intVL_data: {'type': 'tosca.nodes.nfv.VnfVirtualLink', 'properties': {'connectivity_type': {'layer_protocols': ['ipv4']}, 'description': 'Proxy Data plane network', 'vl_profile': {'max_bitrate_requirements': {'root': 10000000, 'leaf': 1000000}, 'min_bitrate_requirements': {'root': 1000000, 'leaf': 100000}}}}
  node[intVL_data]
  intVL_data.name["intVL_data"]
  intVL_data.node_type_name = "tosca.nodes.nfv.VnfVirtualLink"
  // YAML properties:
  // YAML connectivity_type: {'layer_protocols': ['ipv4']}
  // YAML layer_protocols: ['ipv4']
  #intVL_data.property_connectivity_type.layer_protocols = 1
  intVL_data.property_connectivity_type.layer_protocols[0] = "ipv4"
  // NOTE: The property 'flow_pattern' is not required.
  no   intVL_data.property_connectivity_type.flow_pattern
  // YAML description: Proxy Data plane network
  intVL_data.property_description = "Proxy Data plane network"
  // NOTE: The property 'test_access' is not required.
  no   intVL_data.property_test_access
  // YAML vl_profile: {'max_bitrate_requirements': {'root': 10000000, 'leaf': 1000000}, 'min_bitrate_requirements': {'root': 1000000, 'leaf': 100000}}
  // YAML max_bitrate_requirements: {'root': 10000000, 'leaf': 1000000}
  // YAML root: 10000000
  intVL_data.property_vl_profile.max_bitrate_requirements.root = 127 // ISSUE: 10000000 is a too big integer!!!
  // YAML leaf: 1000000
  intVL_data.property_vl_profile.max_bitrate_requirements.leaf = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML min_bitrate_requirements: {'root': 1000000, 'leaf': 100000}
  // YAML root: 1000000
  intVL_data.property_vl_profile.min_bitrate_requirements.root = 127 // ISSUE: 1000000 is a too big integer!!!
  // YAML leaf: 100000
  intVL_data.property_vl_profile.min_bitrate_requirements.leaf = 127 // ISSUE: 100000 is a too big integer!!!
  // NOTE: The property 'qos' is not required.
  no   intVL_data.property_vl_profile.qos
  // NOTE: The property 'virtual_link_protocol_data' is not required.
  no   intVL_data.property_vl_profile.virtual_link_protocol_data
  // NOTE: The property 'monitoring_parameters' is not required.
  no   intVL_data.property_monitoring_parameters
  // NOTE: The property 'nfvi_maintenance_info' is not required.
  no   intVL_data.property_nfvi_maintenance_info
  // NOTE: The property 'externally_managed' is not required.
  no   intVL_data.property_externally_managed
  // YAML interfaces:
  #intVL_data.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no intVL_data.interface_Standard.operation_create.implementation
  no intVL_data.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no intVL_data.interface_Standard.operation_configure.implementation
  no intVL_data.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no intVL_data.interface_Standard.operation_start.implementation
  no intVL_data.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no intVL_data.interface_Standard.operation_stop.implementation
  no intVL_data.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no intVL_data.interface_Standard.operation_delete.implementation
  no intVL_data.interface_Standard.operation_delete.inputs
  #intVL_data.interface_Standard.operations = 5
  // YAML artifacts:
  no intVL_data.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_linkable: None

  // YAML vdu_proxy_frontend: {'type': 'tosca.nodes.nfv.Vdu.Compute', 'properties': {'name': 'proxy-frontend', 'description': 'Proxy Frontend (Entry point/SSL Termination)', 'vdu_profile': {'min_number_of_instances': 3, 'max_number_of_instances': 10}}, 'capabilities': {'virtual_compute': {'properties': {'virtual_memory': {'virtual_mem_size': '4 GB'}, 'virtual_cpu': {'num_virtual_cpu': 2}, 'requested_additional_capabilities': {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}}}}, 'artifacts': {'sw_image': {'type': 'tosca.artifacts.nfv.SwImage', 'file': 'docker.io/mycompany/proxy-frontend:v1.0', 'properties': {'name': 'proxy-frontend-img', 'version': '1.0', 'container_format': 'docker', 'size': '500 MB', 'min_ram': '2 GB', 'operating_system': 'linux'}}}}
  node[vdu_proxy_frontend]
  vdu_proxy_frontend.name["vdu_proxy_frontend"]
  vdu_proxy_frontend.node_type_name = "tosca.nodes.nfv.Vdu.Compute"
  // YAML properties:
  // YAML name: proxy-frontend
  vdu_proxy_frontend.property_name = "proxy-frontend"
  // YAML description: Proxy Frontend (Entry point/SSL Termination)
  vdu_proxy_frontend.property_description = "Proxy Frontend (Entry point/SSL Termination)"
  // NOTE: The property 'boot_order' is set to its default value.
  vdu_proxy_frontend.property_boot_order = false
  // NOTE: The property 'nfvi_constraints' is not required.
  no   vdu_proxy_frontend.property_nfvi_constraints
  // NOTE: The property 'monitoring_parameters' is not required.
  no   vdu_proxy_frontend.property_monitoring_parameters
  // NOTE: The property 'configurable_properties' is not required.
  no   vdu_proxy_frontend.property_configurable_properties
  // YAML vdu_profile: {'min_number_of_instances': 3, 'max_number_of_instances': 10}
  // YAML min_number_of_instances: 3
  vdu_proxy_frontend.property_vdu_profile.min_number_of_instances = 3
  // YAML max_number_of_instances: 10
  vdu_proxy_frontend.property_vdu_profile.max_number_of_instances = 10
  // NOTE: The property 'nfvi_maintenance_info' is not required.
  no   vdu_proxy_frontend.property_vdu_profile.nfvi_maintenance_info
  // NOTE: The property 'boot_data' is not required.
  no   vdu_proxy_frontend.property_boot_data
  // YAML interfaces:
  #vdu_proxy_frontend.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vdu_proxy_frontend.interface_Standard.operation_create.implementation
  no vdu_proxy_frontend.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vdu_proxy_frontend.interface_Standard.operation_configure.implementation
  no vdu_proxy_frontend.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vdu_proxy_frontend.interface_Standard.operation_start.implementation
  no vdu_proxy_frontend.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vdu_proxy_frontend.interface_Standard.operation_stop.implementation
  no vdu_proxy_frontend.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vdu_proxy_frontend.interface_Standard.operation_delete.implementation
  no vdu_proxy_frontend.interface_Standard.operation_delete.inputs
  #vdu_proxy_frontend.interface_Standard.operations = 5
  // YAML artifacts:
  #vdu_proxy_frontend.artifacts = 1
  // YAML   sw_image: {'type': 'tosca.artifacts.nfv.SwImage', 'file': 'docker.io/mycompany/proxy-frontend:v1.0', 'properties': {'name': 'proxy-frontend-img', 'version': '1.0', 'container_format': 'docker', 'size': '500 MB', 'min_ram': '2 GB', 'operating_system': 'linux'}}
  one artifact_sw_image : tosca_artifacts_nfv_SwImage {
    vdu_proxy_frontend.artifact[artifact_sw_image]
    artifact_sw_image.name["sw_image"]
    artifact_sw_image.file["docker.io/mycompany/proxy-frontend:v1.0"]
  // YAML name: proxy-frontend-img
  artifact_sw_image.name = "proxy-frontend-img"
  // YAML version: 1.0
  artifact_sw_image.@version = "1.0"
  // NOTE: The property 'provider' is not required.
  no   artifact_sw_image.provider
  // NOTE: The property 'checksum' is not required.
  no   artifact_sw_image.checksum
  // YAML container_format: docker
  artifact_sw_image.container_format = "docker"
  // NOTE: The property 'disk_format' is not required.
  no   artifact_sw_image.disk_format
  // NOTE: The property 'min_disk' is not required.
  no   artifact_sw_image.min_disk
  // YAML min_ram: 2 GB
  artifact_sw_image.min_ram.init[2, GB]
  // YAML size: 500 MB
  artifact_sw_image.size.init[127, MB]
  // YAML operating_system: linux
  artifact_sw_image.operating_system = "linux"
  // NOTE: The property 'supported_virtualisation_environments' is not required.
  no   artifact_sw_image.supported_virtualisation_environments
  }
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_compute: {'properties': {'virtual_memory': {'virtual_mem_size': '4 GB'}, 'virtual_cpu': {'num_virtual_cpu': 2}, 'requested_additional_capabilities': {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}}}
  // NOTE: The property 'logical_node' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_logical_node
  // YAML requested_additional_capabilities: {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}
  vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.size[1]
  vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.one_entry["properties"]
  // YAML requested_additional_capability_name: container_runtime
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).requested_additional_capability_name = "container_runtime"
  // YAML support_mandatory: True
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).support_mandatory = true
  // NOTE: The property 'min_requested_additional_capability_version' is not required.
  no   (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).min_requested_additional_capability_version
  // NOTE: The property 'preferred_requested_additional_capability_version' is not required.
  no   (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).preferred_requested_additional_capability_version
  // YAML target_performance_parameters: {'container_runtime': 'kubernetes'}
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.size[1]
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.one_entry["container_runtime"]
  (string<:((tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.entry["container_runtime"])) = "kubernetes"
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.keys["container_runtime"]
  vdu_proxy_frontend.capability_virtual_compute.property_requested_additional_capabilities.keys["properties"]
  // NOTE: The property 'compute_requirements' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_compute_requirements
  // YAML virtual_memory: {'virtual_mem_size': '4 GB'}
  // YAML virtual_mem_size: 4 GB
  vdu_proxy_frontend.capability_virtual_compute.property_virtual_memory.virtual_mem_size.init[4, GB]
  // NOTE: The property 'virtual_mem_oversubscription_policy' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_memory.virtual_mem_oversubscription_policy
  // NOTE: The property 'vdu_mem_requirements' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_memory.vdu_mem_requirements
  // NOTE: The property 'numa_enabled' is set to its default value.
  vdu_proxy_frontend.capability_virtual_compute.property_virtual_memory.numa_enabled = false
  // NOTE: The property 'huge_pages_requirements' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_memory.huge_pages_requirements
  // YAML virtual_cpu: {'num_virtual_cpu': 2}
  // NOTE: The property 'cpu_architecture' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_cpu.cpu_architecture
  // YAML num_virtual_cpu: 2
  vdu_proxy_frontend.capability_virtual_compute.property_virtual_cpu.num_virtual_cpu = 2
  // NOTE: The property 'virtual_cpu_clock' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_cpu.virtual_cpu_clock
  // NOTE: The property 'virtual_cpu_oversubscription_policy' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_cpu.virtual_cpu_oversubscription_policy
  // NOTE: The property 'vdu_cpu_requirements' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_cpu.vdu_cpu_requirements
  // NOTE: The property 'virtual_cpu_pinning' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_cpu.virtual_cpu_pinning
  // NOTE: The property 'virtual_local_storage' is not required.
  no   vdu_proxy_frontend.capability_virtual_compute.property_virtual_local_storage
  // YAML   virtual_binding: None

  // YAML vdu_proxy_backend: {'type': 'tosca.nodes.nfv.Vdu.Compute', 'properties': {'name': 'proxy-backend', 'description': 'Proxy Backend (Caching and Content processing)', 'vdu_profile': {'min_number_of_instances': 3, 'max_number_of_instances': 8}}, 'capabilities': {'virtual_compute': {'properties': {'virtual_memory': {'virtual_mem_size': '8 GB'}, 'virtual_cpu': {'num_virtual_cpu': 4}, 'virtual_local_storage': [{'size_of_storage': '50 GB'}], 'requested_additional_capabilities': {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}}}}, 'artifacts': {'sw_image': {'type': 'tosca.artifacts.nfv.SwImage', 'file': 'docker.io/mycompany/proxy-backend:v1.0', 'properties': {'name': 'proxy-backend-img', 'version': '1.0', 'container_format': 'docker', 'size': '800 MB', 'min_ram': '4 GB', 'operating_system': 'linux'}}}}
  node[vdu_proxy_backend]
  vdu_proxy_backend.name["vdu_proxy_backend"]
  vdu_proxy_backend.node_type_name = "tosca.nodes.nfv.Vdu.Compute"
  // YAML properties:
  // YAML name: proxy-backend
  vdu_proxy_backend.property_name = "proxy-backend"
  // YAML description: Proxy Backend (Caching and Content processing)
  vdu_proxy_backend.property_description = "Proxy Backend (Caching and Content processing)"
  // NOTE: The property 'boot_order' is set to its default value.
  vdu_proxy_backend.property_boot_order = false
  // NOTE: The property 'nfvi_constraints' is not required.
  no   vdu_proxy_backend.property_nfvi_constraints
  // NOTE: The property 'monitoring_parameters' is not required.
  no   vdu_proxy_backend.property_monitoring_parameters
  // NOTE: The property 'configurable_properties' is not required.
  no   vdu_proxy_backend.property_configurable_properties
  // YAML vdu_profile: {'min_number_of_instances': 3, 'max_number_of_instances': 8}
  // YAML min_number_of_instances: 3
  vdu_proxy_backend.property_vdu_profile.min_number_of_instances = 3
  // YAML max_number_of_instances: 8
  vdu_proxy_backend.property_vdu_profile.max_number_of_instances = 8
  // NOTE: The property 'nfvi_maintenance_info' is not required.
  no   vdu_proxy_backend.property_vdu_profile.nfvi_maintenance_info
  // NOTE: The property 'boot_data' is not required.
  no   vdu_proxy_backend.property_boot_data
  // YAML interfaces:
  #vdu_proxy_backend.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no vdu_proxy_backend.interface_Standard.operation_create.implementation
  no vdu_proxy_backend.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no vdu_proxy_backend.interface_Standard.operation_configure.implementation
  no vdu_proxy_backend.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no vdu_proxy_backend.interface_Standard.operation_start.implementation
  no vdu_proxy_backend.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no vdu_proxy_backend.interface_Standard.operation_stop.implementation
  no vdu_proxy_backend.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no vdu_proxy_backend.interface_Standard.operation_delete.implementation
  no vdu_proxy_backend.interface_Standard.operation_delete.inputs
  #vdu_proxy_backend.interface_Standard.operations = 5
  // YAML artifacts:
  #vdu_proxy_backend.artifacts = 1
  // YAML   sw_image: {'type': 'tosca.artifacts.nfv.SwImage', 'file': 'docker.io/mycompany/proxy-backend:v1.0', 'properties': {'name': 'proxy-backend-img', 'version': '1.0', 'container_format': 'docker', 'size': '800 MB', 'min_ram': '4 GB', 'operating_system': 'linux'}}
  one artifact_sw_image : tosca_artifacts_nfv_SwImage {
    vdu_proxy_backend.artifact[artifact_sw_image]
    artifact_sw_image.name["sw_image"]
    artifact_sw_image.file["docker.io/mycompany/proxy-backend:v1.0"]
  // YAML name: proxy-backend-img
  artifact_sw_image.name = "proxy-backend-img"
  // YAML version: 1.0
  artifact_sw_image.@version = "1.0"
  // NOTE: The property 'provider' is not required.
  no   artifact_sw_image.provider
  // NOTE: The property 'checksum' is not required.
  no   artifact_sw_image.checksum
  // YAML container_format: docker
  artifact_sw_image.container_format = "docker"
  // NOTE: The property 'disk_format' is not required.
  no   artifact_sw_image.disk_format
  // NOTE: The property 'min_disk' is not required.
  no   artifact_sw_image.min_disk
  // YAML min_ram: 4 GB
  artifact_sw_image.min_ram.init[4, GB]
  // YAML size: 800 MB
  artifact_sw_image.size.init[127, MB]
  // YAML operating_system: linux
  artifact_sw_image.operating_system = "linux"
  // NOTE: The property 'supported_virtualisation_environments' is not required.
  no   artifact_sw_image.supported_virtualisation_environments
  }
  // YAML capabilities:
  // YAML   feature: None
  // YAML   virtual_compute: {'properties': {'virtual_memory': {'virtual_mem_size': '8 GB'}, 'virtual_cpu': {'num_virtual_cpu': 4}, 'virtual_local_storage': [{'size_of_storage': '50 GB'}], 'requested_additional_capabilities': {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}}}
  // NOTE: The property 'logical_node' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_logical_node
  // YAML requested_additional_capabilities: {'properties': {'requested_additional_capability_name': 'container_runtime', 'support_mandatory': True, 'target_performance_parameters': {'container_runtime': 'kubernetes'}}}
  vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.size[1]
  vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.one_entry["properties"]
  // YAML requested_additional_capability_name: container_runtime
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).requested_additional_capability_name = "container_runtime"
  // YAML support_mandatory: True
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).support_mandatory = true
  // NOTE: The property 'min_requested_additional_capability_version' is not required.
  no   (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).min_requested_additional_capability_version
  // NOTE: The property 'preferred_requested_additional_capability_version' is not required.
  no   (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).preferred_requested_additional_capability_version
  // YAML target_performance_parameters: {'container_runtime': 'kubernetes'}
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.size[1]
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.one_entry["container_runtime"]
  (string<:((tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.entry["container_runtime"])) = "kubernetes"
  (tosca_datatypes_nfv_RequestedAdditionalCapability<:(vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.entry["properties"])).target_performance_parameters.keys["container_runtime"]
  vdu_proxy_backend.capability_virtual_compute.property_requested_additional_capabilities.keys["properties"]
  // NOTE: The property 'compute_requirements' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_compute_requirements
  // YAML virtual_memory: {'virtual_mem_size': '8 GB'}
  // YAML virtual_mem_size: 8 GB
  vdu_proxy_backend.capability_virtual_compute.property_virtual_memory.virtual_mem_size.init[8, GB]
  // NOTE: The property 'virtual_mem_oversubscription_policy' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_memory.virtual_mem_oversubscription_policy
  // NOTE: The property 'vdu_mem_requirements' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_memory.vdu_mem_requirements
  // NOTE: The property 'numa_enabled' is set to its default value.
  vdu_proxy_backend.capability_virtual_compute.property_virtual_memory.numa_enabled = false
  // NOTE: The property 'huge_pages_requirements' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_memory.huge_pages_requirements
  // YAML virtual_cpu: {'num_virtual_cpu': 4}
  // NOTE: The property 'cpu_architecture' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_cpu.cpu_architecture
  // YAML num_virtual_cpu: 4
  vdu_proxy_backend.capability_virtual_compute.property_virtual_cpu.num_virtual_cpu = 4
  // NOTE: The property 'virtual_cpu_clock' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_cpu.virtual_cpu_clock
  // NOTE: The property 'virtual_cpu_oversubscription_policy' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_cpu.virtual_cpu_oversubscription_policy
  // NOTE: The property 'vdu_cpu_requirements' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_cpu.vdu_cpu_requirements
  // NOTE: The property 'virtual_cpu_pinning' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_cpu.virtual_cpu_pinning
  // YAML virtual_local_storage: [{'size_of_storage': '50 GB'}]
  #vdu_proxy_backend.capability_virtual_compute.property_virtual_local_storage = 1
  // YAML size_of_storage: 50 GB
  vdu_proxy_backend.capability_virtual_compute.property_virtual_local_storage[0].size_of_storage.init[50, GB]
  // NOTE: The property 'vdu_storage_requirements' is not required.
  no   vdu_proxy_backend.capability_virtual_compute.property_virtual_local_storage[0].vdu_storage_requirements
  // NOTE: The property 'rdma_enabled' is set to its default value.
  vdu_proxy_backend.capability_virtual_compute.property_virtual_local_storage[0].rdma_enabled = false
  // YAML   virtual_binding: None

  // YAML cp_proxy_frontend_mgmt: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 0, 'description': 'Proxy Frontend management interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_frontend'}, {'virtual_link': 'intVL_mgmt'}]}
  node[cp_proxy_frontend_mgmt]
  cp_proxy_frontend_mgmt.name["cp_proxy_frontend_mgmt"]
  cp_proxy_frontend_mgmt.node_type_name = "tosca.nodes.nfv.VduCp"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #cp_proxy_frontend_mgmt.property_layer_protocols = 1
  cp_proxy_frontend_mgmt.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   cp_proxy_frontend_mgmt.property_ip_stack_mode
  // NOTE: The property 'role' is not required.
  no   cp_proxy_frontend_mgmt.property_role
  // YAML description: Proxy Frontend management interface
  cp_proxy_frontend_mgmt.property_description = "Proxy Frontend management interface"
  // NOTE: The property 'protocol' is not required.
  no   cp_proxy_frontend_mgmt.property_protocol
  // NOTE: The property 'trunk_mode' is not required.
  no   cp_proxy_frontend_mgmt.property_trunk_mode
  // NOTE: The property 'bitrate_requirement' is not required.
  no   cp_proxy_frontend_mgmt.property_bitrate_requirement
  // NOTE: The property 'virtual_network_interface_requirements' is not required.
  no   cp_proxy_frontend_mgmt.property_virtual_network_interface_requirements
  // YAML order: 0
  cp_proxy_frontend_mgmt.property_order = 0
  // NOTE: The property 'vnic_type' is not required.
  no   cp_proxy_frontend_mgmt.property_vnic_type
  // YAML interfaces:
  #cp_proxy_frontend_mgmt.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no cp_proxy_frontend_mgmt.interface_Standard.operation_create.implementation
  no cp_proxy_frontend_mgmt.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no cp_proxy_frontend_mgmt.interface_Standard.operation_configure.implementation
  no cp_proxy_frontend_mgmt.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no cp_proxy_frontend_mgmt.interface_Standard.operation_start.implementation
  no cp_proxy_frontend_mgmt.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no cp_proxy_frontend_mgmt.interface_Standard.operation_stop.implementation
  no cp_proxy_frontend_mgmt.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no cp_proxy_frontend_mgmt.interface_Standard.operation_delete.implementation
  no cp_proxy_frontend_mgmt.interface_Standard.operation_delete.inputs
  #cp_proxy_frontend_mgmt.interface_Standard.operations = 5
  // YAML artifacts:
  no cp_proxy_frontend_mgmt.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   trunk_binding: None
  // YAML virtual_binding: vdu_proxy_frontend
  connect[cp_proxy_frontend_mgmt.requirement_virtual_binding, vdu_proxy_frontend.capability_virtual_binding]
  cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_frontend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operations = 8
  // YAML virtual_link: intVL_mgmt
  connect[cp_proxy_frontend_mgmt.requirement_virtual_link, intVL_mgmt.capability_virtual_linkable]
  cp_proxy_frontend_mgmt.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_frontend_mgmt.requirement_virtual_link.relationship.interface_Configure.operations = 8

  // YAML cp_proxy_frontend_data: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 1, 'description': 'Proxy Frontend data interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_frontend'}, {'virtual_link': 'intVL_data'}]}
  node[cp_proxy_frontend_data]
  cp_proxy_frontend_data.name["cp_proxy_frontend_data"]
  cp_proxy_frontend_data.node_type_name = "tosca.nodes.nfv.VduCp"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #cp_proxy_frontend_data.property_layer_protocols = 1
  cp_proxy_frontend_data.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   cp_proxy_frontend_data.property_ip_stack_mode
  // NOTE: The property 'role' is not required.
  no   cp_proxy_frontend_data.property_role
  // YAML description: Proxy Frontend data interface
  cp_proxy_frontend_data.property_description = "Proxy Frontend data interface"
  // NOTE: The property 'protocol' is not required.
  no   cp_proxy_frontend_data.property_protocol
  // NOTE: The property 'trunk_mode' is not required.
  no   cp_proxy_frontend_data.property_trunk_mode
  // NOTE: The property 'bitrate_requirement' is not required.
  no   cp_proxy_frontend_data.property_bitrate_requirement
  // NOTE: The property 'virtual_network_interface_requirements' is not required.
  no   cp_proxy_frontend_data.property_virtual_network_interface_requirements
  // YAML order: 1
  cp_proxy_frontend_data.property_order = 1
  // NOTE: The property 'vnic_type' is not required.
  no   cp_proxy_frontend_data.property_vnic_type
  // YAML interfaces:
  #cp_proxy_frontend_data.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no cp_proxy_frontend_data.interface_Standard.operation_create.implementation
  no cp_proxy_frontend_data.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no cp_proxy_frontend_data.interface_Standard.operation_configure.implementation
  no cp_proxy_frontend_data.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no cp_proxy_frontend_data.interface_Standard.operation_start.implementation
  no cp_proxy_frontend_data.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no cp_proxy_frontend_data.interface_Standard.operation_stop.implementation
  no cp_proxy_frontend_data.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no cp_proxy_frontend_data.interface_Standard.operation_delete.implementation
  no cp_proxy_frontend_data.interface_Standard.operation_delete.inputs
  #cp_proxy_frontend_data.interface_Standard.operations = 5
  // YAML artifacts:
  no cp_proxy_frontend_data.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   trunk_binding: None
  // YAML virtual_binding: vdu_proxy_frontend
  connect[cp_proxy_frontend_data.requirement_virtual_binding, vdu_proxy_frontend.capability_virtual_binding]
  cp_proxy_frontend_data.requirement_virtual_binding.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_frontend_data.requirement_virtual_binding.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_frontend_data.requirement_virtual_binding.relationship.interface_Configure.operations = 8
  // YAML virtual_link: intVL_data
  connect[cp_proxy_frontend_data.requirement_virtual_link, intVL_data.capability_virtual_linkable]
  cp_proxy_frontend_data.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_frontend_data.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_frontend_data.requirement_virtual_link.relationship.interface_Configure.operations = 8

  // YAML cp_proxy_backend_mgmt: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 0, 'description': 'Proxy Backend management interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_backend'}, {'virtual_link': 'intVL_mgmt'}]}
  node[cp_proxy_backend_mgmt]
  cp_proxy_backend_mgmt.name["cp_proxy_backend_mgmt"]
  cp_proxy_backend_mgmt.node_type_name = "tosca.nodes.nfv.VduCp"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #cp_proxy_backend_mgmt.property_layer_protocols = 1
  cp_proxy_backend_mgmt.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   cp_proxy_backend_mgmt.property_ip_stack_mode
  // NOTE: The property 'role' is not required.
  no   cp_proxy_backend_mgmt.property_role
  // YAML description: Proxy Backend management interface
  cp_proxy_backend_mgmt.property_description = "Proxy Backend management interface"
  // NOTE: The property 'protocol' is not required.
  no   cp_proxy_backend_mgmt.property_protocol
  // NOTE: The property 'trunk_mode' is not required.
  no   cp_proxy_backend_mgmt.property_trunk_mode
  // NOTE: The property 'bitrate_requirement' is not required.
  no   cp_proxy_backend_mgmt.property_bitrate_requirement
  // NOTE: The property 'virtual_network_interface_requirements' is not required.
  no   cp_proxy_backend_mgmt.property_virtual_network_interface_requirements
  // YAML order: 0
  cp_proxy_backend_mgmt.property_order = 0
  // NOTE: The property 'vnic_type' is not required.
  no   cp_proxy_backend_mgmt.property_vnic_type
  // YAML interfaces:
  #cp_proxy_backend_mgmt.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no cp_proxy_backend_mgmt.interface_Standard.operation_create.implementation
  no cp_proxy_backend_mgmt.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no cp_proxy_backend_mgmt.interface_Standard.operation_configure.implementation
  no cp_proxy_backend_mgmt.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no cp_proxy_backend_mgmt.interface_Standard.operation_start.implementation
  no cp_proxy_backend_mgmt.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no cp_proxy_backend_mgmt.interface_Standard.operation_stop.implementation
  no cp_proxy_backend_mgmt.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no cp_proxy_backend_mgmt.interface_Standard.operation_delete.implementation
  no cp_proxy_backend_mgmt.interface_Standard.operation_delete.inputs
  #cp_proxy_backend_mgmt.interface_Standard.operations = 5
  // YAML artifacts:
  no cp_proxy_backend_mgmt.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   trunk_binding: None
  // YAML virtual_binding: vdu_proxy_backend
  connect[cp_proxy_backend_mgmt.requirement_virtual_binding, vdu_proxy_backend.capability_virtual_binding]
  cp_proxy_backend_mgmt.requirement_virtual_binding.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_backend_mgmt.requirement_virtual_binding.relationship.interface_Configure.operations = 8
  // YAML virtual_link: intVL_mgmt
  connect[cp_proxy_backend_mgmt.requirement_virtual_link, intVL_mgmt.capability_virtual_linkable]
  cp_proxy_backend_mgmt.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_backend_mgmt.requirement_virtual_link.relationship.interface_Configure.operations = 8

  // YAML cp_proxy_backend_data: {'type': 'tosca.nodes.nfv.VduCp', 'properties': {'layer_protocols': ['ipv4'], 'order': 1, 'description': 'Proxy Backend data interface'}, 'requirements': [{'virtual_binding': 'vdu_proxy_backend'}, {'virtual_link': 'intVL_data'}]}
  node[cp_proxy_backend_data]
  cp_proxy_backend_data.name["cp_proxy_backend_data"]
  cp_proxy_backend_data.node_type_name = "tosca.nodes.nfv.VduCp"
  // YAML properties:
  // YAML layer_protocols: ['ipv4']
  #cp_proxy_backend_data.property_layer_protocols = 1
  cp_proxy_backend_data.property_layer_protocols[0] = "ipv4"
  // NOTE: The property 'ip_stack_mode' is not required.
  no   cp_proxy_backend_data.property_ip_stack_mode
  // NOTE: The property 'role' is not required.
  no   cp_proxy_backend_data.property_role
  // YAML description: Proxy Backend data interface
  cp_proxy_backend_data.property_description = "Proxy Backend data interface"
  // NOTE: The property 'protocol' is not required.
  no   cp_proxy_backend_data.property_protocol
  // NOTE: The property 'trunk_mode' is not required.
  no   cp_proxy_backend_data.property_trunk_mode
  // NOTE: The property 'bitrate_requirement' is not required.
  no   cp_proxy_backend_data.property_bitrate_requirement
  // NOTE: The property 'virtual_network_interface_requirements' is not required.
  no   cp_proxy_backend_data.property_virtual_network_interface_requirements
  // YAML order: 1
  cp_proxy_backend_data.property_order = 1
  // NOTE: The property 'vnic_type' is not required.
  no   cp_proxy_backend_data.property_vnic_type
  // YAML interfaces:
  #cp_proxy_backend_data.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no cp_proxy_backend_data.interface_Standard.operation_create.implementation
  no cp_proxy_backend_data.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no cp_proxy_backend_data.interface_Standard.operation_configure.implementation
  no cp_proxy_backend_data.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no cp_proxy_backend_data.interface_Standard.operation_start.implementation
  no cp_proxy_backend_data.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no cp_proxy_backend_data.interface_Standard.operation_stop.implementation
  no cp_proxy_backend_data.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no cp_proxy_backend_data.interface_Standard.operation_delete.implementation
  no cp_proxy_backend_data.interface_Standard.operation_delete.inputs
  #cp_proxy_backend_data.interface_Standard.operations = 5
  // YAML artifacts:
  no cp_proxy_backend_data.artifacts
  // YAML capabilities:
  // YAML   feature: None
  // YAML   trunk_binding: None
  // YAML virtual_binding: vdu_proxy_backend
  connect[cp_proxy_backend_data.requirement_virtual_binding, vdu_proxy_backend.capability_virtual_binding]
  cp_proxy_backend_data.requirement_virtual_binding.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_backend_data.requirement_virtual_binding.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_backend_data.requirement_virtual_binding.relationship.interface_Configure.operations = 8
  // YAML virtual_link: intVL_data
  connect[cp_proxy_backend_data.requirement_virtual_link, intVL_data.capability_virtual_linkable]
  cp_proxy_backend_data.requirement_virtual_link.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  #cp_proxy_backend_data.requirement_virtual_link.relationship.interfaces = 1
  // YAML Configure:
  // YAML pre_configure_source: {'description': 'Operation to pre-configure the source endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_source.inputs
  // YAML pre_configure_target: {'description': 'Operation to pre-configure the target endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_pre_configure_target.inputs
  // YAML post_configure_source: {'description': 'Operation to post-configure the source endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_source.inputs
  // YAML post_configure_target: {'description': 'Operation to post-configure the target endpoint.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_post_configure_target.inputs
  // YAML add_target: {'description': 'Operation to notify the source node of a target node being added via a relationship.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_target.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_target.inputs
  // YAML add_source: {'description': 'Operation to notify the target node of a source node which is now available via a relationship.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_source.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_add_source.inputs
  // YAML target_changed: {'description': 'Operation to notify source some property or attribute of the target changed'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_target_changed.inputs
  // YAML remove_target: {'description': 'Operation to remove a target node.'}
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.implementation
  no cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operation_remove_target.inputs
  #cp_proxy_backend_data.requirement_virtual_link.relationship.interface_Configure.operations = 8


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

  #policies = 10
  // YAML scaling_aspects: {'type': 'tosca.policies.nfv.ScalingAspects', 'properties': {'aspects': {'proxy_frontend_scaling': {'name': 'proxy_frontend_scaling_aspect', 'description': 'Horizontal Pod Autoscaling for Proxy frontend', 'max_scale_level': 7, 'step_deltas': ['delta_1']}, 'proxy_backend_scaling': {'name': 'proxy_backend_scaling_aspect', 'description': 'Horizontal Pod Autoscaling for Proxy backend', 'max_scale_level': 5, 'step_deltas': ['delta_1']}}}}
  policy[policy_scaling_aspects]
  policy_scaling_aspects.name["scaling_aspects"]
  // YAML properties:
  // YAML aspects: {'proxy_frontend_scaling': {'name': 'proxy_frontend_scaling_aspect', 'description': 'Horizontal Pod Autoscaling for Proxy frontend', 'max_scale_level': 7, 'step_deltas': ['delta_1']}, 'proxy_backend_scaling': {'name': 'proxy_backend_scaling_aspect', 'description': 'Horizontal Pod Autoscaling for Proxy backend', 'max_scale_level': 5, 'step_deltas': ['delta_1']}}
  policy_scaling_aspects.property_aspects.size[2]
  policy_scaling_aspects.property_aspects.one_entry["proxy_frontend_scaling"]
  // YAML name: proxy_frontend_scaling_aspect
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_frontend_scaling"])).name = "proxy_frontend_scaling_aspect"
  // YAML description: Horizontal Pod Autoscaling for Proxy frontend
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_frontend_scaling"])).description = "Horizontal Pod Autoscaling for Proxy frontend"
  // YAML max_scale_level: 7
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_frontend_scaling"])).max_scale_level = 7
  // YAML step_deltas: ['delta_1']
  #(tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_frontend_scaling"])).step_deltas = 1
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_frontend_scaling"])).step_deltas[0] = "delta_1"
  policy_scaling_aspects.property_aspects.one_entry["proxy_backend_scaling"]
  // YAML name: proxy_backend_scaling_aspect
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_backend_scaling"])).name = "proxy_backend_scaling_aspect"
  // YAML description: Horizontal Pod Autoscaling for Proxy backend
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_backend_scaling"])).description = "Horizontal Pod Autoscaling for Proxy backend"
  // YAML max_scale_level: 5
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_backend_scaling"])).max_scale_level = 5
  // YAML step_deltas: ['delta_1']
  #(tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_backend_scaling"])).step_deltas = 1
  (tosca_datatypes_nfv_ScalingAspect<:(policy_scaling_aspects.property_aspects.entry["proxy_backend_scaling"])).step_deltas[0] = "delta_1"
  policy_scaling_aspects.property_aspects.keys["proxy_frontend_scaling" + "proxy_backend_scaling"]
  // YAML interfaces:
  no policy_scaling_aspects.interfaces
  // YAML targets: None
  no policy_scaling_aspects.targets

  // YAML vdu_proxy_frontend_initial_delta: {'type': 'tosca.policies.nfv.VduInitialDelta', 'properties': {'initial_delta': {'number_of_instances': 3}}, 'targets': ['vdu_proxy_frontend']}
  policy[policy_vdu_proxy_frontend_initial_delta]
  policy_vdu_proxy_frontend_initial_delta.name["vdu_proxy_frontend_initial_delta"]
  // YAML properties:
  // YAML initial_delta: {'number_of_instances': 3}
  // YAML number_of_instances: 3
  policy_vdu_proxy_frontend_initial_delta.property_initial_delta.number_of_instances = 3
  // YAML interfaces:
  no policy_vdu_proxy_frontend_initial_delta.interfaces
  // YAML targets: ['vdu_proxy_frontend']
  policy_vdu_proxy_frontend_initial_delta.targets[vdu_proxy_frontend]

  // YAML vdu_proxy_frontend_scaling_delta: {'type': 'tosca.policies.nfv.VduScalingAspectDeltas', 'properties': {'aspect': 'proxy_frontend_scaling', 'deltas': {'delta_1': {'number_of_instances': 1}}}, 'targets': ['vdu_proxy_frontend']}
  policy[policy_vdu_proxy_frontend_scaling_delta]
  policy_vdu_proxy_frontend_scaling_delta.name["vdu_proxy_frontend_scaling_delta"]
  // YAML properties:
  // YAML aspect: proxy_frontend_scaling
  policy_vdu_proxy_frontend_scaling_delta.property_aspect = "proxy_frontend_scaling"
  // YAML deltas: {'delta_1': {'number_of_instances': 1}}
  policy_vdu_proxy_frontend_scaling_delta.property_deltas.size[1]
  policy_vdu_proxy_frontend_scaling_delta.property_deltas.one_entry["delta_1"]
  // YAML number_of_instances: 1
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_frontend_scaling_delta.property_deltas.entry["delta_1"])).number_of_instances = 1
  policy_vdu_proxy_frontend_scaling_delta.property_deltas.keys["delta_1"]
  // YAML interfaces:
  no policy_vdu_proxy_frontend_scaling_delta.interfaces
  // YAML targets: ['vdu_proxy_frontend']
  policy_vdu_proxy_frontend_scaling_delta.targets[vdu_proxy_frontend]

  // YAML vdu_proxy_backend_initial_delta: {'type': 'tosca.policies.nfv.VduInitialDelta', 'properties': {'initial_delta': {'number_of_instances': 3}}, 'targets': ['vdu_proxy_backend']}
  policy[policy_vdu_proxy_backend_initial_delta]
  policy_vdu_proxy_backend_initial_delta.name["vdu_proxy_backend_initial_delta"]
  // YAML properties:
  // YAML initial_delta: {'number_of_instances': 3}
  // YAML number_of_instances: 3
  policy_vdu_proxy_backend_initial_delta.property_initial_delta.number_of_instances = 3
  // YAML interfaces:
  no policy_vdu_proxy_backend_initial_delta.interfaces
  // YAML targets: ['vdu_proxy_backend']
  policy_vdu_proxy_backend_initial_delta.targets[vdu_proxy_backend]

  // YAML vdu_proxy_backend_scaling_delta: {'type': 'tosca.policies.nfv.VduScalingAspectDeltas', 'properties': {'aspect': 'proxy_backend_scaling', 'deltas': {'delta_1': {'number_of_instances': 1}}}, 'targets': ['vdu_proxy_backend']}
  policy[policy_vdu_proxy_backend_scaling_delta]
  policy_vdu_proxy_backend_scaling_delta.name["vdu_proxy_backend_scaling_delta"]
  // YAML properties:
  // YAML aspect: proxy_backend_scaling
  policy_vdu_proxy_backend_scaling_delta.property_aspect = "proxy_backend_scaling"
  // YAML deltas: {'delta_1': {'number_of_instances': 1}}
  policy_vdu_proxy_backend_scaling_delta.property_deltas.size[1]
  policy_vdu_proxy_backend_scaling_delta.property_deltas.one_entry["delta_1"]
  // YAML number_of_instances: 1
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_backend_scaling_delta.property_deltas.entry["delta_1"])).number_of_instances = 1
  policy_vdu_proxy_backend_scaling_delta.property_deltas.keys["delta_1"]
  // YAML interfaces:
  no policy_vdu_proxy_backend_scaling_delta.interfaces
  // YAML targets: ['vdu_proxy_backend']
  policy_vdu_proxy_backend_scaling_delta.targets[vdu_proxy_backend]

  // YAML instantiation_levels: {'type': 'tosca.policies.nfv.InstantiationLevels', 'properties': {'levels': {'small': {'description': 'Small instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 0}, 'proxy_backend_scaling': {'scale_level': 0}}}, 'medium': {'description': 'Medium instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 3}, 'proxy_backend_scaling': {'scale_level': 2}}}, 'large': {'description': 'Large instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 7}, 'proxy_backend_scaling': {'scale_level': 5}}}}, 'default_level': 'small'}}
  policy[policy_instantiation_levels]
  policy_instantiation_levels.name["instantiation_levels"]
  // YAML properties:
  // YAML levels: {'small': {'description': 'Small instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 0}, 'proxy_backend_scaling': {'scale_level': 0}}}, 'medium': {'description': 'Medium instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 3}, 'proxy_backend_scaling': {'scale_level': 2}}}, 'large': {'description': 'Large instantiation level', 'scale_info': {'proxy_frontend_scaling': {'scale_level': 7}, 'proxy_backend_scaling': {'scale_level': 5}}}}
  policy_instantiation_levels.property_levels.size[3]
  policy_instantiation_levels.property_levels.one_entry["small"]
  // YAML description: Small instantiation level
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).description = "Small instantiation level"
  // YAML scale_info: {'proxy_frontend_scaling': {'scale_level': 0}, 'proxy_backend_scaling': {'scale_level': 0}}
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).scale_info.size[2]
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).scale_info.one_entry["proxy_frontend_scaling"]
  // YAML scale_level: 0
  (tosca_datatypes_nfv_ScaleInfo<:((tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).scale_info.entry["proxy_frontend_scaling"])).scale_level = 0
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).scale_info.one_entry["proxy_backend_scaling"]
  // YAML scale_level: 0
  (tosca_datatypes_nfv_ScaleInfo<:((tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).scale_info.entry["proxy_backend_scaling"])).scale_level = 0
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["small"])).scale_info.keys["proxy_frontend_scaling" + "proxy_backend_scaling"]
  policy_instantiation_levels.property_levels.one_entry["medium"]
  // YAML description: Medium instantiation level
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).description = "Medium instantiation level"
  // YAML scale_info: {'proxy_frontend_scaling': {'scale_level': 3}, 'proxy_backend_scaling': {'scale_level': 2}}
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).scale_info.size[2]
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).scale_info.one_entry["proxy_frontend_scaling"]
  // YAML scale_level: 3
  (tosca_datatypes_nfv_ScaleInfo<:((tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).scale_info.entry["proxy_frontend_scaling"])).scale_level = 3
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).scale_info.one_entry["proxy_backend_scaling"]
  // YAML scale_level: 2
  (tosca_datatypes_nfv_ScaleInfo<:((tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).scale_info.entry["proxy_backend_scaling"])).scale_level = 2
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["medium"])).scale_info.keys["proxy_frontend_scaling" + "proxy_backend_scaling"]
  policy_instantiation_levels.property_levels.one_entry["large"]
  // YAML description: Large instantiation level
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).description = "Large instantiation level"
  // YAML scale_info: {'proxy_frontend_scaling': {'scale_level': 7}, 'proxy_backend_scaling': {'scale_level': 5}}
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).scale_info.size[2]
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).scale_info.one_entry["proxy_frontend_scaling"]
  // YAML scale_level: 7
  (tosca_datatypes_nfv_ScaleInfo<:((tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).scale_info.entry["proxy_frontend_scaling"])).scale_level = 7
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).scale_info.one_entry["proxy_backend_scaling"]
  // YAML scale_level: 5
  (tosca_datatypes_nfv_ScaleInfo<:((tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).scale_info.entry["proxy_backend_scaling"])).scale_level = 5
  (tosca_datatypes_nfv_InstantiationLevel<:(policy_instantiation_levels.property_levels.entry["large"])).scale_info.keys["proxy_frontend_scaling" + "proxy_backend_scaling"]
  policy_instantiation_levels.property_levels.keys["small" + "medium" + "large"]
  // YAML default_level: small
  policy_instantiation_levels.property_default_level = "small"
  // YAML interfaces:
  no policy_instantiation_levels.interfaces
  // YAML targets: None
  no policy_instantiation_levels.targets

  // YAML vdu_proxy_frontend_instantiation_levels: {'type': 'tosca.policies.nfv.VduInstantiationLevels', 'properties': {'levels': {'small': {'number_of_instances': 3}, 'medium': {'number_of_instances': 6}, 'large': {'number_of_instances': 10}}}, 'targets': ['vdu_proxy_frontend']}
  policy[policy_vdu_proxy_frontend_instantiation_levels]
  policy_vdu_proxy_frontend_instantiation_levels.name["vdu_proxy_frontend_instantiation_levels"]
  // YAML properties:
  // YAML levels: {'small': {'number_of_instances': 3}, 'medium': {'number_of_instances': 6}, 'large': {'number_of_instances': 10}}
  policy_vdu_proxy_frontend_instantiation_levels.property_levels.size[3]
  policy_vdu_proxy_frontend_instantiation_levels.property_levels.one_entry["small"]
  // YAML number_of_instances: 3
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_frontend_instantiation_levels.property_levels.entry["small"])).number_of_instances = 3
  policy_vdu_proxy_frontend_instantiation_levels.property_levels.one_entry["medium"]
  // YAML number_of_instances: 6
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_frontend_instantiation_levels.property_levels.entry["medium"])).number_of_instances = 6
  policy_vdu_proxy_frontend_instantiation_levels.property_levels.one_entry["large"]
  // YAML number_of_instances: 10
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_frontend_instantiation_levels.property_levels.entry["large"])).number_of_instances = 10
  policy_vdu_proxy_frontend_instantiation_levels.property_levels.keys["small" + "medium" + "large"]
  // YAML interfaces:
  no policy_vdu_proxy_frontend_instantiation_levels.interfaces
  // YAML targets: ['vdu_proxy_frontend']
  policy_vdu_proxy_frontend_instantiation_levels.targets[vdu_proxy_frontend]

  // YAML vdu_proxy_backend_instantiation_levels: {'type': 'tosca.policies.nfv.VduInstantiationLevels', 'properties': {'levels': {'small': {'number_of_instances': 3}, 'medium': {'number_of_instances': 5}, 'large': {'number_of_instances': 8}}}, 'targets': ['vdu_proxy_backend']}
  policy[policy_vdu_proxy_backend_instantiation_levels]
  policy_vdu_proxy_backend_instantiation_levels.name["vdu_proxy_backend_instantiation_levels"]
  // YAML properties:
  // YAML levels: {'small': {'number_of_instances': 3}, 'medium': {'number_of_instances': 5}, 'large': {'number_of_instances': 8}}
  policy_vdu_proxy_backend_instantiation_levels.property_levels.size[3]
  policy_vdu_proxy_backend_instantiation_levels.property_levels.one_entry["small"]
  // YAML number_of_instances: 3
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_backend_instantiation_levels.property_levels.entry["small"])).number_of_instances = 3
  policy_vdu_proxy_backend_instantiation_levels.property_levels.one_entry["medium"]
  // YAML number_of_instances: 5
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_backend_instantiation_levels.property_levels.entry["medium"])).number_of_instances = 5
  policy_vdu_proxy_backend_instantiation_levels.property_levels.one_entry["large"]
  // YAML number_of_instances: 8
  (tosca_datatypes_nfv_VduLevel<:(policy_vdu_proxy_backend_instantiation_levels.property_levels.entry["large"])).number_of_instances = 8
  policy_vdu_proxy_backend_instantiation_levels.property_levels.keys["small" + "medium" + "large"]
  // YAML interfaces:
  no policy_vdu_proxy_backend_instantiation_levels.interfaces
  // YAML targets: ['vdu_proxy_backend']
  policy_vdu_proxy_backend_instantiation_levels.targets[vdu_proxy_backend]

  // YAML proxy_frontend_anti_affinity: {'type': 'tosca.policies.nfv.AntiAffinityRule', 'properties': {'scope': 'nfvi_node'}, 'targets': ['vdu_proxy_frontend']}
  policy[policy_proxy_frontend_anti_affinity]
  policy_proxy_frontend_anti_affinity.name["proxy_frontend_anti_affinity"]
  // YAML properties:
  // YAML scope: nfvi_node
  policy_proxy_frontend_anti_affinity.property_scope = "nfvi_node"
  // NOTE: The property 'nfvi_maintenance_group_info' is not required.
  no   policy_proxy_frontend_anti_affinity.property_nfvi_maintenance_group_info
  // YAML interfaces:
  no policy_proxy_frontend_anti_affinity.interfaces
  // YAML targets: ['vdu_proxy_frontend']
  policy_proxy_frontend_anti_affinity.targets[vdu_proxy_frontend]

  // YAML proxy_backend_anti_affinity: {'type': 'tosca.policies.nfv.AntiAffinityRule', 'properties': {'scope': 'nfvi_node'}, 'targets': ['vdu_proxy_backend']}
  policy[policy_proxy_backend_anti_affinity]
  policy_proxy_backend_anti_affinity.name["proxy_backend_anti_affinity"]
  // YAML properties:
  // YAML scope: nfvi_node
  policy_proxy_backend_anti_affinity.property_scope = "nfvi_node"
  // NOTE: The property 'nfvi_maintenance_group_info' is not required.
  no   policy_proxy_backend_anti_affinity.property_nfvi_maintenance_group_info
  // YAML interfaces:
  no policy_proxy_backend_anti_affinity.interfaces
  // YAML targets: ['vdu_proxy_backend']
  policy_proxy_backend_anti_affinity.targets[vdu_proxy_backend]

  // --------------------------------------------------
  // YAML outputs:
  // --------------------------------------------------

  no outputs

  // --------------------------------------------------
  // Substitution Mappings
  // --------------------------------------------------

  // YAML substitution_mappings: {'node_type': 'tosca.nodes.nfv.Proxy_CNF', 'requirements': {'virtual_link_external': ['extCp_data', 'external_virtual_link']}}
  substitution_mappings[substitution_mappings]
  substitution_mappings.node_type_name = "tosca.nodes.nfv.Proxy_CNF"
  // YAML   requirements:
  // YAML     virtual_link_external: ['extCp_data', 'external_virtual_link']
  connectRequirement[substitution_mappings.requirement_virtual_link_external, extCp_data.requirement_external_virtual_link]
}

/** There exists some CNF3_scalable_topology_template */
run Show_CNF3_scalable_topology_template {
} for 0 but
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 1 LocationGraphs/LocationGraph,
  exactly 31 LocationGraphs/Location,
  exactly 166 LocationGraphs/Value,
  exactly 30 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 37 LocationGraphs/Role,
  exactly 7 TOSCA/Scalar,
  exactly 7 TOSCA/scalar_unit_size,
  exactly 0 TOSCA/scalar_unit_frequency,
  exactly 0 TOSCA/scalar_unit_time,
  exactly 0 TOSCA/map_integer/Map,
  exactly 2 TOSCA/map_string/Map,
  exactly 12 TOSCA/map_data/Map,
  exactly 0 TOSCA/map_map_data/Map,
  exactly 31 TOSCA/ToscaComponent,
  exactly 37 TOSCA/ToscaRole,
  exactly 59 TOSCA/ToscaValue,
  exactly 1 TOSCA/TopologyTemplate,
  exactly 11 TOSCA/Node,
  exactly 11 TOSCA/Requirement,
  exactly 26 TOSCA/Capability,
  exactly 10 TOSCA/Relationship,
  exactly 0 TOSCA/Group,
  exactly 10 TOSCA/Policy,
  exactly 4 TOSCA/Interface,
  exactly 49 TOSCA/Operation,
  exactly 0 TOSCA/Attribute,
  exactly 2 TOSCA/Artifact,
  exactly 38 TOSCA/Data,
  exactly 4 TOSCA/AbstractProperty,
  exactly 0 TOSCA/Property,
  exactly 4 TOSCA/Parameter,
  exactly 2 tosca_artifacts_Root,
  exactly 0 tosca_artifacts_File,
  exactly 2 tosca_artifacts_Deployment,
  exactly 2 tosca_artifacts_Deployment_Image,
  exactly 0 tosca_artifacts_Deployment_Image_VM,
  exactly 0 tosca_artifacts_Implementation,
  exactly 0 tosca_artifacts_Implementation_Bash,
  exactly 0 tosca_artifacts_Implementation_Python,
  exactly 0 tosca_artifacts_template,
  exactly 2 tosca_artifacts_nfv_SwImage,
  exactly 0 tosca_artifacts_Implementation_nfv_Mistral,
  exactly 0 tosca_artifacts_nfv_HelmChart,
  exactly 38 tosca_datatypes_Root,
  exactly 0 tosca_datatypes_Credential,
  exactly 0 tosca_datatypes_TimeInterval,
  exactly 0 tosca_datatypes_network_NetworkInfo,
  exactly 0 tosca_datatypes_network_PortInfo,
  exactly 0 tosca_datatypes_network_PortSpec,
  exactly 0 tosca_datatypes_nfv_L2AddressData,
  exactly 0 tosca_datatypes_nfv_L3AddressData,
  exactly 0 tosca_datatypes_nfv_AddressData,
  exactly 2 tosca_datatypes_nfv_ConnectivityType,
  exactly 4 tosca_datatypes_nfv_LinkBitrateRequirements,
  exactly 0 tosca_datatypes_nfv_CpProtocolData,
  exactly 0 tosca_datatypes_nfv_VnfProfile,
  exactly 0 tosca_datatypes_nfv_Qos,
  exactly 0 tosca_datatypes_nfv_VnfMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VersionDependency,
  exactly 0 tosca_datatypes_nfv_VersionDependencyStatement,
  exactly 6 tosca_datatypes_nfv_ScaleInfo,
  exactly 0 tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements,
  exactly 2 tosca_datatypes_nfv_RequestedAdditionalCapability,
  exactly 2 tosca_datatypes_nfv_VirtualMemory,
  exactly 2 tosca_datatypes_nfv_VirtualCpu,
  exactly 0 tosca_datatypes_nfv_VirtualCpuPinning,
  exactly 0 tosca_datatypes_nfv_VnfcConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties,
  exactly 2 tosca_datatypes_nfv_VduProfile,
  exactly 2 tosca_datatypes_nfv_VlProfile,
  exactly 0 tosca_datatypes_nfv_VirtualLinkProtocolData,
  exactly 0 tosca_datatypes_nfv_L2ProtocolData,
  exactly 0 tosca_datatypes_nfv_L3ProtocolData,
  exactly 0 tosca_datatypes_nfv_IpAllocationPool,
  exactly 3 tosca_datatypes_nfv_InstantiationLevel,
  exactly 10 tosca_datatypes_nfv_VduLevel,
  exactly 0 tosca_datatypes_nfv_VnfLcmOperationsConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfInstantiateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfHealOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfTerminateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfOperateOperationConfiguration,
  exactly 2 tosca_datatypes_nfv_ScalingAspect,
  exactly 0 tosca_datatypes_nfv_VnfConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfAdditionalConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributes,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata,
  exactly 0 tosca_datatypes_nfv_LogicalNodeData,
  exactly 1 tosca_datatypes_nfv_VirtualBlockStorageData,
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
  exactly 26 tosca_capabilities_Root,
  exactly 26 tosca_capabilities_Node,
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
  exactly 8 tosca_capabilities_nfv_VirtualLinkable,
  exactly 6 tosca_capabilities_nfv_VirtualBindable,
  exactly 2 tosca_capabilities_nfv_VirtualCompute,
  exactly 0 tosca_capabilities_nfv_VirtualStorage,
  exactly 0 tosca_capabilities_nfv_TrunkBindable,
  exactly 0 tosca_capabilities_nfv_ContainerDeployable,
  exactly 0 tosca_capabilities_nfv_AssociableVdu,
  exactly 4 tosca_interfaces_Root,
  exactly 1 tosca_interfaces_node_lifecycle_Standard,
  exactly 1 tosca_interfaces_relationship_Configure,
  exactly 1 tosca_interfaces_nfv_Vnflcm,
  exactly 1 tosca_interfaces_nfv_VnfIndicator,
  exactly 0 tosca_interfaces_nfv_ChangeCurrentVnfPackage,
  exactly 10 tosca_relationships_Root,
  exactly 10 tosca_relationships_DependsOn,
  exactly 0 tosca_relationships_HostedOn,
  exactly 0 tosca_relationships_ConnectsTo,
  exactly 0 tosca_relationships_AttachesTo,
  exactly 0 tosca_relationships_RoutesTo,
  exactly 0 tosca_relationships_network_LinksTo,
  exactly 0 tosca_relationships_network_BindsTo,
  exactly 6 tosca_relationships_nfv_VirtualLinksTo,
  exactly 0 tosca_relationships_nfv_VipVirtualLinksTo,
  exactly 4 tosca_relationships_nfv_VirtualBindsTo,
  exactly 0 tosca_relationships_nfv_AttachesTo,
  exactly 0 tosca_relationships_nfv_TrunkBindsTo,
  exactly 0 tosca_relationships_nfv_DeploysTo,
  exactly 0 tosca_relationships_nfv_MciopAssociates,
  exactly 11 tosca_nodes_Root,
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
  exactly 6 tosca_nodes_nfv_Cp,
  exactly 1 tosca_nodes_nfv_VNF,
  exactly 2 tosca_nodes_nfv_VnfExtCp,
  exactly 2 tosca_nodes_nfv_Vdu_Compute,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualBlockStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualObjectStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualFileStorage,
  exactly 4 tosca_nodes_nfv_VduCp,
  exactly 2 tosca_nodes_nfv_VnfVirtualLink,
  exactly 0 tosca_nodes_nfv_VipCp,
  exactly 0 tosca_nodes_nfv_VduSubCp,
  exactly 0 tosca_nodes_nfv_Vdu_OsContainer,
  exactly 0 tosca_nodes_nfv_Vdu_OsContainerDeployableUnit,
  exactly 0 tosca_nodes_nfv_Mciop,
  exactly 0 tosca_nodes_nfv_VirtualCp,
  exactly 1 tosca_nodes_nfv_Proxy_CNF,
  exactly 0 tosca_groups_Root,
  exactly 0 tosca_groups_nfv_PlacementGroup,
  exactly 10 tosca_policies_Root,
  exactly 2 tosca_policies_Placement,
  exactly 0 tosca_policies_Scaling,
  exactly 0 tosca_policies_Update,
  exactly 0 tosca_policies_Performance,
  exactly 0 tosca_policies_nfv_Abstract_SecurityGroupRule,
  exactly 1 tosca_policies_nfv_InstantiationLevels,
  exactly 2 tosca_policies_nfv_VduInstantiationLevels,
  exactly 0 tosca_policies_nfv_VirtualLinkInstantiationLevels,
  exactly 1 tosca_policies_nfv_ScalingAspects,
  exactly 2 tosca_policies_nfv_VduScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas,
  exactly 2 tosca_policies_nfv_VduInitialDelta,
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
  exactly 1 CNF3_scalable_topology_template,
  8 Int,
  1 seq
  expect 1


