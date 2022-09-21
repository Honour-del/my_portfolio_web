import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_web/folders/utils/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';



final padding = Padding(
  padding: EdgeInsets.only(
    left: getProportionateScreenWidth(40),
    right: getProportionateScreenWidth(40),
    top: getProportionateScreenHeight(70),
    bottom: getProportionateScreenHeight(70)  //70
  ),
);



class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}

final notice = ChangeNotifierProvider<MenuController>(((ref) {
  return MenuController();
}));

// Color kGrey =  #707070;
Color kGrey2 = const Color(0xFF334055);
Color kGrey = const Color.fromRGBO(112, 112, 112, 100);
// Color kGrey =  const Color.fromRGBO(255, 255, 255, 0.4);
Color kWhiteText =  const Color.fromRGBO(255, 255, 255, 1);
Color kBlue =  const Color.fromRGBO(38, 153, 251, 1);
// Color kBlue =  Colors.blue;



container(BuildContext context, Widget child){

  // double w = MediaQuery.of(context).size.width * 1;
  // double h = MediaQuery.of(context).size.width * 1;
  return Scaffold(
    body: SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Container(
        // constraints:  BoxConstraints(
        //   maxHeight: h * 3,
        // ),
        // height: h*1.5,
        // width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(
              "images/bg.jpg"
          ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    ),
  );
}

launchURL(String url) async{
  final uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }else{
    throw 'Could not launch';
  }
}

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      shadowColor: Colors.transparent,
      flexibleSpace: const Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: 20
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Alienwear',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: "MISTRAL",
                  // fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
