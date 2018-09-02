module Main exposing (..)

import Browser
import Maybe exposing (..)
import Platform.Cmd as Cmd exposing (Cmd)

import Model exposing (..)
import Message exposing (Message, HomeMessage)
import View.View as View


initialModel =
  { currentPage = Home
  , home =
    { highlightedPhoto = Nothing
    }
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
    , highlightedPage = Nothing
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
update message model = (updateModel message model, Cmd.none)


updateModel : Message -> Model -> Model
updateModel message model =
  case (message, model.currentPage) of

    (Message.Navigate page, _) -> 
      model

    (Message.Home homeMessage, Home) -> 
      { model | home = updateHomePage homeMessage model.home }

    (_, _) -> model


updateHomePage : HomeMessage -> HomePage -> HomePage
updateHomePage message page = page