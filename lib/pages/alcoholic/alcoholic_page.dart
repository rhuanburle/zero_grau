import 'package:flutter/material.dart';
import 'package:zero_grau/pages/common_widgets/user_info.dart';
import '../../models/app_data/app_data.dart';
import '../common_widgets/list_products_widget.dart';
import 'alcoholic_controller.dart';
import '../common_widgets/filter_home_page.dart';

class AlcoholicPage extends StatelessWidget {
  AlcoholicPage({Key? key}) : super(key: key);
  var filterList = filterListAlcoholic;
  var ctrl = AlcoholicControlle();
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
              future: ctrl.readProductsAlcoolic(),
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
