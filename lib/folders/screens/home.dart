// import 'dart:ui';



// ignore_for_file: camel_case_types

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/folders/data/strings_data.dart';
import 'package:my_portfolio_web/folders/screens/about.dart';
import 'package:my_portfolio_web/folders/screens/contact.dart';
// import 'package:my_portfolio_web/folders/screens/portfolio.dart';
import 'package:my_portfolio_web/folders/screens/resume.dart';
import 'package:my_portfolio_web/folders/screens/services.dart';
import 'package:my_portfolio_web/folders/utils/anime.dart';
import 'package:my_portfolio_web/folders/utils/constants.dart';
import 'package:my_portfolio_web/folders/utils/responsive.dart';
import 'package:my_portfolio_web/folders/utils/screen_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);
  static String routeName = "/homePage";

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width *1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      endDrawer:  Drawer(
        backgroundColor: kGrey,
        child: const customDrawer(),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          // height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
                bg
            ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: w/4,
              child: Padding(
                padding: padding.padding,
                child: Responsive(
                  mobile: SingleChildScrollView(
                    // physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const WelcomePart(),

                        const SizedBox(height: 25,),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/stack_programmer.png"
                              ),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          width: 180,
                          height: 180,
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/stack_design.png"
                                ),
                                fit: BoxFit.cover
                              ),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          width: 180,
                          height: 180,
                        ),
                      ],
                    ),
                  ),
                  desktop: Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(110),
                      right: getProportionateScreenWidth(108),
                    ),
                    child: Row(
                      children: [
                        const WelcomePart(),
                        Expanded(child: customStack(context),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class WelcomePart extends StatelessWidget {
  const WelcomePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome to my Portfolio',
          style: TextStyle(
              color: Colors.white,
              fontSize: getFontSize(70),
            fontFamily: "Museo Sans Rounded",
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(100),
        ),
        const AutoSizeText(
          "I'm Alienwear\n"
              "I'm a Creative Mobile App and Web Developer\nExplore through this site to know more about me",
          maxLines: 3,
          minFontSize: 10,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500
          ),
        ),

        SizedBox(
          height: getProportionateScreenHeight(100),
        ),

        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: const Size(100, 45),
          ),
          onPressed: (){
            // Navigator.pushNamed(context, customDrawer.routeName);
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const About()));

          },
          child: AutoSizeText(
            'Hire me!',
            maxLines: 1,
            style: TextStyle(
                color: Colors.white,
                fontSize: getFontSize(20),
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w700
            ),
          ),

        ),
        // customStack(context),
      ],
    );
  }
}


class customDrawer extends StatelessWidget {
  const customDrawer({Key? key}) : super(key: key);
  static String routeName = "/customDrawer";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding.padding,
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/images/avatar.jpg"
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                AutoSizeText(
                  'Bashar Sheriffdeen',
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: getFontSize(50),
                    color: kWhiteText,
                    fontFamily: "Museo Sans Rounded",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          row('About Me', const FaIcon(FontAwesomeIcons.baby),() async{
            await Navigator.push(context, BouncyPageRoute(widget: const About()));
             // ignore: use_build_context_synchronously
             Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
          }),
          row('Resume', const FaIcon(FontAwesomeIcons.baby), () async{
             await Navigator.push(context, BouncyPageRoute(widget: const Resume()));
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }),
          // row('Portfolio', const FaIcon(FontAwesomeIcons.baby), () async{
          //   await Navigator.push(context, BouncyPageRoute(widget: const Portfolio()));
          //   Navigator.pop(context);
          // }),
          row('Services', const FaIcon(FontAwesomeIcons.baby), () async{
            await Navigator.push(context, BouncyPageRoute(widget: const Services()));
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }),
          row('Contact', const FaIcon(FontAwesomeIcons.baby), () async{
            await Navigator.push(context, BouncyPageRoute(widget: const Contact()));
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  row (String text, FaIcon data, VoidCallback onPressed){
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 50,
        ),
        child: ListTile(
          onTap: onPressed,
            leading: IconButton(
              icon: data,
              onPressed: null,
            ) ,
            title: AutoSizeText(
              text,
              maxLines: 1,
              style: TextStyle(
                fontSize: getFontSize(30),
                color: kWhiteText,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500
                // fontStyle: GoogleFonts.museoModernoTextTheme()
              ),
            ),
        ),
      ),
    );
  }
}

customStack(BuildContext context){
  double hquery = MediaQuery.of(context).size.height;
  double wquery = MediaQuery.of(context).size.width;
  return SizedBox(
    height: hquery,
    width: wquery,
    child: Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        stackContainer(Colors.transparent, 0, ""),
        Positioned(
          // height: 350,
          // width: 350,
          left: 200,
          top: 100,
          child: stackContainer(Colors.red, 180, "assets/images/stack_programmer.png"),
        ),
        Positioned(
          top: 200,
          left: 365,
          child: stackContainer(Colors.blue, 180, "assets/images/stack_design.png"),
        ),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: stackContainer(),
        // ),
      ],
    ),
  );
}
 stackContainer(Color color, double size, String str){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(str),
        fit: BoxFit.cover
      ),
        color: color,
        borderRadius: BorderRadius.circular(10)
    ),
    height: size,
    width: size,
  );
}