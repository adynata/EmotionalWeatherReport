'use strict'

import React from 'react/addons';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';

let PasswordInput = React.createClass({
  getInitialState: function() {
    return {value: '', help: 'Password must be at least 8 characters'};
  },
  validationState: function() {
    if (this.state.value.length > 7){
      return 'success'
    } else if (this.state.value.length > 0) {
      return 'error'
    }
  },
  handleChange: function() {
    let pwrd = this.refs.input.getValue();
    this.setState({value: pwrd});
    if (pwrd.length > 7) {
      this.setState({help: ''});
    } else {
      this.setState({help: 'Password must be at least 8 characters'});
    }
  },
  toggleVis: function(e) {
    e.preventDefault();
    if($('.toggle-password').hasClass('glyphicon-eye-open')){
      $('.toggle-password').removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
      $("#password")[0].type = "text";
    } else {
      $('.toggle-password').removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
      $("#password")[0].type = "password";
    }
  },
  render: function() {
    let vis = <Button onClick={this.toggleVis}><i className='toggle-password glyphicon glyphicon-eye-open'></i></Button>;
    return (<Input type="password"
            buttonBefore={vis}
            value={this.state.value}
            placeholder="Password"
            label="Password"
            help={this.state.help}
            bsStyle={this.validationState()}
            hasFeedback
            ref="input"
            groupClassName="group-class"
            labelClassName="label-class"
            id="password"
            onChange={this.handleChange}
            required />);
    }
});

let register = React.createClass({
  getInitialState: function() {
    return {show: this.props.show}
  },
  submit: function(e){
    e.preventDefault();
    let loc = ($('#location').val()) ? $('#location').val() : '94612';
    let user = {email: $('#email').val(), password: $('#password').val(), location: loc}
    $.ajax({
      method: 'POST',
      url: '/users',
      data: {
        user: user
        },
      authenticity_token: this.getMetaContent("csrf-token")
    }).done((data) => {console.log(data)});
  },
  componentWillReceiveProps: function(nextProps){
    this.setState({
      show: nextProps.show > this.props.show
    });
  },
  getMetaContent: function(name){
    let metas = document.getElementsByTagName('meta');

    metas.forEach((meta) => {
      if (meta.getAttribute("name") == name) {
        return meta.getAttribute("content");
      }
      return "";
    });
  },
  render: function(){
    return (
    <Modal show={this.state.show} onHide={this.props.close}>
      <Modal.Header closeButton>
        <Modal.Title>Sign Up</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <div className="col-sm-6 col-sm-offset-3">
          <div className="results"></div>
          <form id="registrationForm" onSubmit={this.submit} className="form">
            <Input type="email" id="email" groupClassName="group-class" labelClassName="label-class" label="Email*" hasFeedback required />
            <Input type="text" id="location" groupClassName="group-class" labelClassName="label-class" label="Default Location" />
            <PasswordInput />
            <ButtonInput type="submit" value="Register" />
          </form>
         </div>
        </Modal.Body>
        <Modal.Footer>
          <Button onClick={this.props.close}>Cancel</Button> <Button onClick={this.props.switchModal}>Sign In</Button>
        </Modal.Footer>
      </Modal>);
  }
});

module.exports = register;
