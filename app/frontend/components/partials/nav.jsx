'use strict'

import React from 'react';
import { Navbar, CollapsibleNav, Nav, NavItem, NavBrand } from 'react-bootstrap';
import Register from '../register';
import Login from '../login';
import Logout from './logoutModal';
import UserProfile from './userProfile';

let nav = React.createClass({
  getInitialState: function(){
    if(this.props.user.name){
      return {login: false, register: false, logout: false, userProfile: false};
    } else {
      return {login: false, register: false, logout: false, userProfile: true};
    }
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

  profile: function(){
    this.setState({
      userProfile: true
    });
  },

  close: function(){
    this.setState({
      login: false,
      register: false,
      logout: false,
      userProfile: false
    });
  },

  logout: function(e){
    $.get('/logout').done(data=>{
      this.setState({logout:true});
      setTimeout(location.reload(), 2000);
    });
  },

  render: function(){
    let name = "Account";
    if(this.props.user) {
      if (this.props.user.name){
        name = "Hello, " + this.props.user.name;
      }
    }
    let menu = (this.props.signedIn) ? <Nav navbar right>
      <NavItem eventKey={1} onClick={this.profile}>{name}</NavItem>
      <NavItem eventKey={2} onClick={this.logout}>Logout</NavItem>
    </Nav> : <Nav navbar right>
      <NavItem eventKey={1} onClick={this.login}>Sign In</NavItem>
      <NavItem eventKey={2} onClick={this.register}>Sign Up</NavItem>
    </Nav>;
    return (
    <div className="row">
      <Navbar>
        <NavBrand><a href="/">Emotional Weather Report</a></NavBrand>
        <CollapsibleNav eventKey={0}>
          {menu}
        </CollapsibleNav>
      </Navbar>
      <Register show={this.state.register} close={this.close} switchModal={this.switchModal} />
      <Login show={this.state.login} close={this.close} switchModal={this.switchModal} />
      <Logout show={this.state.logout} close={this.close} />
      <UserProfile show={this.state.userProfile} user={this.props.user} close={this.close} />
    </div>
    );
  }
});

module.exports = nav;
