import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  // Prep the 3 controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPassController = TextEditingController();

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty.';
    }

    // Regular expression for validating an email address
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format.';
    }

    // If both checks pass, return an empty string or a success message
    return '';
  }

  String validatePassword(String password) {
  if (password.length < 8) {
    return 'Password must be at least 8 characters long.';
  }

  if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
    return 'Password must contain at least one uppercase letter.';
  }

  if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
    return 'Password must contain at least one lowercase letter.';
  }

  if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
    return 'Password must contain at least one digit.';
  }

  if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
    return 'Password must contain at least one special character.';
  }

  // If all checks pass, return an empty string or a success message
  return ''; // or return 'Password is valid.';
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Email
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email'
                  ),
                ),
              ),

              // Password
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password...'
                  ),
                ),
              ),

              // One For confirming password
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  obscureText: true,
                  controller: confirmPassController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Reenter Password to confirm...'
                  ),
                ),
              ),

              // Button to access Login
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate Entry
                    final passValidation = validatePassword(passwordController.text);
                    final emailValidation = validateEmail(emailController.text);
                    if (passValidation.isNotEmpty){
                      // Show Flutter Toast Error
                      Fluttertoast.showToast(
                        msg: passValidation,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM
                      );
                    } else if (emailValidation.isNotEmpty){
                      // Show Flutter Toast Error
                      Fluttertoast.showToast(
                        msg: emailValidation,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM
                      );
                    }else{
                      // Ship it over to Firebase and await confirmation
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                  ),
                  child: const Text('Create Account'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}