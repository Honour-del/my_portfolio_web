
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/folders/data/strings_data.dart';
import 'package:my_portfolio_web/folders/utils/constants.dart';
import 'package:my_portfolio_web/folders/utils/responsive.dart';
import 'package:my_portfolio_web/folders/utils/screen_size.dart';



import '../data/email_funcs.dart';
import 'home.dart';

final _formKey = GlobalKey<FormState>();
bool isLoading = false;
TextEditingController subjects = TextEditingController();
TextEditingController message = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  static String routeName = "/contact";


  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      endDrawer: Drawer(
        backgroundColor: kGrey,
        child: const customDrawer(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Container(
          // height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
              // fit: BoxFit.cover,
                image: AssetImage(
                    bg
                ),
                fit: BoxFit.cover
            ),
          ),
          child: Form(
            key: _formKey,
            child: Responsive(
                mobile: const MobileC(),
                desktop: Padding(
                  padding: padding.padding,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       AutoSizeText(
                        "Get In Touch With Me",
                        style: TextStyle(
                            color: kBlue,
                            fontSize: 40,
                            fontFamily: "Museo Sans Rounded",
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        width: getProportionateScreenWidth(900),
                        child: const AutoSizeText(
                          "You can contact me directly by"
                              "sending me a direct message either"
                              "on WhatsApp or email at "
                              "anytime/anywhere",
                          maxLines: 4,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          first(context, getProportionateScreenWidth(500)),
                          const SizedBox(width: 60,),
                          secondC(context, getProportionateScreenWidth(500)),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}

class MobileC extends StatelessWidget {
  const MobileC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SafeArea(
        child: Column(
          children: [
            AutoSizeText(
              "Get In Touch With Me",
              style: TextStyle(
                  color: kBlue,
                  fontSize: 30,
                  fontFamily: "Museo Sans Rounded",
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 50,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const AutoSizeText(
                "You can contact me directly by "
                    "sending me a direct message either "
                    "on WhatsApp or email at anytime/anywhere",
                maxLines: 4,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                ),
              ),
            ),
            const SizedBox(height: 20,),
            first(context, MediaQuery.of(context).size.width * 0.8),
        const SizedBox(height: 50,),
            secondC(context, MediaQuery.of(context).size.width * 0.8,),
          ],
        ),
      ),
    );
  }
}



  Widget first(BuildContext context, double w) {

    return Container(
      color: kGrey,
      width: w,
      height:340,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            listTile("My Address",
                const AutoSizeText(
                  "No.163 Olowo Castle",
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 10,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),), context),
            listTile("Email Me",
                const AutoSizeText(
                  "basharsherifdeen@gmail.com",
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 10,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),), context),
            listTile("Social Profiles", Row(
              children: [
                IconButton(onPressed: (){
                  launchURL("https://twitter.com/alienutd");
                }, icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: kWhiteText,
                  // size: 25,
                )),
                const SizedBox(width: 1,),
                IconButton(onPressed: (){
                  launchURL("");
                }, icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: kWhiteText,
                  // size: 25,
                )),
                const SizedBox(width: 1,),
                IconButton(onPressed: (){}, icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: kWhiteText,
                  // size: 25,
                )),
                const SizedBox(width: 1,),
                IconButton(onPressed: (){
                  launchURL("https://github.com/Honour-del");
                }, icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: kWhiteText,
                  // size: 25,
                )),
              ],
            ), context),
            listTile("Call Me",
                const AutoSizeText(
                  "+23490 2526 2315",
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 10,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500
                  ),), context),
          ],
        ),
      ),
    );
  }

  listTile(String title, Widget subtitle, BuildContext context,){
    // double w = MediaQuery.of(context).size.width;
    //  bool isIcon = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w500

          ),
        ),
        subtitle: subtitle,
      ),
    );
  }



  Widget secondC(BuildContext context, double w) {
    return SizedBox(
      width: w,
      // height: 600,
      child: Column(
        children:  [

          const SizedBox(height: 15,),
          field( name, 'FULL NAME','name', 50),

          const SizedBox(height: 15,),
          field( email, 'EMAIL', 'email address', 50),
          const SizedBox(height: 15,),
          field( subjects, 'SUBJECT', 'subject', 50),
          const SizedBox(height: 15,),
          field( message, 'MESSAGE', 'message', 70),
          // field(controller, text, hint)
          const SizedBox(height: 40,),
            submitButton(() async{
              await _submit();
            }),
        ],
      ),
    );
  }


  submitButton(VoidCallback onPressed){
  return TextButton(onPressed: onPressed,
    style: TextButton.styleFrom(
      backgroundColor: kBlue,
      fixedSize: const Size(140, 45),
    ),
    child: const Text(
      'Send message',
      style: TextStyle(
        color: Colors.white,
        // fontSize: 25
      ),
    ),
  );
  }

 _submit() {
     if (_formKey.currentState!.validate()){
       openEmail();
       // if(Responsive.isDesktop(context)) {
       //   openEmail();
       // }else if(Responsive.isTablet(context) || Responsive.isMobile(context)){
       //   sendEmail();
       // }
       name.clear();
       message.clear();
       email.clear();
       subjects.clear();
    }else {
        return ("Form is invalid");
      }
    // _formKey.currentState!.save();
    ///the submit action will now be called

    // this.widget.presenter.onCalculateClicked(_weight, _height);

}







  field(TextEditingController controller, String text, String hint, double height, ){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          height: height,
          margin: const EdgeInsets.only(left: 30, right: 30),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: const Color(0XFFdae1eb),
              //color: Color.fromRGBO(241, 241, 241, 1),
              borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
            // keyboardType: TextInputType.emailAddress,
            obscureText: false,
            controller: controller,
            keyboardType: TextInputType.text,
            // onSaved: (value) {
            //   _weight = value;
            // },
            validator: (value) => (value!.isEmpty ) ? "This field cannot be blank" : null,
          ),
        ),
      ],
    );
  }
