'use strict';

// expose jQuery for jquery_ujs and React for react_ujs
require('expose?jQuery!expose?$!jquery');
require('expose?React!react/addons');
require('expose?ReactBootstrap!react-bootstrap');

import $      from 'jquery';
import React  from 'react/addons';
import Index   from './index';
import Register from './register';
import Nav from './partials/nav';
import FeelsTree from './log';

$(document).ready(function() {
  let index = document.getElementById('index');
  if (index) {
    React.render(<Index />, index);
  }

  let nav = document.getElementById('nav');
  if (nav) {
    React.render(<Nav />, nav);
  }

  let feels_tree = document.getElementById('feels_tree');
  if (feels_tree) {
    React.render(<FeelsTree />, feels_tree);
  }

});
