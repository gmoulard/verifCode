
#VerifCode


exemple d'usage : 
```
$ awk -f verifCode.awk monfichier.c
report verif code :  monfichier.c
  1 2.5-BEGIN LINE EMPTY20:
  5 2.1-lg>8020: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaax
  8 2.7-ESPACE END LINE20:     <
 10 2.2-TAB20:
 12 2.7-ESPACE END LINE20: 2.7 KO  <
 16 2.7-ESPACE END LINE20: //comment <
 19 5.1 #PreProc start #20:     #endif
 18 5.2 #PreProc else endif alwas comment20: #else
 19 5.2 #PreProc else endif alwas comment20:     #endif
 22 5.1 #PreProc start #20:   #include "my_read_iso.h"
 46 2.7-ESPACE END LINE20: int print_info(void *p) <
 47 6.3-BRACE START BAD COLUMN20:     {
118 6.2-BRACE OWN LINE20: intmain(intargc,char*argv[]){
118 6.3-BRACE START BAD COLUMN20: int main(int argc, char *argv[]){
142 2.5-END LINE EMPTY20:
nbPbs:  15

``` 
