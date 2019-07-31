import "package:flutter/material.dart";

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/bg.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    "assets/icon.png",
                    width: 150,
                  ),
                  Spacer(),
                  Text(
                    "TRAVaL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 31,
                    ),
                  ),
                  Text(
                    "Prepare your own trip with us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                  Spacer(),
                  MyButton(
                    buttonColor: Color(0xff48808d),
                    border: null,
                    buttonText: "Sign Up",
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  MyButton(
                    buttonColor: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    buttonText: "Sign In",
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final Border border;
  final String buttonText;
  const MyButton(
      {Key key, @required this.buttonColor, this.border, this.buttonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
          border: border,
        ),
        padding: EdgeInsets.symmetric(vertical: 9.0),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 21),
          ),
        ),
      ),
    );
  }
}
