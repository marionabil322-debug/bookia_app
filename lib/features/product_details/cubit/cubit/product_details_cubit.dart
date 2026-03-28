import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubitCubit extends Cubit<ProductDetailsCubitState> {
  ProductDetailsCubitCubit() : super(ProductDetailsCubitInitial());

  showProduct(int bookId) {}
}
