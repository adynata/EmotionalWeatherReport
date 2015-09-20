'use strict'

import React from 'react/addons';
import $ from 'jquery';
import { Input, ButtonInput, Button } from 'react-bootstrap';

let PasswordInput = React.createClass({
  getInitialState: () => {
    return {value: '', help: 'Password must be at least 8 characters'};
  },
  validationState: () => {
    if (this.state.value.length > 7){
      return 'success'
    } else if (this.state.value.length > 0) {
      return 'error'
    }
  },
  handleChange: () => {
    let pwrd = this.refs.input.getValue();
    this.setState({value: pwrd});
    if (pwrd.length > 7) {
      this.setState({help: ''});
    } else {
      this.setState({help: 'Password must be at least 8 characters'});
    }
  },
  toggleVis: e => {
    e.preventDefault();
    if($(e.target).hasClass('glyphicon-eye-open')){
      $(e.target).removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
      $("#password")[0].type = "text";
    } else {
      $(e.target).removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
      $("#password")[0].type = "password";
    }
  },
  render: () => {
    let vis = <Button><i className='glyphicon glyphicon-eye-open' onClick={this.toggleVis}></i></Button>;
    return <Input type="password"
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
            required />
    }
});

let SignUp = React.createClass({
  submit: (e) => {
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
  getMetaContent: (name) => {
    let metas = document.getElementsByTagName('meta');

    metas.forEach((meta) => {
      if (meta.getAttribute("name") == name) {
        return meta.getAttribute("content");
      }
      return "";
    });
  },
  render: () => {
  <div className="col-sm-6 col-sm-offset-3">
        <h2>Sign Up!</h2>
          <div className="results"></div>
          <form id="registrationForm" onSubmit={this.submit} className="form">
            <Input type="email" id="email" groupClassName="group-class" labelClassName="label-class" label="Email*" hasFeedback required />
            <Input type="text" id="location" groupClassName="group-class" labelClassName="label-class" label="Default Location" />
            <PasswordInput />
            <ButtonInput type="submit" value="Register" />
          </form>
       </div>
  }
});

module.exports = SignUp;
