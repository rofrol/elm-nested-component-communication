module Pair exposing (Model, init, view, Msg(UpdateRed), update, getRedNum)

import Counter
import Html exposing (..)
import Html.Attributes exposing (..)


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


type alias Model =
    { greenCounter : Counter.Model
    , redCounter : Counter.Model
    , totalClickCount : Int
    }


init : Model
init =
    Model (Counter.init 0) (Counter.init 0) 0


view : Model -> Html Msg
view model =
    div [ style [ "background-color" => "lightgray", "margin-bottom" => "1rem" ] ]
        [ div [] [ text <| "Total click count " ++ (toString model.totalClickCount) ]
        , Html.map PairGreen (Counter.view "green" model.greenCounter)
        , Html.map PairRed (Counter.view "red" model.redCounter)
        ]


type Msg
    = PairRed Counter.Msg
    | PairGreen Counter.Msg
    | UpdateRed Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        PairGreen subMsg ->
            { model | greenCounter = Counter.update subMsg model.greenCounter, totalClickCount = model.totalClickCount + 1 }

        PairRed subMsg ->
            { model | redCounter = Counter.update subMsg model.redCounter, totalClickCount = model.totalClickCount + 1 }

        UpdateRed value ->
            { model | redCounter = Counter.update (Counter.SetNum value) model.redCounter }



------- INTEFACE HELPERS


getRedNum : Model -> Int
getRedNum model =
    Counter.getNum model.redCounter
