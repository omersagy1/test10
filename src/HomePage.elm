module HomePage exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Model exposing (..)
import Message exposing (Message)


buttonNames =
  [ "Etsy Store"
  , "Mezuzot"
  , "Jewelry"
  , "Photo Holders"
  , "Wine Bottles"
  , "Shows & Fairs"
  , "About Gila"
  , "Contact Us"
  ]


homePage : HomePage -> Html Message
homePage pageModel =
  div [ class "homepage" ] 
      [ sideBar pageModel.highlightedPhoto
      ]


sideBar : Maybe Product -> Html Message
sideBar highlightedProduct =
  div [ class "sidebar" ] 
      (List.map navButton buttonNames)


navButton : String -> Html Message
navButton label =
  div [ class "nav-button" ] 
      [ text label ]