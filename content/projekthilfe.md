# Projekthilfe

% ju -- https://bw1.eu -- 10-Okt-18  -- projekthilfe.md

## Hinweis

Projekt getestet unter Win10

## Software

Pandoc: <https://pandoc.org/installing.html>

Latex: <https://www.tug.org/texlive/acquire-netinstall.html>

~~~
  # Shell: TeXlive update
  tlmgr update --all
~~~

Editor: <https://code.visualstudio.com/download>

Git: <https://git-scm.com/downloads>

~~~
  # Shell: Git version
  git --version
~~~

Imagemagick: <https://www.imagemagick.org/script/download.php#windows>

## Editor - Visual Studio Code 

Tastenkombination und Einstellungen

~~~
  Editor - Visual Studio Code 
    - Shell öffnen: file Auswahl   <Alt+Strg+O>
    - mehrfaches Editieren         <Alt+Mausklick>
    - Einzug: 2 (Leerzeichen), Codierung: UTF-8, Zeilenende: LF (Linux)
~~~

## Repository Python-Notiz von Github downloaden

~~~
  # Shell: Kopie downloaden
  $ git clone https://github.com/ju-bw/Python-Notiz.git .
~~~

## neues Repository auf github anlegen

~~~
  # https://github.com/new
  # github: Create a new repository
  # Repository name = Python-Notiz
  # Shell: Git Befehle
  # "git config", ".gitignore" konfigurieren und erstellen
  $ git init
  $ git add .
  $ git commit -am "Projekt initialisieren"
  $ git remote add origin https://github.com/ju-bw/Python-Notiz.git
  $ git push -u origin master
  $ git status
  $ git pull
  $ git push
  $ git status
~~~

## Markdown Dokumente / Notizen

Markdown Dokumente / Notizen im Ordner "md/neu.md" erstellen.

Beachte das *min. zwei Markdowndateien* vorhanden sein müssen. 

**Powershellscript** "#docKonverter.ps1" erstellt LaTeX - pdf und html files.

~~~
  # Editor - Powershellscript "#docKonverter.ps1" anpassen
    ### Projekt
    # anpassen
    $thema = "Python-Notiz" # Thema
    $bildformat = "svg"    # Bildformate: svg, jpg, png
    $codeformat = "py"     # Codeformate: c, c++, sh, py
    $language = "python"   # Latex-Code:  C, [LaTeX]TeX, Bash, Python
  # Shell: Script ausfuehren
  $ ./#docKonverter.ps1
~~~

## Bilder optimieren

**JPG Bilder** in den Ordner "imgOriginal/" kopieren.

**Powershellscript** "#imgWeb.ps1" optimiert Fotos für das Web und die PDF Datei.

~~~
  # Shell: Script ausfuehren
  $ ./#imgWeb.ps1
~~~

## Befehle Pandoc

**Pandoc - universeller Dokumentenkonverter**

~~~
  $ # Shell oeffnen
  # Pandoc: dokumentenkonverter
  pandoc text.md -o text.pdf
  pandoc -s text.md -c main-design.css -o text-mit-css.html
  pandoc text.md -o text.html
  pandoc text.md -o text.tex
  # aufraeumen
  rm *.log
  rm *.out
  rm *.aux
  rm *.synctex.gz
~~~

## Dokumentenkonverter

**Latex**

pandoc text.md -o text.tex

~~~
  Editor "text.tex" oeffnen -> Suchen und Ersetzen
  TeXworks "dummy.tex" oeffnen -> pdflatex
~~~

**html**

~~~
  pandoc text.md -o text.html
~~~

**HTML5 mit CSS**

~~~
  pandoc -s text.md -c design.css -o text-mit-css.html
~~~

**pdf**

~~~
  pandoc text.md -o text.pdf
~~~

**Word**

~~~
  pandoc text.md -o text.docx
~~~

