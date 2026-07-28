@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Maintenance Work Order'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_AIRCRA_WORKORDER
  as projection on ZI_AIRCRA_WORKORDER
{

      @UI.lineItem: [{ position: 10 }]
  key workorder_uuid,

      @UI.lineItem: [{ position: 20 }]
      workorder_id,

      @UI.lineItem: [{ position: 30 }]
      ac_type,

      @UI.lineItem: [{ position: 40 }]
      component_id,

      @UI.lineItem: [{ position: 50 }]
      description,

      @UI.lineItem: [{ position: 60 }]
      priority,

      @UI.lineItem: [{ position: 70 }]
      status,

      @UI.lineItem: [{ position: 80 }]
      @Semantics.amount.currencyCode: 'currency'
      est_cost,

      @UI.lineItem: [{ position: 90 }]
      currency,

      @UI.lineItem: [{ position: 100 }]
      schedule_date,

      @UI.lineItem: [{ position: 110 }]
      created_by,

      @UI.lineItem: [{ position: 120 }]
      created_at,

      @UI.lineItem: [{ position: 130 }]
      last_changed_by,

      @UI.lineItem: [{ position: 140 }]
      last_changed_at

}
