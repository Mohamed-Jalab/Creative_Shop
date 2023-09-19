import 'package:creative_shop/models/item_of_cart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

List<ItemCard> accessoriesCards = [];
List<ItemCard> giftsCards = [];
List<ItemCard> candlesCards = [];
List<ItemCard> collagesCards = [];
List<ItemCard> flowersCards = [];
List<ItemCard> paperCards = [];
List<ItemCard> embroideryCards = [];
List<ItemCard> raizenCards = [];
SignUpModel publicModel = SignUpModel(
  username: 'NULL',
  email: 'NULL',
  password: 'NULL',
);

List<List<ItemCard>> allProduct = [
  accessoriesCards,
  candlesCards,
  collagesCards,
  embroideryCards,
  flowersCards,
  giftsCards,
  paperCards,
  raizenCards,
];
List<ItemCard> trendCards = [];
List<ItemCard> newestCards = [];
List<String> nameOfCategories = [
  "Accessories",
  "Candles",
  "Collages",
  "Embroideries",
  "Flowers",
  "Gifts",
  "Papers",
  "Raizens",
];

bool login = false;
SharedPreferences? sharedPreferences;
List<ItemOfCart> listOfCartItems = [];
List<ItemCard> favoriteList = [];
