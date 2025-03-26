//¿Qué diferencias existen entre las conversiones de tipo implícitas y explícitas?
//Las conversiones implicitas son aquellas que se realizan de forma automatica, por ejemplo, pasar de un int a un float.
//Las conversiones explicitas son aquellas en donde debemos especificar en el codigo que somos concientes que podemos perder datos, por ejemplo, de un int a un short (CASTEANDO).

byte b = 10;
 double x = 12.25;
 int i = b;
 double y = i;
 short j = (short)i;    //DE UN INT A UN SHORT CASTEANDO
 i = (int)x;
