'use strict';

import React from 'react/addons';
import $ from 'jquery';
import { ButtonInput } from 'react-bootstrap';
import moment from 'moment';
import FinishProfile from './partials/finishProfile';

let index = React.createClass({
  getInitialState: function(){
    return {forecast: this.props.forecast, user: this.props.user };
  },
  changeZip: function(e){
    e.preventDefault();
    $.post('/forecasts', {forecast: {zipcode: event.target.zip.value}}, data=>{
      this.setState({forecast: data});
    });
  },
  componentWillMount: function(){
    if(!this.props.forecast){
      $.get('/forecasts', data => {
        this.setState({
          forecast: data
        });
      });
    }
  },
  render: function() {
    let weather = (this.state) ? <div className="actual-weather">
                <ul>
                  <li>Location: {this.state.forecast.location}</li>
                  <li>Current: {this.state.forecast.conditions_desc}</li>
                  <li>Temp: {this.state.forecast.current_temp}</li>
                  <li>Sunrise: {moment(this.state.forecast.sunrise).format("LT")}</li>
                  <li>Sunset: {moment(this.state.forecast.sunset).format("LT")}</li>
                </ul>
              </div> : <div className="text-center">Getting the weather...</div>;
    let profile = "";
    if (this.state.user) {
      profile = (this.state.user.name) ? <FinishProfile show={false} /> : <FinishProfile show={true} user={this.state.user} />;
    }
    return (
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
          <div id="feels_tree"></div>
          {weather}
          {profile}
        </div>);
      }
});

module.exports = index;
