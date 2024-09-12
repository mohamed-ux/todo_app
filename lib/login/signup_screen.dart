import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/login/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = 'signUp';

   SignupScreen({super.key});
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'Sign Up',
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
                controller: userController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  label: Text(
                    'User Name',
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  label: Text(
                    'Phone',
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
                obscureText: true,
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
                    FirebaseFunctions.createAccountAuth(emailController.text, passwordController.text,
                        phone: phoneController.text,
                        userName: userController.text,
                        onError: (error){
                          showDialog(context: context, builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text(error),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('OK'))
                            ],
                          ),);
                        },
                    onSuccess: (){Navigator.pushNamed(context, LoginScreen.routeName);});
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[300],minimumSize: Size(double.infinity, 50)),

                  child: Text('Sign Up',style: TextStyle(fontSize: 20,color: Colors.white),)),
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text.rich(TextSpan(children:[
                    TextSpan(text: 'I Have An Account? '),
                    TextSpan(text: 'Login',style: TextStyle(color: Colors.blue[400],fontWeight: FontWeight.bold)),
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
