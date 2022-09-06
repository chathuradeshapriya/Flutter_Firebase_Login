import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _AignUpState();
}

class _AignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          buttonItem("assets/google.svg", "Continue with Google", 25),
          SizedBox(
            height: 15,
          ),
          buttonItem("assets/phone.svg", "Continue with Phone", 30),
          SizedBox(
            height: 20,
          ),
          Text(
            "Or",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          textItem("Email..."),
          SizedBox(
            height: 15,
          ),
          textItem("Password..."),
          SizedBox(
            height: 30,
          ),
          colorButton(),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("If you already have an account? ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text("Login ",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          )
        ]),
      ),
    ));
  }

  Widget colorButton() {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0xFFFD746C),
            Color(0xFFFF9068),
            Color(0xFFFD746C),
          ])),
      child: Center(
        child: Text(
          " SIgn Up",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buttonItem(String imagepath, String buttonName, double size) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: Card(
        color: Colors.black,
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagepath,
              height: size,
              width: size,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              buttonName,
              style: TextStyle(fontSize: 17, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget textItem(String labelText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
          decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 17, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      )),
    );
  }
}
