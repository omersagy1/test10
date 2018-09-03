module Main exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav
import Maybe exposing (..)
import Platform.Cmd as Cmd exposing (Cmd)
import Url exposing (Url)

import Model exposing (..)
import Message exposing (Message, HomeMessage)
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
    
    (Message.HighlightNavButton page, _) ->
      { model | sideBar = highlightNavButton page model.sideBar }
    
    (Message.ClearNavHighlight, _) ->
      { model | sideBar = clearNavHighlight model.sideBar }

    (Message.Home homeMessage, Home) -> 
      { model | home = updateHomePage homeMessage model.home }

    (_, _) -> model


highlightNavButton : Page -> SideBar -> SideBar
highlightNavButton page sideBar =
  { sideBar | highlightedPage = Just page }


clearNavHighlight : SideBar -> SideBar
clearNavHighlight sideBar =
  { sideBar | highlightedPage = Nothing }


updateHomePage : HomeMessage -> HomePage -> HomePage
updateHomePage message page = page