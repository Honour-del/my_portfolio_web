import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_web/folders/data/strings_data.dart';
import 'package:my_portfolio_web/folders/utils/constants.dart';
import 'package:my_portfolio_web/folders/utils/responsive.dart';
import 'package:my_portfolio_web/folders/utils/screen_size.dart';

import 'home.dart';

class Portfolio extends ConsumerWidget {
  const Portfolio({Key? key}) : super(key: key);
  static String routeName = '/portfolio';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(notice);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      endDrawer: Drawer(
        backgroundColor: kGrey,
        child: const customDrawer(),
      ),
      key: currentState.scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
              bg
          ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Responsive(
            mobile: const Mobile(),
            tablet: const Mobile(),
            desktop: Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(80),
                  left: getProportionateScreenWidth(129),
                  right: getProportionateScreenWidth(228),
                  bottom: getProportionateScreenHeight(90)
              ),
              child: Row(
                children: const [
                  PortContainer(),
                  SizedBox(width: 90,),
                  Second()
                ],
              ),
            ),
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
    return Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(80),
          left: getProportionateScreenWidth(129),
          right: getProportionateScreenWidth(129),
          bottom: getProportionateScreenHeight(90)
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: kGrey,
              height: 600,
              // height: hQuery * 0.85,
              width: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(29),
                  ),
                  AutoSizeText(
                    'Portfolio',
                    style: TextStyle(
                        fontSize: 50,
                        color: kBlue,
                        fontFamily: "Museo Sans Rounded",
                        fontWeight: FontWeight.w700
                      // fontStyle: GoogleFonts.georgia
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      child: AutoSizeText(
                        porfolio_text,
                        maxLines: 25,
                        style: TextStyle(
                            fontSize: getFontSize(20),
                            color: kWhiteText,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30,),

            Container(
              color: kGrey,
              height: 600,
              // height: hQuery * 0.85,
              width: 500,
              child: const Text(
                  'Images'
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PortContainer extends StatelessWidget {
  const PortContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrey,
      height: 600,
      // height: hQuery * 0.85,
      width: 500,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(29),
          ),
          AutoSizeText(
            'Portfolio',
            style: TextStyle(
              fontSize: 50,
              color: kBlue,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500
              // fontStyle: GoogleFonts.georgia
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              child: AutoSizeText(
                porfolio_text,
                maxLines: 25,
                style: TextStyle(
                  fontSize: getFontSize(20),
                  color: kWhiteText,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kGrey,
        height: 600,
        // height: hQuery * 0.85,
        width: 900,
        child: const Text(
            'Images'
        ),
      ),
    );
  }
}
