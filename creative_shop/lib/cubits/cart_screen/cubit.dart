import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int n = 1;

  void addNumberOfItemsInCart() {
    n++;
    emit(AddNumberOfItemsInCartState());
  }

  void removeNumberOfItemsInCart() {
    if (n > 1) n--;
    emit(RemoveNumberOfItemsInCartState());
  }
}
