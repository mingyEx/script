// ==UserScript==
// @name         LeetCode-Default-Font
// @namespace    leetcode-default-font
// @version      0.3
// @description  Always use the default monospace font in the codemirror editor.
// @author       fenghaolw@gmail.com
// @include      *://leetcode.cn/*
// ==/UserScript==

(function() {
    'use strict';
    function addGlobalStyle(css) {
        var head, style;
        head = document.getElementsByTagName('head')[0];
        if (!head) { return; }
        style = document.createElement('style');
        style.type = 'text/css';
        style.innerHTML = css;
        head.appendChild(style);
    }
    addGlobalStyle('.CodeMirror { font-family: JetBrains Mono !important; }');
    addGlobalStyle('pre, code, kbd, samp { font-family: JetBrains Mono !important; }');
})();
/*在原版的基础上换成了中文站，以及字体做了一些修改*/
