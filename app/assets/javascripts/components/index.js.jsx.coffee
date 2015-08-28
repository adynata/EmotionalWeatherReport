  # app/assets/javascripts/components/index.js.jsx.coffee
@RouteHandler = ReactRouter.RouteHandler;
@Link = ReactRouter.Link;

@Index = React.createClass
  render: ->
    `<RouteHandler {...this.props} />`
