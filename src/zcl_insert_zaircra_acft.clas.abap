CLASS zcl_insert_zaircra_acft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zaircra_acft IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_object) = NEW lcl_aircra_acft_sample_data(  ).

    lo_object->insert_sample_data(  ).

  ENDMETHOD.
ENDCLASS.
