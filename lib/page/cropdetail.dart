import 'package:b_green/model_n/cropmodel.dart';
import 'package:flutter/material.dart';
//import ;
//import 'package:mine/pages/selectcrop.dart';
//import 'package:favorite_button/favorite_button.dart';

class DetailPage extends StatefulWidget {
  //final Product product;
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.product;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 85, 139, 47),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(188, 101, 101, 101),
                            blurRadius: 5,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          // ignore: unnecessary_string_interpolations
                          image: AssetImage(products[widget.id].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: products[widget.id].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0)),
                                // TextSpan(text: product.title,style: TextStyle(color: Colors.black))
                              ])),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool isFavorited = toggleIsFavorated(
                                          products[widget.id].isFavorated);
                                      products[widget.id].isFavorated =
                                          isFavorited;
                                    });
                                  },
                                  icon: Icon(
                                    products[widget.id].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.white,
                                  ),

                                  /*onPressed: () {
                                      setState(() {
                                        bool isFavorited = toggleIsFavorated(
                                            products[widget.product.id]
                                                .isFavorated);
                                        products[widget.product.id]
                                            .isFavorated = isFavorited;
                                      });
                                    },
                                    icon: Icon(
                                      products[widget.product.id].isFavorated ==
                                              true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.white,
                                    )
                                    */
                                ),
                              ),
                              /*FavoriteButton(
                                  iconSize: 30,
                                  iconColor: Colors.green,
                                  isFavorite: false,
                                  valueChanged: (isFavorite) {
                                    print('Is Favorite: $isFavorite');
                                  })*/
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildCard(
                                    title: "Humidity",
                                    data: products[widget.id].hum,
                                    icon: Icons.water),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: buildCard(
                                    title: "Temperature",
                                    data: products[widget.id].temp,
                                    icon: Icons.thermostat),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          RichText(
                              text: TextSpan(
                                  text: products[widget.id].desc,
                                  style: const TextStyle(color: Colors.black))),
                        ]),
                  )
                  /* Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 25,
                          ),
                        ),
                        Text('Be Green'),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(left: 18, top: 28),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.grey.shade200,
                        ),
                        child: _productDescription()),
                  ),
                  */
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(190, 232, 232, 232),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildCard(
      {required String title, required String data, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.green,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const Padding(padding: EdgeInsets.only(left: 20, bottom: 20)),
                  //const Padding(padding: EdgeInsets.all(20)),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
      /*child: Row(children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 85, 139, 47),
          radius: 20,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 12),
            )
          ],
        )
      ]),*/
    );
  }
}
  /*Widget _productDescription() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  color: Colors.green),
              child: Text(
                ' ${product.price}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            product.desc,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 48),
                child: Text(
                  'Buy',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }*/

