module Ui.Container exposing
  ( Model, view, render
  , row, rowStart, rowCenter, rowEnd
  , column, columnStart, columnCenter, columnEnd )

{-| Flexbox container component.

# Model
@docs Model

# View
@docs view, render

# Row
@docs row, rowStart, rowEnd, rowCenter

# Column
@docs column, columnStart, columnEnd, columnCenter
-}

import Html.Attributes exposing (classList)
import Html exposing (node)
import Html.Lazy


{-| Representation of a container:
  - **align** - Either "start", "center", "space-between", "space-around" or "end"
  - **compact** - Whether or not to have spacing between the children
  - **direction** - Either "row" or "column"
-}
type alias Model =
  { direction : String
  , align : String
  , compact : Bool
  }


{-| Lazily renders a container.

    Ui.Container.view
      { direction = "row", align = "start", compact = False }
      attributes
      children
-}
view : Model -> List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
view model attributes children =
  Html.Lazy.lazy3 render model attributes children


{-| Renders a container.

    Ui.Container.render
      { direction = "row", align = "start", compact = False }
      attributes
      children
-}
render : Model -> List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
render model attributes children =
  node "ui-container" ([ classes model ] ++ attributes) children


{-| Lazily renders a container as a row.
-}
row : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
row attributes children =
  Html.Lazy.lazy3 render rowOptions attributes children


{-| Lazily renders a container as a row with content aligned to start.
-}
rowStart : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
rowStart attributes children =
  Html.Lazy.lazy3 render { rowOptions | align = "start" } attributes children


{-| Lazily renders a container as a row with content aligned to center.
-}
rowCenter : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
rowCenter attributes children =
  Html.Lazy.lazy3 render { rowOptions | align = "center" } attributes children


{-| Lazily renders a container as a row with content aligned to end.
-}
rowEnd : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
rowEnd attributes children =
  Html.Lazy.lazy3 render { rowOptions | align = "end" } attributes children


{-| Lazily renders a container as a column.
-}
column : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
column attributes children =
  Html.Lazy.lazy3 render columnOptions attributes children


{-| Lazily renders a container as a column with content aligned to start.
-}
columnStart : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
columnStart attributes children =
  Html.Lazy.lazy3 render { columnOptions | align = "start" } attributes children


{-| Lazily renders a container as a column with content aligned to center.
-}
columnCenter : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
columnCenter attributes children =
  Html.Lazy.lazy3 render { columnOptions | align = "center" } attributes children


{-| Lazily renders a container as a column with content aligned to end.
-}
columnEnd : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
columnEnd attributes children =
  Html.Lazy.lazy3 render { columnOptions | align = "end" } attributes children


{-| Options for row.
-}
rowOptions : Model
rowOptions =
  { direction = "row"
  , compact = False
  , align = "start"
  }


{-| Options for column.
-}
columnOptions : Model
columnOptions =
  { direction = "column"
  , compact = False
  , align = "start"
  }


{-| Returns classes for a container.
-}
classes : Model -> Html.Attribute msg
classes model =
  classList
    [ ( "direction-" ++ model.direction, True )
    , ( "align-" ++ model.align, True )
    , ( "compact", model.compact )
    ]
