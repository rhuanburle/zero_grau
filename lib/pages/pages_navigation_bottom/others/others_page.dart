import 'package:flutter/material.dart';
import 'package:zero_grau/models/app_data/app_data.dart';
import '../../common_widgets/filter_home_page.dart';
import '../common_widgets_navigation_page/list_products_widget.dart';
import '../../common_widgets/user_info.dart';
import 'others_page_controller.dart';

class OthersPage extends StatelessWidget {
  OthersPage({Key? key}) : super(key: key);
  var filterList = filterListOthers;
  var ctrl = OthersPageController();
  var resultCount = 0;

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
              future: ctrl.readProductsOthers(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return ListProductsWidget(snapshot.data[index]);
                        })
                    : const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}
