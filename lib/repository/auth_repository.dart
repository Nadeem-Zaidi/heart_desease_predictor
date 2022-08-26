import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  final FirebaseAuth _firebaseAuth;
  String _verificationCode = "";
  String? errorMsg = "";

  String vcode() {
    return _verificationCode;
  }

  FirebaseAuthRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (authCredential) =>
              verificationComplete(authCredential),
          verificationFailed: (authException) =>
              verificationFailed(authException),
          codeSent: (verificationId, [code]) =>
              _smsCodeSent(verificationId, [code]),
          codeAutoRetrievalTimeout: (verificationId) =>
              _codeAutoRetrievalTimeout(verificationId));
    } catch (e) {
      print("Error");
    }
  }

  verificationComplete(AuthCredential authCredential) async {
    print("running verification complete");
    print(authCredential);
  }

  void _smsCodeSent(String verificationId, List<int?> code) async {
    print("running code sent");
    _verificationCode = verificationId;
  }

  Future<String?> verificationFailed(
      FirebaseAuthException authException) async {
    print("running verification failed");
    errorMsg = authException.code;
    return authException.message;
  }

  void _codeAutoRetrievalTimeout(String verificationCode) async {
    print("inside verification");
    print(verificationCode);
  }

  signInWithSMS(String sms) async {
    AuthCredential phoneAuth = PhoneAuthProvider.credential(
        verificationId: _verificationCode, smsCode: sms);

    await FirebaseAuth.instance.signInWithCredential(phoneAuth);
  }
}
