CLASS zcl_6440_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_6440_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : number1 TYPE i,
           number2 TYPE i.

    DATA : result_num TYPE p LENGTH 8 DECIMALS 2.

    number1 = -8.
    number2 = 3.

    DATA(result) = number1 / number2.

    DATA(output) = |{ number1 } / { number2 } = { result }|.

    out->write( output ).

    result_num = number1 / number2.

    DATA(output_num) = |{ number1 } / { number2 } = { result_num }|.

    out->write( output_num ).

  ENDMETHOD.
ENDCLASS.
