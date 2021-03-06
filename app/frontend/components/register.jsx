'use strict'

import React from 'react';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';
import PasswordInput from './partials/passwordInput';
import Functions from './helpers/functions';

let register = React.createClass({
  getInitialState: function() {
    return {show: this.props.show}
  },
  submit: function(e){
    e.preventDefault();
    let loc = ($('#location').val()) ? $('#location').val() : 'Paris, France';
    let user = {email: $('#signup-email').val(), password: $('#signup-password').val(), location: loc};
    $.ajax({
      method: 'POST',
      url: '/users',
      data: {
        user: user
        },
      authenticity_token: Functions.getMetaContent("csrf-token")
    }).error(err => {
      console.log(err);
    }).success(data => {
      console.log(data);
    });
  },
  componentWillReceiveProps: function(nextProps){
    this.setState({
      show: nextProps.show > this.props.show
    });
  },
  render: function(){
    return (
    <Modal show={this.state.show} onHide={this.props.close}>
      <Modal.Header closeButton>
        <Modal.Title>Sign Up</Modal.Title>
      </Modal.Header>
      <div className="modal-body overlay-bg owl-bg sm">
        <div className="row">
          <div className="col-sm-8 col-sm-offset-2">
            <div className="results"></div>
            <form id="registrationForm" onSubmit={this.submit} className="form">
              <Input type="email" id="signup-email" groupClassName="group-class" labelClassName="label-class" label="Email*" hasFeedback required />
              <Input type="text" id="location" groupClassName="group-class" labelClassName="label-class" label="Default Location" />
              <PasswordInput toggle="signup-toggle" id="signup-password" help="Password must be at least 8 characters" />
              <ButtonInput type="submit" value="Register" />
            </form>
           </div>
          </div>
        </div>
        <Modal.Footer>
          <Button className="pull-left" onClick={this.props.close}>Cancel</Button> <Button onClick={this.props.switchModal}>Sign In</Button>

        </Modal.Footer>
      </Modal>);
  }
});

module.exports = register;
