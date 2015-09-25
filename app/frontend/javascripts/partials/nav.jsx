'use strict'

import React from 'react/addons';
import { Navbar, CollapsibleNav, Nav, NavItem } from 'react-bootstrap';

let nav = React.createClass({
  render: ()=> {
    return (
      <Navbar brand="Emotional Weather Report">
        <CollapsibleNav eventKey={0}>
          <Nav navbar right>
            <NavItem eventKey={1} href="#">Sign In</NavItem>
            <NavItem eventKey={2} href="#">Sign Up</NavItem>
          </Nav>
        </CollapsibleNav>
      </Navbar>
    );
  }
});

module.exports = nav;
