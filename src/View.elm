module View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Model exposing (..)
import Message exposing (Message)
import HomePage


view : Model -> Document Message
view model = 
  { title = "Fused Glass Art"
  , body = [ body model ]
  }


body : Model -> Html Message
body model =
  case model.currentPage of

    Home page -> 
      HomePage.homePage page

    other -> 
      div [] [text "page not implemented!"]
