module Message exposing (..)

import Browser exposing (UrlRequest)
import Url exposing (Url)

import Model exposing (..)


type Message = ClickedLink UrlRequest
               | UrlChanged Url
               | Navigate Page
