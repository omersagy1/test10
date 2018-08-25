module View exposing (view)

import Browser exposing (Document)
import Html exposing (div, text)
import Html.Attributes exposing (class)

import Model exposing (Model)
import Message exposing (Message)


view : Model -> Document Message
view model = 
  { title = "Another Title??"
  , body = 
    [
      div [class "tx"] 
          [text "hello world"]
    ]
  }