;1)
;DIRECCIÓN  |  REGISTRO  |  FUNCION                          |  VALOR DE EJEMPLO
;20H        |  EOI       |  END OF INSTRUCTION               |  NO APLICA  
;21H        |  IMR       |  Hab. y deshab. interrupciones    |  1111  1101  (4 bits menos sign)
;22H        |  IRR       |  Indica cuales soli. interrumpir  |  0000  0011
;23H        |  ISR       |  Indica cual esta siendo atendido |  0000  0100
;24H        |  INT0      |  F10                              |  15
;25H        |  INT1      |  TIMER                            |  10
;26H        |  INT2      |  HANDSHAKE                        |  25
   
    ORG 2000H
    INT 0
    END