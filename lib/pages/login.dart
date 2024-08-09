import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email'
                  ),
                ),
              ),

              // Password
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password...'
                  ),
                ),
              ),

              //Login Button
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
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
                  child: const Text('Login'),
                ),
              ),

              //Login Via Google Button
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
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
                  child: Text('Login via Google')),
              ),

              //Register Button
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
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
                  onPressed: () {},
                  child: const Text('Register')),
              ),

              // Forgot Password?
               Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                  ),
                  onPressed: () {},
                  child: const Text('Forgot Password?')),
              ),
            ],
          ),
        ),
      )
    );
  }
}