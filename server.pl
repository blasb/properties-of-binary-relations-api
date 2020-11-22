:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- multifile http_json/1.
:- [properties]. % Se importa el archivo con los predicados de las propiedades.

% Para soportar navegadores
http_json:json_type('application/x-javascript').
http_json:json_type('text/javascript').
http_json:json_type('text/x-javascript').
http_json:json_type('text/x-json').

% SERVER

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- http_handler(/, say_hi, [methods([post])]).

say_hi(Request) :-
    http_read_json_dict(Request, _{conjunto:S, relacion:R}),
    resolve(S,R,JSON),
    reply_json_dict(JSON).

resolve(S,R,_{reflexiva:REF, simetrica:SYM, antisimetrica:ANTI, transitiva: TRANS}) :- 
    ((reflexive(S,R), REF = true); REF = false),
    ((symmetric(R), SYM = true); SYM = false),
    ((antisymmetric(R), ANTI = true); ANTI = false),
    ((transitive(R), TRANS = true); TRANS = false).