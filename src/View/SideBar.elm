module View.SideBar exposing (..)

import Html exposing (Html, div, text, img)
import Html.Attributes exposing (class, src)

import Message exposing (Message)
import Model exposing (..)


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
