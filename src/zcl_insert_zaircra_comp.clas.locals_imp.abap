*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_insert_zaircra_comp DEFINITION.

  PUBLIC SECTION.
*    METHODS: insert_samples.

    TYPES lty_zaircra_comp TYPE STANDARD TABLE OF zaircra_comp WITH NON-UNIQUE DEFAULT KEY.

    METHODS: get_sample_records
      CHANGING ct_zaircra_comp TYPE lty_zaircra_comp.

  PROTECTED SECTION.
  PRIVATE SECTION.

*    DATA lt_zaircra_comp TYPE TABLE OF zaircra_comp.

ENDCLASS.

CLASS lcl_insert_zaircra_comp IMPLEMENTATION.

  METHOD get_sample_records.
    DATA: lt_data     TYPE TABLE OF zaircra_comp,
          ls_data     TYPE zaircra_comp,
          lt_types    TYPE TABLE OF char30,
          lt_aircraft TYPE TABLE OF char20,
          lv_idx      TYPE i.

    " Base samples (from your table)
    ls_data-client = sy-mandt.
    ls_data-component_id = 'ENG001'.
    ls_data-ac_type = 'A320'.
    ls_data-component_type = 'Engine'.
    ls_data-used_hours = 15000.
    ls_data-limit_hours = 20000.
    ls_data-install_date = sy-datum - 5000.
    ls_data-hour_unit = 'HR'.
    APPEND ls_data TO lt_data.

    ls_data-component_id = 'ENG002'.
    ls_data-ac_type = 'A320'.
    ls_data-component_type = 'Engine'.
    ls_data-used_hours = 19000.
    ls_data-limit_hours = 20000.
    ls_data-install_date = sy-datum - 4000.
    ls_data-hour_unit = 'HR'.
    APPEND ls_data TO lt_data.

    ls_data-component_id = 'ENG003'.
    ls_data-ac_type = 'B737'.
    ls_data-component_type = 'Engine'.
    ls_data-used_hours = 20500.
    ls_data-limit_hours = 20000.
    ls_data-install_date = sy-datum - 4100.
    ls_data-hour_unit = 'HR'.
    APPEND ls_data TO lt_data.

    ls_data-component_id = 'BRK001'.
    ls_data-ac_type = 'B787'.
    ls_data-component_type = 'Brake'.
    ls_data-used_hours = 3000.
    ls_data-limit_hours = 5000.
    ls_data-install_date = sy-datum - 3500.
    ls_data-hour_unit = 'HR'.
    APPEND ls_data TO lt_data.

    " Add more data programmatically
    lt_types = VALUE #( ( 'Engine' ) ( 'Gearbox' ) ( 'Brake' ) ).
    lt_aircraft = VALUE #( ( 'A320' ) ( 'B737' ) ( 'B787' ) ( 'A380' ) ).

    DO 16 TIMES.
      CLEAR ls_data.
      ls_data-client = sy-mandt.
      ls_data-component_id = |CMP{ sy-index + 100 }|.
      READ TABLE lt_aircraft INDEX ( ( sy-index MOD lines( lt_aircraft ) ) + 1 ) INTO ls_data-ac_type.
      READ TABLE lt_types INDEX ( ( sy-index MOD lines( lt_types ) ) + 1 ) INTO ls_data-component_type.
      ls_data-used_hours = 1000 * sy-index + 100 * ( sy-index MOD 7 ).
      ls_data-limit_hours = 12000 + 5000 * ( sy-index MOD 4 ).
      ls_data-install_date = sy-datum - ( 3000 + sy-index * 10 ).
      ls_data-hour_unit = 'HR'.

      APPEND ls_data TO lt_data.
    ENDDO.

*    lt_zaircra_comp = lt_data.

    ct_zaircra_comp = lt_data.

  ENDMETHOD.

*  METHOD insert_samples.
*    DATA(lt_samples) = lt_zaircra_comp.
*
*    " Remove existing dummy data (optional, based on your environment)
**   DELETE FROM zaircra_comp WHERE component_id LIKE 'CMP%'.
*
*    LOOP AT lt_samples ASSIGNING FIELD-SYMBOL(<ls_data>).
*      INSERT zaircra_comp FROM @<ls_data>.
*      IF sy-subrc = 0.
*
*        "Both WRITE & MESSAGE statements are not allowed in this ABAP version
*
**        WRITE: / 'Inserted:', <ls_data>-component_id, <ls_data>-ac_type, <ls_data>-used_hours.
**        MESSAGE |Inserted: | && <ls_data>-component_id && |,| && <ls_data>-ac_type && |,| && <ls_data>-used_hours TYPE 'S'.
*      ELSE.
**        WRITE: / 'Could not insert:', <ls_data>-component_id.
*      ENDIF.
*    ENDLOOP.
*
*  ENDMETHOD.

ENDCLASS.
