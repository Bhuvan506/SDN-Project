import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdn_project/Components/button.dart';
import 'package:sdn_project/Components/squaretile.dart';
import 'package:sdn_project/Components/textfield.dart';
import 'package:sdn_project/Services/auth_service.dart';
import 'globals.dart' as globals;

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    try {
      globals.type = 'email';
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);
      if(e.code == 'invalid-login-credentials') {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.redAccent,
              title: Center(child: Text('Invalid login credentials', style: TextStyle(color: Colors.white))),
            );
          },
        );
      } else if(e.code == 'too-many-requests') {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.redAccent,
              title: Center(child: Text('Too many requests. Try again later!', style: TextStyle(color: Colors.white))),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Icon(Icons.camera_outlined, size:100),
                const SizedBox(height: 50),
                const Text('Welcome back you\'ve been missed!', style: TextStyle(color: Colors.black54, fontSize: 18,)),
                const SizedBox(height: 25),
                MyTextField(controller: emailController, hintText: 'Email', obscureText: false,),
                const SizedBox(height: 10),
                MyTextField(controller: passwordController, hintText: 'Password', obscureText: true,),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black12,
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            'Or continue with',
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black12,
                          ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        imagePath: 'lib/images/google.png',
                        onTap: () =>
                        {
                          AuthService().signInWithGoogle(),
                          globals.type = 'google',
                        }
                    ),
                    const SizedBox(width: 25),
                    SquareTile(
                        imagePath: 'lib/images/fb.png',
                        onTap: () =>
                        {
                          AuthService().signInWithFacebook(),
                          globals.type = 'facebook',
                        }
                    ),
                    const SizedBox(width: 25),
                    SquareTile(
                        imagePath: 'lib/images/github.png',
                        onTap: () =>
                        {
                          AuthService().signInWithGithub(context),
                          globals.type = 'github',
                        }
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'No account?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ]),
          ),
        ),
      ),
    );

  }
}