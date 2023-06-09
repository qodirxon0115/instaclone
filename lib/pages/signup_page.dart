import 'package:flutter/material.dart';
import 'package:instaclone/pages/home_page.dart';
import 'package:instaclone/pages/service/utils_service.dart';
import 'package:instaclone/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "signup_page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var isLoading = false;
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var cPassController = TextEditingController();


  _doSignUp(){
    String name = fullNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String pass = passController.text.toString().trim();
    String password = cPassController.text.toString().trim();
    if(name.isEmpty || email.isEmpty || pass.isEmpty) return;

    if(password != pass){
      Utils.fireToast("Password and confirm password does not match");
      return;
    }
    Navigator.pushReplacementNamed(context, HomePage.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(193, 53, 132, 1),
                  Color.fromRGBO(131, 58, 180, 1),
                ]
            )
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Instagram",
                    style: TextStyle(
                        color: Colors.white, fontSize: 45, fontFamily: "Billabong"),),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: fullNameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Fullname",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: passController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: cPassController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap:(){
                      _doSignUp();
                    },
                    child:  Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 50,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Center(
                          child: Text("Sign Up", style:
                          TextStyle(color: Colors.white, fontSize: 17),),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),),

                  const SizedBox(width: 8,),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                    },
                    child: const Text("Sign In",
                      style: TextStyle(
                          color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
