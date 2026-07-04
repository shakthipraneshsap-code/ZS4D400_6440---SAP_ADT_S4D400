@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Maintenance Interface View V2'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_MAINT_V2
  as select from zaircra_maint

  association [0..1] to ZI_AIRCRA_ACFT as _Aircraft on $projection.ac_type = _Aircraft.ac_type
{
  key order_id,
      ac_type,
      maint_type,
      status,
      @Semantics.amount.currencyCode : 'currency'
      cost,
      currency,
      created_on,

      _Aircraft
}
