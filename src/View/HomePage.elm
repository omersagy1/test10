module View.HomePage exposing (..)

import Html exposing (Html, div, text, img)
import Html.Attributes exposing (class, src)

import Asset exposing (imagesrc)
import Model exposing (..)
import Message exposing (Message)

import View.Text as Text


homePage : Html Message
homePage =
  div [ class "homepage" ] 
      [ mainBody ]


mainBody : Html Message
mainBody =
  div [ class "main-body" ]
      [ div [ class "main-title" ] [ text "Gila Sagy Fused Glass Art" ]
      , bio
      , productCategories
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


productCategories : Html Message
productCategories =
  div [ class "product-categories" ]
      [ mezuzot
      , productCategory "Jewelry" "jewelry_page"
      , productCategory "Flat Wine Bottles" "wine_page"
      -- , photoHolders
      ]


productCategory : String -> String -> Html Message
productCategory name imgFile =
  div [ class "product-category" ]
      [ productTitle name
      , div [ class "product-image-frame" ]
            [ img [ class "product-image", imagesrc imgFile ] [] ]
      ]


mezuzot : Html Message
mezuzot =
  div [ class "product-category" ]
      [ productTitle "Mezuzot"
      , div [ class "product-image-frame" ]
            [ img [ class "product-image", imagesrc "mezuzah_page" ] [] ]
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