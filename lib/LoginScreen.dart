import 'package:flutter/material.dart';
import 'package:techstore_app/dashboard.dart';
class LogInScreen extends StatefulWidget{
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  GlobalKey<FormState> _formKey= GlobalKey<FormState>(); ///validation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("login",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? text){
                      if(text!.isEmpty){
                        return "Enter your email";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 6),
                  TextFormField(
                    validator: (String? text){
                      if(text!.isEmpty){
                        return "Enter your password";
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> DashBoardScreen()
                            ));
                          }
                        }, child: Text("Next")
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}