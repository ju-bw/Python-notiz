# Python - Notiz

% ju -- https://bw1.eu -- 8-Okt-18  -- Python-Notiz.md

## Kommentar

~~~
  # Kommentar einzeilig
  '''
    Kommentar
    mehrzeilig
  '''
~~~


## Funktion

Standardfunktionen <https://docs.python.org/3/library/functions.html>

**Separator bei print()**

~~~
  # Separator bei print()
  print(name, vorname, alter, sep="-")
  print(name, vorname, alter, sep="")
  print(name, vorname, alter)
~~~

**Ausgabe**

~~~
  # Separator bei print()
  Meier-Hans-42
  MeierHans42
  Meier Hans 42
~~~

**input()-Funktion**

~~~
  # input()-Funktion
  var = input("Eingabe Text: ")
  print(var)
~~~

**Mathematische Umwandlungen**

~~~
  # Mathematische Umwandlungen
  zahl1 = int(input("Eingabe Zahl1: "))
  zahl2 = int(input("Eingabe Zahl2: "))
  summe = zahl1 + zahl2
  print(summe)
~~~

**Module**

<https://docs.python.org/3/library/index.html>

~~~
  # Module
  from tkinter import *
  master=Tk()
  master.mainloop()
~~~

## Art der Information

**Datentypen**

~~~
  # Datentypen
  var1 = None # erst initialisierung
  print(var1)
  var1 = "Text"
  print(var1)
  var2 = True
  var3 = False
  print(var2)
  print(var2 + 1)
  var4 = 1
  var5 = 1.1e3
  print(var4)
  print(var5)
  var6 = 1 + 4j # komplexe Zahl
  var7 = "Text\n"
  var8 = 'Text'
  print(var6, var7, var8)
~~~

**Ausgabe**

~~~
  # Datentypen
  None
  Text
  True
  2
  1
  1100.0
  (1+4j) Text
  Text
~~~


**Datentyp bestimmen und umwandeln**

~~~
  # Datentyp bestimmen und umwandeln
  var1 = 7
  var2 = "3" # Text!
  print(type(var1))
  print(type(var2))
  print(type(float(var1)))
  print(var1 + int(var2))
  print(str(var1) + var2)
~~~

**Ausgabe**

~~~
  # Datentyp bestimmen und umwandeln
  <class 'int'>
  <class 'str'>
  <class 'float'>
  10
  73
~~~

## Verarbeitung von Daten

**Arithmetische Operatoren**

~~~
  # Arithmetische Operatoren
  a = 17;
  b = 0.3;
  c = 2;
  d = 0.65;
  print("1 * 1 = ", 1 * 1);
  print("1 + 1 = ", 1 + 1);
  print("5 - 1 = ", 5 - 1);

  print("4 / 2 = ", 4 / 2);
  print("5 / 2 = ", 5 / 2);

  print("5 / 2 = ", 5 / 2)
  print("5 // 2 = ", 5 // 2)

  print("a % c = ", a % c);
  print("a % b = ", a % b);
  print("a % d = ", a % d);
  print("a ** c = ", a ** c);
  print("a ** b = ", a ** b);
  print("a" + "b");
  print("a + 1.9 = ", a + 1.9);
  print("1 + 3.9 = ", 1 + 3.9);
  print("False + True = ", False + True);
  print("a + True = ", a + True);
~~~

**Ausgabe**

~~~
  # Arithmetische Operatoren
  1 * 1 =  1
  1 + 1 =  2
  5 - 1 =  4
  4 / 2 =  2.0
  5 / 2 =  2.5
  5 / 2 =  2.5
  5 // 2 =  2
  a % c =  1
  a % b =  0.20000000000000062
  a % d =  0.09999999999999942
  a ** c =  289
  a ** b =  2.3395626336814512
  ab
  a + 1.9 =  18.9
  1 + 3.9 =  4.9
  False + True =  1
  a + True =  18
~~~

**Zuweisungsoperatoren**

~~~
  # Zuweisungsoperatoren
  i = 5
  i *= 2 # i = i * 2
  print(i)
  i %= 13
  print(i)
  i **= 2
  print(i)
~~~

**Ausgabe**

~~~
  # Zuweisungsoperatoren
  10
  10
  100
~~~


**Vergleichsoperatoren - Logische Operatoren**

~~~
  # Vergleichsoperatoren - Logische Operatoren
  print((4 + 4 == 8) and (2 + 3 == 5))
  print((4 + 4 == 8) and (1 + 3 == 3))
  print((4 + 4 == 8) or (2 + 3 == 5))
  print((4 + 4 == 7) or (2 + 3 != 5))
  print(not(1 + 4 == 5))
~~~

**Ausgabe**

~~~
  # Vergleichsoperatoren - Logische Operatoren
  True
  False
  True
  False
  False
~~~

**Weitere Operatoren**

~~~
  # Weitere Operatoren
  pattern = "@" # Suche @ Zeichen
  seq1 = "ralph_steyer@gmx.de"
  print(pattern in seq1 )
  print(pattern not in seq1 )
  seq2 = "ralph_steyer@gmx.de"
  print ("seq1 is seq2", seq1 is seq2) # Objekt vergleichen
  print ("seq1 == seq2", seq1 == seq2) # gleich
  z1 = [2, 3, 5]
  z2 = [2, 3, 5]
  print ("z1 is z2", z1 is z2) # Objekt vergleichen
  print ("z1 == z2", z1 == z2) # gleich
~~~

**Ausgabe**

~~~
  # Weitere Operatoren
  True
  False
  seq1 is seq2 True
  seq1 == seq2 True
  z1 is z2 False
  z1 == z2 True
~~~

**Bitoperator**

~~~
  # Bitoperator
  z1 = 2
  a = z1 << 1 
  b = z1 >> 1
  print("Der Wert von 2 << 1: " , a)
  print("Der Wert von 2 >> 1: " , b)
~~~

**Ausgabe**

~~~
  # Bitoperator
  Der Wert von 2 << 1:  4
  Der Wert von 2 >> 1:  1
~~~


## Steuerung des Programmflusses

**Kontrollstrukturen**

~~~
  # Kontrollstrukturen
  a = 1
  if a < 2:
    print("Der Wert von a ist kleiner 2")
~~~

**Ausgabe**

~~~
  # Kontrollstrukturen
  Der Wert von a ist kleiner 2
~~~

**Entscheidungsanweisungen**

~~~
  # Entscheidungsanweisungen
  a = 3
  if a < 2:
    print("Der Wert von a ist kleiner 2")
    print("Auch das wird bedingt ausgefuehrt")
  elif a == 3:
    print("Der Wert ist 3")
  else:
    if(a == 4):
      print("Der Wert ist 4")
  if a > 2: print("Das geht")
  else: print("Alternative")
~~~

**Ausgabe**

~~~
  # Entscheidungsanweisungen
  Der Wert ist 3
  Das geht
~~~

**while-Schleife**

~~~
  # while-Schleife
  i = 0
  while (i < 9):
      i += 1
      print("Wert des Schleifenzaehlers", i)
  print("Schleife beendet")
~~~

**Ausgabe**

~~~
  # while-Schleife
  Wert des Schleifenzaehlers 1
  Wert des Schleifenzaehlers 2
  Wert des Schleifenzaehlers 3
  Wert des Schleifenzaehlers 4
  Wert des Schleifenzaehlers 5
  Wert des Schleifenzaehlers 6
  Wert des Schleifenzaehlers 7
  Wert des Schleifenzaehlers 8
  Wert des Schleifenzaehlers 9
  Schleife beendet
~~~

for-Schleife



Sprunganweisungen




<https://www.linkedin.com/learning/python-lernen/>

