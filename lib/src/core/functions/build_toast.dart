import 'package:fluttertoast/fluttertoast.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions%20copy.dart';

Future<bool?> buildToast({required ToastType toastType, required String msg}) {
  return Fluttertoast.showToast(msg: msg, backgroundColor: toastType.getColor(), textColor: AppColors.white);
}
