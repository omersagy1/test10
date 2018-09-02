module View.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Model exposing (..)
import Message exposing (Message)

import View.HomePage as HomePage
import View.SideBar as SideBar


view : Model -> Document Message
view model = 
  { title = "Fused Glass Art"
  , body = [ div [ class "top-level" ]
                 [ SideBar.sideBar model.sideBar
                 , body model 
                 ]
           ]
  }


body : Model -> Html Message
body model =
  case model.currentPage of

    Home -> 
      HomePage.homePage model.home

    other -> 
      div [] [text "page not implemented!"]
