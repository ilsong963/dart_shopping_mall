import 'dart:io';
import 'dart:math';

import 'product.dart';

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000)
  ];
  Map<Product, int> cart = {};

  void showProducts() {
    for (int i = 0; i < products.length; i++) {
      print('${products[i].name} / ${products[i].price}원');
    }
  }

  void showTotal() {
    if (cart.isEmpty) {
      print("장바구니에 담긴 상품이 없습니다.");
      return;
    }
    int totalPrice = 0;
    print('-' * 110);
    for (var entry in cart.entries) {
      int productTotal = entry.key.price * entry.value;
      totalPrice += productTotal;

      print('${entry.key.name} : ${entry.key.price} * ${entry.value}개');
    }
    print('-' * 110);
    print("총 $totalPrice원 입니다!");
  }

  void addToCart() {
    try {
      print("상품 이름을 입력해 주세요 !");
      String productName = stdin.readLineSync()!;
      Product? selectedProduct;
      for (var product in products) {
        if (product.name == productName) {
          selectedProduct = product;
          break;
        }
      }

      if (selectedProduct == null) {
        print("입력값이 올바르지 않아요 !");
        return;
      }

      print("상품 개수를 입력해 주세요 !");
      int amountInput = int.parse(stdin.readLineSync()!);

      if (amountInput <= 0) {
        print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
        return;
      }
      cart[selectedProduct] = (cart[selectedProduct] ?? 0) + amountInput;

      print("장바구니에 상품이 담겼어요 !");
    } catch (e) {
      print("입력값이 올바르지 않아요 !");
    }
  }

  void resetCart() {
    if (cart.isEmpty) {
      print("이미 장바구니가 비어있습니다");
    } else {
      cart = {};

      print("장바구니를 초기화 합니다");
    }
  }
}
