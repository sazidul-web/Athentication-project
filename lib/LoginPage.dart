import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapps/ForgetPassword.dart';
import 'package:newapps/HomePage.dart';
import 'package:newapps/RegistationPage.dart';
import 'package:newapps/Services/auth.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String Email = "", Password = "";
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No User Found For That Email.',
              style: TextStyle(fontSize: 20),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'Wrong password provided by user',
              style: TextStyle(fontSize: 20),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/car.PNG',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        // validation chack
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your email';
                          } else {
                            return null;
                          }
                        },
                        // controller add
                        controller: EmailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(color: Color(0xFFb2b7bf), fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFedf0f8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      // validation chack
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your password';
                        } else {
                          return null;
                        }
                      },
                      //controller add
                      controller: PasswordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(0xFFb2b7bf),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          Email = EmailController.text;
                          Password = PasswordController.text;
                        });
                      }
                      userlogin();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Color(0xFF273671),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text(
                      'Forget password',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8c8e98),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Or LogIn With',
                    style: TextStyle(
                        color: Color(0xFF273671),
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AuthMethods().signInWithGoogle(context);
                        },
                        child: Image.asset(
                          'assets/google.png',
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          // AuthMethods().signInWithApple();
                        },
                        child: Image.asset(
                          'assets/apple1.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color(0xFF8c8e89),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registationpage()));
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              color: Color(0xFF273671),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
