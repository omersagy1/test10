module Model exposing (..)


type alias Model = 
  { currentPage : Page
  }


type Page = Home HomePage
            | Etsy
            | ProductPage Product
            | Shows
            | About
            | Contact


type Product = Mezuzah
               | Jewelry
               | PhotoHolder
               | Bottle


type alias HomePage =
  { highlightedPhoto : Maybe Product
  }
