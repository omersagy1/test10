module View.HomePage exposing (..)

import Html exposing (Html, div, text, img)
import Html.Attributes exposing (class, src)

import Asset exposing (imagesrc)
import Model exposing (..)
import Message exposing (Message)

import View.Text as Text


homePage : HomePage -> Html Message
homePage pageModel =
  div [ class "homepage" ] 
      [ mainBody pageModel.highlightedPhoto ]


mainBody : Maybe Product -> Html Message
mainBody highlightedPhoto =
  div [ class "main-body" ]
      [ div [ class "main-title" ] [ text "Gila Sagy Fused Glass Art" ]
      , bio
      , productCategories highlightedPhoto
      ]


bio : Html a
bio =
  div [ class "bio" ]
      [ div [ class "artist-image-frame" ]
            [ img [ class "artist-image", imagesrc "artist" ] [] ]
      , blurb
      ]


blurb =
  div [ class "blurb" ]
      [ text Text.artistBlurb
      ]


productCategories : Maybe Product -> Html Message
productCategories highlightedPhoto =
  div [ class "product-categories" ]
      [ productCategory "Mezuzot" "mezuzah_page"
      , productCategory "Jewelry" "jewelry_page"
      , productCategory "Flat Wine Bottles" "wine_page"
      , photoHolders
      ]


productCategory : String -> String -> Html Message
productCategory name imgFile =
  div [ class "product-category" ]
      [ productTitle name
      , div [ class "product-image-frame" ]
            [ img [ class "category-image", imagesrc imgFile ] [] ]
      ]

photoHolders : Html Message
photoHolders = 
  div [ class "product-category" ]
      [ productTitle "Photo Holders"
      , div [ class "photo-holders-frame" ] 
        [ img [ class "photo-holder", imagesrc "holder_page_1" ] []
        , img [ class "photo-holder", imagesrc "holder_page_2" ] []
        , img [ class "photo-holder", imagesrc "holder_page_3" ] []
        ]
      ]


productTitle : String -> Html a
productTitle title =
  div [ class "product-title" ] [ text title ]