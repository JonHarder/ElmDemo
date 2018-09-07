module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Json.Encode exposing (Value)


type alias Model =
    Int


type Msg
    = Increment
    | Decrement
    | Reset


buttonCounter : Msg -> String -> Html Msg
buttonCounter msg string =
    button [ onClick msg ]
        [ text string ]


view : Model -> Html Msg
view model =
    div []
        [ buttonCounter Decrement "-"
        , span []
            [ text (String.fromInt model) ]
        , buttonCounter Increment "+"
        , div []
            [ buttonCounter Reset "reset" ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        Reset ->
            ( 0, Cmd.none )


init : flags -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Value Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
