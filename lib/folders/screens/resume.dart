
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_web/folders/data/strings_data.dart';
import 'package:my_portfolio_web/folders/utils/constants.dart';
import 'package:my_portfolio_web/folders/utils/responsive.dart';
import 'package:my_portfolio_web/folders/utils/screen_size.dart';

import 'home.dart';


class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  static String routeName = "/resume";

  @override
  // ignore: library_private_types_in_public_api
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
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
        decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage(
              bg
          ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 50,
          ),
          child: ListView(
            children: [
              AutoSizeText(
                "Resume",
                style: TextStyle(
                  fontSize: 50,
                  color: kBlue,
                    fontFamily: "Museo Sans Rounded",
                    fontWeight: FontWeight.w700
                ),
              ),

              const SizedBox(height: 35,),

              if(Responsive.isMobile(context) || Responsive.isTablet(context))
                AutoSizeText(
                  resume,
                  style: TextStyle(
                    color: kWhiteText,
                    fontSize: 20,
                  ),
                ),
              if(Responsive.isDesktop(context))
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(120),
                    right: getProportionateScreenWidth(120),
                  ),
                  child: AutoSizeText(
                    resume,
                    style: TextStyle(
                      color: kWhiteText,
                      fontSize: 20,
                    ),
                  ),
                ),
              const SizedBox(height: 50,),
              if(Responsive.isDesktop(context))
                const Desktop(),
              if(Responsive.isMobile(context) || Responsive.isTablet(context))
                const Mobile(),
            ],
          ),
        ),
      ),
    );
  }
}



class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        firstR(context, MediaQuery.of(context).size.width * 0.89),
        const SizedBox(height: 0,),
        secondR(context, MediaQuery.of(context).size.width * 0.89)
      ],
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        firstR(context, getProportionateScreenWidth(590)),
        secondR(context, getProportionateScreenWidth(658)),
      ],
    );
  }
}



Widget firstR(BuildContext context, double w) {
  return SizedBox(
    width: w,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Summary",
            style: TextStyle(
              color: kWhiteText,
              fontSize: 33,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500
            ),
          ),
        ),

        const SizedBox(height: 0,),

        steps(context,  "ALIENWEAR", summary),

        const SizedBox(height: 2,),

        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Education",
            style: TextStyle(
              color: kWhiteText,
              fontSize: 33,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500
            ),
          ),
        ),

        steps(context,  "MASTER OF MOBILE DEVELOPMENT", education),
        const SizedBox(height: 150,),
      ],
    ),
  );
}



Widget secondR(BuildContext context, double w) {
  return SizedBox(
    width: w,
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Professionalism",
            style: TextStyle(
              color: kWhiteText,
              fontSize: 33,
              fontFamily: "Museo Sans Rounded",
              fontWeight: FontWeight.w500
            ),
          ),
        ),

        const SizedBox(height: 0,),
        Stepper(
          steps: [
            Step(
              title: AutoSizeText(
                "SENIOR DEVELOPER",
                maxLines: 1,
                style: TextStyle(
                  color: kBlue,
                  fontSize: 30,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500
                ),
              ),
              content: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(senior,
                  // maxLines: 6,
                  style: TextStyle(
                    color: kWhiteText,
                    fontSize: 20,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500
                  ),),
              ),
            ),


            Step(
              title: AutoSizeText(
                "GRAPHIC DESIGN SPECIALIST",
                maxLines: 1,
                style: TextStyle(
                  color: kBlue,
                  fontSize: 30,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500
                ),
              ),
              content: AutoSizeText(
                graphic,
                // maxLines: 6,
                style: TextStyle(
                  color: kWhiteText,
                  fontSize: 20,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500
                ),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 65,
            bottom: 125
          ),
          child: SizedBox(
            child: AutoSizeText(
              graphic,
              style: TextStyle(
                color: kWhiteText,
                fontSize: 20,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    ),
  );
}



Widget steps(BuildContext context, String title, String content) {
  return Flexible(
    child: Stepper(
      steps: [
        Step(
          title: AutoSizeText(title,
            maxLines: 1,
            style: TextStyle(
              color: kBlue,
              fontSize: 30,
            ),
          ),
          content: Align(
            alignment: Alignment.centerLeft,
            child: Text(content,
              // maxLines: 6,
              // overflow:  TextOverflow.ellipsis,
              style: TextStyle(
                color: kWhiteText,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
