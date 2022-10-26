import 'package:flutter/material.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;
import 'package:zero_grau/pages/cart/components_cart/alert_dialog_orders.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showDialogOrders() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogOrders();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartList.length,
              itemBuilder: (_, index) {
                return Card(
                    color: Colors.grey[100],
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          appData.cartList[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                            'R\$ ' + appData.cartList[index].price.toString(),
                            style: const TextStyle(fontSize: 14)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('R\$  ', style: TextStyle(fontSize: 16)),
                          SizedBox(
                            width: 50,
                            height: 35,
                            child: TextFormField(
                              initialValue:
                                  '${appData.cartList[index].quantity * appData.cartList[index].price}',
                              textAlign: TextAlign.center,
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_not_disturb_on,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 35,
                            height: 30,
                            child: TextFormField(
                              initialValue:
                                  ' ${appData.cartList[index].quantity}',
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                // hintText: '0',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text('R\$ 48,00',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialogOrders();
                    },
                    icon: Icon(
                      Icons.check_circle,
                    ),
                    label: Row(
                      children: [
                        Text('Finalizar Pedido',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
