module HomePage exposing (..)

import Html exposing (Html, div, text, img)
import Html.Attributes exposing (class, src)

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
      , mainBody pageModel.highlightedPhoto
      ]


sideBar : Maybe Product -> Html Message
sideBar highlightedProduct =
  div [ class "sidebar" ] 
      (List.map navButton buttonNames)


navButton : String -> Html Message
navButton label =
  div [ class "nav-button" ] 
      [ text label ]


mainBody : Maybe Product -> Html Message
mainBody highlightedPhoto =
  div [ class "main-body" ]
      [ div [ class "main-title" ] [ text "Gila Sagy Fused Glass Art" ]
      , bio
      ]


bio : Html a
bio =
  div [ class "bio" ]
      [ div [ class "artist-image-frame" ]
            [ img [ class "artist-image", src "artist.jpeg" ] [] ]
      , blurb
      ]

blurb =
  div [ class "blurb" ]
      [ text "One-of-a-kind hand-made glass pieces, from Mezuzot to Necklaces, Earrings, and Photo Holders. Each piece is carefully crafted by Gila Sagy in her California studio. Please browse, enjoy, and contact us to place a custom order, or visit our online Etsy store."
      ]