module Ui.Styles.Tagger exposing (style)

import Css.Properties exposing (..)
import Css exposing (..)

import Ui.Styles.Theme as Theme exposing (Theme)
import Ui.Styles.IconButton as IconButton
import Ui.Styles.Container as Container
import Ui.Styles.Mixins as Mixins
import Ui.Styles.Input as Input

style : Theme -> Node
style theme =
  mixin
    [ IconButton.style theme
    , Container.style theme
    , Input.style theme
    , selector "ui-tagger"
      [ Mixins.defaults

      , fontFamily theme.fontFamily
      , display inlineBlock

      , selector "> ui-container"
        [ marginBottom (px 5)

        , selector "ui-icon-button[size=medium]"
          [ flex_ (zero . zero . (px 36))
          , padding zero
          ]

        , selector "input"
          [ flex_ "1"
          ]
        ]

      , selector "ui-tagger-tags"
        [ display block
        , margin (zero . (px -5))
        ]

      , selector "ui-tagger-tag"
        [ margin (px 5)

        , backgroundColor theme.colors.gray.color
        , borderRadius theme.borderRadius
        , color theme.colors.gray.bw
        , padding (zero . (px 10))
        , display inlineBlock
        , lineHeight (px 38)
        , alignItems center
        , fontWeight bold
        , height (px 36)

        , selector "svg"
          [ marginLeft (px 10)
          , fill currentColor
          , cursor pointer
          , height (px 12)
          , width (px 12)

          , selector "&:focus"
            [ fill theme.colors.focus.color
            , outline none
            ]

          , selector "&:hover"
            [ fill theme.colors.primary.color
            ]
          ]
        ]

      , selector "&[readonly]"
        [ Mixins.readonly

        , selector "ui-icon-button"
          [ pointerEvents none
          ]
        ]

      , selector "&[disabled]"
        [ Mixins.disabled ]
      ]
    ]