module Message exposing (..)

import Model exposing (..)


type Message = Navigate Page
               | Home HomeMessage


type HomeMessage = HighlightCategory Product
                   | HighlightNavButton Page

