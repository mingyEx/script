// ==UserScript==
// @name         leetcode-auto-to-zh
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  自动换成中文版
// @author       SpiceEx
// @match        https://leetcode.com/problems/*
// @icon         https://www.google.com/s2/favicons?domain=tampermonkey.net
// @grant        none
// @license MIT
// ==/UserScript==

(function() {
    'use strict';
    // more https://stackoverflow.com/questions/503093/how-do-i-redirect-to-another-webpage
    // https://www.tampermonkey.net/documentation.php#_match
    window.location.replace(`${location.origin.replace("com", "cn/classic")}${location.pathname}`);

})();
