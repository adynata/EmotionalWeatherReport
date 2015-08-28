  # app/assets/javascripts/components/signup.js.jsx.coffee
@SignUp = React.createClass
  submit: (e) ->
    console.log(e.target);
  render: ->
    `<div className="col-sm-6 col-sm-offset-3">
          <h2>Sign Up!</h2>
            <div className="results"></div>
            <form id="registrationForm" onSubmit={this.submit} className="form-horizontal">
              <div className="form-group">
                <label className="control-label">Email*</label>
                <input name="email" type="email" className="form-control" required />
              </div>
              <div className="form-group">
                <label className="control-label">First Name</label>
                <input name="fname" type="text" className="form-control" />
              </div>
              <div className="form-group">
                <label className="control-label">Last Name</label>
                <input name="lname" type="text" className="form-control" />
              </div>
              <div className="form-group">
                <label className="control-label">Password*</label>
                <input id="password" name="password" type="password" className="form-control" required />
              </div>
              <div className="form-group">
                <label className="control-label">Retype Password*</label>
                <input id="password_confirmation" name="password_confirmation" type="password" className="form-control" required />
              </div>
            </form>
         </div>`
