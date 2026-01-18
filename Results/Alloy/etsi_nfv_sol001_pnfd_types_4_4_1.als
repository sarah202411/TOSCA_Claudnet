// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: ETSI NFV SOL 001 pnfd types definitions version 4.4.1

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
// Represents geographical information on the location where a PNF is deployed.
//
sig tosca_datatypes_nfv_LocationInfo extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML country_code: {'type': 'string', 'description': 'Country code', 'required': True}
  //
  // Country code
  //
  country_code: one string,

  // YAML civic_address_element: {'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.CivicAddressElement'}, 'description': 'Elements composing the civic address where the PNF is deployed.', 'required': False}
  //
  // Elements composing the civic address where the PNF is deployed.
  //
  civic_address_element: seq tosca_datatypes_nfv_CivicAddressElement,

  // YAML geographic_coordinates: {'type': 'tosca.datatypes.nfv.GeographicCoordinates', 'description': 'Geographic coordinates (e.g. Altitude, Longitude, Latitude) where the PNF is deployed.', 'required': False}
  //
  // Geographic coordinates (e.g. Altitude, Longitude, Latitude) where the PNF is deployed.
  //
  geographic_coordinates: lone tosca_datatypes_nfv_GeographicCoordinates,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.LocationInfo */
run Show_tosca_datatypes_nfv_LocationInfo {
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
  exactly 1 tosca_datatypes_nfv_LocationInfo
  expect 1

//
// Represents an element of a civic location as specified in IETF  RFC 4776 [11].
//
sig tosca_datatypes_nfv_CivicAddressElement extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ca_type: {'type': 'string', 'description': 'caType as per RFC4776', 'required': True}
  //
  // caType as per RFC4776
  //
  ca_type: one string,

  // YAML ca_value: {'type': 'string', 'description': 'caValue as per RFC4776.', 'required': True}
  //
  // caValue as per RFC4776.
  //
  ca_value: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.CivicAddressElement */
run Show_tosca_datatypes_nfv_CivicAddressElement {
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
  exactly 1 tosca_datatypes_nfv_CivicAddressElement
  expect 1

//
// Represents an element of a geographic coordinate location as specified in IETF RFC?6225.
//
sig tosca_datatypes_nfv_GeographicCoordinates extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML latitude_uncertainty: {'type': 'string', 'description': 'LatUnc as per RFC 6225', 'required': False}
  //
  // LatUnc as per RFC 6225
  //
  latitude_uncertainty: lone string,

  // YAML latitude: {'type': 'string', 'description': 'Latitude value as per RFC 6225', 'required': True}
  //
  // Latitude value as per RFC 6225
  //
  latitude: one string,

  // YAML longitude_uncertainty: {'type': 'string', 'description': 'LongUnc as per RFC 6225', 'required': False}
  //
  // LongUnc as per RFC 6225
  //
  longitude_uncertainty: lone string,

  // YAML longitude: {'type': 'string', 'description': 'Longitude value as per RFC 6225', 'required': True}
  //
  // Longitude value as per RFC 6225
  //
  longitude: one string,

  // YAML altitude_type: {'type': 'string', 'description': 'AType value as per RFC 6225', 'required': True}
  //
  // AType value as per RFC 6225
  //
  altitude_type: one string,

  // YAML altitude_uncertainty: {'type': 'string', 'description': 'AltUnc as per RFC 6225', 'required': False}
  //
  // AltUnc as per RFC 6225
  //
  altitude_uncertainty: lone string,

  // YAML altitude: {'type': 'string', 'description': 'Altitude value as per RFC 6225', 'required': True}
  //
  // Altitude value as per RFC 6225
  //
  altitude: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.GeographicCoordinates */
run Show_tosca_datatypes_nfv_GeographicCoordinates {
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
  exactly 1 tosca_datatypes_nfv_GeographicCoordinates
  expect 1

// --------------------------------------------------
// Node Types
// --------------------------------------------------

sig tosca_nodes_nfv_PNF extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'type': 'string', 'required': True, 'description': 'Identifier of this PNFD information element. It uniquely identifies the PNFD.'}
  //
  // Identifier of this PNFD information element. It uniquely identifies the PNFD.
  //
  property_descriptor_id: one string,

  // YAML function_description: {'type': 'string', 'required': True, 'description': 'Describes the PNF function.'}
  //
  // Describes the PNF function.
  //
  property_function_description: one string,

  // YAML provider: {'type': 'string', 'required': True, 'description': 'Identifies the provider of the PNFD.'}
  //
  // Identifies the provider of the PNFD.
  //
  property_provider: one string,

  // YAML version: {'type': 'string', 'required': True, 'description': 'Identifies the version of the PNFD.'}
  //
  // Identifies the version of the PNFD.
  //
  property_version: one string,

  // YAML descriptor_invariant_id: {'type': 'string', 'required': True, 'description': 'Identifier of this PNFD in a version independent manner. This attribute is invariant across versions of PNFD with no constraint on the changes across versions.'}
  //
  // Identifier of this PNFD in a version independent manner. This attribute is invariant across versions of PNFD with no constraint on the changes across versions.
  //
  property_descriptor_invariant_id: one string,

  // YAML ext_invariant_id: {'type': 'string', 'required': False, 'description': 'Identifies a PNFD in a version independent manner. This attribute is invariant across versions of the PNFD that expose the same external connectivity, i.e. same number and name of the requirements for VirtualLinkable capability that represent PnfExtCps. When used in a PNF node template in an NSD it allows for PNF instances during NS LCM the use of a PNFD different from the one referenced by the descriptor_id attribute, provided they have the same ext_invariant_id.'}
  //
  // Identifies a PNFD in a version independent manner. This attribute is invariant across versions of the PNFD that expose the same external connectivity, i.e. same number and name of the requirements for VirtualLinkable capability that represent PnfExtCps. When used in a PNF node template in an NSD it allows for PNF instances during NS LCM the use of a PNFD different from the one referenced by the descriptor_id attribute, provided they have the same ext_invariant_id.
  //
  property_ext_invariant_id: lone string,

  // YAML name: {'type': 'string', 'required': True, 'description': 'Name to identify the PNFD.'}
  //
  // Name to identify the PNFD.
  //
  property_name: one string,

  // YAML geographical_location_info: {'type': 'tosca.datatypes.nfv.LocationInfo', 'required': False, 'description': 'Provides information about the geographical location (e.g. geographic coordinates or address of the building, etc.) of the PNF'}
  //
  // Provides information about the geographical location (e.g. geographic coordinates or address of the building, etc.) of the PNF
  //
  property_geographical_location_info: lone tosca_datatypes_nfv_LocationInfo,

  // YAML version_dependency: {'type': 'list', 'description': 'Identifies versions of descriptors of other constituents in the NSD upon which the PNF depends. The dependencies may be described for the PNFD referenced with descriptor_id  and for PNFDs with the same ext_invariant_id.', 'required': False, 'entry_schema': {'type': 'tosca.datatypes.nfv.VersionDependency'}}
  //
  // Identifies versions of descriptors of other constituents in the NSD upon which the PNF depends. The dependencies may be described for the PNFD referenced with descriptor_id  and for PNFDs with the same ext_invariant_id.
  //
  property_version_dependency: seq tosca_datatypes_nfv_VersionDependency,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_virtual_link: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.PNF */
run Show_tosca_nodes_nfv_PNF {
  tosca_nodes_nfv_PNF.no_name[]
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
  exactly 1 tosca_nodes_nfv_PNF
  expect 1

//
// node definition of PnfExtCp.
//
sig tosca_nodes_nfv_PnfExtCp extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_external_virtual_link: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement["external_virtual_link", requirement_external_virtual_link]
  requirement_external_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_external_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.PnfExtCp */
run Show_tosca_nodes_nfv_PnfExtCp {
  tosca_nodes_nfv_PnfExtCp.no_name[]
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
  exactly 1 tosca_nodes_nfv_PnfExtCp
  expect 1

// --------------------------------------------------
// Policy Types
// --------------------------------------------------

//
// The PnfSecurityGroupRule type is a policy type specified the matching criteria for the ingress and/or egress traffic to/from visited PNF external connection points.
//
sig tosca_policies_nfv_PnfSecurityGroupRule extends tosca_policies_nfv_Abstract_SecurityGroupRule
{
} {
  // YAML targets: ['tosca.nodes.nfv.PnfExtCp']
  targets_type[tosca_nodes_nfv_PnfExtCp]
}

/** There exists some tosca.policies.nfv.PnfSecurityGroupRule */
run Show_tosca_policies_nfv_PnfSecurityGroupRule {
  tosca_policies_nfv_PnfSecurityGroupRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_PnfSecurityGroupRule
  expect 1

