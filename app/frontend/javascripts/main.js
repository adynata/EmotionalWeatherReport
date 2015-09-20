'use strict';

// expose jQuery for jquery_ujs and React for react_ujs
require('expose?jQuery!expose?$!jquery');
require('expose?React!react/addons');
require('expose?ReactBootstrap!react-bootstrap');

import $      from 'jquery';
import React  from 'react/addons';
import Router from 'react-router';
import Index   from './index';
import Register from './register';

$(document).ready(function() {
  // define routing
  const routes = (
    <Router.Route name='index' path='/' handler={Index}>
      <Router.Route name='register' path='/register/' handler={Register} />
    </Router.Route>
  );

  Router.run(routes, Router.HashLocation, function(Handler) {
    React.render(<Handler />, document.getElementById('route'));
  });
});
