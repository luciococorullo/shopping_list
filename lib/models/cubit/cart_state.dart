part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial(List<Product> products) = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.success(List<Product> products) = _Success;
  const factory CartState.error(String error, List<Product> products) = _Error;
}
