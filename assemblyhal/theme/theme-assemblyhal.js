define("ace/theme/assemblyhal", ["require", "exports", "module", "ace/lib/dom"], function(e, t, n) {
    t.isDark = !0, t.cssClass = "ace-assemblyhal", t.cssText = `
    /* General Styling */
    .ace-assemblyhal .ace_gutter { background: #1a1a1a;color: #BEBEBE }
    .ace-assemblyhal .ace_print-margin { width: 1px;background: #1a1a1a }
    .ace-assemblyhal { background-color: #0F0F0F;color: #FFFFFF }
    .ace-assemblyhal .ace_cursor {color: #FFFFFF}
    .ace-assemblyhal .ace_marker-layer .ace_selection {background: #6699CC}
    .ace-assemblyhal.ace_multiselect .ace_selection.ace_start {box-shadow: 0 0 3px 0px #0F0F0F;}
    .ace-assemblyhal .ace_marker-layer .ace_step {background: rgb(102, 82, 0)}
    .ace-assemblyhal .ace_marker-layer .ace_bracket {margin: -1px 0 0 -1px;border: 1px solid #404040}
    .ace-assemblyhal .ace_marker-layer .ace_active-line {background: #333333}
    .ace-assemblyhal .ace_gutter-active-line {background-color: #333333}
    .ace-assemblyhal .ace_marker-layer .ace_selected-word {border: 1px solid #6699CC}
    .ace-assemblyhal .ace_invisible {color: #404040}
    /* Language Colors */ /* entity.name.tag */
    .ace-assemblyhal .ace_tag {color: #569CD6}
    .ace-assemblyhal .ace_invalid {color: #F44747}.ace-assemblyhal .ace_string {color: #CE9178}
    .ace-assemblyhal .ace_comment {color: #6A9955}.ace-assemblyhal .ace_variable {color: #9CDCFE}
    .ace-assemblyhal .ace_constant.ace_numeric {color: #99CC99}
    .ace-assemblyhal .ace_constant.ace_other {color: #4FC1FF !important; font-weight: bold}
    .ace-assemblyhal .ace_entity.ace_name.ace_function {color: #DCDCAA}`;
    var r = e("../lib/dom");
    r.importCssString(t.cssText, t.cssClass)
});
(function() {
    window.require(["ace/theme/assemblyhal"], function(m) {
        if (typeof module == "object" && typeof exports == "object" && module) {
            module.exports = m;
        }
    });
})();