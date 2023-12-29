// ==UserScript==
// @name         xhs
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  不进主页，防止推荐
// @author       spiceEx
// @match        https://www.xiaohongshu.com/explore
// @icon         https://www.google.com/s2/favicons?domain=tampermonkey.net
// @grant        none
// @license MIT
// ==/UserScript==
(function() {
    'use strict';
    window.location.replace(`https://www.xiaohongshu.com/notification`);
})();
