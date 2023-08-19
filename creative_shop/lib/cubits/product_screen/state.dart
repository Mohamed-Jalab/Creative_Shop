part of 'cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ChangeSelectItemState extends ProductState {}

class ChangeSizeOfItemState extends ProductState {}

class AddToItem extends ProductState {}

class RemoveFromItem extends ProductState {}
