import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_designs/screens/home_screen.dart';

class Login extends StatefulWidget {
  String mobile;
  Login(this.mobile);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mobile = "";

  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding:EdgeInsets.all(30),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintText: "otp",
                labelText: "OTP",
              ),
              controller: _password,
              obscureText: true,
            ),
            Container(
              height: 45,
              width: size.width / 1.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              child: MaterialButton(
                onPressed: () async {
                  var otp = _password.text;

                  var request = http.Request(
                      'POST',
                      Uri.parse(
                          'http://dev.carclenx.com/api/V2/customers/validate-otp?phone=${widget.mobile}&otp=$otp'));

                  http.StreamedResponse response = await request.send();

                  if (response.statusCode == 200) {
                    print(await response.stream.bytesToString());
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                        );
                  } else {
                    print(response.reasonPhrase);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                  }
                },
                child: Text("Log in",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
