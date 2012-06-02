SIEMPRE LO PRIMERO QUE HAY QUE HACER ANTES DE EDITAR ES:
git pull
SI NO HACE ESO, SUS CAMBIOS NO PODRAN SER ENVIADOS

Como Editar esta Pagina:

1. Localizar el directorio done esta la pagina: cd ~/saimiriWebSite
2. cd saimiriWebSite
3. git pull
3. mate .
4. foreman start

** Con esto se inicia el servidor y abre el editor

5. git add .
6. git commit -m "[detalles de los cambios]"
7. git push origin master

** Luego notificar al administrador que se han hecho cambios para que los publique

Que Editar?

1. En el folder views/posts/ estan todos los posts
2. La primera linea incluye todos los detalles como foto, titulo, etc; Estos deben siempre ir de esa forma
3. Luego de la primera linea se escribe el contenido considerando donde se va publicar ( Modal de 560px de ancho )
4. Referencia del Markup JADE aqui http://jade-lang.com

Textos?

1. Los textos de las paginas se encuentran en /views/index.jade y /views/index-es.jade
2. Los layouts y textos de los Modals se encuentran en /app/views/modals/ ( estos usan el markup .eco muy similar a html )
