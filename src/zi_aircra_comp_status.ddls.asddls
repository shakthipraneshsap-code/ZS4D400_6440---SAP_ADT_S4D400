@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Component Status'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_AIRCRA_COMP_STATUS
  as select from ZI_AIRCRA_COMP
{
  key component_id,

      ac_type,

      component_type,

      used_hours,

      limit_hours,

      hour_unit,

      install_date,

      ( limit_hours - used_hours )                                as remaining_hours,

      cast( ( used_hours * 100 ) / limit_hours as abap.dec(5,2) ) as utilization_percent,

      case
        when used_hours >= limit_hours
            then 'OVERDUE'

        when used_hours * 100 >= limit_hours * 80
            then 'DUE SOON'

        else 'NORMAL'

      end                                                         as component_status,

      case
        when used_hours >= limit_hours
            then 1

        when used_hours * 100 >= limit_hours * 80
            then 2

        else 3

      end                                                         as criticality,

      _Aircraft

}
