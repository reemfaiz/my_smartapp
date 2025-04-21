import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  // ---------------------------------------------------------------------------
  Future<dynamic> pushView({
    required Widget view,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve transitionCurve = Curves.easeInOut,
    Function(dynamic)? then,
  }) async {
    final result = await Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionDuration: transitionDuration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var fadeAnimation = CurvedAnimation(
            parent: animation,
            curve: transitionCurve,
          );

          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
    );

    if (then != null) {
      then(result);
    }
    return result;
  }

  //----------------------------------------------------------------------------
  popView() {
    Navigator.pop(this, 'back');
  }

  //----------------------------------------------------------------------------
  removeUntil({required Widget view}) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => view),
      ModalRoute.withName('/view'),
    );
  }
}
