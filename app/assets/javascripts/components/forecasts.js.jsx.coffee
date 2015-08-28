  # app/assets/javascripts/components/forecasts.js.jsx.coffee

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
		`<div className="col-sm-12 forecast">
				<div className="title"><h2>It Weather</h2></div>
				<div className="change-weather">
					<form onSubmit={this.changeZip}>
						<label>Change Zipcode?</label>
						<input name="zip" type="text" placeholder="zipcode" />
						<input type="submit" className="btn btn-primary" calue="Change"></input>
					</form>
				</div>
				<div className="actual-weather">
					<ul>
						<li>Location: {this.state.forecast.location}</li>
						<li>Current: {this.state.forecast.conditions_desc}</li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>
		</div>`
