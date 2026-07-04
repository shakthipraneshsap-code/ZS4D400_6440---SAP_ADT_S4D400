@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Maintenance Analytics'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_MAINT_ANALYTICS
  as select from ZI_AIRCRA_MAINT
{
  ac_type,

  currency,

  count(*)  as total_orders,

  @Semantics.amount.currencyCode: 'currency'
  sum(cost) as total_cost

}

group by
  ac_type,
  currency
