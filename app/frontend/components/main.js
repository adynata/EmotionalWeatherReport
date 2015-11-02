'use strict';

// expose jQuery for jquery_ujs and React for react_ujs
require('expose?jQuery!expose?$!jquery');
require('expose?React!react');
require('expose?ReactBootstrap!react-bootstrap');

import $      from 'jquery';
import React  from 'react';
import ReactDOM from 'react-dom';
import Index   from './index';
import Navigation from './partials/nav';
import Register from './register';
import FeelsTree from './log'


$(document).ready(function() {

  let index = document.getElementById('index');
  if (index) {
    $.get('/forecasts', data => {
      ReactDOM.render(<Index forecast={data.forecast} user={data.user} />, index);
      let feels_tree = document.getElementById('feels_tree');
      if (feels_tree) {
        ReactDOM.render(<FeelsTree />, feels_tree);
      }
    }).error(data=>{
      ReactDOM.render(<Index />, index);
    });
  }

  let nav = document.getElementById('nav');
  if (nav) {
    $.get('/signed_in').error(data => {
      ReactDOM.render(<Navigation signedIn={false} />, nav);
    }).success(data => {
      ReactDOM.render(<Navigation signedIn={data.signed_in} user={data.user} />, nav)
    });
  }

  // let feels = document.getElementById('feels');
  // if (feels) {
  //   React.render(<FeelingsTree />, feels);
  // }

});
