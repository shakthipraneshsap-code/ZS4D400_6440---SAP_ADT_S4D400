@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aircraft Component Life Dashboard'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
@UI.headerInfo: {
    typeName: 'Aircraft Component',
    typeNamePlural: 'Aircraft Components',
    title: {
        type: #STANDARD,
        value: 'component_id' },
    description: {
        value: 'component_type'} }

//@UI.facet: [
//
//{
//    id: 'General',
//    purpose: #STANDARD,
//    type: #IDENTIFICATION_REFERENCE,
//    label: 'General Information',
//    position: 10
//}
//
//]

define view entity ZC_AIRCRA_COMP_STATUS
  as select from ZI_AIRCRA_COMP_STATUS
{

      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key component_id,
      _Aircraft,

      @UI.lineItem: [{ position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      @Search.ranking: #LOW
      @ObjectModel.text.association: '_Aircraft'
      @Consumption.valueHelpDefinition: [
        {
            entity: {
                name: 'ZI_AIRCRA_ACFT',
                element: 'ac_type'
            }
        }
       ]
      ac_type,

      @UI.lineItem: [{ position: 30 }]
      @Search.ranking: #MEDIUM
      component_type,

      @UI.lineItem: [{ position: 40 }]
      @Semantics.durationInHours: true
      used_hours,

      @UI.lineItem: [{ position: 50 }]
      @Semantics.durationInHours: true
      limit_hours,

      @UI.lineItem: [{ position: 60 }]
      @Semantics.durationInHours: true
      remaining_hours,

      @UI.lineItem: [{ position: 70 }]
      hour_unit,

      @UI.lineItem: [{ position: 80 }]
      utilization_percent,

      criticality,

      @UI.lineItem: [
      {
        position: 90,
        criticality: 'criticality' }
      ]
      component_status,

      @UI.lineItem: [{ position: 100 }]
      @Semantics.dateTime: true
      install_date

}
