// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://en.cppreference.com/*
// @icon         https://www.google.com/s2/favicons?domain=tampermonkey.net
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // more https://stackoverflow.com/questions/503093/how-do-i-redirect-to-another-webpage
    // https://www.tampermonkey.net/documentation.php#_match
    window.location.replace(`${location.origin.replace('en', 'ja')}${location.pathname}`);

})();
