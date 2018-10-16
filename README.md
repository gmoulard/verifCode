
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
  1 2.5 file.spurious        :<
  5 2.1 file.cols >80        :aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaax<
  8 2.7 file.trailing        :    <
 10 2.2 file.indentation     :  <
 12 2.7 file.trailing        :2.7 KO  <
 16 2.7 file.trailing        :    //comment <
 19 5.1 cpp.mark             :    #endif<
 18 5.2 cpp.if COMMENT       :#else<
 19 5.2 cpp.if COMMENT       :    #endif<
 20 7.16 exp.nopadding -> NUL:head -> next = NULL;<
 24 5.1 cpp.mark             :  #include "my_read_iso.h"<
 24 6.4 braces.indent        :  #include "my_read_iso.h"<
 48 2.7 file.trailing        :int print _info (void *p , char* guigui) <
 48 7.2 decl.point * MUST NEX:int print _info (void *p , char* guigui) <
 48 7.12 keyword SPACE AFTER :int print _info (void *p , char* guigui) <
 48 7.19 exp.args            :int print _info (void *p , char* guigui) <
 52 7.18 exp.parentheses     :    printf( "System Identifier: %.*s\n", ISO_SYSIDF_LEN,iso->syidf);<
 53 7.18 exp.parentheses     :    printf("Volume Identifier: %.*s\n", ISO_VOLIDF_LEN,iso->vol_idf );<
 70 6.4 braces.indent        :   return code;<
121 6.2 braces.close         :intmain(intargc,char*argv[]){<
121 6.3 braces.open          :int main(int argc, char *argv[]){<
134 7.19 exp.args            :            printf ("> ");<
137 7.12 keyword SPACE AFTER :            return0;<
138 7.8 semicolon NO SPACE BE:        res = parse_responce(arg, e iso) ;<
139 7.7 comma SPACE AFTER, CO:        res = parse_responce(arg,e iso);<
147 2.7 file.trailing        :char[AZEDSQzae] toto    <
nbPbs:  26





``` 
