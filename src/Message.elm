module Message exposing (..)

import Model exposing (..)


type Message = Navigate Page
               | HighlightNavButton Page
               | ClearNavHighlight
               | Home HomeMessage


type HomeMessage = HighlightCategory Product

