;1)
;DISPOS.          |    IMR    |  INT 0  |  INT 1  |  INT 2  |  DIR.VEC.
;F10              | 1111 1110 |  5      |  N/I    |  N/I    |  20
;F10              | 1111 1110 |  8      |  N/I    |  N/I    |  32
;TIMER            | 1111 1101 |  N/I    |  10     |  N/I    |  40
;HAND             | 1111 1011 |  N/I    |  N/I    |  10     |  40
;N/I              | 1111 1111 |  N/I    |  N/I    |  N/I    |  N/I
;F10 Y TIMER      | 1111 1100 |  10     |  20     |  N/I    |  40 Y 80
;TIMER Y HAND     | 1111 1001 |  N/I    |  4      |  8      |  16 Y 32
;F10, TIMER, HAND | 1111 1000 |  5      |  10     |  15     |  20, 40 Y 60

;N/I====NO IMPORTA
;DIR.VEC= 4 * INT1/INT2/INT3

    ORG 2000H
    INT 0
    END