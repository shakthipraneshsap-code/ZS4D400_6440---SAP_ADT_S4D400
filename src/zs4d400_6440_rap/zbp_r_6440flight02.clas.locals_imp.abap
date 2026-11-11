CLASS lhc_zr_6440flight02 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight02
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
       keys FOR Flight02~validatePrice.
ENDCLASS.

CLASS lhc_zr_6440flight02 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD validatePrice.

    DATA failed_record   LIKE LINE OF failed-flight02.
    DATA reported_record LIKE LINE OF reported-flight02.

    READ ENTITIES OF zr_6440flight02 IN LOCAL MODE
      ENTITY Flight02
        FIELDS ( Price )
        WITH CORRESPONDING #(  keys )
        RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      IF flight-price <= 0.

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight02.

        reported_record-%tky = flight-%tky.
        reported_record-%msg = new_message(
                          id       = '/LRN/S4D400'
                          number   = '101'
                          severity = ms-error ).
        APPEND reported_record TO reported-flight02.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
