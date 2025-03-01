
// ==UserScript==
// @name         NO copyright！
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Blocking additional copyright information
// @author       mingy
// @match        https://leetcode.cn/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=leetcode.cn// @grant        none
// ==/UserScript==




(function() {
document.addEventListener('copy', e => {
    e.stopImmediatePropagation();
}, true);})();
