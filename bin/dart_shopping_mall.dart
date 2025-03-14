import 'dart:io';
import 'package:dart_shopping_mall/shopping_mall.dart';

void main() {
  ShoppingMall shoppingMall = ShoppingMall();
  bool isRunning = true;
  int? inputMenu;

  while (isRunning) {
    printMenu();
    inputMenu = int.parse(stdin.readLineSync()!);
    switch (inputMenu) {
      case 1:
        shoppingMall.showProducts();
        break;
      case 2:
        shoppingMall.addToCart();
        break;
      case 3:
        shoppingMall.showTotal();
        break;
      case 4:
        isRunning = exit();
        break;
      case 6:
        shoppingMall.resetCart();
        break;
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }
}

void printMenu() {
  print('-' * 110);
  print(
      "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화");
  print('-' * 110);
}

bool exit() {
  print("정말 종료하시겠습니까?");
  try {
    if (int.parse(stdin.readLineSync()!) == 5) {
      print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");

      return false;
    } else {
      print("종료하지 않습니다.");

      return true;
    }
  } catch (e) {
    print("종료하지 않습니다.");

    return true;
  }
}
