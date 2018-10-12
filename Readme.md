# Readme

% ju -- https://bw1.eu -- 10-Okt-18  -- Readme.md

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

~~~
  # Editor visual studio code
  # Datei / einstellungen / User settings
  {
    "workbench.iconTheme": "material-icon-theme",
    "powershell.powerShellExePath": "C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
    "editor.tabSize": 2,           
    "php.executablePath": "C:/xampp/php/php.exe",
    "files.eol": "\n",
    "git.autofetch": true,
    "python.pythonPath": "D:\\anaconda\\python.exe",
    "window.zoomLevel": 1,
  }
~~~

Git: <https://git-scm.com/downloads>

~~~
  # Shell: Git version
  git --version
~~~

Imagemagick: <https://www.imagemagick.org/script/download.php#windows>
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
  # ".gitconfig", ".gitignore" konfigurieren und erstellen
  $ git init
  $ git add .
  $ git commit -am "Projekt start"
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
  $ ./content/imgWeb.ps1
~~~