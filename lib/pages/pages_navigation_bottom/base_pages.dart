import 'package:flutter/material.dart';
import 'package:zero_grau/pages/common_widgets/user_info.dart';
import '../../models/app_data/app_data.dart';
import '../common_widgets/filter_home_page.dart';
import 'base_pages_controller.dart';
import 'common_widgets_navigation_page/list_products_widget.dart';

class BasePages extends StatelessWidget {
  var type;

  BasePages({Key? key, required this.type}) : super(key: key);
  var filterList = filterListAlcoholic;
  var ctrl = BasePagesController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfo(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 25,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (_, index) {
                return FilterHomePage(
                  category: filterList[index],
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(10),
        ),
        Expanded(
            child: FutureBuilder(
                future: ctrl.readProductsFireBase(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: type == 'Alcoholic'
                          ? ctrl.productAlcoolicList.length
                          : type == 'noAlcoholic'
                              ? ctrl.productNoAlcoolicList.length
                              : ctrl.productOthersList.length,
                      itemBuilder: (_, index) {
                        return ListProductsWidget(type == 'Alcoholic'
                            ? ctrl.productAlcoolicList[index]
                            : type == 'noAlcoholic'
                                ? ctrl.productNoAlcoolicList[index]
                                : ctrl.productOthersList[index]);
                      });
                })),
      ],
    );
  }
}
