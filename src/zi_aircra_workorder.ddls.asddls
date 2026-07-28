@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Maintenance Work Order'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_AIRCRA_WORKORDER
  as select from zaircra_wo
{
  key workorder_uuid,

      workorder_id,

      ac_type,

      component_id,

      description,

      priority,

      status,

      @Semantics.amount.currencyCode : 'currency'
      est_cost,

      currency,

      schedule_date,

      @Semantics.user.createdBy: true
      created_by,

      @Semantics.systemDateTime.createdAt: true
      created_at,

      @Semantics.user.lastChangedBy: true
      last_changed_by,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at

}
