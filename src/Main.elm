module Main exposing (..)

import Browser
import Platform.Cmd as Cmd exposing (Cmd)

import Model exposing (Model)
import Message exposing (Message)
import View


main = Browser.document
  { init = init
  , subscriptions = (\_ -> Sub.none)
  , update = update
  , view = View.view
  }


init : () -> (Model, Cmd Message)
init _ = ({}, Cmd.none)


update : Message -> Model -> (Model, Cmd Message)
update message model = ({}, Cmd.none)

