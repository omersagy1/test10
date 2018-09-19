module View.Home exposing (bio, blurb, homePage, mainBody, photoHolders, productCategories, productCategory, productTitle)

import Html exposing (Html, a, div, img, span, text)
import Html.Attributes exposing (class, href, src, target)
import Message exposing (Message)
import Model exposing (..)
import View.Asset as Asset exposing (imagesrc)


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
        [ a [ href (Asset.link About) ]
            [ div [ class "artist-image-frame" ]
                [ img [ class "artist-image", imagesrc "artist" ] [] ]
            ]
        , blurb
        ]


blurb =
    div [ class "blurb" ]
        [ artistBlurb ]


artistBlurb : Html a
artistBlurb =
    span []
        [ text "One-of-a-kind hand-made glass pieces, from "
        , a [ href (Asset.link (Product Mezuzot)) ] [ text "Mezuzot" ]
        , text " to "
        , a [ href (Asset.link (Product Jewelry)) ] [ text "Necklaces, Earrings," ]
        , text " and "
        , a [ href (Asset.link (Product PhotoHolders)) ] [ text "Photo Holders." ]
        , text " Each piece is carefully crafted by Gila Sagy in her California studio. Please browse, enjoy, and "
        , a [ href (Asset.link Contact) ] [ text "contact us to place a custom order, " ]
        , a [ href (Asset.link Etsy) ] [ text "visit our online Etsy store," ]
        , text " or "
        , a [ href (Asset.link Shows) ] [ text "stop by in person!" ]
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
                    "Wine Bottle Platters"

                PhotoHolders ->
                    "Photo Holders"
    in
    a [ href (Asset.link (Product product)) ]
        [ div [ class "product-title" ] [ text title ]
        ]
