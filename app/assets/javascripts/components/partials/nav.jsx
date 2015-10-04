'use strict'

import React from 'react/addons';
import { Navbar, CollapsibleNav, Nav, NavItem } from 'react-bootstrap';
import Register from '../register';
import Login from '../login';
import Logout from './logoutModal'

let nav = React.createClass({
  getInitialState: function(){
    return {login: false, register: false, logout: false};
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
      register: false,
      logout: false
    });
  },

  logout: function(e){
    $.get('/logout').done(data=>{
      this.setState({logout:true});
      setTimeout(location.reload(), 2000);
    });
  },

  render: function(){
    let menu = (this.props.signedIn) ? <Nav navbar right>
      <NavItem eventKey={1} onClick={this.user}>Hello, {this.props.user.name}</NavItem>
      <NavItem eventKey={2} onClick={this.logout}>Logout</NavItem>
    </Nav> : <Nav navbar right>
      <NavItem eventKey={1} onClick={this.login}>Sign In</NavItem>
      <NavItem eventKey={2} onClick={this.register}>Sign Up</NavItem>
    </Nav>;
    return (
    <div className="row">
      <Navbar brand="Emotional Weather Report">
        <CollapsibleNav eventKey={0}>
          {menu}
        </CollapsibleNav>
      </Navbar>
      <Register show={this.state.register} close={this.close} switchModal={this.switchModal} />
      <Login show={this.state.login} close={this.close} switchModal={this.switchModal} />
      <Logout show={this.state.logout} close={this.close} />
    </div>
    );
  }
});

module.exports = nav;
