@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Master'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_ACFT
  as select from zaircra_acft
{
  key ac_type,
      ac_name,
      manufacturer,
      max_seats
}
