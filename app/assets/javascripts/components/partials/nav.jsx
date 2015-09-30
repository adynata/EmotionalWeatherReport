'use strict'

import React from 'react/addons';
import { Navbar, CollapsibleNav, Nav, NavItem } from 'react-bootstrap';
import Register from '../register';
import Login from '../login';

let nav = React.createClass({
  getInitialState: function(){
    return {login: false, register: false};
  },

  register: function(){
    this.setState({
      register:true
    });
  },

  login: function(){
    this.setState({
      login:true
    });
  },

  switchModal: function(){
    this.setState({
      login: !this.state.login,
      register: !this.state.register
    });
  },

  close: function(){
    this.setState({
      login: false,
      register: false
    });
  },

  render: function(){
    return (
    <div className="row">
      <Navbar brand="Emotional Weather Report">
        <CollapsibleNav eventKey={0}>
          <Nav navbar right>
            <NavItem eventKey={1} onClick={this.login}>Sign In</NavItem>
            <NavItem eventKey={2} onClick={this.register}>Sign Up</NavItem>
          </Nav>
        </CollapsibleNav>
      </Navbar>
      <Register show={this.state.register} close={this.close} switchModal={this.switch} />
      <Login show={this.state.login} close={this.close} switchModal={this.switch} />
    </div>
    );
  }
});

module.exports = nav;
