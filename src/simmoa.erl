%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc TEMPLATE.

-module(simmoa).
-author('author <author@example.com>').
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the simmoa server.
start() ->
    simmoa_deps:ensure(),
    ensure_started(crypto),
    application:start(simmoa).

%% @spec stop() -> ok
%% @doc Stop the simmoa server.
stop() ->
    Res = application:stop(simmoa),
    application:stop(crypto),
    Res.
