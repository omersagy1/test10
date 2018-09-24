module Data exposing (shows)

import Date exposing (Date)
import Model exposing (Show)
import Time exposing (Month(..))


shows : List Show
shows =
    [ Show "Capitola Art & Wine Fair" (date 2018 Sep 29) "Booth #403"
    , Show "Walnut Creek Art Walk" (date 2018 Oct 2) "Booth #12"
    , Show "Lafayette Art Expo" (date 2018 Oct 17) "Booth #19"
    ]


date : Int -> Month -> Int -> Date
date =
    Date.fromCalendarDate
