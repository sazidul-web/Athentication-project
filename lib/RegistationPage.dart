import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapps/HomePage.dart';
import 'package:newapps/LoginPage.dart';

class Registationpage extends StatefulWidget {
  @override
  State<Registationpage> createState() => _RegistationpageState();
}

class _RegistationpageState extends State<Registationpage> {
// Authentication are first step Controller create kora and TextFromField a controller=Controller bosano================================== !! ......
  String Name = '', Email = '', Password = '';
  TextEditingController NameController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
// Form are state track kore form are validation track kore ============================================================================== !! ......
  final _formkey = GlobalKey<FormState>();
// akhane registation are funtion carreate kora hoice && (sign in are button conditon diya login setup kora hoice && gmail password save rakher jnno firebase authenticaton kora hoice.)
  registation() async {
    if (Password != null &&
        NameController.text != "" &&
        EmailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: Email, password: Password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Registration Successfully Done.',
            style: TextStyle(fontSize: 20),
          ),
        ));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Password provided is too weak.',
                style: TextStyle(fontSize: 20),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account already exits.',
                style: TextStyle(fontSize: 20),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/car.PNG'),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Form(
                    // validation formkey add
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
                            return 'Please Enter your name';
                          } else {
                            return null;
                          }
                        },
                        // controller
                        controller: NameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18,
                          ),
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
                  // Registration compelete kora hoice ================================================================== !!! ......
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          Name = NameController.text;
                          Email = EmailController.text;
                          Password = PasswordController.text;
                        });
                      }
                      registation();
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
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
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
                      Image.asset(
                        'assets/google.png',
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        'assets/apple1.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
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
                        'Alraddy have an account ?',
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
                                  builder: (context) => Loginpage()));
                        },
                        child: Text(
                          'Login',
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
            ),
          ],
        ),
      ),
    );
  }
}
