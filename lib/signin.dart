import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'homepage.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool circular = false;

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
            "Sign In",
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
          textItem("Email...", _emailController, false),
          SizedBox(
            height: 15,
          ),
          textItem("Password...", _passwordController, true),
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
              Text(
                "If you don't have an account? ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Forgot Password ",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    ));
  }

  Widget colorButton() {
    return InkWell(
      onTap: () async {
        try{
          firebase_auth.UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text);

          print(userCredential.user?.email);
          setState((){
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (builder) => HomePage()),
                  (route) => false);
        } catch (e){
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState((){
            circular = false;
          });
        }
      },
      child: Container(
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
          child: circular? CircularProgressIndicator() : Text(
            " SIgn In",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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

  Widget textItem(String labelText, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
          style: TextStyle(fontSize: 17, color: Colors.white),
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 17, color: Colors.white),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1.5, color: Colors.amber),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
          )),
    );
  }
}
