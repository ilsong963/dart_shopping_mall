import 'dart:io';
import 'package:dart_shopping_mall/shopping_mall.dart';

void main() {
  ShoppingMall shoppingMall = ShoppingMall();
  bool isUserRunning = true;
  int? inputMenu;

  while (isUserRunning) {
    printUserMenu();
    try {
      inputMenu = int.parse(stdin.readLineSync()!);
    } catch (e) {}
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
        shoppingMall.resetCart();
        break;
      case 5:
        adminLoop(shoppingMall);
        break;
      case 6:
        isUserRunning = exit();
        break;
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }
}

void adminLoop(ShoppingMall shoppingMall) {
  bool isAdminRunning = true;
  int? inputMenu;
  if (shoppingMall.isAdmin()) {
    while (isAdminRunning) {
      printAdminMune();
      try {
        inputMenu = int.parse(stdin.readLineSync()!);
        switch (inputMenu) {
          case 1:
            shoppingMall.addProduct();

            break;
          case 2:
            shoppingMall.deleteProduct();

            break;
          case 3:
            isAdminRunning = exit();
            break;
        }
      } catch (e) {}
    }
  }
}

void printUserMenu() {
  print('-' * 130);
  print(
      "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품 보기 / [4] 장바구니 초기화 / [5] 관리자모드 / [6] 프로그램 종료");
  print('-' * 130);
}

void printAdminMune() {
  print('-' * 40);
  print("[1] 상품 추가 / [2] 상품 삭제 / [3] 관리자 모드 종료");
  print('-' * 40);
}

bool exit() {
  print("정말 종료하시겠습니까? (Y/N)");
  String answer = stdin.readLineSync()!;
  try {
    if (answer == 'Y' || answer == 'y') {
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
