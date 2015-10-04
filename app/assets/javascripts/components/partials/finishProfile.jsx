'use strict';

import React from 'react/addons';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';

let FinishProfile = React.createClass({
  getInitialState: function(){
   return{show: this.props.show}
  },
  close: function(){
    this.setState({show: false});
  },
  render: function(){
    return(<Modal show={this.state.show} onHide={this.close}>
      <Modal.Header closeButton>
        <Modal.Title>Welcome Back!</Modal.Title>
      </Modal.Header>
      <Modal.Body className="overlay-bg owl-bg med">
        <div className="row">
          <div className="col-sm-12">
            <h5>Please take a few moments to complete your profile</h5>
            <div className="profileResults"></div>
            <form id="profileForm" onSubmit={this.submit} className="form">
              <Input type="text" id="name" groupClassName="group-class" labelClassName="label-class" label="Name*" hasFeedback required />
              <Input type="email" id="profile-email" groupClassName="group-class" labelClassName="label-class" label="Email*" hasFeedback required />
              <Input type="text" id="defaultLoc" groupClassName="group-class" labelClassName="label-class" label="Default Location" />
            </form>
          </div>
        </div>
      </Modal.Body>
      <Modal.Footer>
        <Button className="pull-left" onClick={this.close}>Cancel</Button> <Button onClick={this.submit}>Save</Button>
      </Modal.Footer>
    </Modal>);
  }
});

module.exports = FinishProfile;
