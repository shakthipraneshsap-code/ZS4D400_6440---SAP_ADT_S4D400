CLASS lhc_ZI_AIRCRA_WORKORDER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_aircra_workorder RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_aircra_workorder RESULT result.

    METHODS SetDefaultValues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_aircra_workorder~SetDefaultValues.

    METHODS Approve FOR MODIFY
      IMPORTING keys FOR ACTION zi_aircra_workorder~Approve RESULT result.
    METHODS Complete FOR MODIFY
      IMPORTING keys FOR ACTION zi_aircra_workorder~Complete RESULT result.
    METHODS ValidateEstimateCost FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_aircra_workorder~ValidateEstimateCost.

ENDCLASS.

CLASS lhc_ZI_AIRCRA_WORKORDER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD SetDefaultValues.

    READ ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_workorders).

    LOOP AT lt_workorders ASSIGNING FIELD-SYMBOL(<fs_workorders>).

      <fs_workorders>-workorder_uuid = cl_system_uuid=>create_uuid_x16_static(  ).

      <fs_workorders>-status = 'NEW'.

      <fs_workorders>-created_by = sy-uname.

      GET TIME STAMP FIELD DATA(lv_timestamp).

      <fs_workorders>-created_at = lv_timestamp.

      <fs_workorders>-last_changed_by = sy-uname.

      GET TIME STAMP FIELD DATA(lv_timestamp_2).

      <fs_workorders>-last_changed_at = lv_timestamp_2.

    ENDLOOP.

    MODIFY ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    UPDATE FIELDS
    ( workorder_uuid
      status
      created_by
      created_at
      last_changed_by
      last_changed_at )
    WITH CORRESPONDING #( lt_workorders ).

  ENDMETHOD.

  METHOD Approve.

    READ ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_workorders).


    LOOP AT lt_workorders ASSIGNING FIELD-SYMBOL(<fs_workorders>).

      <fs_workorders>-status = zif_aircra_constants=>gc_status_approved.

    ENDLOOP.


    MODIFY ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    UPDATE FIELDS
    ( status )
    WITH CORRESPONDING #( lt_workorders ).


    READ ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).


    result = VALUE #( FOR ls_workorder IN lt_result
                      ( %tky   = ls_workorder-%tky
                        %param = ls_workorder ) ).

  ENDMETHOD.

  METHOD Complete.

    READ ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_workorders).


    LOOP AT lt_workorders ASSIGNING FIELD-SYMBOL(<fs_workorders>).

      <fs_workorders>-status = zif_aircra_constants=>gc_status_completed.

    ENDLOOP.


    MODIFY ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    UPDATE FIELDS
    ( status )
    WITH CORRESPONDING #( lt_workorders ).


    READ ENTITIES OF zi_aircra_workorder IN LOCAL MODE
    ENTITY zi_aircra_workorder
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).


    result = VALUE #( FOR ls_workorder IN lt_result
                      ( %tky   = ls_workorder-%tky
                        %param = ls_workorder ) ).

  ENDMETHOD.

  METHOD ValidateEstimateCost.
  ENDMETHOD.

ENDCLASS.
