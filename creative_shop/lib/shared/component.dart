import 'package:creative_shop/screens/cate_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../models/categroy_model.dart';
import '../screens/widgets/item_card.dart';
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
  BorderRadius? borderRadius,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      padding: padding,
      height: height,
      textColor: whiteColor,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
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

// Widget pageViewScreen(
//   BuildContext context,
// ) {
//   return Stack(
//     children: [
//       PageView.builder(
//         itemBuilder: (context, index) {
//           return SizedBox(
//             child: pageWithGradient(context, image: "${index + 1}.jpg"),
//           );
//         },
//         itemCount: 3,
//       ),
//     ],
//   );
// }

Widget pageWithGradient(
  BuildContext context, {
  required String image,
  required String title,
  required String subtitle,
}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Image.asset(
        'asset/images/$image',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(.9),
              primaryColor.withOpacity(0),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Positioned(
        top: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: whiteColor, fontSize: 28, fontFamily: 'Poppins')),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(
                    color: whiteColor.withOpacity(.7), fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget buildlistTile(
  BuildContext context, {
  required String imageUrl,
  required String title,
  required String subTitle,
}) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 80,
              height: 110,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$$subTitle',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(
                  splashColor: Colors.black,
                  color: greyColor2,
                  iconSize: 16,
                  splashRadius: 18,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                const Text(
                  '1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  color: greyColor2,
                  iconSize: 16,
                  splashRadius: 18,
                  style: IconButton.styleFrom(),
                  icon: const Icon(Icons.remove),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      distance(),
    ],
  );
}

Widget distance() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Divider(),
  );
}

void buildMessage(
  BuildContext context, {
  required String image,
  required String subTitle,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(image, width: 100, height: 100),
            const SizedBox(height: 20),
            const Text(
              'Success!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            buildBigButton(context, child: const Text('Continue shopping'),
                onPressed: () {
              Navigator.of(context).pop();
            }, color: secondaryColor, borderRadius: BorderRadius.circular(20)),
          ],
        ),
      ),
    ),
  );
}

Widget productDetile({
  required Function() removeOnPressed,
  required Function() addOnPressed,
  required int amountOfProduct,
  required double priseOfProduct,
  required String imageOfProduct,
  required String typeOfProduct,
  required String nameOfProduct,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75,
          height: 75,
          color: Colors.white,
          child: Image.asset(
            imageOfProduct,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    typeOfProduct,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    nameOfProduct,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$priseOfProduct',
              ),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(
              child: IconButton(
                splashRadius: 12,
                onPressed: addOnPressed,
                icon: const Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            // Expanded(
            //   child:
            // Container(
            //   color: Colors.white,
            //   child:
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  '$amountOfProduct',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // ),
            // ),
            Expanded(
              child: IconButton(
                splashRadius: 12,
                onPressed: removeOnPressed,
                icon: const Icon(
                  Icons.remove,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );

Widget itemOfColorList({
  required Color productColor,
  required Color selectedColor,
  required Function() inkwellWork,
}) =>
    InkWell(
      onTap: inkwellWork,
      child: Material(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selectedColor, width: 4),
            color: productColor,
          ),
        ),
      ),
    );

Widget itemOfSizeList({
  required String sizeOfProduct,
  required Color selectedColor,
  required Function() inkwellWork,
}) =>
    InkWell(
      onTap: inkwellWork,
      child: Material(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: selectedColor, width: 4),
              color: Colors.white),
          child: Center(
            child: Text(
              sizeOfProduct,
            ),
          ),
        ),
      ),
    );

Widget nameItem({Color? shadowColor, Color? nameColor, String? name}) =>
    Container(
      width: 220,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
                color: shadowColor!,
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(4, 4)),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(-4, -4)),
          ]),
      child: Center(
        child: Text(
          '$name',
          style: TextStyle(
              fontSize: 25, color: nameColor!, fontStyle: FontStyle.italic),
        ),
      ),
    );

Widget grid(BuildContext context, CategoryModel model, List<ItemCard> list) {
  return Column(
    children: [
      InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CateScreen(
                      title: model.name,
                      list: list,
                    )));
          },
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.black45,
                  ),
                ]),
            child: Center(
              child: Image.asset(
                'asset/images/${model.image}',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          )),
      const SizedBox(
        height: 2,
      ),
      Text(
        model.name,
        style: const TextStyle(fontSize: 17),
      ),
    ],
  );
}

List<ItemCard> listOfCards(int index) {
  if (index == 0) {
    return accessoriesCards;
  } else if (index == 1) {
    return candlesCards;
  } else if (index == 2) {
    return collagesCards;
  } else if (index == 3) {
    return embroideryCards;
  } else if (index == 4) {
    return flowersCards;
  } else if (index == 5) {
    return giftsCards;
  } else if (index == 6) {
    return paperCards;
  } else {
    return raizenCards;
  }
}
