import React from 'react';
import $ from 'jquery';

//-- import d3??

let feels_tree = React.createClass({
  getInitialState: function(){
    return {feels_tree: {}};
  },
  componentWillMount: function(){
    $.get('/feels/log', data => {
      this.setState({
        feels_tree: data
      });
    });
  },
  render: function(){
    let feels_view = (this.state.feels_tree) ? <div className="feels_tree">
    <ul>{
          Object.keys(this.state.feels_tree).map(key => {
            return(<li>{key}</li>);
          }, this)
      }
    </ul></div> : <div>Log Feel</div>
    return(<div>{feels_view}</div>);
  }
});

module.exports = feels_tree;
