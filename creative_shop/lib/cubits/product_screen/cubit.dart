// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);
  bool isFavorite = false;
  int selectedItem = 0;
  int price = 69;
  int amountOfItem = 0;
  int total = 0;

  void changeFavorit() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteItemState());
  }

  int changeSelectedItem(index) {
    selectedItem = index;
    emit(ChangeSelectItemState());
    return selectedItem;
  }

  int selectSizeOfItem = 0;
  int changeSizeOfProduct(index) {
    selectSizeOfItem = index;
    emit(ChangeSizeOfItemState());
    return selectSizeOfItem;
  }

  void addToAmountOfItem() {
    amountOfItem++;
    total = price * amountOfItem;
    emit(AddToItem());
  }

  void removeFromAmountOfItem() {
    if (amountOfItem > 0) amountOfItem--;
    total = price * amountOfItem;
    emit(RemoveFromItem());
  }
}
