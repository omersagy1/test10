module Main exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav
import Maybe exposing (..)
import Platform.Cmd as Cmd exposing (Cmd)
import Url exposing (Url)

import Model exposing (..)
import Message exposing (Message)
import View.View as View


main = Browser.application
  { init = init
  , view = View.view
  , update = update
  , subscriptions = (\_ -> Sub.none)
  , onUrlRequest = onUrlRequest
  , onUrlChange = onUrlChange
  }


init : () -> Url -> Nav.Key -> (Model, Cmd Message)
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
    (initialModel, Cmd.none)


update : Message -> Model -> (Model, Cmd Message)
update message model = (updateModel message model, Cmd.none)


onUrlRequest : UrlRequest -> Message
onUrlRequest urlRequest = Message.Navigate Home


onUrlChange : Url -> Message
onUrlChange url = Message.Navigate Home


updateModel : Message -> Model -> Model
updateModel message model =
  case (message, model.currentPage) of

    (Message.Navigate page, _) -> 
      model
