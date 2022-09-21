

import 'package:flutter/material.dart';
import 'package:my_portfolio_web/folders/screens/about.dart';
import 'package:my_portfolio_web/folders/screens/contact.dart';
import 'package:my_portfolio_web/folders/screens/home.dart';
import 'package:my_portfolio_web/folders/screens/portfolio.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName : (context) =>  const HomePage(),
  customDrawer.routeName : (context) => const customDrawer(),
  Portfolio.routeName : (context) => const Portfolio(),
  Contact.routeName : (context) => const Contact(),
  About.routeName : (context) => const About(),
};
