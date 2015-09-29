@Route = ReactRouter.Route
@DefaultRoute = ReactRouter.DefaultRoute

this.MyRoutes = (
  `<Route handler={Index}>
    <DefaultRoute handler={Forecasts} />
    <Route handler={SignUp} path='users/sign_up' />
   </Route>`
);
