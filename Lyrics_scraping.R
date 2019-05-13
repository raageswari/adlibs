install.packages("genius")
install.packages("tidyverse")
library(genius)
library(tidyverse)

#2019 
a2019 <- genius_lyrics(artist = "Drake", song = "Gods Plan")
b2019 <- genius_lyrics(artist = "Bruno Mars", song = "Finesse")
c2019 <- genius_lyrics(artist = "Post Malone", song = "Psycho")
d2019 <- genius_lyrics(artist = "BlocBoy JB", song = "Look Alive")
e2019 <- genius_lyrics(artist = "Lil Dicky", song = "Freaky Friday")

tot2019 <- rbind(a2019,b2019,c2019,d2019,e2019)

#2015
a2015 <- genius_lyrics(artist ="Rihanna" , song = "FourFiveSeconds")
b2015 <- genius_lyrics(artist ="The Weeknd" , song = "Earned It")
c2015 <- genius_lyrics(artist ="Fetty Wap" , song = "Trap Queen")
d2015 <- genius_lyrics(artist ="Flo Rida" , song = "GDFR")
e2015 <- genius_lyrics(artist ="Nicki Minaj" , song = "Truffle Butter")

tot2015 <- rbind(a2015,b2015,c2015,d2015,e2015)

#2011
a2011 <- genius_lyrics(artist="Chris Brown", song="Look At Me Now")
b2011 <- genius_lyrics(artist="Nicki Minaj", song="Moment 4 Life")
c2011 <- genius_lyrics(artist="Trey Songz", song="Love Faces")
d2011 <- genius_lyrics(artist="Lil Wayne", song="6 Foot 7 Foot")
e2011 <- genius_lyrics(artist="Kanye West", song="All Of The Lights")

tot2011 <- rbind(a2011, b2011, c2011, d2011, e2011)

#2007
a2007 <- genius_lyrics(artist="Robin Thicke", song="Lost Without U")
b2007 <- genius_lyrics(artist="Musiq Soulchild", song="Buddy")
c2007 <- genius_lyrics(artist="R Kelly", song="Im A Flirt")
d2007 <- genius_lyrics(artist="Mims", song="This Is Why Im Hot")
e2007 <- genius_lyrics(artist="Lloyd", song="You")

tot2007 <- rbind(a2007, b2007, c2007, d2007, e2007)

#2003
a2003 <- genius_lyrics(artist="50 Cent", song="In Da Club")
b2003 <- genius_lyrics(artist="R Kelly", song="Ignition")
c2003 <- genius_lyrics(artist="JAY Z", song="Excuse Me Miss")
d2003 <- genius_lyrics(artist="Snoop Dogg", song="Beautiful")
e2003 <- genius_lyrics(artist="Tyrese", song="How You Gonna Act Like That")

tot2003 <- rbind(a2003, b2003, c2003, d2003, e2003)

#1999
a1999 <- genius_lyrics(artist="Busta Rhymes", song="Whats It Gonna Be")
b1999 <- genius_lyrics(artist="Whitney Houston", song="Heartbreak Hotel")
c1999 <- genius_lyrics(artist="Faith Evans", song="All Night Long")
d1999 <- genius_lyrics(artist="Silk", song="If You (Lovin Me)")
e1999 <- genius_lyrics(artist="Shanice", song="When I Close My Eyes")

tot1999 <- rbind(a1999, b1999, c1999, d1999, e1999)

#1995
a1995 <- genius_lyrics(artist="Montell Jordan", song="This Is How We Do It")
b1995 <- genius_lyrics(artist="Adina Howard", song="Freak Like Me")
c1995 <- genius_lyrics(artist="Brandy", song="Baby")
d1995 <- genius_lyrics(artist="Soul For Real", song="Candy Rain")
e1995 <- genius_lyrics(artist="TLC", song="Red Light Special")

tot1995 <- rbind(a1995, b1995, c1995, d1995, e1995)

#1991
a1991 <- genius_lyrics(artist="Freddie Jackson", song="Do Me Again")
b1991 <- genius_lyrics(artist="Johnny Gill", song="Wrap My Body Tight")
c1991 <- genius_lyrics(artist="Guy", song="Lets Chill")
d1991 <- genius_lyrics(artist="Hi Five", song="I Like The Way (The Kissing Game)")
e1991 <- genius_lyrics(artist="Ralph Tresvant", song="Stone Cold Gentleman")

tot1991 <- rbind(a1991, b1991, c1991, d1991, e1991)

#1987

a1987 <- genius_lyrics(artist="Jody Watley", song="Looking For A New Love")
b1987 <- genius_lyrics(artist="Club Nouveau", song="Lean On Me")
c1987 <- genius_lyrics(artist="Prince", song="Sign O The Times")
d1987 <- genius_lyrics(artist="Kool & The Gang", song="Stone Love")
e1987 <- genius_lyrics(artist="Herb Alpert", song="Keep Your Eye On Me")

tot1987 <- rbind(a1987, b1987, c1987, d1987, e1987)

#1983
a1983 <- genius_lyrics(artist="Michael Jackson", song="Billie Jean")
b1983 <- genius_lyrics(artist="Lionel Richie", song="You Are")
c1983 <- genius_lyrics(artist="George Clinton", song="Atomic Dog")
d1983 <- genius_lyrics(artist="Debarge", song="I Like It")
e1983 <- genius_lyrics(artist="Angela Bofill", song="Too Tough")

tot1983 <- rbind(a1983, b1983, c1983, d1983, e1983)

#1979
a1979 <- genius_lyrics(artist="Instant Funk", song="I Got My Mind Made Up")
b1979 <- genius_lyrics(artist="Sister Sledge", song="Hes the Greatest Dancer")
c1979 <- genius_lyrics(artist="The Jacksons", song="Shake Your Body (Down To The Ground")
d1979 <- genius_lyrics(artist="GQ", song="Disco Nights")
e1979 <- genius_lyrics(artist="Chic", song="I Want Your Love")

tot1979 <- rbind(a1979, b1979, c1979, d1979, e1979)

write.csv(tot2019, file = "tot2019.csv")
write.csv(tot2015, file = "tot2015.csv")
write.csv(tot2011, file = "tot2011.csv")
write.csv(tot2007, file = "tot2007.csv")
write.csv(tot2003, file = "tot2003.csv")
write.csv(tot1999, file = "tot1999.csv")
write.csv(tot1995, file = "tot1995.csv")
write.csv(tot1991, file = "tot1991.csv")
write.csv(tot1987, file = "tot1987.csv")
write.csv(tot1983, file = "tot1983.csv")
write.csv(tot1979, file = "tot1979.csv")