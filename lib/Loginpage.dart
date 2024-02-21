import 'package:flutter/material.dart';
import 'package:login/homepage.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        // Use a calmer, neutral palette as suggested
        primaryColor: Colors.tealAccent[700], // Teal, calming and refreshing
        scaffoldBackgroundColor: Colors.grey[200], // Light gray, neutral
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 16,
              color: Colors.grey[600]), // Slightly darker text for readability
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Local list of usernames and passwords
  Map<String, String> userCredentials = {
    'user1': 'pass1',
    'user2': 'pass2',
    // Add more users as needed
  };

  String errorMessage = '';

  void _login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    // Check if username exists in the local list
    if (userCredentials.containsKey(username)) {
      // Check if password matches
      if (userCredentials[username] == password) {
        // Successful login
        setState(() {
          errorMessage = '';
        });
        // Navigate to the home page after successful login
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Incorrect password
        setState(() {
          errorMessage = 'Incorrect password';
        });
      }
    } else {
      // Username not found
      setState(() {
        errorMessage = 'Username not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove gradient as suggested
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Use a relevant and well-sized icon
              Icon(
                Icons.healing,
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                // Use clear labels and placeholders
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  prefixIcon:
                      const Icon(Icons.person_outline, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
