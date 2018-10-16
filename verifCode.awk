BEGIN {
    #       lstType (char, signed char, unsigned char, short, short int, signed short, signed short int, unsigned short, unsigned short int, int, signed, signed int, unsigned, unsigned int, long, long int, signed long, signed long int, unsigned long, unsigned long int, long long, long long int, signed long long, signed long long int, unsigned long long, unsigned long long int, float, double, long double )
    lstType ["char", "signed" , "unsigned" , "short", "int", "long", "float", "double", "struct" ,"size_t"];
    lst0706 = "char|signed|unsigned|short|int|long|float|double|struct|size_t";
    lst0501 = "if|else|endif|include|define|error|warning|pragma|undef";
    lst0702 = "char[*]|signed[*]|unsigned[*]|short[*]|int[*]|long[*]|float[*]|double[*]|struct[*]|size_t[*]";
    lst0712 = " alignas[^ ]| alignof[^ ]| and[^ ]| and_eq[^ ]| asm[^ ]| auto[^ ]| bitand[^ ]| bitor[^ ]| bool[^ ]| break[^ ]| case[^ ]| catch[^ ]| char[^ ]| char16_t[^ ]| char32_t[^ ]| class[^ ]| compl[^ ]| const[^ ]| constexpr[^ ]| const_cast[^ ]| continue[^ ]| decltype[^ ]| default[^ ]| delete[^ ]| do[^ ]| double[^ ]| dynamic_cast[^ ]| else[^ ]| enum[^ ]| explicit[^ ]| export[^ ]| extern[^ ]| false[^ ]| float[^ ]| for[^ ]| friend[^ ]| goto[^ ]| if[^ ]| inline[^ ]| int[^ ]| long[^ ]| mutable[^ ]| namespace[^ ]| new[^ ]| noexcept[^ ]| not[^ ]| not_eq[^ ]| nullptr[^ ]| operator[^ ]| or[^ ]| or_eq[^ ]| private[^ ]| protected[^ ]| public[^ ]| register[^ ]| reinterpret_cast[^ ]| return[^ ]| short[^ ]| signed[^ ]| static[^ ]| static_assert[^ ]| static_cast[^ ]| struct[^ ]| switch[^ ]| template[^ ]| this[^ ]| thread_local[^ ]| throw[^ ]| true[^ ]| try[^ ]| typedef[^ ]| typeid[^ ]| typename[^ ]| union[^ ]| unsigned[^ ]| using[^ ]| virtual[^ ]| void[^ ]| volatile[^ ]| wchar_t[^ ]| while[^ ]| xor[^ ]| xor_eq[^ ]";
    lst0719 = " alignas[ ]| alignof[ ]| and[ ]| and_eq[ ]| asm[ ]| auto[ ]| bitand[ ]| bitor[ ]| bool[ ]| break[ ]| case[ ]| catch[ ]| char[ ]| char16_t[ ]| char32_t[ ]| class[ ]| compl[ ]| const[ ]| constexpr[ ]| const_cast[ ]| continue[ ]| decltype[ ]| default[ ]| delete[ ]| do[ ]| double[ ]| dynamic_cast[ ]| else[ ]| enum[ ]| explicit[ ]| export[ ]| extern[ ]| false[ ]| float[ ]| for[ ]| friend[ ]| goto[ ]| if[ ]| inline[ ]| int[ ]| long[ ]| mutable[ ]| namespace[ ]| new[ ]| noexcept[ ]| not[ ]| not_eq[ ]| nullptr[ ]| operator[ ]| or[ ]| or_eq[ ]| private[ ]| protected[ ]| public[ ]| register[ ]| reinterpret_cast[ ]| return[ ]| short[ ]| signed[ ]| static[ ]| static_assert[ ]| static_cast[ ]| struct[ ]| switch[ ]| template[ ]| this[ ]| thread_local[ ]| throw[ ]| true[ ]| try[ ]| typedef[ ]| typeid[ ]| typename[ ]| union[ ]| unsigned[ ]| using[ ]| virtual[ ]| void[ ]| volatile[ ]| wchar_t[ ]| while[ ]| xor[ ]| xor_eq";

    print "report verif code : ", ARGV[1]
    nbPbs=0;
}

function reportBug (typeError, linNum, ligne) {
        printf ("%3i %.*s:%s<\n",linNum, 25,typeError "                                                 ", ligne)
        nbPbs=nbPbs+1;
}

{
    tmp=$0
    start=match($0, "[a-zA-Z0-9/#{}]") - 1

    if (length($0) >= 80)
        reportBug("2.1 file.cols >80", NR, $0)

    if (index($0, "\t") > 0)
        reportBug("2.2 file.indentation", NR, $0)

    if ((! match($0, "[a-zA-Z0-9}]+")) && (NR == 1))
        reportBug("2.5 file.spurious", NR, $0)

    if ( match($0, " $"))
        reportBug("2.7 file.trailing", NR, $0)


    if ( match($0, "#") && match($0, lst0501) && !match($0, "^#") )
        reportBug("5.1 cpp.mark", NR, $0)

    if ( match(memoLigne, "#") && match(memoLigne, "else|endif") )
        if ( !match($0, "//"))
            reportBug("5.2 cpp.if COMMENT", NR-1, memoLigne)

    if ( match(tmp, "{|}")){
            gsub(/ /,"",tmp)
            if (length(tmp) > 1)
                    reportBug("6.2 braces.close", NR, tmp )
    }

    if ( match($0, "[{]") )
            if (match($0, "{") != match (memoLigne, "[a-zA-Z0-9}]")){
                    reportBug("6.3 braces.open", NR, $0 )
                            }

    if ( int(start/4) != (start/4) && start != -1)
        reportBug("6.4 braces.indent", NR, $0 )


    if ( match ($0, lst0702))
        reportBug("7.2 decl.point * MUST NEXT VARIABLE", NR, $0 )

# 7.4

    if (match($0, lst0712) && match($0, "[^[A-Z0-9]]"))
        reportBug("7.6 decl.vla ONLY CONSTANTE", NR, $0 )

    if (match($0, ",") && !match($0, ",[ ]"))
        reportBug("7.7 comma SPACE AFTER, COMMA", NR, $0 )

    if (match($0, "[ ][;]"))
        reportBug("7.8 semicolon NO SPACE BEFORT;", NR, $0 )

    if (match($0, lst0712))
        reportBug("7.12 keyword SPACE AFTER KEYWORDS", NR, $0  )

    if (match($0, "(->)") && match($0, "(NULL)"))
        reportBug("7.16 exp.nopadding -> NULL", NR, $0 )

    if (match($0, "[ ][)]") || match($0, "[(][ ]"))
        reportBug("7.18 exp.parentheses", NR, $0 )

    if ( match($0, "[ ][(]") && !match($0,lst0719)) 
            reportBug("7.19 exp.args", NR, $0  )

    if ( match(memoLigne, "if |else|{") && !match($0,"{") ) 
        if ( start != memoStart + 4 || ( match($0,"}") && start = memoStart - 4  ))
            reportBug("7.21 ctrl.indentation", NR, $0 )

    memoLigne=$0
    memoStart=start
}


END {
        if (! match($0, "[a-zA-Z0-9}]+"))
                reportBug("2.5-END LINE EMPTY", NR, $0)

        print "nbPbs: ", nbPbs
}
