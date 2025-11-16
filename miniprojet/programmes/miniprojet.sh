#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Le script attend exactement un argument"
	exit 1
fi

fichier_urls=$1

echo "<html>
  <head>
    <meta charset="UTF-8" />
    <title>Programmation et Projet Encadré</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css"
    />
  </head>
  <body>
    <div class="container is-fluid">
      <figure class="image">
        <img src="../images/plurital-logo.jpg" />
      </figure>
      <nav class="navbar mb-6" role="navigation" aria-label="main navigation">
        <div id="navbarBasicExample" class="navbar-menu">
          <div class="navbar-start">
            <a class="navbar-item" href="../../index.html"> Accueil </a>
            <a class="navbar-item"> Script </a>
            <a class="navbar-item has-background-info-light"> Tableaux </a>
          </div>
        </div>
      </nav>
      <table class="table mx-auto">
        <thead>
          <tr>
            <th><abbr title="Index">index</abbr></th>
            <th>url</th>
            <th><abbr title="Code">http code</abbr></th>
            <th><abbr title="Encoding">encodage</abbr></th>
            <th><abbr title="Words">nombre de mots</abbr></th>
          </tr>
        </thead>
        <tbody>"

lineno=1
while read -r line
do
	data=$(curl -s -i -L -w "%{http_code}\n%{content_type}" -o ./.data.tmp $line)
	http_code=$(echo "$data" | head -1)
	encoding=$(echo "$data" | tail -1 | grep -Po "charset=\S+" | cut -d"=" -f2)

	if [ -z "${encoding}" ]
	then
		encoding="N/A" # petit raccourci qu'on peut utiliser à la place du if : encoding=${encoding:-"N/A"}
	fi

	nbmots=$(cat ./.data.tmp | lynx -dump -nolist -stdin | wc -w)

	echo -e "			<tr class="is-light">
            <th>$lineno</th>
            <td>
              <a
                href="$line"
                target="_blank"
                rel="noopener noreferrer"
                >$line</a
              >
            </td>
            <td>$http_code</td>
            <td>$encoding</td>
            <td>$nbmots</td>
          </tr>"

	lineno=$(expr $lineno + 1)
done < $fichier_urls

echo "		</tbody>
      </table>
    </div>
  </body>
</html>"


rm ./.data.tmp
