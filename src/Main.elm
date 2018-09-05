module Main exposing (changeUrl, clickedLink, init, main, routeParser, update, urlChanged)

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav
import Debug
import Maybe exposing (..)
import Message exposing (Message)
import Model exposing (..)
import Platform.Cmd as Cmd exposing (Cmd)
import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s, string)
import View.View as View


main =
    Browser.application
        { init = init
        , view = View.view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = Message.ClickedLink
        , onUrlChange = Message.UrlChanged
        }


init : () -> Url -> Nav.Key -> ( Model, Cmd Message )
init flags url key =
    let
        initialModel =
            { key = key
            , currentPage = Home
            , sideBar =
                { buttons =
                    [ Home
                    , Etsy
                    , Product Mezuzot
                    , Product Jewelry
                    , Product PhotoHolders
                    , Product Bottles
                    , Shows
                    , About
                    , Contact
                    ]
                }
            }
    in
    changeUrl url initialModel


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case ( message, model.currentPage ) of
        ( Message.ClickedLink urlRequest, _ ) ->
            clickedLink urlRequest model

        ( Message.UrlChanged url, _ ) ->
            urlChanged url model

        ( Message.Navigate page, _ ) ->
            ( { model | currentPage = page }, Cmd.none )


clickedLink : UrlRequest -> Model -> ( Model, Cmd Message )
clickedLink urlRequest model =
    case urlRequest of
        Browser.Internal url ->
            changeUrl url model

        Browser.External url ->
            ( model, Nav.load url )


changeUrl : Url -> Model -> ( Model, Cmd Message )
changeUrl url model =
    ( model, Nav.pushUrl model.key (Url.toString url) )


urlChanged : Url -> Model -> ( Model, Cmd Message )
urlChanged url model =
    let
        page =
            Maybe.withDefault Home (parse routeParser url)
    in
    update (Message.Navigate page) model


routeParser : Parser (Page -> a) a
routeParser =
    oneOf
        (List.map (\p -> map p (s (pathForPage p)))
            [ Home
            , Product Mezuzot
            , Product Jewelry
            , Product Bottles
            , Product PhotoHolders
            ]
        )
