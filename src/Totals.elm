module Totals exposing (Model, init, view, Msg(UpdateRed), update)

import Html exposing (..)
import Html.Attributes exposing (..)

(=>) : a -> b -> ( a, b )
(=>) = (,)

type alias Model =
  { redNum : Int,
    foo: String
  }

init : Model
init =
  Model 0 "Foo"

view : Model -> Html Msg
view model =
  div [style ["color" => "red"]][text <| "Red val: " ++ (toString model.redNum)]

type Msg
  = NoOp
  | UpdateRed Int

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp ->
      model
    UpdateRed redNum ->
      { model | redNum = redNum }
