# #!/usr/bin/env python3
# -*- coding: utf-8 -*-
# % ju -- https://bw1.eu -- 8-Okt-18  -- code.py
# Python install: https://www.anaconda.com/download/
#                 https://www.python.org/downloads/windows/
# Script vom Windows-Desktop starten: 
#   Neu\Verknuepfung\
#   python "c:\projekte\python\ralphSteyer-python-lernen\doc\code\code.py"
# python ./code.py
# python ./code.py > ausgabe.txt

# Variablen
name = "Meier"
vorname = "Hans" 
alter = 42

# Separator bei print()
print("\n**Ausgabe**\n\n~~~")
print("# Separator bei print()")
print(name, vorname, alter, sep="-")
print(name, vorname, alter, sep="")
print(name, vorname, alter)
print("~~~\n")
# input()-Funktion
#var = input("Eingabe Text: ")
#print(var)

# Mathematische Umwandlungen
#zahl1 = int(input("Eingabe Zahl1: "))
#zahl2 = int(input("Eingabe Zahl2: "))
#summe = zahl1 + zahl2
#print(summe)

# Datentypen
print("\n**Ausgabe**\n\n~~~")
print("# Datentypen")
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
print("~~~\n")

# Datentyp bestimmen und umwandeln
print("\n**Ausgabe**\n\n~~~")
print("# Datentyp bestimmen und umwandeln")
var1 = 7
var2 = "3" # Text!
print(type(var1))
print(type(var2))
print(type(float(var1)))
print(var1 + int(var2))
print(str(var1) + var2)
print("~~~\n")

# Arithmetische Operatoren
print("\n**Ausgabe**\n\n~~~")
print("# Arithmetische Operatoren")
# Arithmetische Operatoren
a = 17
b = 0.3
c = 2
d = 0.65
print("1 * 1 = ", 1 * 1)
print("1 + 1 = ", 1 + 1)
print("5 - 1 = ", 5 - 1)

print("4 / 2 = ", 4 / 2)
print("5 / 2 = ", 5 / 2)

print("5 / 2 = ", 5 / 2)
print("5 // 2 = ", 5 // 2)

print("a % c = ", a % c)
print("a % b = ", a % b)
print("a % d = ", a % d)
print("a ** c = ", a ** c)
print("a ** b = ", a ** b)
print("a" + "b")
print("a + 1.9 = ", a + 1.9)
print("1 + 3.9 = ", 1 + 3.9)
print("False + True = ", False + True)
print("a + True = ", a + True)
print("~~~\n")

# Zuweisungsoperatoren
print("\n**Ausgabe**\n\n~~~")
print("# Zuweisungsoperatoren")
i = 5
i *= 2 # i = i * 2
print(i)
i %= 13
print(i)
i **= 2
print(i)
print("~~~\n")

# Vergleichsoperatoren - Logische Operatoren
print("\n**Ausgabe**\n\n~~~")
print("# Vergleichsoperatoren - Logische Operatoren")
print((4 + 4 == 8) and (2 + 3 == 5))
print((4 + 4 == 8) and (1 + 3 == 3))
print((4 + 4 == 8) or (2 + 3 == 5))
print((4 + 4 == 7) or (2 + 3 != 5))
print(not(1 + 4 == 5))
print("~~~\n")

# Weitere Operatoren
print("\n**Ausgabe**\n\n~~~")
print("# Weitere Operatoren")
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
print("~~~\n")

# Bitoperatoren
print("\n**Ausgabe**\n\n~~~")
print("# Bitoperatoren")
z1 = 2
a = z1 << 1
b = z1 >> 1
print("Der Wert von 2 << 1: " , a)
print("Der Wert von 2 >> 1: " , b)
print("~~~\n")

# Kontrollstrukturen 
print("\n**Ausgabe**\n\n~~~")
print("# Kontrollstrukturen")
a = 1
if a < 2:
  print("Der Wert von a ist kleiner 2")
print("~~~\n")

# Entscheidungsanweisungen
print("\n**Ausgabe**\n\n~~~")
print("# Entscheidungsanweisungen")
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
print("~~~\n")


# while-Schleife
print("\n**Ausgabe**\n\n~~~")
print("# while-Schleife")
i = 0
while (i < 9):
  i += 1
  print("Wert des Schleifenzaehlers", i)
print("Schleife beendet")
print("~~~\n")


# Windows: Beenden
#input("\nBeenden...[Enter]")

