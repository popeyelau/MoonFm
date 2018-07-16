import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sigin In",
                    style: TextStyle(color: Colors.white, fontSize: 32.0),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "To access your own data, please Login in with a Monn.FM account or sign in with Facebook account",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(22.0)),
                    height: 44.0,
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed("/home"),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 60.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: TextSpan(
                              text: "No Accounts?  ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12.0),
                                )
                              ]),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
