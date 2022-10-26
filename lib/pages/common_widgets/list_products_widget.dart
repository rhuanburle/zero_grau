import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/models/products_model.dart';

class ListProductsWidget extends StatelessWidget {
  // ListProductsWidget({Key? key}) : super(key: key);
  RxInt resultCount = 0.obs;
  final ProductsModel product;

  ListProductsWidget(this.product);

  @override
  Widget build(BuildContext context) {
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
                      product.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'R\$ ${product.price}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            resultCount--;
                            print(resultCount);
                          },
                          icon: const Icon(
                            Icons.do_not_disturb_on,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 40,
                          child: Obx(() {
                            return TextFormField(
                              initialValue: ' ${resultCount.value}',
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                                // hintText: '0',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            );
                          }),
                        ),
                        IconButton(
                          onPressed: () {
                            resultCount++;
                            print(resultCount);
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
                      image: AssetImage(product.image),
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
    ;
  }
}
