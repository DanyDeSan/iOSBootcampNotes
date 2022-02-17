# iOSBootcampNotes
This repository contains supporting notes for the iOS Bootcamp of Kodemia

# Instrucciones para hacer un Pull Request (PR) para el ejercicio SOLID

1. Crear una nueva rama desde la rama `main` con el siguiente formato 'nombre_del_equipo'/ejercicio_solid

`git checkout main`
`git checkout -b dany_team/ejercicio_solid`

2. Agregar los cambios al playground que corresponde

`git add Dependency_Inversion_Principle.playground`

3. Hacer commit de los cambios

`git commit -m "Add example of dependency inversion principle"`

4. Subir la rama local al remote

`git push --set-upstream origin dany_team/ejercicio_solid`

5. En github, ir al repositorio, luego a la pestaña pull request y precionar el boton 'Crear un Pull Request'

6. En 'compare' escoger la rama que se acaba de subir y luego precionar pull request.

NOTA: Si aparece la leyenda que no se puede hacer un merge automático. Ir a la seccion de 'Resolver conflictos'
<img width="1218" alt="Captura de Pantalla 2022-02-16 a la(s) 17 48 03" src="https://user-images.githubusercontent.com/14959107/154376713-b77fbce4-40b4-44d9-b251-f438e885a7c8.png">

7. De título del PR poner ['Nombre del equipo'] 'ejercicio_solid_que_tocó'
<img width="934" alt="Captura de Pantalla 2022-02-16 a la(s) 17 51 57" src="https://user-images.githubusercontent.com/14959107/154377091-26617a73-5eb9-4928-bf5a-577cf9d26b0e.png">

8. En el cuerpo del PR poner la explicación del principio SOLID que tocó

9. En la parte de `reviewers` poner a los compañeros del bootcamp
10. En la parte de `Assignees` poner a los compañeros del equipo
11. Finalmente presionar el botón 'Crear Pull Request'

Cuando se obtengan 4 *aproves* de los compañeros del bootcamp, el PR se hará merge a la rama main.

No se olviden de hacer review a los PR de los demás equipos. Si hay algún comentario o sugerencia con respecto al código de algún PR. Dejen un comentario en el PR., recuerden que asi podemos mejorar nuestra manera de hacer código.


# Resolver Conflictos
En caso de que al intentar hacer un PR aparecen conflictos pueden hacer lo siguiente. Terminen de hacer el PR tal y como se describe arriba. Y en la rama local hacer lo siguiente.

1. Pasarse nuevamente a la rama `main`.  Nota: Si no les deja cambiar de rama por que tienen cambios sin terminar, pueden hacer un commit de esos cambios. O hacen un `git stash` para guardar temporalmente sus cambios, y en cuanto hayan terminado todo el proceso, deben de hacer un `git stash pop` para regresar esos cambios.
2. Hacer un git `git pull -r` para bajar los cambios de la rama `main` remoto.
3. Regresarse a su rama donde tienen su trabajo y hacer un `git rebase`. Si no les marca conflictos como 'CONFLICT', pueden saltarse al paso 8
4. Abrir los archivos que están marcados con 'CONFLICT' y ubicar las partes de código que git marca como conflicto.

La recomendación que les doy para resolver conflictos es procurar aplicar los cambios que provienen de la rama `main` y luego aplicar nuevamente los cambios que uno hizo. De esta manera evitamos que el trabajo de los demás se pierda, y tenemos la ventaja que conocemos los cambios que hicimos.

5. Una vez que hayamos terminado de resolver los conflictos. Compilar nuevamente todo para asegurarse de que todo está en orden (en este caso probar el playground). 
6. Agregar todos los archivos resueltos con `git add`.
7. Aplicar el comando `git rebase --continue` para continuar con el rebase
8. Subir la rama actualizada a la rama remota aplicando `git push -f` NOTA: El -f es necesario para forzar a github que tome nuestros cambios locales, ya que para este momento las dos ramas habrán divergido bastante.

Listo, la rama ya debe de esta actualizada y con posibilidad de ser mergeada en la rama main.

