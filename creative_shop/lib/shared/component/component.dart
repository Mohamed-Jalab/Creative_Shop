import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'constant.dart';

Widget circles(
        {Color color = greyColor6,
        double width = 10,
        double height = 10,
        child}) =>
    Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        child: child,
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(15),
          color: color,
        ),
      ),
    );

Widget myRow({
  String text1 = 'Hellow',
  String text2 = '',
  double fontsize = 20,
  Color color = Colors.black,
  EdgeInsets padd = const EdgeInsets.only(left: 10),
}) =>
    Padding(
      padding: padd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                overflow: TextOverflow.ellipsis,
                fontSize: fontsize,
                color: color),
            textAlign: TextAlign.right,
          ),
          const SizedBox(width: 10),
          Text(
            text2,
            style: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                overflow: TextOverflow.ellipsis,
                fontSize: fontsize,
                color: greyColor2),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );

Widget myButton(
        {double width = 70,
        double height = 50,
        child,
        Color color = whiteColor}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: redColor),
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: child,
      ),
    );
Widget buildTextField({
  String text = '',
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  Widget? suffix,
  bool obscure = false,
}) {
  return TextFormField(
    obscureText: obscure,
    validator: validator,
    keyboardType: keyboardType,
    cursorColor: redColor.withOpacity(.8),
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
    activeColor: redColor,
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
      foregroundColor: redColor,
    ),
    child: Text(
      text,
      style:
          const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    ),
  );
}

void message(BuildContext context, String msg, {bool longtime = true}) {
  ToastContext toastContext = ToastContext();
  toastContext.init(context);
  Toast.show(msg, duration: longtime ? Toast.lengthLong : Toast.lengthShort);
}
