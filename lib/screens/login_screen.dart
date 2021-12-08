import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_designs/screens/login_screen_2.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String mobile = "";
  TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
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
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                hintText: "Mobile Number",
                labelText: "Mobile",
              ),
              controller: _mobile,
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
                  mobile = _mobile.text;

                  var request = http.Request(
                      'POST',
                      Uri.parse(
                          'http://dev.carclenx.com/api/V2/customers/get-otp?phone=$mobile'));

                  http.StreamedResponse response = await request.send();

                  if (response.statusCode == 200) {
                    print(await response.stream.bytesToString());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login(mobile)));
                  } else {
                    print(response.reasonPhrase);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid phone number or Internal error")));
                  }
                },
                child: Text("Get OTP",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
