// ==UserScript==
// @name         cppref-zh
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  自动换成中文版
// @author       spiceEx
// @match        https://en.cppreference.com/*
// @icon         https://www.google.com/s2/favicons?domain=tampermonkey.net
// @grant        none
// @license MIT
// ==/UserScript==

(function() {
    'use strict';
    window.location.replace(`${location.origin.replace('en', 'zh')}${location.pathname}`);

})();
