  ORG 1000H
A DB "HO LA"
B DB ?
  ORG 2000H
  mov bx, offset A
  mov B, offset B - offset a  ;calculo cant caracteres
  mov al, B  ;envío cant caracteres del string
  int 7
  HLT  ;detiene el programa
END
