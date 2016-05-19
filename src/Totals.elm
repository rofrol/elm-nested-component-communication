module Totals exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias TotalsModel =
  { redNum : Int,
    foo: String
  }

totalsInit : TotalsModel
totalsInit =
  TotalsModel 0 "Foo"

totalsView : TotalsModel -> Html TotalsMsg
totalsView model =
  div [][text ("Red val: " ++ (toString model.redNum))]

type TotalsMsg
  = NoOp
  | UpdateRed Int

totalsUpdate : TotalsMsg -> TotalsModel -> TotalsModel
totalsUpdate msg model =
  case msg of
    NoOp ->
      model
    UpdateRed redNum ->
      let
        model' = { model | redNum = redNum }
      in
        model'
