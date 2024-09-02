import 'package:flutter/material.dart';
import 'screens/Home Page.dart';

void main() {
  runApp(MovieManiaApp());
}

class MovieManiaApp extends StatefulWidget {
  @override
  _MovieManiaAppState createState() => _MovieManiaAppState();
}

class _MovieManiaAppState extends State<MovieManiaApp> {
  bool _isDarkMode = false;

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.lightBlue[50],
    appBarTheme: AppBarTheme(color: Colors.blueGrey),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
  );

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(color: Colors.blueGrey[800]),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey[800],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
  );

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieMania',
      theme: _isDarkMode ? _darkTheme : _lightTheme,
      home: SignInPage(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}

class SignInPage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  SignInPage({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cinema_background.jpg'), // Add a cinematic background
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'MovieMania',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(toggleTheme: toggleTheme, isDarkMode: isDarkMode)),
                );
              },
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Navigate to Forgot Password page
              },
              child: Text('Forgot Password?', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20.0),
            Text(
              "Don't have an account?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Sign Up page
              },
              child: Text('Sign Up', style: TextStyle(color: Color(0xff04042e))),
            ),
          ],
        ),
      ),
    );
  }
}
