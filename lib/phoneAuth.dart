import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/otpScreen.dart';

class phoneAuth extends StatefulWidget {
  const phoneAuth({super.key});

  @override
  State<phoneAuth> createState() => _phoneAuthState();
}

class _phoneAuthState extends State<phoneAuth> {
  TextEditingController phonecontroller = TextEditingController();

  final authCred = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> verifyPhoneNumber() async {
    try {
      setState(() {
        isLoading = true;
      });

      await authCred.verifyPhoneNumber(
          phoneNumber: "+91${phonecontroller.text}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await authCred.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e);

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$e')));
          },
          codeSent: (String verificationId, int? token) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => otpScreen(
                          verificationId: verificationId,
                        )));
          },
          codeAutoRetrievalTimeout: (v) {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " phone auth screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(26, 51, 61, 1),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "enter phone number",
                    labelText: "Phone number",
                    suffixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: phonecontroller,
                keyboardType: TextInputType.number),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: verifyPhoneNumber,
              child: isLoading
                  ? CircularProgressIndicator()
                  : const Text("Verify phone number"))
        ],
      ),
    );
  }
}
