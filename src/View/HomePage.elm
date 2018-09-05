module View.HomePage exposing (bio, blurb, homePage, mainBody, photoHolders, productCategories, productCategory, productTitle)

import Html exposing (Html, a, div, img, text)
import Html.Attributes exposing (class, href, src, target)
import Message exposing (Message)
import Model exposing (..)
import View.Asset as Asset exposing (imagesrc)
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
        [ productCategory Mezuzot "mezuzah_page"
        , productCategory Jewelry "jewelry_page"
        , productCategory Bottles "wine_page"
        , photoHolders
        ]


productCategory : Product -> String -> Html Message
productCategory product imgFile =
    div [ class "product-category" ]
        [ productTitle product
        , div [ class "product-image-container" ]
            [ a [ href (Asset.link (Product product)) ]
                [ div [ class "product-image-frame" ]
                    [ img [ class "product-image", imagesrc imgFile ] [] ]
                ]
            ]
        ]


photoHolders : Html Message
photoHolders =
    div [ class "product-category" ]
        [ productTitle PhotoHolders
        , div [ class "product-image-container" ]
            [ a [ href (Asset.link (Product PhotoHolders)) ]
                [ div [ class "product-image-frame" ]
                    [ div [ class "photo-holders" ]
                        [ img [ class "photo-holder", imagesrc "holder_page_1" ] []
                        , img [ class "photo-holder", imagesrc "holder_page_2" ] []
                        , img [ class "photo-holder", imagesrc "holder_page_3" ] []
                        ]
                    ]
                ]
            ]
        ]


productTitle : Product -> Html a
productTitle product =
    let
        title =
            case product of
                Mezuzot ->
                    "Mezuzot"

                Jewelry ->
                    "Jewelry"

                Bottles ->
                    "Flattened Wine Bottles"

                PhotoHolders ->
                    "Photo Holders"
    in
    a [ href (Asset.link (Product product)) ]
        [ div [ class "product-title" ] [ text title ]
        ]
