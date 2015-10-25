'use strict';

import React from 'react/addons';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';
import Functions from '../helpers/functions';

let UserProfile = React.createClass({
  mixins: [React.addons.LinkedStateMixin],
  getInitialState: function(){
   return {
     show: this.props.show,
     name: this.props.user.name,
     email: this.props.user.email,
     location: this.props.user.location
   }
  },
  componentWillReceiveProps: function(nextProps){
    this.setState({
      show: nextProps.show > this.props.show
    });
  },
  submit: function(e){
    e.preventDefault();
    let $result = $(e.target).next('.result');
    $result.html('<div class="sp-circle fr"></div>');
    let data = {
      id: this.props.user.id,
      user: {
        name: this.state.name,
        email: this.state.email,
        location: this.state.location
      }
    };
    $.ajax({
      method: 'POST',
      url: '/users/edit',
      data: data,
      authenticity_token: Functions.getMetaContent("csrf-token")
    }).error(err => {
      console.log("error");
      console.log(err);
    }).success(data => {
      $result.html('Profile was successfully saved');
    });
  },
  render: function(){
    let message = "";
    if (this.props.user && (!this.props.user.name || !this.props.user.location)) {
      message = "Please take a few moments to complete your profile";
    }
    return(<Modal show={this.state.show} onHide={this.props.close}>
      <Modal.Header closeButton>
        <Modal.Title>Welcome Back!</Modal.Title>
      </Modal.Header>
      <Modal.Body className="overlay-bg owl-bg med">
        <div className="row">
          <div className="col-sm-12">
            <h5>{message}</h5>
            <div className="profileResults"></div>
            <form id="profileForm" onSubmit={this.submit} className="form">
              <Input type="text" groupClassName="group-class" labelClassName="label-class" label="Name" valueLink={this.linkState('name')} hasFeedback required />
              <Input type="email" groupClassName="group-class" labelClassName="label-class" label="Email*" valueLink={this.linkState('email')} hasFeedback required />
              <Input type="text" groupClassName="group-class" labelClassName="label-class" label="Default Location" valueLink={this.linkState('location')} />
            </form>
          </div>
        </div>
      </Modal.Body>
      <Modal.Footer>
        <Button className="pull-left" onClick={this.props.close}>Cancel</Button>
        <Button onClick={this.submit}>Save</Button>
        <div className="result"></div>
      </Modal.Footer>
    </Modal>);
  }
});

module.exports = UserProfile;
