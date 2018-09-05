module Message exposing (Message(..))

import Browser exposing (UrlRequest)
import Model exposing (..)
import Url exposing (Url)


type Message
    = ClickedLink UrlRequest
    | UrlChanged Url
    | Navigate Page
