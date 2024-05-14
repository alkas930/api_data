import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/loginpage.dart';
import 'package:project1/page.dart';
import 'package:project1/routes.dart';

class otpScreen extends StatefulWidget {
  final String verificationId;
  const otpScreen({super.key, required this.verificationId});

  @override
  State<otpScreen> createState() =>
      _otpScreenState(verificationId: this.verificationId);
}

class _otpScreenState extends State<otpScreen> {
  TextEditingController otpcontroller = TextEditingController();

  final String verificationId;

  _otpScreenState({
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " otp screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(26, 51, 61, 1),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Verification",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Enter the code sent to the number"),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "enter otp",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              controller: otpcontroller,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                try {
                  // PhoneAuthCredential cred = PhoneAuthProvider.credential(
                  //     verificationId: widget.verificationId,
                  //     smsCode: otpcontroller.text.toString());

                  // FirebaseAuth.instance
                  //     .signInWithCredential(cred)
                  //     .then((value) => {
                  //           Navigator.pushAndRemoveUntil(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => ProductPage()),
                  //             (route) => false,
                  //           )
                  //           // Navigator.pushNamed(context, loginRoute)
                  //         });
                  PhoneAuthCredential cred = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpcontroller.text);
                } catch (e) {
                  print('----------------eror from otp==========$e');
                }
              },
              child: Text('submit'))
        ],
      ),
    );
  }
}
