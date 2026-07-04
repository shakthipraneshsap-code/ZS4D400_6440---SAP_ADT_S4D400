@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Maintenance Analytics V2'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_MAINT_ANALYTICS_V2
  as select from ZI_AIRCRA_MAINT
{
  key ac_type,

      count(*)    as total_orders,

      sum(
          case
              when status = 'OPEN'
              then 1
              else 0
           end )  as open_orders,

      sum(
          case
              when status = 'CLOSED'
              then 1
              else 0
          end )   as closed_orders,

      sum(
            case
                when status = 'IN PROCESS'
                then 1
                else 0
            end ) as inprocess_orders,

      @Semantics.amount.currencyCode: 'currency'
      sum( cost ) as total_cost,

      currency    as currency
}

group by
  ac_type,
  currency
