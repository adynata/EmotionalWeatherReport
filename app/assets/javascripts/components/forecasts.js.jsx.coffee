  # app/assets/javascripts/components/forecasts.js.jsx.coffee

@Forecasts = React.createClass
	getInitialState: ->
		forecast: @props.data
	render: ->
		console.log this.state
		`<div className="forecast">
			<div className="title"><h2>It Weather</h2></div>
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