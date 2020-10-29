define("ace/mode/assemblyhal_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,t,n){"use strict";var r=e("../lib/oop"),i=e("./text_highlight_rules").TextHighlightRules,s=function(){this.$rules={start:[{include:"#main"}],"#main":[{token:"comment.assemblyhal",regex:/#.*/},{token:"entity.name.function.assemblyhal",regex:/\w+:/},{token:"entity.name.function.assemblyhal",regex:/@\w+[\x003c\x003e]?/},{token:"string.assemblyhal",regex:/PUT\s/},{token:"string.assemblyhal",regex:/(?:N?AND|ORN?|ADD|MUL|DIV|XOR|SHIFT[LR]|INV|POW|SUB|CP|RAND)\s/},{token:"string.assemblyhal",regex:/(?:LD|ST)\s/},{token:"string.assemblyhal",regex:/DISP(?:RC[LMR]|RH[LR]|C[LMR])\s/},{token:"string.assemblyhal",regex:/(?:BNEG|BZERO|BA|SETHI|SETLO)\s/},{token:"variable.assemblyhal",regex:/\$r[0-9B-F]/},{token:"variable.other.constant.assemblyhal",regex:/\$(?:RET|m[1-3]|d[B-F]|dAD|dVAL|dPC|dIR|PC|IR)/},{token:"constant.numeric.assemblyhal",regex:/\b\d+/},{token:"constant.numeric.assemblyhal",regex:/"(?:[01]{1,5}|[01]{8}|[01]{16})"/},{token:"constant.numeric.assemblyhal",regex:/x"(?:[0-9A-F]{1,2}|[0-9A-F]{4})"/},{token:"invalid.assemblyhal",regex:/\$(?:rA|dA)/}]},this.normalizeRules()};s.metaData={fileTypes:["assh"],name:"assemblyhal",scopeName:"source.assemblyhal"},r.inherits(s,i),t.assemblyhalHighlightRules=s}),define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(e,t,n){"use strict";var r=e("../../lib/oop"),i=e("../../range").Range,s=e("./fold_mode").FoldMode,o=t.FoldMode=function(e){e&&(this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+e.start)),this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+e.end)))};r.inherits(o,s),function(){this.foldingStartMarker=/([\{\[\(])[^\}\]\)]*$|^\s*(\/\*)/,this.foldingStopMarker=/^[^\[\{\(]*([\}\]\)])|^[\s\*]*(\*\/)/,this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/,this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/,this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/,this._getFoldWidgetBase=this.getFoldWidget,this.getFoldWidget=function(e,t,n){var r=e.getLine(n);if(this.singleLineBlockCommentRe.test(r)&&!this.startRegionRe.test(r)&&!this.tripleStarBlockCommentRe.test(r))return"";var i=this._getFoldWidgetBase(e,t,n);return!i&&this.startRegionRe.test(r)?"start":i},this.getFoldWidgetRange=function(e,t,n,r){var i=e.getLine(n);if(this.startRegionRe.test(i))return this.getCommentRegionBlock(e,i,n);var s=i.match(this.foldingStartMarker);if(s){var o=s.index;if(s[1])return this.openingBracketBlock(e,s[1],n,o);var u=e.getCommentFoldRange(n,o+s[0].length,1);return u&&!u.isMultiLine()&&(r?u=this.getSectionRange(e,n):t!="all"&&(u=null)),u}if(t==="markbegin")return;var s=i.match(this.foldingStopMarker);if(s){var o=s.index+s[0].length;return s[1]?this.closingBracketBlock(e,s[1],n,o):e.getCommentFoldRange(n,o,-1)}},this.getSectionRange=function(e,t){var n=e.getLine(t),r=n.search(/\S/),s=t,o=n.length;t+=1;var u=t,a=e.getLength();while(++t<a){n=e.getLine(t);var f=n.search(/\S/);if(f===-1)continue;if(r>f)break;var l=this.getFoldWidgetRange(e,"all",t);if(l){if(l.start.row<=s)break;if(l.isMultiLine())t=l.end.row;else if(r==f)break}u=t}return new i(s,o,u,e.getLine(u).length)},this.getCommentRegionBlock=function(e,t,n){var r=t.search(/\s*$/),s=e.getLength(),o=n,u=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/,a=1;while(++n<s){t=e.getLine(n);var f=u.exec(t);if(!f)continue;f[1]?a--:a++;if(!a)break}var l=n;if(l>o)return new i(o,r,l,t.length)}}.call(o.prototype)}),define("ace/mode/assemblyhal",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/assemblyhal_highlight_rules","ace/mode/folding/cstyle"],function(e,t,n){"use strict";var r=e("../lib/oop"),i=e("./text").Mode,s=e("./assemblyhal_highlight_rules").assemblyhalHighlightRules,o=e("./folding/cstyle").FoldMode,u=function(){this.HighlightRules=s,this.foldingRules=new o};r.inherits(u,i),function(){this.$id="ace/mode/assemblyhal"}.call(u.prototype),t.Mode=u});
                (function() {
                    window.require(["ace/mode/assemblyhal"], function(m) {
                        if (typeof module == "object" && typeof exports == "object" && module) {
                            module.exports = m;
                        }
                    });
                })();
            