module App exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Markdown

main =
    Html.beginnerProgram { model = model, view = view, update = update}

--- Model

type alias Model = { content : String }

model : Model
model = { content = "# Hello" }

--- Update

type Msg = Reset | Change String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Reset -> { model | content = "" }
        Change newContent -> { model | content = newContent }

--- View

view : Model -> Html Msg
view model = div []
       [ input [ placeholder "# hello", onInput Change ] []
       , div [] [ Markdown.toHtml [] model.content ]
       ]
