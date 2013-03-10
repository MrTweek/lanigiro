#!/bin/zsh

source config.zsh

python login.py -pass:$PASS -all 2>&1 > /dev/null

#python replace.py -regex '== ?Hitching [Oo]ut ?==' '== Hitchhiking out ==' -lang:en -start:!

for lang (en es fr fi ru de pt bg zh tr nl ro he pl hr) {
    python interwiki.py -autonomous -start:! -same -lang:$lang 2>&1 > /dev/null
    python redirect.py double -always -lang:$lang 2>&1 > /dev/null
#    python fixing_redirects.py -start:! -lang:$lang 2>&1 > /dev/null

#    python weblinkchecker.py -lang:$lang -start:! -talk -repeat 2>&1 > /dev/null
#    python cosmetic_changes.py -lang:$lang -always
#    python standardize_interwiki.py -start:! -lang:$lang
}


