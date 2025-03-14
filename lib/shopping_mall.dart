import 'dart:io';

import 'product.dart';

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000)
  ];
  int totalPrice = 0;

  void showProducts() {
    for (int i = 0; i < products.length; i++) {
      print('${products[i].name} / ${products[i].price}원');
    }
  }

  void showTotal() {
    print("장바구니에 $totalPrice원 어치를 담으셨네요 !");
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
      totalPrice += selectedProduct.price * amountInput;

      print("장바구니에 상품이 담겼어요 !");
    } catch (e) {
      print("입력값이 올바르지 않아요 !");
    }
  }

  void resetCart() {
    if (totalPrice == 0) {
      print("이미 장바구니가 비어있습니다");
    } else {
      totalPrice = 0;

      print("장바구니를 초기화 합니다");
    }
  }
}
