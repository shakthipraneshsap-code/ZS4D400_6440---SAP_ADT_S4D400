CLASS zcl_insert_zaircra_maint DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      create_sample_records.

    DATA gt_zaircra_maint TYPE TABLE OF zaircra_maint.

ENDCLASS.



CLASS ZCL_INSERT_ZAIRCRA_MAINT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_data TYPE STANDARD TABLE OF zaircra_maint.

    " Prepare all records
    me->create_sample_records( ).

    " Insert them into table
    IF gt_zaircra_maint IS NOT INITIAL.

*      INSERT zaircra_maint FROM TABLE @gt_zaircra_maint.
      MODIFY zaircra_maint FROM TABLE @gt_zaircra_maint.
      IF sy-subrc = 0.
*      WRITE: 'Sample records inserted successfully.'.
        COMMIT WORK.
        out->write('Sample records inserted successfully.').
      ELSE.
*      WRITE: 'Error during insertion of records!'.
        ROLLBACK WORK.
        out->write('Error during insertion of records!').
      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD create_sample_records.
    DATA: lt_data  TYPE STANDARD TABLE OF zaircra_maint,
          ls_data  TYPE zaircra_maint,
          lv_index TYPE i.

    " Given 4 records
    CLEAR ls_data.
    ls_data-client      = sy-mandt.
    ls_data-order_id    = 'M0001'.
    ls_data-ac_type     = 'A320'.
    ls_data-maint_type  = 'GENERAL'.
    ls_data-status      = 'OPEN'.
    ls_data-cost        = 15000.
    ls_data-currency    = 'USD'.
    ls_data-created_on  = sy-datum.
    APPEND ls_data TO lt_data.

    ls_data-order_id    = 'M0002'.
    ls_data-status      = 'CLOSED'.
    ls_data-cost        = 20000.
    ls_data-currency    = 'INR'.
    APPEND ls_data TO lt_data.

    ls_data-order_id    = 'M0003'.
    ls_data-ac_type     = 'B737'.
    ls_data-status      = 'OPEN'.
    ls_data-cost        = 12000.
    ls_data-currency    = 'USD'.
    APPEND ls_data TO lt_data.

    ls_data-order_id    = 'M0004'.
    ls_data-status      = 'CLOSED'.
    ls_data-cost        = 35000.
    ls_data-currency    = 'INR'.
    APPEND ls_data TO lt_data.

    " Next 20 additional records
    DO 20 TIMES.
      CLEAR ls_data.
      ls_data-client      = sy-mandt.
      ls_data-order_id    = |M{ 1005 + sy-index }|.
      ls_data-ac_type     = SWITCH #( sy-index MOD 2 WHEN 0 THEN 'A320' ELSE 'B737' ).
      ls_data-maint_type  = SWITCH #( sy-index MOD 3 WHEN 0 THEN 'ENGINE' WHEN 1 THEN 'ROUTINE' ELSE 'GENERAL' ).
      ls_data-status      = SWITCH #( sy-index MOD 2 WHEN 0 THEN 'OPEN' ELSE 'CLOSED' ).
      ls_data-cost        = 10000 + sy-index * 1000.
      ls_data-created_on  = sy-datum - sy-index.
      ls_data-currency    = SWITCH #( sy-index MOD 2 WHEN 0 THEN 'INR' ELSE 'USD').
*      ls_data-currency    = SWITCH #( sy-index MOD 3 WHEN 0 THEN 'KWT' ).
      APPEND ls_data TO lt_data.
    ENDDO.

    IF lt_data IS NOT INITIAL.
      gt_zaircra_maint = lt_data.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
