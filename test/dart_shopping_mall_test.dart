import 'package:dart_shopping_mall/shopping_mall.dart';
import 'package:test/test.dart';

void main() {
  group("Shopping mall Test", () {
    late ShoppingMall shoppingMall;

    setUp(() => shoppingMall = ShoppingMall());

    // print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료");
    test('상품 목록이 잘 보이는지', () {
      expect(shoppingMall.products.length, equals(5)); // 상품 개수
      expect(shoppingMall.products[0].name, equals('셔츠')); // 첫번째 상품 이름
      expect(shoppingMall.products[0].price, equals(45000)); // 첫번째 상품 가격
    });
  });
}
