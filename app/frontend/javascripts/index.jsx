'use strict';

import React from 'react/addons';
import $ from 'jquery';
let ReactBootstrap = require('react-bootstrap');
let ButtonInput = ReactBootstrap.ButtonInput;

let index = React.createClass({
  changeZip: function(e){
    e.preventDefault();
    $.post('/forecasts', {forecast: {zipcode: event.target.zip.value}}, data=>{
      this.setState({forecast: data});
    });
  },
  componentWillMount: function(){
    $.get('/forecasts', data => {
      this.setState({
        forecast: data
      });
    });
  },
  render: function() {
    if(!this.state) {
      return (<div className="index text-center"><h2>Getting the Weather</h2></div>);
    }
    return (
    <div className="index">
      <div className="row">
        <div className="col-sm-12 text-center forecast">
          <div className="title">
            <h2>It Weather</h2>
          </div>
          <h3>The only weather app that cares how you feel</h3>
          <div className="change-weather">
            <form onSubmit={this.changeZip}>
              <div className="form-group">
                <h4>Change Weather?</h4>
                <input type="text" name="zip" />
              </div>
              <ButtonInput type="submit" value="New Weather" />
            </form>
          </div>
          <div className="actual-weather">
            <ul>
              <li>Location: {this.state.forecast.location}</li>
              <li>Current: {this.state.forecast.conditions_desc}</li>
              <li>Temp: {this.state.forecast.current_temp}</li>
              <li>Sunrise: {this.state.forecast.sunrise}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>); }
});

module.exports = index;
