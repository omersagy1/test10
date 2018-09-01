module Asset exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (src)


imagesrc : String -> Attribute a
imagesrc fileName = src ("images/" ++ fileName ++ ".jpg")