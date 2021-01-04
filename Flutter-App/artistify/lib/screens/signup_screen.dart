import 'package:artistify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signin_sacreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var decorationImage = DecorationImage(
                  image: AssetImage("assets/images/gallery.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                );
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: decorationImage,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                       
                        "SIGN UP",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      FittedBox(
                          child: GestureDetector(
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignInScreen();
                            },
                          ));
                        },
                        child: Text(
                        "SIGN IN",
                        style: Theme.of(context).textTheme.button,
                      ),),),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.person,
                            color: kPrimaryColor,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Full Name",
                            ),
                          ),
                        ),
                               
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Email Address",
                          ),
                        ),
                      ),
                    ],
                  ),
                    
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                         FittedBox(
                          child: GestureDetector(
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ));
                        },
                          child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ),),),
                      ],
                    ),
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
