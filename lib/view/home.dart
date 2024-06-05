import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:products_api/controller/home_controller.dart';
import 'package:products_api/model/product_model.dart';
import 'package:products_api/view/widgets/no_result_found.dart';
import 'package:products_api/view/widgets/product_card.dart';
import 'package:products_api/view/widgets/product_shimmer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => homeController.onRefresh(),
          edgeOffset: 180,
          displacement: 20,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: homeController.scrollController,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Code Solutions 👋",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Good Morning!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/profilepic.jpg',
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: homeController.textFieldController,
                          onSubmitted: (s) => homeController.onSubmit(s),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 12),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(100, 0, 0, 0),
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: IconButton(
                          onPressed: () {
                            homeController.onSubmit(
                              homeController.textFieldController.text,
                            );
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                          ),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Obx(
                    () => !homeController.hasResult.value &&
                            !homeController.isLoading.value
                        ? const NoResultFound()
                        : GridView.builder(
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: homeController.isLoading.value
                                ? homeController.displayedList.length + 6
                                : homeController.displayedList.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              if (index < homeController.displayedList.length) {
                                final Products product =
                                    homeController.displayedList[index];
                                return ProductCard(
                                  imagePath: product.thumbnail!,
                                  title: product.title!,
                                  price: product.price!,
                                );
                              } else if (homeController.hasMore.value) {
                                return const ProductShimmer();
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                  ),
                ),
                Obx(
                  () => !homeController.hasMore.value
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('no more data'),
                          ),
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: homeController.isButtonVisible.value ? 1 : 0,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: const Icon(Icons.arrow_upward_rounded),
            onPressed: () => homeController.scroll2Top(),
          ),
        ),
      ),
    );
  }
}
