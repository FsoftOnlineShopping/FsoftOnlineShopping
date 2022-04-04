"use strict";

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var nav__itemList = document.querySelectorAll(".nav__item");
var timer;
nav__itemList.forEach(nav__item => {
  nav__item.addEventListener("mouseover", function (e) {
    document.querySelector(".nav__item.active").classList.remove("active");
    this.classList.add("active");
  }); // Reset to the real-active element

  nav__item.addEventListener("mouseleave", function (e) {
    clearTimeout(timer);
    timer = setTimeout(() => {
      document.querySelector(".real-active").classList.add("active");
      var nav__item_activeList = document.querySelectorAll('.nav__item.active');
      Array.from(nav__item_activeList).forEach(nav__item_active => {
        if (!nav__item_active.classList.contains("real-active")) {
          nav__item_active.classList.remove("active");
        }
      });
    }, 4000);
  });
  nav__item.addEventListener("click", function (e) {
    document.querySelector(".nav__item.active").classList.remove("active");
    this.classList.add("active"); // Add click effect

    this.querySelector(".icon").style.opacity = 0.5;
    this.querySelector(".title").style.opacity = 0.5;
    setTimeout(() => {
      this.querySelector(".icon").style.opacity = 1;
      this.querySelector(".title").style.opacity = 1;
    }, 30);
  });
  nav__item.addEventListener("mousedown", function (e) {
    // Add mouse down effect
    this.querySelector(".icon").style.opacity = 0.5;
    this.querySelector(".title").style.opacity = 0.5;
  });
  nav__item.addEventListener("mouseup", function (e) {
    // Add mouse down effect
    this.querySelector(".icon").style.opacity = 1;
    this.querySelector(".title").style.opacity = 1;
  });
}); // Menu Toggle

var toggle = document.querySelector(".toggle");
var header_aside = document.querySelector(".header-aside");
var main = document.querySelector(".main");
var nav__logo_image = document.querySelector(".nav__logo-image a");
var titles = header_aside.querySelectorAll(".title");
var change_theme = document.querySelector(".change-theme");
var body = document.querySelector("body");
var icons = header_aside.querySelectorAll(".nav__list .icon");

toggle.onclick = function () {
  var _nav__logo_image$quer;

  header_aside.classList.toggle("active");
  body.classList.toggle("active");
  nav__logo_image.classList.toggle("transparent");
  Array.from(titles).forEach(title => {
    title.classList.toggle("hide-text");
  });
  main.classList.toggle("active");
  document.querySelector(".container").classList.toggle("active");
  (_nav__logo_image$quer = nav__logo_image.querySelector("img").classList) === null || _nav__logo_image$quer === void 0 ? void 0 : _nav__logo_image$quer.toggle("left");
  Array.from(icons).forEach(icon => {
    icon.classList.toggle("d-block");
  });
}; // Change Theme


change_theme.onclick = function () {
  body.classList.toggle("dark-theme");
  change_theme.querySelector(".theme-sun").classList.toggle("d-none");
  change_theme.querySelector(".theme-moon").classList.toggle("d-none");
  Array.from(nav__itemList).forEach(nav__item => {
    nav__item.style.transition = "0.5s";
  });
  setTimeout(function () {
    Array.from(nav__itemList).forEach(nav__item => {
      nav__item.style.transition = "0s";
    });
  }, 500);
};