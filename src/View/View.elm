module View.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

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

    Home -> 
      HomePage.homePage model.home

    other -> 
      div [] [text "page not implemented!"]


sideBar : SideBar -> Html Message
sideBar sb =
  div [ class "sidebar" ] 
      (List.map navButton (List.map buttonName sb.buttons))


navButton : String -> Html Message
navButton label =
  div [ class "nav-button" ] 
      [ text label ]


buttonName : Page -> String
buttonName page =
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