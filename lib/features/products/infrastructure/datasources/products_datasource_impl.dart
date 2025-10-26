import 'package:dio/dio.dart';
import 'package:teslo_app/config/constants/environment.dart';
import 'package:teslo_app/features/products/domain/domain.dart';

class ProductsDataSourceImpl extends ProductsDataSource {
  late final Dio dio;
  final String accessToken;

  ProductsDataSourceImpl({required this.accessToken})
    : dio = Dio(
        BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage({
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await dio.get<List>(
      '/products?limit=$limit&offset=$offset',
    );
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      // products.add() // mapper
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}
