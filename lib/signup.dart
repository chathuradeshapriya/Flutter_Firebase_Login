import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:login_with_firebase/auth_service.dart';
import 'package:login_with_firebase/signin.dart';

import 'homepage.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _AignUpState();
}

class _AignUpState extends State<SignUp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool circular = false;
  AuthClass authClass =AuthClass();

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
          buttonItem("assets/google.svg", "Continue with Google", 25,
              () async {
            await authClass.googleSignIn(context);
              }),
          SizedBox(
            height: 15,
          ),
          buttonItem("assets/phone.svg", "Continue with Phone", 30, () {} ),
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
                "If you already have an account? ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (builder) => SignIn()),
                  (route) => false);
                },
                child: Text(
                  "Login ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ]),
      ),
    ));
  }

  Widget colorButton() {
    return InkWell(
      onTap: () async {
        setState((){
          circular = true;
        }
        );

      try{
        firebase_auth.UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text);

        print(userCredential.user!.email);
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
            " SIgn Up",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget buttonItem(String imagepath, String buttonName, double size, Function onTap) {
    return InkWell(
      // onTap:  () => onTap,

      onTap: () => onTap(),
      child: Container(
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


