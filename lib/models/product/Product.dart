import 'package:freezed_annotation/freezed_annotation.dart';

part 'Product.freezed.dart';
part 'Product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({required String title, required double price}) =
      _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
