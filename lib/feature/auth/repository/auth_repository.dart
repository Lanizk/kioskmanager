import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fpdart/fpdart.dart';

import 'package:kiosk_app/core/constants/constants.dart';
import 'package:kiosk_app/core/failure.dart';
import 'package:kiosk_app/core/type_def.dart';
import 'package:kiosk_app/core/constants/firebase_constants.dart';
import 'package:kiosk_app/core/constants/providers/firebase_provider.dart';
import 'package:kiosk_app/model/user_model.dart';



final authRepositoryProvider=Provider((ref)=>AuthRepository(
    fireStore: ref.read(firestoreProvider),
    firebaseAuth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));


class AuthRepository {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;


  AuthRepository({
    required FirebaseFirestore fireStore,
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })
      :_fireStore=fireStore,
        _firebaseAuth=firebaseAuth,
        _googleSignIn=googleSignIn;


  CollectionReference get _users=>
      _fireStore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange=>_firebaseAuth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle() async {

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(Failure('Google SignIn Aborted'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );

      final userCredetials = await _firebaseAuth.signInWithCredential(
          credential);
      UserModel userModel;

      if (userCredetials.additionalUserInfo?.isNewUser ?? false) {
        userModel = UserModel(
            uid: userCredetials.user!.uid,
            email: userCredetials.user!.email ?? '',
            displayName: userCredetials.user!.displayName ?? 'No Name',
            photoUrl: userCredetials.user!.photoURL ?? Constants.avatarDefault,
            kioskId: null,
            role: "owner");

        await _users.doc(userModel.uid).set(userModel.toMap());
      }
      else {
        userModel = await getUserData(userCredetials.user!.uid).first;
      }

      return right(userModel);
    }
    on FirebaseAuthException catch(e){
      return left(Failure.auth(e.message??"Auth error",code: e.code));
    }
    on FirebaseException catch(e){
      return left(Failure.firestore(e.message??"Firetore error", code:e.code));
    }
    on Exception catch (e) {
      return left(Failure.unknown(e.toString()));
    }
    }

    Stream<UserModel> getUserData(String uid)
    {
      return _users.doc(uid).snapshots().map(
          (event)=>UserModel.fromMap(event.data() as Map<String,dynamic>)
      );
  }


  Future<void> logOut() async{

    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  FutureEither<UserModel> signUpWithEmail({
    required String email,
    required String password,
    }) async{
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = userCredential.user!;
      final userModel = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName?? 'No Name',
        photoUrl: user.photoURL ?? Constants.avatarDefault,
        kioskId: null,
        role: "Owner"
      );

      await _users.doc(user.uid).set(userModel.toMap());

      return right(userModel);
    }
    on FirebaseAuthException catch(e){
      return left(Failure.auth(e.message??"Auth error",code: e.code));
    }
    on Exception catch (e) {
      return left(Failure.unknown(e.toString()));
    }
    }

    FutureEither<UserModel> signInWithEmail({
      required String email,
      required String password,
      }) async{

    try{
      final credential=await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password);

      final user=credential.user!;
      final userModel= await getUserData(user.uid).first;
      return right(userModel);
    }
    on FirebaseAuthException catch(e){
      return left(Failure.auth(e.message??"Auth error",code: e.code));
    }
    on Exception catch (e) {
      return left(Failure.unknown(e.toString()));
    }

    }


  }






