import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screen/homePage.dart';
import 'signUpPage.dart';
// import 'homePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget buildSignUpBtn(BuildContext context) {
  return GestureDetector(
    onTap: () {
      print("Dont Have an Acc?");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUpScreen()));
    },
    child: RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: 'Dont have an Account?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: ' Sign Up',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  String loggedInUsername = '';
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Data Dummy untuk login
  String dummyUsername = 'admin';
  String dummyPassword = 'admin123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x663468C0),
                    Color(0x993468C0),
                    Color(0xcc3468C0),
                    Color(0xff3468C0),
                  ])),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Replace with your image asset path
                        width: 300, // Set width as needed
                        height: 300, // Set height as needed
                        // You can adjust fit and other properties here
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextField(
                              controller: _usernameController,
                              // keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 10),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xff00B3FF),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.black38)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  const BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 10),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff00B3FF),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.black38)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              primary: Colors.white),
                          onPressed: () {
                            // Memeriksa login dengan data dummy
                            if (_usernameController.text == dummyUsername &&
                                _passwordController.text == dummyPassword) {
                              loggedInUsername = _usernameController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Logged In')),
                              );
                            } else {
                              // Jika login gagal
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Login Failed,Wrong email or password')),
                              );
                            }
                          },
                          child: Text('Login'),
                        ),
                      ),
                      buildSignUpBtn(context)
                    ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
