import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:products_api/services/api_services.dart';

import '../model/product_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool hasMore = true.obs;
  RxBool hasResult = true.obs;
  RxBool isButtonVisible = false.obs;

  RxList<Products> productsList = RxList<Products>([]);
  RxList<Products> searchList = RxList<Products>([]);
  RxList<Products> displayedList = RxList<Products>([]);

  final textFieldController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void onInit() {
    fetchProducts();
    fetchMoreData();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await ApiServices.getAllProducts();
      await Future.delayed(const Duration(seconds: 2));

      if (products!.isNotEmpty) {
        displayedList = RxList.empty();
        productsList.addAll(products);
        hasMore(true);
      } else {
        hasMore(false);
      }
    } finally {
      displayedList.addAll(productsList);
      isLoading(false);
    }
  }

  void search4Products(String searchItem) async {
    isLoading(true);
    displayedList = RxList.empty();
    searchList = RxList.empty();

    try {
      ApiServices.resetSearchPage();
      var products = await ApiServices.getProducts(searchItem);
      await Future.delayed(const Duration(seconds: 2));

      if (products!.isNotEmpty) {
        displayedList = RxList.empty();
        searchList.addAll(products);
        displayedList.addAll(searchList);
        hasResult(true);
      } else {
        hasResult(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void searchProducts(String search) async {
    isLoading(true);
    try {
      var products = await ApiServices.getProducts(search);
      await Future.delayed(const Duration(seconds: 2));

      if (products!.isNotEmpty) {
        displayedList = RxList.empty();
        searchList.addAll(products);
        displayedList.addAll(searchList);
        hasMore(true);
      } else {
        hasMore(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void onRefresh() {
    hasResult(true);
    hasMore(true);
    displayedList = RxList.empty();
    fetchProducts();
    textFieldController.text = "";
  }

  void onSubmit(String search) async {
    hasMore(true);
    search4Products(search);
  }

  void fetchMoreData() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (textFieldController.text.isEmpty) {
          fetchProducts();
        } else {
          hasMore(true);
          searchProducts(textFieldController.text);
        }
      }

      if (scrollController.position.minScrollExtent ==
          scrollController.offset) {
        isButtonVisible(false);
      } else {
        isButtonVisible(true);
      }
    });
  }

  void scroll2Top() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}
