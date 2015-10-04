'use strict';

import React from 'react/addons';
import $ from 'jquery';
import { Modal, Input, ButtonInput, Button } from 'react-bootstrap';

let Logout = React.createClass({
  render: function(){
    return(
      <Modal show={this.props.show} onHide={this.props.close}>
        <Modal.Body>
          <div className="col-sm-8 col-sm-offset-2 center-text">
            <h4>You have been successfully logged out!</h4>
          </div>
        </Modal.Body>
      </Modal>
    );
  }
});

module.exports = Logout;
