// ==UserScript==
// @name         solveCopy
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  复制文字带版权信息小尾巴
// @author       brgihtspark
// @match        https://*.zhihu.com/*
// @match        https://*.acwing.com/*
// @match        https://*/*
// ==/UserScript==

(function() {
    [...document.querySelectorAll('*')].forEach(item=>{
        item.oncopy = function(e) {
            e.stopPropagation();
        }
    });
})();
