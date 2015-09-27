import React from 'react/addons';
import $ from 'jquery';

//-- import d3??

let feels_tree = React.createClass({
  componentWillMount: function(){
    $.get('/feels/log', data => {
      this.setState({
        feels_tree: data
      });
    });
  },
  render: function(){
    let feels_tree = (this.state.feels_tree) ? <div className="feels_tree">
    <ul>{function(){
          for (var key in this.state.feels_tree){
            return <li> {key} </li>
          }
        }.call(this)
      }
    </ul></div> : <div>Log Feel</div>
    return(<div>{feels_tree}</div>);
  }
});

module.exports = feels_tree;
