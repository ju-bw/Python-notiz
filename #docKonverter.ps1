# PowerShell Script:  ju -- https://bw1.eu -- 10-Okt-18  -- #docKonverter.ps1
# Shell: Script ausfuehren
# $ ./#docKonverter.ps1

<#
  Markdown Dokumente / Notizen im Ordner "md/neu.md" erstellen.
  Beachte das *min. zwei Markdowndateien* vorhanden sein müssen. 
  **Powershellscript** "#docKonverter.ps1" erstellt LaTeX - pdfs und html files.
#>

<#
  Editor - Visual Studio Code 
    - Shell öffnen: file Auswahl   <Alt+Strg+O>
    - mehrfaches Editieren         <Alt+Mausklick>
    - Einzug: 2 (Leerzeichen), Codierung: UTF-8, Zeilenende: LF (Linux)
#>

Clear-Host # cls

### Projektverzeichnis
# anpassen
#$work = "C:/projekte/"
#cd $work

### Zeit
$timestampArchiv = Get-Date -Format 'yyyy-MMM-dd' # 2018-Okt-11
#$timestampArchiv = Get-Date -Format 'yMd'         # 181011
#$timestampFile = Get-Date -Format 'dd-MMM-yyyy'   # 11-Okt-2018
$timestampFile = Get-Date -Format 'd-MMM-y'       # 11-Okt-18

$autor = "ju -- https://bw1.eu -- $timestampFile"
$autor

### Projekt
# anpassen
$thema = "Python-Notiz" # Thema
$bildformat = "svg"    # Bildformate: svg, jpg, png
$codeformat = "py"     # Codeformate: c, c++, sh, py
$language = "Python"   # Latex-Code:  C, [LaTeX]TeX, Bash, Python
#
#$doc = "doc"
$tex = "tex"
$md = "md"
$html = "html"
$css = "css"
$wp = "wordpress"
$img = "img"
$code = "code"
$archiv = "archiv"
$pdf = "pdf"
#$docx = "docx" # Word
$imgOriginal = "imgOriginal"
$content = "content"
# ext. dateien
$webDesign = "$css/design.css"
$texDummyArtikel = "$content/texDummyArtikel.tex"
$book = "$content/texDummyBook.tex"
$print = "$content/texDummyPrint.tex"
$inhalt = "$content/inhalt.tex" # Inhalt book.tex & print.tex

"+++ Verzeichnis erstellen, wenn nicht vorhanden"
### loescht ordner, wenn vorhanden, recursiv, schreibgeschützt, versteckt (unix)
#if(test-path $html){rm $html -force -recurse}
if(!(test-path $html)){md $html/$wp}
#if(!(test-path $docx)){md $docx} # Word
if(!(test-path $pdf)){md $pdf}
if(!(test-path $tex)){md $tex}
if(!(test-path $imgOriginal)){md $imgOriginal}
if(!(test-path $code)){md $code}
if(!(test-path $img)){md $img}




### info
$info = "Auswahlmenue"
# Menue
$auswahl =  @'
(1) artikel.pdf
(2) book.pdf
(3) print.pdf
(4) alle Abbildungen.tex
(5) alle Quellcodedateien.tex
(6) backup - "../$archiv/$timestampArchiv-$thema.zip"
(7) git - Repository auf github notwendig!
(8) imgWeb.ps1 # ext. Script - Bilder optimieren (Latex/Web)
(9) html
(10) pandoc & suchen/ersetzen - Achtung: min. zwei Markdown Dateien notwendig !!!
(11) Beenden
'@

# Menueeintraege
$auswahl_von = 1
$auswahl_bis = 11

### Fragen
$frage      = "`n$ Bitte eine Auswahl treffen."
$frageTitel = "`n$ Bitte einen Haupttitel eingeben."

### Fehler 
$ErrorEingabe1 = "`n$ Eingabefehler, Die richtige Zahl eingegeben!"
$ErrorEingabe2 = "`n$ Eingabefehler, keine Zahl eingegeben!"

 
<# Funktionen #>
# Struktur
### Funktionsaufruf: trennLinie $max $muster
function trennLinie{
  param(
    [int]$max, 
    [char]$muster
  )  
	for($i=1; $i -le $max; $i++){
    $linie += $muster #array
	}	
  Write-Host "`n$linie" #-ForegroundColor Yellow # Farbe: Green, Red, Yellow
}

# Haupttitel fuer Latex 
# Usereingabe
#[string]$varTitel = Read-Host 'Eingabe - [Titel]'  


[bool]$nochmal = $true
while($nochmal){
  ### Funktionsaufruf: 
  trennLinie 30 -
  Write-Host "`n$info`n============`n" 
  $auswahl      # auswahlmenü	 
  trennLinie 30 -
  
  # Fehlerbehandlung
  try {
      # Usereingabe
      [int]$var = Read-Host 'Eingabe - [Zahl]'  
      # Eingabefehler: menüeinträge von - bis
      if( $var -lt $auswahl_von -or $var -gt $auswahl_bis ){ 
          $ErrorEingabe1
      }
  }
  catch {
      # Eingabefehler: keine Zahl
      $ErrorEingabe2
      [int]$var = 0 # initialisieren, sonst Fehler
  }          

  # artikel.pdf
  if($var -eq 1){ # gleich 
    ### Latex - Artikel  
    $filter = "*.tex"
    [array]$array = ls -Path ./$tex -Filter $filter -Recurse -Force 
    $artikel = "$texDummyArtikel" 
    $readFile = @(Get-content "$artikel" -Encoding UTF8)
    # array auslesen
    for($n=0; $n -lt $array.length; $n++){   # kleiner
      $name = "$($array[$n])"              # file.tex
      $basename = "$($array.BaseName[$n])" # file
      #"$n - $name"
      # schreibe jeweils in datei 
      $artikel = "$basename-main.tex"
      $readFile | Out-File "$artikel" -Encoding UTF8 
      # Suchen und Ersetzen
      $suchen = "DUMMY" # regulaerer Ausdruck
      $ersetzen = "$basename"
      # regulaerer Ausdruck
      (Get-Content "$artikel") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "$artikel" 
    } 


    ### pdflatex
    $filter = "*main.tex"
    [array]$array = ls -Path ./ -Filter $filter -Force 
    for ($x=0; $x -lt $array.length; $x++) { #-lt=kleiner
      $name = "$($array[$x])"              # file.tex
      $basename = "$($array.BaseName[$x])" # file
      # pdflatex "main.tex"
      pdflatex $name 
      biber $basename
      pdflatex $name
      pdflatex $name
    } 
    
    # Kopie
    cp *.pdf $pdf/  

    ### aufraeumen
    rm *.pdf
    rm *.log
    rm *.out
    rm *.aux 
    rm ./$tex/*.aux 
    rm ./$content/*.aux
    rm *.synctex*
    rm *.bbl
    rm *.bcf
    rm *.blg
    rm *.run*
    rm *.toc
  }    
  # book.pdf
  if($var -eq 2){ # gleich 
    ### Latex - Artikel  
    $filter = "*.tex"
    [array]$array = ls -Path ./$tex -Filter $filter -Recurse -Force 
    $artikel = "$texDummyArtikel" 
    $readFile = @(Get-content "$artikel" -Encoding UTF8)
    # array auslesen
    for($n=0; $n -lt $array.length; $n++){   # kleiner
      $name = "$($array[$n])"              # file.tex
      $basename = "$($array.BaseName[$n])" # file
      #"$n - $name"
      # schreibe jeweils in datei 
      $artikel = "$basename-main.tex"
      $readFile | Out-File "$artikel" -Encoding UTF8 
      # Suchen und Ersetzen
      $suchen = "DUMMY" # regulaerer Ausdruck
      $ersetzen = "$basename"
      # regulaerer Ausdruck
      (Get-Content "$artikel") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "$artikel" 
    } 

    ### PDF book
    # lese aus datei
    $readFile = @(Get-content "$book" -Encoding UTF8)
    # schreibe in datei 
    $book = "$thema-book.tex"
    $readFile | Set-Content "$book"
    # Suchen und Ersetzen
    $suchen = "Haupttitel" # regulaerer Ausdruck
    $ersetzen = "$thema"
    (Get-Content "$book") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "$book" 
    
    ### Inhalt fuer book.tex & print.tex
    # schreibe in datei
    $text = "% Inhalt `n% $autor"
    $text | Set-Content $inhalt 
    $filter = "*.tex"
    [array]$arrayTEX = ls -Path $tex -Filter $filter -Recurse -Force 
    # array auslesen
    for($n=0; $n -lt $arrayTEX.length; $n++){   # kleiner
        $name = "$($arrayTEX[$n])"              # file.tex
        $basename = "$($arrayTEX.BaseName[$n])" # file
        #"$n - $basename"
        # schreibe in datei 
        $text = "\chapter{Kapitel} `n\input{tex/$basename}`n"  
        $text | Add-Content $inhalt
    }

    ### pdflatex
    $filter = "*book.tex"
    [array]$array = ls -Path ./ -Filter $filter -Force 
    for ($x=0; $x -lt $array.length; $x++) { #-lt=kleiner
      $name = "$($array[$x])"              # file.tex
      $basename = "$($array.BaseName[$x])" # file
      # pdflatex "main.tex"
      pdflatex $name 
      biber $basename
      pdflatex $name
      pdflatex $name
    }

    # Kopie
    cp *.pdf $pdf/  

    ### aufraeumen
    rm *.pdf
    rm *.log
    rm *.out
    rm *.aux 
    rm ./$tex/*.aux 
    rm ./$content/*.aux
    rm *.synctex*
    rm *.bbl
    rm *.bcf
    rm *.blg
    rm *.run*
    rm *.toc
  }
  
  #  print.pdf 
  if($var -eq 3){ # gleich 
    ### Latex - Artikel  
    $filter = "*.tex"
    [array]$array = ls -Path ./$tex -Filter $filter -Recurse -Force 
    $artikel = "$texDummyArtikel" 
    $readFile = @(Get-content "$artikel" -Encoding UTF8)
    # array auslesen
    for($n=0; $n -lt $array.length; $n++){   # kleiner
      $name = "$($array[$n])"              # file.tex
      $basename = "$($array.BaseName[$n])" # file
      #"$n - $name"
      # schreibe jeweils in datei 
      $artikel = "$basename-main.tex"
      $readFile | Out-File "$artikel" -Encoding UTF8 
      # Suchen und Ersetzen
      $suchen = "DUMMY" # regulaerer Ausdruck
      $ersetzen = "$basename"
      # regulaerer Ausdruck
      (Get-Content "$artikel") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "$artikel" 
    } 

    ### PDF print
    # lese aus datei
    $readFile = @(Get-content "$print" -Encoding UTF8)
    # schreibe in datei 
    $print = "$thema-print.tex"
    $readFile | Set-Content "$print"
    # Suchen und Ersetzen
    $suchen = "Haupttitel" # regulaerer Ausdruck
    $ersetzen = "$thema"
    (Get-Content "$print") | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content "$print" 
    
    ### Inhalt fuer book.tex & print.tex
    # schreibe in datei
    $text = "% Inhalt `n% $autor"
    $text | Set-Content $inhalt 
    $filter = "*.tex"
    [array]$arrayTEX = ls -Path $tex -Filter $filter -Recurse -Force 
    # array auslesen
    for($n=0; $n -lt $arrayTEX.length; $n++){   # kleiner
        $name = "$($arrayTEX[$n])"              # file.tex
        $basename = "$($arrayTEX.BaseName[$n])" # file
        #"$n - $basename"
        # schreibe in datei 
        $text = "\chapter{Kapitel} `n\input{tex/$basename}`n"  
        $text | Add-Content $inhalt
    }

    ### pdflatex
    $filter = "*print.tex"
    [array]$array = ls -Path ./ -Filter $filter -Force 
    for ($x=0; $x -lt $array.length; $x++) { #-lt=kleiner
      $name = "$($array[$x])"              # file.tex
      $basename = "$($array.BaseName[$x])" # file
      # pdflatex "main.tex"
      pdflatex $name 
      biber $basename
      pdflatex $name
      pdflatex $name
    } 
    
    # Kopie
    cp *.pdf $pdf/  

    ### aufraeumen
    rm *.pdf
    rm *.log
    rm *.out
    rm *.aux 
    rm ./$tex/*.aux 
    rm ./$content/*.aux
    rm *.synctex*
    rm *.bbl
    rm *.bcf
    rm *.blg
    rm *.run*
    rm *.toc
  }
  
  # alle Abbildungen.tex
  if($var -eq 4){ # gleich 
    ### alle Abbildungen
    # schreibe in datei
    $file =  "Abbildungen.tex"
    $text = "\section{Abbildungen}\label{abbildungen}`n"
    $text | Set-Content $tex/$file  
    $filter = "*.pdf"
    [array]$arrayBild = ls -Path $img -Filter $filter -Recurse -Force 
    # array auslesen
    for($n=0; $n -lt $arrayBild.length; $n++){ # kleiner
      $name = "$($arrayBild[$n])"              # file.tex
      $basename = "$($arrayBild.BaseName[$n])" # file
      #"$n - $basename"
      # schreibe in datei 
      $text = "\subsection{$basename}\label{}`n
% Bild Referenz
(\autoref{fig:$basename} $basename). % bildname anpassen!
% Bild
\begin{figure}[!hb] % hier
  \centering
  \includegraphics[width=0.8\linewidth]{$img/$basename.pdf}
  % ====================
  \caption{$basename}   % Caption  anpassen!
  \label{fig:$basename} % Referenz anpassen!
  % ===================
\end{figure}`n" 
      $text | Add-Content $tex/$file
    } 
  }
  
  # alle Quellcodedateien.tex
  if($var -eq 5){ # gleich
    ### alle Quellcode dateien
    #$codeformat = "py"     # Codeformate: c, c++, sh, py
    #$language = "Python"   # Latex-Code:  C, [LaTeX]TeX, Bash, Python
    # schreibe in datei
    $file =  "Quellcode.tex"
    $text = "\section{Quellcode}\label{quellcode}`n"
    $text | Set-Content $tex/$file  
    $filter = "*.$codeformat"
    [array]$arrayCode = ls -Path $code -Filter $filter -Recurse -Force 
    # array auslesen
    for($n=0; $n -lt $arrayCode.length; $n++){ # kleiner
      $name = "$($arrayCode[$n])"              # file.tex
      $basename = "$($arrayCode.BaseName[$n])" # file
      #"$n - $basename"
      # schreibe in datei 
      $text = "\subsection{$basename}\label{}`n
% Quellcode Referenz
(\autoref{code:$basename} $basename). % codename anpassen!
% Quellcode aus ext. Datei
\lstset{language=$language}% C++, [LaTeX]TeX, Bash, Python
\lstinputlisting[%numbers=left, frame=l, framerule=0.1pt,
  % =====================
  caption={Quellcode in $language, $basename}, % Caption  anpassen!
  label={code:$basename}                       % Referenz anpassen!
  % =====================
]{$code/$basename.$codeformat}% ext. Datei

\newpage`n" 
      $text | Add-Content $tex/$file
    }
  } 

  # backup
  if($var -eq 6){ # gleich 
    ### Backup
    #robocopy $quelle $ziel /mir /e /NFL /NDL /NJH /TEE          
    if(test-path "../$archiv/*Archiv-$thema.zip"){
      rm "../$archiv/*Archiv-$thema.zip" -force -recurse
    }
    ### Komprimieren
    ls ./ | Compress-Archive -Update -dest "../$archiv/$timestampArchiv-$thema.zip"
  }

  # git
  if($var -eq 7){ # gleich 
    # git
    git status
    # Usereingabe
    "+++ Gibt es Aenderungen? Wenn ja, Repository auf github notwendig! siehe Readme.md"
    $varGit = Read-Host 'Eingabe - [j/n]' 
    if($varGit -eq  "n"){# gleich
      "keine Aenderung"
    }
    else{
      # repository auf github notwendig!
      git add .
      #git commit -am "Projekt geaendert"
      # vim Texteingabe: <i> / beenden mit <ESC : wq>
      git commit -a
      # letzten Commit rueckgaengig
      # git commit --amend
      git pull
      git push
      git status
      #git log  # less beenden mit <Shift+q>
      # --global: Datei /C/Users/jan/.gitconfig
      git loa
      #log --graph --decorate --pretty=oneline --abbrev-commit --all
    }
  }
  
  # #imgWeb.ps1 # ext. Script
  if($var -eq 8){ # gleich  
    ./imgWeb.ps1 # ext. Script
  }

  # html
  if($var -eq 9){ # gleich  
    ### html
    "+++ alle-PDF-files.html"
    $titel = "PDFs"
    $fileHTML =  "alle-PDF-files.html"
    $textHTML = "<!--+++ $autor +++-->
<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title><!-- Titel -->
  <meta name=`"description`" content=`"$titel`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"../$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"
    # schreibe in datei 
    $textHTML | Set-Content ./$html/$fileHTML  
    $filter = "*.pdf"
    [array]$arrayPDF = ls ./$pdf $filter -Force 
    # array auslesen
    #$picnummer = 1
    for($n=0; $n -lt $arrayPDF.length; $n++){   # kleiner
      $name = "$($arrayPDF[$n])"              # file.tex
      $basename = "$($arrayPDF.BaseName[$n])" # file
      #"$n - $basename"
      $textHTML = "   <li><a href=`"../$pdf/$name`">$name</a></li>"
      # schreibe in datei hinzu
      $textHTML | Add-Content ./$html/$fileHTML
      #$picnummer++ 
    }
    $textHTML = "</ul>`n<!-- Ende Inhalt -->`n</body></html>"
    # schreibe in datei hinzu
    $textHTML | Add-Content ./$html/$fileHTML



    "+++ alle-Abb-files.html"
    $titel = "Abbildungen"
    $fileHTML =  "alle-Abb-files.html"
    $textHTML = "<!--+++ $autor +++-->
<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title><!-- Titel -->
  <meta name=`"description`" content=`"$titel`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"../$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"
    # schreibe in datei 
    $textHTML | Set-Content ./$html/$fileHTML  
    $filter = "*.$bildformat" # Bildformate: svg, jpg, png
    [array]$arrayAbb = ls ./$img $filter -Force 
    # array auslesen
    #$picnummer = 1
    for($n=0; $n -lt $arrayAbb.length; $n++){   # kleiner
      $name = "$($arrayAbb[$n])"              # file.tex
      $basename = "$($arrayAbb.BaseName[$n])" # file
      #"$n - $basename"
      $textHTML = "   <li><a href=`"../$img/$name`">$name</a></li>"
      # schreibe in datei hinzu
      $textHTML | Add-Content ./$html/$fileHTML
      #$picnummer++ 
    }
    $textHTML = "</ul>`n<!-- Ende Inhalt -->`n</body></html>"
    # schreibe in datei hinzu
    $textHTML | Add-Content ./$html/$fileHTML

    "+++ alle-Pics.html"
    $titel = "Pics"
    $fileHTML =  "alle-Pics.html"
    $textHTML = "<!--+++ $autor +++-->
<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title><!-- Titel -->
  <meta name=`"description`" content=`"$titel`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"../$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>"
    # schreibe in datei 
    $textHTML | Set-Content ./$html/$fileHTML  
    $filter = "*.$bildformat" # Bildformate: svg, jpg, png
    [array]$arrayAbb = ls ./$img $filter -Force 
    # array auslesen
    $picnummer = 1
    for($n=0; $n -lt $arrayAbb.length; $n++){   # kleiner
      $name = "$($arrayAbb[$n])"              # file.tex
      $basename = "$($arrayAbb.BaseName[$n])" # file
      #"$n - $basename"
      $textHTML = "<!-- Abb. $picnummer -->
<a href=`"../$img/$name`"> 
  <figure>
    <img class=scaled src=`"../img/$name`" />
    <figcaption>Abb. $picnummer : $name</figcaption>
  </figure>
</a>"
      # schreibe in datei hinzu
      $textHTML | Add-Content ./$html/$fileHTML
      $picnummer++ 
    }
    $textHTML = "<!-- Ende Inhalt -->`n</body></html>"
    # schreibe in datei hinzu
    $textHTML | Add-Content ./$html/$fileHTML

    "+++ alle-Code-files.html"
    $titel = "Code"
    $fileHTML =  "alle-Code-files.html"
    $textHTML = "<!--+++ $autor +++-->
<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title><!-- Titel -->
  <meta name=`"description`" content=`"$titel`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"../$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"
    # schreibe in datei 
    $textHTML | Set-Content ./$html/$fileHTML  
    $filter = "*.$codeformat" # Codeformate: c, c++, sh, py
    [array]$arrayCode = ls ./$code $filter -Force 
    # array auslesen
    #$picnummer = 1
    for($n=0; $n -lt $arrayCode.length; $n++){   # kleiner
      $name = "$($arrayCode[$n])"              # file.tex
      $basename = "$($arrayCode.BaseName[$n])" # file
      #"$n - $basename"
      $textHTML = "   <li><a href=`"../$code/$name`">$name</a></li>"
      # schreibe in datei hinzu
      $textHTML | Add-Content ./$html/$fileHTML
      #$picnummer++ 
    }
    $textHTML = "</ul>`n<!-- Ende Inhalt -->`n</body></html>"
    # schreibe in datei hinzu
    $textHTML | Add-Content ./$html/$fileHTML

    "+++ index.html - alle html-Seiten"
    $titel = "$thema"
    $fileHTML =  "index.html"
    $textHTML = "<!--+++ $autor +++-->
<!DOCTYPE html>
<html><head>
  <meta charset=`"UTF-8`" />
  <title>$titel</title><!-- Titel -->
  <meta name=`"description`" content=`"$titel`" /><!-- Beschreibung -->
  <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0, user-scalable=yes`" />
  <link rel=`"stylesheet`" href=`"./$webDesign`" />
</head><body>
<!-- Inhalt -->
<h1>$titel</h1>
<p>Inhalt</p>
<ul class=`"nav`"><!-- Liste -->"
    # schreibe in datei 
    $textHTML | Set-Content $fileHTML  
    $filter = "*.html"
    [array]$arrayHTML = ls ./$html $filter -Force 
    # array auslesen
    for($n=0; $n -lt $arrayHTML.length; $n++){   # kleiner
      $name = "$($arrayHTML[$n])"              # file.tex
      $basename = "$($arrayHTML.BaseName[$n])" # file
      #"$n - $basename"
      $textHTML = "   <li><a href=`"./$html/$basename.html`">$basename.html</a></li>"
      # schreibe in datei hinzu
      $textHTML | Add-Content $fileHTML
    }
    $textHTML = "</ul>`n<!-- Ende Inhalt -->`n</body></html>"
    # schreibe in datei hinzu
    $textHTML | Add-Content $fileHTML
  }
  
  # Pandoc
  if($var -eq 10){ # gleich  
    # loeschen
    if(test-path ./Abbildungen-main.tex){
      rm ./Abbildungen-main.tex -force -recurse
    }
    if(test-path ./$tex/Abbildungen.tex){
      rm ./$tex/Abbildungen.tex -force -recurse
    }
    if(test-path ./Quellcode-main.tex){
      rm ./Quellcode-main.tex -force -recurse
    }
    if(test-path ./$tex/Quellcode.tex){
      rm ./$tex/Quellcode.tex -force -recurse
    }
    
    ### Files umbenennen
    cd $img
    "+++ Files umbenennen"
    # Dateiendung
    ls -r | ren -NewName {$_.fullname -replace ".JPG", ".jpg"} -ea SilentlyContinue
    ls -r | ren -NewName {$_.fullname -replace ".jpeg", ".jpg"} -ea SilentlyContinue
    # Leerzeichen
    ls -r | ren -NewName {$_.name -replace "_", "-"} -ea SilentlyContinue
    ls -r | ren -NewName {$_.name -replace " ", ""} -ea SilentlyContinue
    # webserver
    #ls -r | ren -NewName {$_.name -replace "-", "_"} -ea SilentlyContinue
    # Umlaute ergaenzen
    cd ..


    ### Markdown in *.tex, *.pdf, *.html
    $filter = "*.md"
    [array]$array = ls -Path ./$md -Filter $filter -Recurse -Force 
    for ($x=0; $x -lt $array.length; $x++) { #-lt=kleiner
      $name = "$($array[$x])"              # file.md
      $basename = "$($array.BaseName[$x])" # file
      # pandoc text.md -o text.tex
      pandoc "./$md/$name" -o "./$tex/$basename.tex"
      #pandoc "./$md/$name" -o "./$pdf/$basename.pdf"
      # Word
      #pandoc "./$md/$name" -o "./$docx/$basename.docx"
      pandoc "./$md/$name" -o "./$html/$wp/$basename-$wp.html"
      pandoc -s "./$md/$name" -c "../$webDesign" -o "./$html/$basename.html"
    } 

    

    ### suchen und ersetzen in latex
    $filter = "*.tex"
    [array]$array = ls -Path ./$tex -Filter $filter -Recurse -Force 
    # array auslesen
    for($n=0; $n -lt $array.length; $n++){   # kleiner
      $name = "$($array[$n])"              # file.tex
      $basename = "$($array.BaseName[$n])" # file
      #"$n - $name"
    # \tightlist
    $suchen = "\\tightlist" # regulaerer Ausdruck
    $ersetzen = ""
    # regulaerer Ausdruck
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # \hypertarget
    $suchen = "\\hypertarget{" # regulaerer Ausdruck
    $ersetzen = "%% Ueberschrift: "
    # regulaerer Ausdruck
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # }{%
    $suchen = "}{%" # regulaerer Ausdruck
    $ersetzen = ""
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # }}
    $suchen = "}}" # regulaerer Ausdruck
    $ersetzen = "}"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # Bilder
    $suchen = "includegraphics" # regulaerer Ausdruck
    $ersetzen = "includegraphics[width=0.8\textwidth]"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # \begin{figure}[!hb] % hier
    $suchen = "\\begin{figure}" # regulaerer Ausdruck
    $ersetzen = "\begin{figure}[!hb] % hier"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # Quellcode
    $suchen = "\\begin\{verbatim\}" # regulaerer Ausdruck
    $ersetzen = "% Quellcode
\lstset{language=$language} % C, [LaTeX]TeX, Bash, Python
\begin{lstlisting}[%numbers=left, frame=l, framerule=0.1pt,%
% ======================
  caption={},            % Caption anpassen!
  label={code:codename}  % Label anpassen!
]% ======================
"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name

    $suchen = "\\end\{verbatim\}" # regulaerer Ausdruck
    $ersetzen = "\end{lstlisting}"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # Tabelle
    $suchen = "\[\]\{\@\{\}" # regulaerer Ausdruck
    $ersetzen = ""
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    #
    $suchen = "\@\{\}" # regulaerer Ausdruck
    # regulaerer Ausdruck
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    #
    $suchen = "siehe tab. " # regulaerer Ausdruck
    $ersetzen = "% Tabellenverweis
    (\autoref{tab:tabname}). % tabname = "
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    #
    $suchen = "\\begin\{longtable\}" # regulaerer Ausdruck
    $ersetzen = "% Tabelle
\begin{table}[!ht] % hier     
\centering
\rowcolors{1}{}{meinred!4}% Farbe
%\begin{tabularx}{\textwidth}{XXX}   % auto. Spaltenumbruch
%\begin{tabular}{p{4cm}p{4cm}p{4cm}} % Spaltelaenge fest, auto. Spaltenumbruch, Text nur linksbuendig
\begin{tabular}{"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    #
    $suchen = "\\end\{longtable\}" # regulaerer Ausdruck
    $ersetzen = "%\end{tabularx}
\end{tabular}
% =========================
\caption{}                 % Caption  anpassen!
\label{tab:tabname}	       % Referenz anpassen!
% =========================
\end{table}"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    #
    $suchen = "\\toprule" # regulaerer Ausdruck
    $ersetzen = "}%
\toprule            
%\rowcolor{orange!90} % Farbe"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    #
    $suchen = "\\endhead" # regulaerer Ausdruck
    $ersetzen = ""
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    # Ersetze: \tabularnewline
    $suchen = "\\tabularnewline" # regulaerer Ausdruck
    $ersetzen = " \\"
    (Get-Content ./$tex/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$tex/$name
    }


    ### suchen u. ersetzen in html
    $filter = "*.html"
    [array]$array = ls ./$html $filter -Force 
    # array auslesen
    for($n=0; $n -lt $array.length; $n++){   # kleiner
      $name = "$($array[$n])"              # file.tex
      $basename = "$($array.BaseName[$n])" # file
      #"$n - $name"
    # Bilder pdf in jpg
    $suchen = "pdf`" /><fig" # regulaerer Ausdruck
    $ersetzen = "$bildformat`" width=`"400`"/><fig"
    # regulaerer Ausdruck
    (Get-Content ./$html/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$html/$name
    # Bild pfad
    $suchen = "src=`"img" # regulaerer Ausdruck
    $ersetzen = "src=`"../img"
    # regulaerer Ausdruck
    (Get-Content ./$html/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$html/$name
    # Bild skalieren: <embed src=   =>  <img class=scaled src=
    $suchen = "<embed src=" # regulaerer Ausdruck
    $ersetzen = "<img class=scaled src="
    (Get-Content ./$html/$name) | Foreach-Object {$_ -replace "$suchen", "$ersetzen"} | Set-Content ./$html/$name
    }

  }

  # Beenden
  if($var -eq 11){ # gleich  
      $nochmal = 0;# schleife beenden
  }
  
}

### Win - Explorer öffnen
#& explorer 

### Shell offen halten
Write-Host $openShell 
Read-Host "Beenden mit Enter ..."
