module Main exposing (..)

import Browser
import Maybe exposing (..)
import Platform.Cmd as Cmd exposing (Cmd)

import Model exposing (..)
import Message exposing (Message)
import View


initialModel =
  { currentPage = Home
    { highlightedPhoto = Nothing
    }
  }


main = Browser.document
  { init = init
  , subscriptions = (\_ -> Sub.none)
  , update = update
  , view = View.view
  }


init : () -> (Model, Cmd Message)
init _ = (initialModel, Cmd.none)


update : Message -> Model -> (Model, Cmd Message)
update message model = (initialModel, Cmd.none)

