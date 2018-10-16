
#VerifCode

appel sur une directory
#!/bin/bash
for i in ../.../moular_b-myfind/src/*
do
      awk -f verifCode.awk $i
done




exemple d'usage : 
```
$ awk -f verifCode.awk monfichier.c
report verif code :  monfichier.c
  1 2.5 BEGIN LINE EMPTY     :<
  5 2.1 LG>80                :aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaax<
  8 2.7 ESPACE END LINE      :    <
 10 2.2 TAB                  :  <
 12 2.7 ESPACE END LINE      :2.7 KO  <
 16 2.7 ESPACE END LINE      ://comment <
 19 5.1 #PREPROC START #     :    #endif<
 18 5.2 #PREPROC else COMMENT:#else<
 19 5.2 #PREPROC else COMMENT:    #endif<
 22 5.1 #PREPROC START #     :  #include "my_read_iso.h"<
 22 6.4 INDENT 4 MULTIPLE    :  #include "my_read_iso.h"<
 46 2.7 ESPACE END LINE      :int print_info(void *p) <
 47 6.3 BRACE START BAD COLUM:    {<
 67 6.4 INDENT 4 MULTIPLE    :   fprintf(stderr, "%s\n", msg);<
 68 6.4 INDENT 4 MULTIPLE    :   return code;<
 73 6.4 INDENT 4 MULTIPLE    :   fprintf(stderr, "my_read_iso: %s: unknown command\n", msg);<
 74 6.4 INDENT 4 MULTIPLE    :   return code;<
118 6.2 BRACE OWN LINE       :intmain(intargc,char*argv[]){<
118 6.3 BRACE START BAD COLUM:int main(int argc, char *argv[]){<
139 6.4 INDENT 4 MULTIPLE    :     return 0;<
142 2.5-END LINE EMPTY       :<
nbPbs:  21


``` 
