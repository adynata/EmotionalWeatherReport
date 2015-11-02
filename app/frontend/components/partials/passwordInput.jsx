'use strict';

import React from 'react';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';

let PasswordInput = React.createClass({
  getInitialState: function() {
    return {value: '', help: this.props.help, type: 'password'};
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
      this.setState({help: this.props.help});
    }
  },
  toggleVis: function(e) {
    e.preventDefault();
    let toggleId = '#' + this.props.toggle;
    let passwordId = '#' + this.props.id;
    if($(toggleId).hasClass('glyphicon-eye-open')){
      $(toggleId).removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
      this.setState({type: 'text'});
    } else {
      $(toggleId).removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
      this.setState({type: 'password'});
    }
  },
  render: function() {
    let vis = <Button onClick={this.toggleVis}><i id={this.props.toggle} className='glyphicon glyphicon-eye-open'></i></Button>;
    return (<Input type={this.state.type}
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
            id={this.props.id}
            onChange={this.handleChange}
            required />);
    }
});

module.exports = PasswordInput;
