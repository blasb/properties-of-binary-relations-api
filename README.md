# API para consultar las propiedades de una relacion binaria

## Descripcion

API que recibe un json con un conjunto A y una relacion R de A en A y devuelve un json determinando si R es reflexiva, simetrica, antisimetrica y transitiva.

## Ejemplo

Si se recibe en el body de un post el siguiente json:

```json
{ 
    "conjunto": ["a","b","c"],
    "relacion": [ ["a","a"], ["b","b"], ["a","b"], ["b","a"], ["b","c"], ["c","b"] ]
}
```

El resultado sera:
```json
{
    "antisimetrica": true,
    "reflexiva": false,
    "simetrica": true,
    "transitiva": true
}
```

## Modo de uso

Requisitos:

- Poder correr script bash.
- Tener Docker instalado.

Para crear un contenedor con el servidor corriendo ejecutar `./run-container \<port\>` especificando el puerto que se desee. Ejemplo: `./run-container 5000`.

Enviar por post request a http://localhost:<port\>
  
El contenedor se elimina una vez se cierra la aplicacion.
