module Model exposing (..)


type alias Model = 
  { currentPage: Page
  , home: HomePage
  , sideBar: SideBar
  }


type alias SideBar =
  { buttons: List Page
  , highlightedPage: Maybe Page
  }


type Page = Home
            | Etsy
            | Product Product
            | Shows
            | About
            | Contact


type Product = Mezuzot
               | Jewelry
               | PhotoHolders
               | Bottles


type alias HomePage =
  { highlightedPhoto : Maybe Product
  }
