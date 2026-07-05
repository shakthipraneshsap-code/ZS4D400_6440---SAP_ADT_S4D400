CLASS zcl_insert_zaircra_comp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA lt_zaircra_comp TYPE TABLE OF zaircra_comp.

ENDCLASS.


CLASS zcl_insert_zaircra_comp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_object) = NEW lcl_insert_zaircra_comp(  ).

    lo_object->get_sample_records( CHANGING ct_zaircra_comp = lt_zaircra_comp ).

    IF lt_zaircra_comp IS NOT INITIAL.

      MODIFY zaircra_comp FROM TABLE @lt_zaircra_comp.
      IF sy-subrc = 0.
        COMMIT WORK.
        out->write( 'Data inserted' ).
      ELSE.
        ROLLBACK WORK.
        out->write( 'Data Not Inserted' ).
      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
