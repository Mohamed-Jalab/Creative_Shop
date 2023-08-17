import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'constant.dart';

Widget buildTextField({
  TextEditingController? controller,
  String text = '',
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  Widget? suffix,
  bool obscure = false,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    validator: validator,
    keyboardType: keyboardType,
    cursorColor: secondaryColor.withOpacity(.8),
    decoration: InputDecoration(
      suffixIcon: suffix,
      contentPadding: const EdgeInsets.only(left: 20),
      hintText: text,
      hintStyle: const TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(.8), width: 1.8)),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8),
      //   borderSide: BorderSide(color: Colors.grey.withOpacity(.8), width: 1.8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.withOpacity(.8), width: 1.8),
      ),
    ),
  );
}

Widget buildCheckbox(String text, {bool value = true}) {
  return CheckboxListTile(
    activeColor: secondaryColor,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    contentPadding: EdgeInsets.zero,
    controlAffinity: ListTileControlAffinity.leading,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    value: value,
    // tristate: true,
    onChanged: (value) {},
    title: Text(
      text,
      style: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    ),
  );
}

Widget buildBigButton(
  BuildContext context, {
  required Widget child,
  Color? color,
  EdgeInsets? padding,
  double? height,
  required void Function() onPressed,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      padding: padding,
      height: height,
      textColor: whiteColor,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: const BorderSide(color: Color(0xffe50010)),
      ),
      onPressed: onPressed,
      child: child,
    ),
  );
}

Widget buildTextButton(String text, {required void Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: secondaryColor,
    ),
    child: Text(
      text,
      style:
          const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    ),
  );
}

void message(BuildContext context, String msg, {bool longTime = true}) {
  ToastContext toastContext = ToastContext();
  toastContext.init(context);
  Toast.show(msg, duration: longTime ? Toast.lengthLong : Toast.lengthShort);
}

Widget pageViewScreen(BuildContext context,{required String image}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size .height,
    decoration:  BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          primaryColor,
          Colors.red,
          primaryColor.withOpacity(0),
        ],
      ),
    ),
    child: Image.asset('asset/images/$image',fit: BoxFit.cover),
  );
}
