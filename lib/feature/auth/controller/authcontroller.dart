import 'package:riverpod/riverpod.dart';
import 'package:kiosk_app/core/failure.dart';
import 'package:kiosk_app/core/type_def.dart';
import 'package:kiosk_app/feature/auth/repository/auth_repository.dart';
import 'package:kiosk_app/model/user_model.dart';

//Provider
// final authControllerProvider=
//     StateNotifierProvider(AuthController,As)


class AuthController extends StateNotifier<AsyncValue<UserModel?>>{

  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController(this._ref,this._authRepository):super(AsyncValue.loading())
  {
    _init();
  }

  void _init(){
    _authRepository.authStateChange.listen((user) async{
      if(user==null){
        state=const AsyncValue.data(null);
      }
      else{
        final userModel=await _authRepository.getUserData(user.uid).first;
        state=AsyncValue.data(userModel);
      }
    });
  }

  Future<void> signInWithGoogle () async{
    state= const AsyncValue.loading();
    final res=await _authRepository.signInWithGoogle();
    res.fold(
        (failure)=>state=AsyncValue.error(failure.message, StackTrace.current),
        (userModel)=>state=AsyncValue.data(userModel));

  }
  /// Email sign-up
  Future<void> signUpWithEmail(String email, String password) async {
    state = const AsyncValue.loading();
    final res = await _authRepository.signUpWithEmail(
      email: email,
      password: password,
    );
    res.fold(
          (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
          (userModel) => state = AsyncValue.data(userModel),
    );
  }

  /// Email login
  Future<void> signInWithEmail(String email, String password) async {
    state = const AsyncValue.loading();
    final res = await _authRepository.signInWithEmail(
      email: email,
      password: password,
    );
    res.fold(
          (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
          (userModel) => state = AsyncValue.data(userModel),
    );
  }

  /// Logout
  Future<void> logOut() async {
    await _authRepository.logOut();
    state = const AsyncValue.data(null);
  }

}

