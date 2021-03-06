//             HAL8080 Processor               \\
// Kasper, Dennis, Tjeerd, Nick, Oussama 2020  \\
//           AssemblyHal Syntax Theme          \\
// This file describes the colors for the      \\
// syntax highlighting of the assembly hal     \\
// theme.                                      \\

define("ace/theme/assemblyhaltheme", ["require", "exports", "module", "ace/lib/dom"], function(a, e, c) {
    e.isDark = !0, e.cssClass = "ace-vibrant-ink", e.cssText = `
        /* General Styling */
        .ace-vibrant-ink .ace_gutter { background: #1a1a1a;color: #BEBEBE }
        .ace-vibrant-ink .ace_print-margin { width: 1px;background: #1a1a1a }
        .ace-vibrant-ink { background-color: #0F0F0F;color: #FFFFFF }
        .ace-vibrant-ink .ace_cursor {color: #FFFFFF}
        .ace-vibrant-ink .ace_marker-layer .ace_selection {background: #6699CC}
        .ace-vibrant-ink.ace_multiselect .ace_selection.ace_start {box-shadow: 0 0 3px 0px #0F0F0F;}
        .ace-vibrant-ink .ace_marker-layer .ace_step {background: rgb(102, 82, 0)}
        .ace-vibrant-ink .ace_marker-layer .ace_bracket {margin: -1px 0 0 -1px;border: 1px solid #404040}
        .ace-vibrant-ink .ace_marker-layer .ace_active-line {background: #333333}
        .ace-vibrant-ink .ace_gutter-active-line {background-color: #333333}
        .ace-vibrant-ink .ace_marker-layer .ace_selected-word {border: 1px solid #6699CC}
        .ace-vibrant-ink .ace_invisible {color: #404040}
        /* Language Colors */
        .ace-vibrant-ink .ace_keyword,.ace-vibrant-ink .ace_meta {color: #FF6600}
        .ace-vibrant-ink .ace_constant,.ace-vibrant-ink .ace_constant.ace_character,.ace-vibrant-ink .ace_constant.ace_character.ace_escape,.ace-vibrant-ink .ace_constant.ace_other {color: #339999}
        .ace_constant.ace_other {color: #FFCC00 !important}
        .ace-vibrant-ink .ace_constant.ace_numeric {color: #B5CEA8}
        .ace-vibrant-ink .ace_invalid,.ace-vibrant-ink .ace_invalid.ace_deprecated {color: #fc032c}
        .ace-vibrant-ink .ace_fold {background-color: #FFCC00;border-color: #FFFFFF}
        .ace-vibrant-ink .ace_entity.ace_name.ace_function,.ace-vibrant-ink .ace_support.ace_function,.ace-vibrant-ink .ace_variable {color: #FFCC00}
        .ace-vibrant-ink .ace_variable.ace_parameter {font-style: italic}
        .ace-vibrant-ink .ace_string {color: #9933CC}
        .ace-vibrant-ink .ace_string.ace_regexp {color: #44B4CC}
        .ace-vibrant-ink .ace_comment {color: #66FF00}
        .ace-vibrant-ink .ace_entity.ace_other.ace_attribute-name {font-style: italic;color: #99CC99}

        .ace-vibrant-ink .ace_indent-guide {background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAACCAYAAACZgbYnAAAAEklEQVQImWNgYGBgYNDTc/oPAALPAZ7hxlbYAAAAAElFTkSuQmCC) right repeat-y}", a("../lib/dom").importCssString(e.cssText, e.cssClass)
    `
}), window.require(["ace/theme/assemblyhaltheme"], function(a) {
    "object" == typeof module && "object" == typeof exports && module && (module.exports = a)
});