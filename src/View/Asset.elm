module View.Asset exposing (imagesrc, link)

import Html exposing (Attribute)
import Html.Attributes exposing (src)
import Model exposing (..)


imagesrc : String -> Attribute a
imagesrc fileName =
    src ("images/" ++ fileName ++ ".jpg")


link : Page -> String
link page =
    "/" ++ pathForPage page
