@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Maintenance Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_MAINT
  as select from zaircra_maint
{
  key order_id,
      ac_type,
      maint_type,
      status,
      @Semantics.amount.currencyCode : 'currency'
      cost,
      currency,
      created_on
}
