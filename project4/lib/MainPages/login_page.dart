import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.grey[200],
        child: Form(
          key: _formKey, // Assign the GlobalKey to the form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),

                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if(value.length <5){
                  return "email must be more than 5 chars";
                  }
                  else if(! value.contains("@")) {
                    return "email must include @ ";
                  }

    return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if(value == " "){
                    return "don't make space ";}
                  return null;
                },
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validation successful, perform login action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FooterBar()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // Navigate to registration page
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(height: 0.0),
              TextButton(
                onPressed: () {
                  // Navigate to registration page
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}