import numpy as np
prim = np.array([2,3,5,7, 11,13,17])
print("Das Array", prim)
print("Die Array-Groesse", prim.size)
print("Datentyp der Array-Elemente",  prim.dtype)
print("*" * 30)

mehrdimArray = np.array([(1.5,2,3), (4,5,6), (7,11,33,54)])
print("Das mehrdimensionale Array\n", mehrdimArray)
print("*" * 30)

nullinitArray = np.zeros( 49 )
print("Das nullinitialisierte Array - eindimensional\n", nullinitArray)
print("*" * 30)

nullinitArrayMehrDim1 = np.zeros( (10,4) )
print("Das nullinitialisierte Array - zweidimensional\n", nullinitArrayMehrDim1)
nullinitArrayMehrDim2 = np.zeros( (2,5,4,4) )
print("Das nullinitialisierte Array - 4 Dimensionen\n", nullinitArrayMehrDim2)

print("*" * 30)

bereich1 = np.arange( 10, 30 )
print("Das Array mit einem Wertebereich zwischen 10 und 30 (exklusive) und Defaultschritten\n", bereich1)
print("*" * 30)
bereich2 = np.arange( 10, 30, 3 )
print("Das Array mit einem Wertebereich und Schritten mit dem Abstand 3\n", bereich2)
print("*" * 30)
bereich3 = np.arange( 1, 4, 0.3 )
print("Das Array mit einem Wertebereich zwischen 1 und 4 und Schritten mit einem Abstand 0.3\n", bereich3)
print("*" * 30)

# Umdimensionieren von Arrays
aDim1 = np.arange(100)
print("Das originale Array (eindimensional)\n", aDim1)
print("*" * 30)
aDim2 = aDim1.reshape(10,10)
print("Das Array umdimensioniert\n", aDim2)
print("*" * 30)

zufallszahlen = np.array([100, 2,88, 143, 3, 15, 47, 11, 13, 97, 19, 23, 29, 31])
print("Maximum:", np.max(zufallszahlen))
print("Minimum:", np.min(zufallszahlen))
print("Mittelwert:", np.mean(zufallszahlen))
print("Zentralwert:", np.median(zufallszahlen))

print("*" * 30)
zufallszahlen2 = zufallszahlen.reshape(2,7)
print("Das Array umdimensioniert\n", zufallszahlen2)
print("*" * 30)
print("Maximum:", np.max(zufallszahlen2))
print("Minimum:", np.min(zufallszahlen2))
print("Mittelwert:", np.mean(zufallszahlen2))
print("Zentralwert:", np.median(zufallszahlen2))

print("*" * 30)
