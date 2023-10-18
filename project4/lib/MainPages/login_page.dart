import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'Home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    // Create an instance of Dio
    final dio = Dio();

    try {
      // Send a POST request to your login API endpoint
      final response = await dio.post(
        'https://your-api-endpoint.com/login',
        data: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Login successful, navigate to the home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FooterBar()),
        );
      } else {
        // Login failed, display an error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the text controllers
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            controller: _emailController,
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
              if (value.length < 5) {
                return 'Email must be more than 5 characters';
              }
              if (!value.contains('@')) {
                return 'Email must include @';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordController,
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
              if (value.trim().isEmpty) {
                return "Don't make space";
              }
              return null;
            },
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Validation successful, perform login action
                _login();
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
                // Navigate to forgot password page
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
          )
            ],
          ),
        ),
      ),
    );
  }
}