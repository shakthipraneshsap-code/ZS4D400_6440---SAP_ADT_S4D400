@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Maintenance Detail'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_MAINT_DETAIL
  as select from ZI_AIRCRA_MAINT_V2
{
  key order_id,
      ac_type,

      _Aircraft.ac_name,
      _Aircraft.manufacturer,

      maint_type,
      status,
      @Semantics.amount.currencyCode: 'currency'
      cost,
      currency,
      created_on
}
