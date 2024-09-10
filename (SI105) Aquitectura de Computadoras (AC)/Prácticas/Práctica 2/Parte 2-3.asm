
          ORG 3400H
FLA_ASC:  IN AL, PA
          AND AL, 0FDH  ;FUERZO STROBE A 0
          OUT PA, AL

          IN AL, PA
          OR AL, 2    ;FUERZO STROBE A 1
          OUT PA, AL  ;envio caracter a la impresora
          RET
