CLASS lhc_zr_6440flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR flight~validatePrice.
ENDCLASS.

CLASS lhc_zr_6440flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validatePrice.

    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

    READ ENTITIES OF ZR_6440Flight IN LOCAL MODE
              ENTITY Flight
              FIELDS ( price )
  WITH CORRESPONDING #( keys )
              RESULT DATA(flights).

    IF flights IS NOT INITIAL.

      LOOP AT flights INTO DATA(flight).

        IF flight-Price <= 0.

          failed_record-%tky = flight-%tky.
          APPEND failed_record TO failed-flight.

          reported_record-%tky = flight-%tky.
          reported_record-%msg = new_message(
                                 id       = '/LRN/S4D400'
                                 number   = '101'
                                 severity = ms-error ).

          APPEND reported_record TO reported-flight.

        ENDIF.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
