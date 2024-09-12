import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/todo/homeScreen.dart';
import 'package:asseignment_flutter/todo/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

   LoginScreen({super.key});
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<LoginProvider>(context);
    return Scaffold(
     // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              //Image.asset('assets/images/login.png'),
              Center(
                child: Image.asset(
                  'assets/images/logo (1).png',
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Login',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400],
                    fontSize: 35),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  label: Text(
                    'Email',
                    style: TextStyle(fontSize: 15),
                  ),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  label: Text(
                    'Password',
                    style: TextStyle(fontSize: 15),
                  ),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFunctions.signInAuth(emailController.text, passwordController.text,onError: (error){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text(error),
                        actions: [
                          ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('OK'))
                        ],
                      ),);
                    },
                    onSuccess: (label){
                      pro.initUser();
                      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false, arguments:label );
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[300],minimumSize: Size(double.infinity, 50)),
          
                  child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),)),
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
                child: Center(
                  child: Text.rich(TextSpan(children:[
                    TextSpan(text: 'Do You Have An Account? '),
                    TextSpan(text: 'Register',style: TextStyle(color: Colors.blue[400],fontWeight: FontWeight.bold)),
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
