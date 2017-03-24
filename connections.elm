import Html exposing (..)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL

type alias Dot = 
  { x : Int
  , y : Int
  }

type alias Connection =
  { dotA : Dot
  , dotB : Dot
  , connected : Bool
  }

type alias Model =
  { connections : List Connection }

dot1 = Dot 0 0
dot2 = Dot 1 0

model : Model
model =
  Model [ Connection dot1, dot2, False ]

-- VIEW

connectionView : Connection -> Html Msg
connectionView connection =
  let
    buttonText =
      if connection.connected then
        "-"
      else
        ""
  in
    div []
      [
        span [] [ text "*" ],
        button [ onClick Connect ] [ text buttonText ],
        span [] [ text "*" ]
      ]

view : Model -> Html Msg
view model =
  div [] ( List.map connectionView model.connections )

-- UPDATE

type Msg =
  Connect

update : Msg -> Model -> model
update msg model =
  case msg of
    Connect ->
      model
