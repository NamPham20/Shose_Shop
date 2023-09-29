import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shoes_shop/view/recovery_password.dart';
import 'package:shoes_shop/view/register_acc.dart';

import 'myhome_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscureText = true;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      KeyboardDismisser(
        gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
        child: SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 0.1,
                  fillColor: Colors.white70,
                  padding: const EdgeInsets.all(10.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Text(
              'Hello Again!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text(
              'Fill your details or continue with',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'social media',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email Address'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'xyz@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Password'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Enter text',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        )),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const RecoveryScreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Recovery Password')],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(13, 110, 253,1.0)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(top: 15,bottom: 15)
                            )
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen() ));
                          });
                        },
                        child: const Text('SignIn',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                      ))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(top: 15,bottom: 15)
                            ),

                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/logo_gg.svg'),
                            const SizedBox(width: 10,),
                            const Text('Sign In With Google',style: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),),
                          ],
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(height: 180,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New User?',style: TextStyle(
                        color: Colors.grey,
                      ),),
                      const SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const RegisterAcc()));
                        },
                        child: const Text('Create Account',style: TextStyle(
                          color: Colors.black,
                        ),),
                      )
                    ],

                  )
                ],
              ),
            ),
          ],
        ),)
    )),
      );
  }
}
