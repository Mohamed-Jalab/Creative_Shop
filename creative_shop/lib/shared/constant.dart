import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import '../models/sign_up_model.dart';
import '../screens/widgets/item_card.dart';

const primaryColor = Color(0xFF232F3E);
const secondaryColor = Color(0xFFF69B32);
const blackColor2 = Color(0xff404040);
const greyColor1 = Color(0xFF696969);
const greyColor2 = Color(0xFF979797);
const greyColor3 = Color(0xfff9f9fa);
const whiteColor = Color(0xffffffff);
const kColorThemeBrowse = Color(0xfffd5252);

int selectedInd = 1;

final accessoriesCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/accessories/1.jpg',
    title: 'Pearl Bracelet',
    newPrice: '199\$',
    category: 'Accessorires',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/accessories/2.jpg',
    title: 'beads',
    newPrice: '49\$',
    category: 'Accessorires',
  ),
];
final giftsCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/gifts/1.jpg',
    title: 'Party Gift',
    newPrice: '199\$',
    category: 'Gifts',
    isFavorite: true,
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/gifts/2.jpg',
    title: 'Special Gift',
    newPrice: '49\$',
    category: 'Gifts',
  ),
];
final candlesCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/candles/1.jpg',
    title: 'Candles with Rose',
    newPrice: '109\$',
    category: 'Candles',
  ),
];
final collagesCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/collages/1.jpg',
    title: 'Painting',
    newPrice: '69\$',
    category: 'Collages',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/collages/2.jpg',
    title: 'Card and Paper',
    newPrice: '19\$',
    category: 'Collages',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/collages/3.jpg',
    title: 'Card with Colours',
    newPrice: '15\$',
    category: 'Collages',
  ),
];
final flowersCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/flowers/1.jpg',
    title: 'Normal Flowers',
    newPrice: '69\$',
    category: 'Flowers',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/flowers/2.jpg',
    title: 'Flowers with Card',
    newPrice: '69\$',
    category: 'Flowers',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/flowers/2.jpg',
    title: 'Little Flower',
    newPrice: '19\$',
    category: 'Flowers',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/flowers/3.jpg',
    title: 'Roses',
    newPrice: '15\$',
    category: 'Flowers',
  ),
];
final paperCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/papers/1.jpg',
    title: 'Paper Roses',
    newPrice: '69\$',
    category: 'Papers',
    isFavorite: true,
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/papers/2.jpg',
    title: 'Paper with Card',
    newPrice: '69\$',
    category: 'Papers',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/papers/3.jpg',
    title: 'Little Paper',
    newPrice: '19\$',
    category: 'Papers',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/papers/4.jpg',
    title: 'Normal Paper',
    newPrice: '15\$',
    category: 'Papers',
  ),
];
final embroideryCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/embroidery/1.jpg',
    title: 'Embroidery',
    newPrice: '69\$',
    category: 'Embroidery',
  ),
];
final raizenCards = [
  ItemCard(
    onTap: () {},
    image: 'asset/images/raizens/1.jpg',
    title: 'Raizen with Flowers',
    newPrice: '69\$',
    category: 'Raizens',
  ),
  ItemCard(
    onTap: () {},
    image: 'asset/images/raizens/2.jpg',
    title: 'Funny Raizen',
    newPrice: '69\$',
    category: 'Raizens',
  ),
];
SignUpModel publicModel = SignUpModel(
  username: '',
  email: '',
  password: '',
);

List<List<ItemCard>> allProduct = [
  accessoriesCards,
  candlesCards,
  collagesCards,
  flowersCards,
  paperCards,
  embroideryCards,
  giftsCards,
  raizenCards,
];

bool login = false;
SharedPreferences? sharedPreferences;
