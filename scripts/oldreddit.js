// ==UserScript==
// @name         Reddit Old Layout
// @namespace    9bf36c681d35d52913b3bda74ddf6127318ed7b0
// @version      0.1
// @description  Forces usage of the old reddit version
// @author       /u/AyrA_ch
// @match        https://www.reddit.com/*
// @match        https://reddit.com/*
// @grant        none
// @run-at       document-start
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "old.reddit.com";
})();
