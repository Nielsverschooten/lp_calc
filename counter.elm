module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import String


type alias Model =
    { lp_1 : Int
    , lp_2 : Int
    , counter : Maybe String
    }


initialModel : Model
initialModel =
    { lp_1 = 8000, lp_2 = 8000, counter = Nothing }


main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }


type Msg
    = Add String



-- | Reset


update msg model =
    case msg of
        Add s ->
            case String.left 1 s of
                "0" ->
                    case model.counter of
                        Nothing ->
                            model

                        Just counter ->
                            { model | counter = Just (counter ++ s) }

                _ ->
                    case model.counter of
                        Nothing ->
                            { model | counter = Just s }

                        Just counter ->
                            { model | counter = Just (counter ++ s) }



--    Reset ->
--        initialModel


view model =
    let
        counter =
            case model.counter of
                Nothing ->
                    "0"

                Just c ->
                    c
    in
        div []
            [ div []
                [ div [] [ text (toString model.lp_1) ]
                , div [] [ text counter ]
                , div [] [ text (toString model.lp_2) ]
                ]
            , div []
                [ button [ onClick (Add "0") ] [ text "0" ]
                , button [ onClick (Add "00") ] [ text "00" ]
                , button [ onClick (Add "000") ] [ text "000" ]
                , button [ onClick (Add "1") ] [ text "1" ]
                , button [ onClick (Add "2") ] [ text "2" ]
                , button [ onClick (Add "3") ] [ text "3" ]
                , button [ onClick (Add "4") ] [ text "4" ]
                , button [ onClick (Add "5") ] [ text "5" ]
                , button [ onClick (Add "6") ] [ text "6" ]
                , button [ onClick (Add "7") ] [ text "7" ]
                , button [ onClick (Add "8") ] [ text "8" ]
                , button [ onClick (Add "9") ] [ text "9" ]

                --    , button [ onClick Reset] [ text "Reset"]
                ]
            ]
