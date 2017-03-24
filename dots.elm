import Html exposing (..)
import Html.Attributes exposing (..)
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
  , selected : Bool
  }

type alias Model =
  { dots : List Dot }

model : Model
model =
  Model [ Dot 0 0 False
        , Dot 1 0 False
        ]

-- VIEW

dotView : Dot -> Html Msg
dotView dot =
  let
    selectedStyle =
      if dot.selected then
        [("backgroundColor", "red")]
      else
        [("", "")]
  in
    button [ style selectedStyle, onClick (Selected dot)] [ text "*" ]

view : Model -> Html Msg
view model =
  div [] (List.map dotView model.dots)

-- UPDATE

type Msg =
  Selected Dot

update : Msg -> Model -> Model
update msg model =
  case msg of
    Selected selectedDot ->
      { model | dots = List.map (selectDot selectedDot) model.dots }

selectDot : Dot -> Dot -> Dot
selectDot selectedDot dot =
  if selectedDot == dot then
    { dot | selected = True }
  else
    dot
