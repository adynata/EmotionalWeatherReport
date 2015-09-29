'use strict'

import React from 'react/addons';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';
import PasswordInput from './partials/passwordInput';

export default class Login extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      show: this.props.show
    };
  }

  submit(e){
    e.preventDefault();
    let user = {email: $('#login-email').val(), password: $('#login-password').val()};
    console.log(user);
  }

  componentWillReceiveProps(nextProps){
    this.setState({
      show: nextProps.show > this.props.show
    });
  }

  getMetaContent(name){
    let metas = $('meta').toArray();

    metas.forEach((meta) => {
      if (meta.getAttribute("name") == name) {
        return meta.getAttribute("content");
      }
      return "";
    });
  }

  render(){
    return (
    <Modal show={this.state.show} onHide={this.props.close}>
      <Modal.Header closeButton>
        <Modal.Title>Login</Modal.Title>
      </Modal.Header>
      <div className="modal-body overlay-bg owl-bg sm">
        <div className="row">
          <div className="col-sm-8 col-sm-offset-2">
            <div className="results"></div>
            <form id="registrationForm" onSubmit={this.submit} className="form">
              <Input type="email" id="login-email" groupClassName="group-class" labelClassName="label-class" label="Email*" hasFeedback required />
              <PasswordInput toggle="login-toggle" id="login-password" />
              <ButtonInput type="submit" value="Login" />
            </form>
           </div>
          </div>
        </div>
        <Modal.Footer>
          <Button onClick={this.props.close}>Cancel</Button> <Button onClick={this.props.switchModal}>Sign Up</Button>
        </Modal.Footer>
      </Modal>);
  }

}
