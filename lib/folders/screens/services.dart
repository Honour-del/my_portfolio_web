
// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/folders/utils/constants.dart';
import 'package:my_portfolio_web/folders/utils/responsive.dart';
import 'package:my_portfolio_web/folders/utils/screen_size.dart';

import '../data/strings_data.dart';
import 'home.dart';



class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);
  static String routeName = "/services";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: appBar(context),
      endDrawer: Drawer(
        backgroundColor: kGrey,
        child: const customDrawer(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
            image: DecorationImage(image: AssetImage(
                bg
            ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(187),
              top: getProportionateScreenHeight(60),
              right: getProportionateScreenWidth(186)
          ),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AutoSizeText(
                  "Services",
                  style: TextStyle(
                      fontSize: getFontSize(73),
                      color: kBlue,
                      fontFamily: "Museo Sans Rounded",
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),

              SizedBox(height: getProportionateScreenHeight(58),),
              const CarouselBar(),
              SizedBox(height: getProportionateScreenHeight(61),),
              Column(
                children: [
                  CarouselSlider(
                    items: [
                      Content(title: "Web&ApDesign", body: web_app, image: "images/web-design.jpg"),
                      Content(title: "Web Development", body: web, image: "images/web-development.jpg"),
                      Content(title: "Mobile Development", body: mobile, image: "images/mobile-development.jpg"),
                    ],
                    options: CarouselOptions(
                      height: getProportionateScreenHeight(600),
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 2.0,

                    ),
                  ),
                ],
              ),
              // Content(title: "Web Design", body: body, image: "images/web-design.jpg")
            ],
          ),
        )
      )
    );
  }
}


class CarouselBar extends StatefulWidget {
  const CarouselBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CarouselBarState createState() => _CarouselBarState();
}

class _CarouselBarState extends State<CarouselBar> {
  // ignore: unused_field
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: kWhiteText
      ),
      // width: w * 0.8,
      // color: kWhiteText,
      width: getProportionateScreenWidth(1547),
      height: getProportionateScreenHeight(151),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: sliderContent("title", body, "images/web-design.jpg"),
        child: CarouselSlider(
            items: [
              textWithIcon("Web&App Design", const FaIcon(FontAwesomeIcons.computer, color: Colors.black, size: 30,),),
              textWithIcon("Web Development", const FaIcon(FontAwesomeIcons.baby),),
              textWithIcon("Mobile Development", const FaIcon(FontAwesomeIcons.baby),)
            ],
            options: CarouselOptions(
              height: getProportionateScreenHeight(600),
              // enlargeCenterPage: true,
              autoPlay: true,
              // aspectRatio: 16/9,
              // viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(
                      () {
                    _currentIndex = index;
                  },
                );
              },
            ),
        ),
      ),
    );
  }

  textWithIcon(String text, FaIcon icon){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: null,
          icon: icon,
        ),
        const SizedBox(),
        AutoSizeText(
          text,
          maxLines: 1,
          minFontSize: 10,
          style:  TextStyle(
            fontSize: getFontSize(30),
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}



class MobileS extends StatelessWidget {
   MobileS({Key? key, required this.image, required this.body}) : super(key: key);

  String image;
  String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: getProportionateScreenWidth(400),
          // height: getProportionateScreenHeight(350),
          child: AutoSizeText(
            body,
            // maxLines: 10,
            // minFontSize: 10,
            style: TextStyle(
              color: kWhiteText,
              fontSize: getFontSize(30),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              // fit: BoxFit.cover,
                image: AssetImage(
                    image
                ),
                fit: BoxFit.cover
            ),
          ),
          // child: Image(image: AssetImage(image)),
        ),
      ],
    );
  }
}


class DesktopS extends StatelessWidget {
   DesktopS({Key? key, required this.image, required this.body}) : super(key: key);
  String image;
  String body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            // width: getProportionateScreenWidth(400),
            height: getProportionateScreenHeight(350),
            child: AutoSizeText(
              body,
              // maxLines: 10,
              // minFontSize: 10,
              style: TextStyle(
                color: kWhiteText,
                fontSize: getFontSize(30),
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),

        Expanded(
          child: Container(
            width: getProportionateScreenWidth(650),
            height: getProportionateScreenHeight(350),
            decoration: BoxDecoration(
              image: DecorationImage(
                // fit: BoxFit.cover,
                  image: AssetImage(
                      image
                  ),
                  fit: BoxFit.cover
              ),
            ),
            // child: Image(image: AssetImage(image)),
          ),
        ),
      ],
    );
  }
}


class Content extends StatelessWidget {
  Content({Key? key, required this.title, required this.body, required this.image}) : super(key: key);

  String title; String body; String image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              title,
              maxLines: 1,
              style: TextStyle(
                color: kBlue,
                fontSize: getFontSize(73),
                  fontFamily: "Museo Sans Rounded",
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
           SizedBox(height: getProportionateScreenHeight(63),),

          if(Responsive.isDesktop(context))
            DesktopS(image: image, body: body.toString(),),
          if(Responsive.isMobile(context) || Responsive.isTablet(context))
            // DesktopS(image: image, body: body.toString(),),
            MobileS(image: image, body: body,),
        ],
      ),
    );
  }
}

