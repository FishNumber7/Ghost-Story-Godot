{"inkVersion":21,"root":[["^You stand out in the cold, in the dark. There's something uneasy in the air.","\n","^You've been here before, you know it.","\n","^You look out into the endless darkness, lost, alone. ","#","^video ","/#","#","^darkness","/#","\n","^The letter burns ice cold in your pocket.","\n",["ev",{"^->":"0.14.$r1"},{"temp=":"$r"},"str",{"->":".^.s"},[{"#n":"$r1"}],"/str","/ev",{"*":"0.c-0","flg":18},{"s":["^Read it",{"->":"$r","var":true},null]}],["ev",{"^->":"0.15.$r1"},{"temp=":"$r"},"str",{"->":".^.s"},[{"#n":"$r1"}],"/str","/ev",{"*":"0.c-1","flg":18},{"s":["^Ignore it",{"->":"$r","var":true},null]}],{"c-0":["ev",{"^->":"0.c-0.$r2"},"/ev",{"temp=":"$r"},{"->":"0.14.s"},[{"#n":"$r2"}],"\n","^You take out the crumpled piece of paper, and gently unfold it. ","#","^letter","/#","\n",{"->":"0.g-0"},{"#f":5}],"c-1":["ev",{"^->":"0.c-1.$r2"},"/ev",{"temp=":"$r"},{"->":"0.15.s"},[{"#n":"$r2"}],"\n","^The darkness streches on.","\n",{"->":"0.g-0"},{"#f":5}],"g-0":["^Out of the corner of your eye, you notice a figure in the darkness.","\n","^Someone is standing there... someone familiar ","#","^video ","/#","#","^emily","/#","\n","^The dark figure is known to you, and yet wholly unknown.","\n","^Your mind reels. ","#","^extro","/#","\n","end",["done",{"#f":5,"#n":"g-1"}],{"#f":5}]}],"done",{"#f":1}],"listDefs":{}}