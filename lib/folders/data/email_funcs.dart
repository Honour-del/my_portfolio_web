
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:my_portfolio_web/folders/screens/contact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

sendEmail() async{
  final Email sendEmail = Email(
    body: message.text.toString(),
    subject: name.text.toString(),
    recipients: ['basharsherifdeen@gmail.com'],
    cc: ['example_cc@ex.com'],
    bcc: ['example_bcc@ex.com'],
    attachmentPaths: ['/path/to/email_attachment.zip'],
    isHTML: false,
  );

  // ignore: unused_local_variable
  String platformResponse;

  try {
    await FlutterEmailSender.send(sendEmail);
    platformResponse = 'success';
  } catch (error) {
    platformResponse = error.toString();
  }

  // print("THIS IS : $platformResponse");
  //
  // if (!mounted) return;
  //
  // _scaffoldKey.currentState.showSnackBar(SnackBar(
  //   content: Text(platformResponse),
  // ));
  // await FlutterEmailSender.send(send_email);
}


openEmail()async{
  String email = Uri.encodeComponent("basharsherifdeen@gmail.com");
  String subject = Uri.encodeComponent(subjects.text);
  String body = Uri.encodeComponent(message.text);
  // print(subject); //output: Hello%20Flutter
  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  if (await launchUrl(mail)) {
    //email app opened
  }else{
    //email app is not opened
  }
}

sendMail() async {
  // Android and iOS
  String email = "basharsherifdeen@gmail.com";
  // const uri = 'mailto:test@example.org?subject=Greetings&body=Hello%20World';
  if (await canLaunchUrlString("mailto:$email")) {
    await launchUrlString("mailto:$email");
  } else {
    throw 'Could not launch $email';
  }
}
