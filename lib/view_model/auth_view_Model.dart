
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  //final _authRepo = AuthRepository(apiService: NetworkApiServices());

  final _authRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApis(dynamic data, BuildContext context) async {
    // _authRepo.loginApi(data).then((onValue) {
    //   Utils.flushBarErrorMessage("login SuccesFully", context);
    //   if (kDebugMode) {
    //     print("......responseCompleted.......$onValue");
    //   }
    // }).onError((error, StackTrace) {
    //   Utils.flushBarErrorMessage(error.toString(), context);

    //   if (kDebugMode) {
    //     print("...........error on auth view model .......$error");
    //   }
    // });
    try {
      final res = await _authRepo.loginApi(data);
      if (context.mounted) {
        Utils.flushBarErrorMessage(res.toString(), context);
      }
      // Change this to a success message
      if (kDebugMode) {
        print("......responseCompleted.......$res");
      }
    } catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        Utils.flushBarErrorMessage(e.toString(), context);
      }
    }
  }
}

// class AuthViewModel with ChangeNotifier {
//   final _authRepo = AuthRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   Future<void> loginApis(dynamic data, BuildContext context) async {
//     setLoading(true);
//     _authRepo.loginApi(data).then((onValue) {
//       setLoading(false);
//       // Map<String, dynamic> kValue = onValue;
//       // dynamic token = kValue['token'];
//       // print(".............................." + token.toString());

//       Utils.flushBarErrorMessage(
//           onValue.toString(), context); // Change this to a success message
//       if (kDebugMode) {
//         print("......responseCompleted.......${onValue.toString()}");
//       }
//     }).catchError((error) {
//       setLoading(false);

//       Utils.flushBarErrorMessage(error.toString(), context);
//       if (kDebugMode) {
//         print("...........error on auth view model .......${error.toString()}");
//       }
//     });
//   }
// }

// class AuthViewModel with ChangeNotifier {
//   final _authRepo = AuthRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   Future<void> loginApis(dynamic data, BuildContext context) async {
//     setLoading(true);
//     try {
//       _authRepo.loginApi(data).then((onValue) {
//         setLoading(false);

//         Utils.flushBarErrorMessage(
//             onValue.toString(), context); // Change this to a success message
//         if (kDebugMode) {
//           print("......responseCompleted.......${onValue.toString()}");
//         }
//       }).onError((handleError, StackTrace) {
//         setLoading(false);

//         Utils.flushBarErrorMessage(handleError.toString(), context);
//       });
//       print("................res ..... vdnv..... ");
//       setLoading(false);
//     } catch (e) {
//       print("now changed in auth_view model _ $e");
//       setLoading(false);
//     }
//     //   Utils.flushBarErrorMessage(
//     //       onValue.toString(), context); // Change this to a success message
//     //   if (kDebugMode) {
//     //     print("......responseCompleted.......${onValue.toString()}");
//     //   }
//     // }.catchError((error) {
//     //   setLoading(false);

//     //   Utils.flushBarErrorMessage(error.toString(), context);
//     //   if (kDebugMode) {
//     //     print("...........error on auth view model .......${error.toString()}");
//     //   }
//     //   });
//   }
// }
