//Qué líneas del siguiente código provocan conversiones boxing y unboxing.

    char c1 = 'A';
    string st1 = "A";
    object o1 = c1;     //BOXING
    object o2 = st1;
    char c2 = (char)o1;     //UNBOXING
    string st2 = (string)o2;

    