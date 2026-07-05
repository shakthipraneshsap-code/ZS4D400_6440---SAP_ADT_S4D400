@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Component Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_COMP
  as select from zaircra_comp
  association [0..1] to ZI_AIRCRA_ACFT as _Aircraft on $projection.ac_type = _Aircraft.ac_type
{
  key component_id,

      ac_type,

      component_type,

      used_hours,

      limit_hours,

      hour_unit,

      install_date,

      _Aircraft
}
