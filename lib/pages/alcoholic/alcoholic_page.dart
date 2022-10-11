import 'package:flutter/material.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;
import 'package:zero_grau/pages/common_widgets/user_info.dart';
import '../../models/app_data/app_data.dart';
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
          child: ListView.builder(
              itemCount: ctrl.alcoolicList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ctrl.alcoolicList[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  ctrl.alcoolicList[index].description,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'R\$ ${ctrl.alcoolicList[index].price}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(width: 10),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.do_not_disturb_on,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      width: 40,
                                      child: TextFormField(
                                        initialValue: ' $resultCount',
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.blue,
                                          )),
                                          // hintText: '0',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        resultCount++;
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outlined,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 110,
                            width: 110,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      appData.productsItems[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
