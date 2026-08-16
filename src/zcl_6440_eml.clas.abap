CLASS zcl_6440_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_6440_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

    " Updated existing record of the entity, ID = '070045' - Successful but not fulfilled PRG purpose
*    agencies_upd = VALUE #( ( AgencyID = '070045' name = 'Shakthi Pranesh L - G6440' ) ).

    " Does not inserted new record for my ID = '070064' - Not Successful
    agencies_upd = VALUE #( ( AgencyID = '070064' name = 'Shakthi Pranesh L - G6440' ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP
                ENTITY /DMO/Agency
         UPDATE FIELDS ( Name )
                  WITH agencies_upd.
*    IF sy-subrc = 0.

    COMMIT ENTITIES.

    out->write( 'Method Execution Finished! - Entity Updated Successfully' ).

*    ELSE.

*      ROLLBACK ENTITIES.

*    ENDIF.

  ENDMETHOD.
ENDCLASS.
