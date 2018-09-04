module View.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onMouseOver, onMouseOut)

import Model exposing (..)
import Message exposing (Message)

import View.HomePage as HomePage


view : Model -> Document Message
view model = 
  { title = "Fused Glass Art"
  , body = [ div [ class "top-level" ]
                 [ sideBar model.sideBar
                 , body model 
                 ]
           ]
  }


body : Model -> Html Message
body model =
  case model.currentPage of

    Home -> HomePage.homePage

    other -> 
      div [] [text "page not implemented!"]


sideBar : SideBar -> Html Message
sideBar sb =
  div [ class "sidebar" ] 
      (List.map navButton sb.buttons)


navButton : Page -> Html Message
navButton page =
  let 
    label = buttonLabel page
  in
    div [ class "nav-button" ] [ text label ]


buttonLabel : Page -> String
buttonLabel page =
  case page of
    Home -> "Home"
    Etsy -> "Etsy"
    Product Mezuzot -> "Mezuzot"
    Product Jewelry -> "Jewelry"
    Product Bottles -> "Wine Bottles"
    Product PhotoHolders -> "Photo Holders"
    Shows -> "Shows & Fairs"
    About -> "About Gila"
    Contact -> "Contact Us"