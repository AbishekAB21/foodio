import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async{
    return await auth.currentUser;
  }

  Future deleteAccount() async{
    User? user= await FirebaseAuth.instance.currentUser;
    user?.delete();
  }
}