
# udes_chimie_latex

Template LaTeX (testé avec la distribution texlive 2015 sous Ubuntu 16.04) pour la production de documents (mémoire, thèse, examen général) pour le département de chimie de l'Université de Sherbrooke.

## Pour commencer

Pour compiler, utiliser les commandes:

```
pdflatex -interaction=nonstopmode --shell-escape doc.tex
biber doc
pdflatex -interaction=nonstopmode --shell-escape doc.tex
```

La compilation devrait résulter en un doc.pdf où un tutoriel est présent et aborde ces sujets:
* Ajout de figures;
* Ajout d'équations mathématiques;
* Formattage des nombres et unités;
* Gestion de la bibliographie;
* Ajout de tableaux.

Vous pouvez comparer ce fichier avec le tutoriel.pdf fourni pour déceler les différences dans la compilation.

## Installation

Pour l'installation, seulement copier et coller les fichiers dans le dossier de travail. Les fichiers importants sont:

* udes_chimie.cls: classe LaTeX pour le formattage principal du document;
* udes_chimie.sty: regroupement de package scientifiques (mchem, chemfig, siunitx, etc.) utile à d'autre mise en page;
* doc.tex: fichier tex principal;
* titre.tex: page titre.

## Gestion des métadonnées

La gestion des métadonnées se fait grâce à ces lignes.

```latex
\begin{filecontents*}{\jobname.xmpdata}
\Title{Titre}
\Subject{Sujet}
\Author{Prénom Nom}
\Org{Laboratoire}
\Keywords{Mots clé 1\sep Mots clé 2\sep Mots clé 3}
\end{filecontents*}
```

Si vous voulez changer les métadonnées et que vous avez l'avertissement

```
LaTeX Warning: File `doc.xmpdata' already exists on the system.
               Not generating it from this source.
```

Il suffit seulement de supprimer le fichier .xmpdata et de recompiler.

## Bugs connus

* Selon la version de pdflatex et pdfx, un conflit de caractère peut se produire (une page poubelle avec un caractère sera générée avant la page titre). Pour régler le problème, commenter l'appel de pdfx dans udes_chimie.sty et décommenter l'appel dans udes_chimie.cls.

## À faire / non testé

* Gestion des annexes;
* Compilation sous Windows et Mac OS;
* Compilation avec d'autres versions de texlive.
