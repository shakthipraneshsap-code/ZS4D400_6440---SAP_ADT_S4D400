*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_aircra_acft_sample_data DEFINITION.

  PUBLIC SECTION.

    METHODS insert_sample_data.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_aircra_acft_sample_data IMPLEMENTATION.

  METHOD insert_sample_data.

    DATA lt_acft TYPE TABLE OF zaircra_acft.
    DATA ls_acft TYPE zaircra_acft.

    " Sample record 1
    ls_acft-client = sy-mandt.
    ls_acft-ac_type = 'A320'.
    ls_acft-ac_name = 'Airbus A320'.
    ls_acft-manufacturer = 'Airbus'.
    ls_acft-max_seats = 180.
    APPEND ls_acft TO lt_acft.

    " Sample record 2
    ls_acft-ac_type = 'A350'.
    ls_acft-ac_name = 'Airbus A350'.
    ls_acft-manufacturer = 'Airbus'.
    ls_acft-max_seats = 300.
    APPEND ls_acft TO lt_acft.

    " Sample record 3
    ls_acft-ac_type = 'B737'.
    ls_acft-ac_name = 'Boeing 737'.
    ls_acft-manufacturer = 'Boeing'.
    ls_acft-max_seats = 189.
    APPEND ls_acft TO lt_acft.

    " Sample record 4
    ls_acft-ac_type = 'B787'.
    ls_acft-ac_name = 'Boeing 787 Dreamliner'.
    ls_acft-manufacturer = 'Boeing'.
    ls_acft-max_seats = 242.
    APPEND ls_acft TO lt_acft.

    " Additional record 1
    ls_acft-ac_type = 'E190'.
    ls_acft-ac_name = 'Embraer 190'.
    ls_acft-manufacturer = 'Embraer'.
    ls_acft-max_seats = 100.
    APPEND ls_acft TO lt_acft.

    " Additional record 2
    ls_acft-ac_type = 'A220'.
    ls_acft-ac_name = 'Airbus A220'.
    ls_acft-manufacturer = 'Airbus'.
    ls_acft-max_seats = 135.
    APPEND ls_acft TO lt_acft.

    " Insert records (avoiding duplicates)
    LOOP AT lt_acft ASSIGNING FIELD-SYMBOL(<acft>).
      INSERT zaircra_acft FROM @<acft>.
      IF sy-subrc <> 0.
        " Handle duplicate or error if needed
        CONTINUE.
      ENDIF.
    ENDLOOP.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
