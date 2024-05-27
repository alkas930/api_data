import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/loginpage.dart';
import 'package:project1/productpage2.dart';
import 'package:project1/page.dart';
import 'package:project1/signup.dart';

const String signupRoute = '/Signup';
const String loginRoute = '/loginpage';
const String ProductPageRoute = '/ProductPage';

final Map<String, WidgetBuilder> routes = {
  signupRoute: (context) => const signup(),
  loginRoute: (context) => const MyLogin(),
};
