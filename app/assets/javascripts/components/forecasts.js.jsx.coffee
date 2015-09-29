  # app/assets/javascripts/components/forecasts.js.jsx.coffee
Input = ReactBootstrap.Input
ButtonInput = ReactBootstrap.ButtonInput

@Forecasts = React.createClass
	getInitialState: ->
		forecast: @props.data

	changeZip: (event) ->
		event.preventDefault()
		console.log(event.target.zip.value)
		$.post "forecasts", {forecast: {zipcode: event.target.zip.value}}, (data) =>
			@setState forecast: data

	render: ->
		# console.log this.state
		`<div className="col-sm-12 text-center forecast">
				<div className="title"><h2>It Weather</h2></div>
				<h3>The Only Weather App That Cares How You Feel</h3>
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
		</div>`
