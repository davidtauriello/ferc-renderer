###-----------------------------------------------------------------------------------------------------------------------------------------------------------------
# COMPILE RULES
###-----------------------------------------------------------------------------------------------------------------------------------------------------------------

#COMPILE RULES ---

python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-compile ../Form1/source/ --xule-rule-set ../ValidationRuleset_Form1.zip --xule-crash  --xule-stack-size=20 --xule-compile-workers=0

python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-compile ../Form2/source/ --xule-rule-set ../ValidationRuleset_Form2.zip --xule-crash  --xule-stack-size=20 --xule-compile-workers=0

python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-compile ../Form6/source/ --xule-rule-set ../ValidationRuleset_Form6.zip --xule-crash  --xule-stack-size=20 --xule-compile-workers=0

python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-compile ../Form60/source/ --xule-rule-set ../ValidationRuleset_Form60.zip --xule-crash  --xule-stack-size=20 --xule-compile-workers=0

python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-compile ../Form714/source/ --xule-rule-set ../ValidationRuleset_Form714.zip --xule-crash  --xule-stack-size=20 --xule-compile-workers=0