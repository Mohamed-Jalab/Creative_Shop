// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  int selectedItem = 0;
  int changeSelectedItem(index) {
    selectedItem = index;
    emit(ChangeSelectItemState());
    return selectedItem;
  }

  int selectSizeOfItem = 0;
  int cahngeSizeOfProduct(index) {
    selectSizeOfItem = index;
    emit(ChangeSizeOfItemState());
    return selectSizeOfItem;
  }

  int amountOfItem = 0;
  void addToAmountOfItem() {
    amountOfItem++;
    emit(AddToItem());
  }

  void removeFromAmountOfItem() {
    if (amountOfItem > 0) amountOfItem--;
    emit(RemoveFromItem());
  }
}
