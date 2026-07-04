@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Fleet Maintenance Dashboard'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
define view entity ZC_AIRCRA_MAINT_ANALYTICS
  as select from ZI_AIRCRA_MAINT_ANALYTICS_V2
{

      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key ac_type,

      @UI.lineItem: [{ position: 20 }]
      total_orders,

      @UI.lineItem: [{ position: 30 }]
      open_orders,

      @UI.lineItem: [{ position: 40 }]
      closed_orders,

      @UI.lineItem: [{ position: 50 }]
      inprocess_orders,

      @UI.lineItem: [{ position: 60 }]
      @Semantics.amount.currencyCode: 'currency'
      total_cost,

      currency

}
