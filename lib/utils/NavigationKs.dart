import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyNavigator {
  static void goTolandingpage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/landingpage');
  }
  static void goToWorkThrouhpage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/workthroughpage');
  }
  static void goTologin(BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }
   static void goToregister(BuildContext context) {
    Navigator.of(context).pushNamed('/registerpage');
  }

   static void goToOtpPage(BuildContext context) {
    Navigator.of(context).pushNamed('/otppage');
  }

  static void goToForgetPasswordPage(BuildContext context) {
    Navigator.of(context).pushNamed('/forgetpasswordpage');
  }

  static void goToForgetPasswordOtpPage(BuildContext context) {
    Navigator.of(context).pushNamed('/forgetpasswordotppage');
  }
  static void goToForgetPasswordNewPage(BuildContext context) {
    Navigator.of(context).pushNamed('/forgetpasswordnewpage');
  }

  static void goToMomentImageZoomPage(BuildContext context) {
    Navigator.of(context).pushNamed('/momentimagezoompage');
  }

  static void goToLogInScreenFromOtp(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/loginpagefromotp', ModalRoute.withName('/loginpagefromotp'));

  
  }

  static void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home'));
  }

   static void goToLandingPageAfterLogout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/gotolandingpageafterlogout',
        ModalRoute.withName('/gotolandingpageafterlogout'));
  }

  

}
