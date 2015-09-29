  # app/assets/javascripts/components/signup.js.jsx.coffee
Input = ReactBootstrap.Input
ButtonInput = ReactBootstrap.ButtonInput
Button = ReactBootstrap.Button
$ = jQuery

@PasswordInput = React.createClass
  getInitialState: ->
    value: ''
    help: 'Password must be at least 8 characters'
  validationState: ->
    if this.state.value.length > 7
      'success'
    else if this.state.value.length > 0
      'error'
  handleChange: ->
    pword = this.refs.input.getValue()
    @setState value: pword
    if pword.length > 7
      @setState help: ''
    else
      @setState help: 'Password must be at least 8 characters'
  toggleVis: (e) ->
    e.preventDefault()
    if $(e.target).hasClass "glyphicon-eye-open"
      $(e.target).removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close")
      $("#password")[0].type = "text"
    else
      $(e.target).removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open")
      $("#password")[0].type = "password"
  render: ->
    vis = `<Button><i className='glyphicon glyphicon-eye-open' onClick={this.toggleVis}></i></Button>`
    `<Input type="password"
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
            required />`
@SignUp = React.createClass
  submit: (e) ->
    e.preventDefault()
    loc = if $('#location').val() then $('#location').val() else '94612'
    user = {email: $('#email').val(), password: $('#password').val(), location: loc}
    $.ajax({
      method: 'POST',
      url: '/users',
      data: {
        user: user
        },
      authenticity_token: this.getMetaContent("csrf-token")
      }).done((data) -> console.log(data))
  getMetaContent: (name) ->
      metas = document.getElementsByTagName('meta');

      for meta in metas
        if meta.getAttribute("name") == name
          return meta.getAttribute("content");
      return "";
  render: ->
    `<div className="col-sm-6 col-sm-offset-3">
          <h2>Sign Up!</h2>
            <div className="results"></div>
            <form id="registrationForm" onSubmit={this.submit} className="form">
              <Input type="email" id="email" groupClassName="group-class" labelClassName="label-class" label="Email*" hasFeedback required />
              <Input type="text" id="location" groupClassName="group-class" labelClassName="label-class" label="Default Location" />
              <PasswordInput />
              <ButtonInput type="submit" value="Register" />
            </form>
         </div>`
