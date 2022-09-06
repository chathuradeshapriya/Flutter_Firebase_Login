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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1,
                    color: Colors.grey
                  )),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/google.svg",
                        height: 25, width: 25,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Continue with Googssle",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
