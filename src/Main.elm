module Main exposing (..)

import Browser
import Platform.Cmd as Cmd exposing (Cmd)

import Model exposing (Model)
import Message exposing (Message)
import Html exposing (div, text)
import Html.Attributes exposing (class)


main = Browser.document
  { init = init
  , subscriptions = (\_ -> Sub.none)
  , update = update
  , view = view
  }


init : () -> (Model, Cmd Message)
init _ = ({}, Cmd.none)


update : Message -> Model -> (Model, Cmd Message)
update message model = ({}, Cmd.none)


view model = 
  { title = "Another Title??"
  , body = 
    [
      div [class "tx"] 
          [text "hello world"]
    ]
  }