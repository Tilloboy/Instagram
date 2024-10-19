import 'package:flutter/material.dart';
import 'package:instagram1/hom_page/hompage.dart';

class loginstatus extends StatefulWidget {
  const loginstatus({super.key});

  @override
  State<loginstatus> createState() => _loginstatusState();
}

class _loginstatusState extends State<loginstatus> {
  // TextEditingController to get input from text fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to validate login
  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Replace "correct_username" and "correct_password" with your desired values
    if (username == "Zerotwo002" && password == "Zero002") {
      // If login is successful, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Hompage()), // Replace with your next page
      );
    } else {
      // If login fails, show a snackbar with an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect username or password!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80),
                  Text(
                    'Instagram',
                    style: TextStyle(
                      fontFamily: 'insta',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: usernameController, // Connect to controller
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone number, username, or email',
                    ),
                    onSubmitted: (value) {
                      _login(); // Trigger login when enter is pressed
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController, // Connect to controller
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    onSubmitted: (value) {
                      _login(); // Trigger login when enter is pressed
                    },
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Add "Forgot password?" functionality
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _login, // Call the login function on button press
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      // Add Facebook login functionality
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.blue),
                        Text(
                          'Log in with Facebook',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('OR'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Add "Sign up" functionality
                        },
                        child: Text(
                          " Sign up.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 90,
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Instagram or Facebook",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy next page for navigation

