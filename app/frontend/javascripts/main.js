'use strict';

// expose jQuery for jquery_ujs and React for react_ujs
require('expose?jQuery!expose?$!jquery');
require('expose?React!react/addons');

import $      from 'jquery';
import React  from 'react/addons';
import Router from 'react-router';
import Index   from './index';

$(document).ready(function() {
  // define routing
  const routes = (
    <Router.Route name='main_page' path='/' handler={Index}></Router.Route>
  );

  Router.run(routes, Router.HashLocation, function(Handler) {
    React.render(React.createFactory(Handler)(), document.getElementById('route'));
  });
});
