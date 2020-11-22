# API para consultar las propiedades de una relación binaria

## Descripción

API que recibe en formato json un conjunto A y una relación R de A en A y devuelve en formato json si R es reflexiva, simétrica, antisimétrica y transitiva.

## Ejemplo

Si se recibe en el body de un post el siguiente json:

```json
{ 
    "conjunto": ["a","b","c"],
    "relacion": [ ["a","a"], ["b","b"], ["a","b"], ["b","a"], ["b","c"], ["c","b"] ]
}
```

El resultado será:
```json
{
    "antisimetrica": true,
    "reflexiva": false,
    "simetrica": true,
    "transitiva": true
}
```

## Modo de uso

Para levantar el servidor localmente:

- Si se tiene `swipl` instalado ejecutar `swipl -g "server(<port>)." server.pl` indicando el puerto. Por ejemplo: `swipl -g "server(5000)." server.pl`
- Si no se tiene swipl se puede iniciar la aplicación en un docker container ejecutando `./run-container <port>` indicando el puerto. Ejemplo: `./run-container 5000`. El contenedor se elimina una vez se cierra la aplicación.

Para usar la API:
- Enviar por post request a `http://localhost:<port>`.
