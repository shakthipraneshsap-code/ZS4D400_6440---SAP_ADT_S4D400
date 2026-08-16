CLASS zcl_6440_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_6440_INSTANCES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    connection = NEW #(  ).

    connection->carrier_id    = 'LH'.
    connection->connection_id = '0400'.

    APPEND connection TO connections.

    connection = NEW #(  ).

    connection->carrier_id    = 'BA'.
    connection->connection_id = '0064'.

    APPEND connection TO connections.

    connection = NEW #(  ).

    connection->carrier_id    = 'UA'.
    connection->connection_id = '093'.

    APPEND connection TO connections.



  ENDMETHOD.
ENDCLASS.
