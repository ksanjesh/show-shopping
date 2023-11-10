import 'package:get/get.dart';

class MainScreenController extends GetxController{
  int _pageIndex = 0;

  int get getPageIndex => _pageIndex;

  void indexIncrement(int newIndex){
    _pageIndex = newIndex;
    update();
  }

}