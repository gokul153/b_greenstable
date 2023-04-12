import 'package:b_green/model_n/cropmodel.dart';
import 'package:b_green/page/cropdetail.dart';
import 'package:flutter/material.dart';
//import 'package:mine/pages/cropdetails.dart';
//import 'package:mine/model/cropmodel.dart';

class Crop extends StatefulWidget {
  const Crop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CropState createState() => _CropState();
}

class _CropState extends State<Crop> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.product;
    return Scaffold(
      backgroundColor: Colors.white, // Color.fromARGB(255, 40, 49, 27),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
        title: const Text(
          "Be Green",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        //the icon ends here
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        //color: Colors.blue,
        //margin: const EdgeInsets.only(top: 18, left: 14, right: 14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' Know Your Crops',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //Icon(Icons.shopping_cart_rounded,size: 30,)
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          //  const SizedBox(height: 24,),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //maxCrossAxisExtent: 200,
                      mainAxisExtent: 120,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              id: products[index].id,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: const Color.fromARGB(255, 85, 139, 47),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(153, 85, 139, 47),
                                  blurRadius: 5,
                                  offset: Offset(0, 5))
                            ]),
                        child: Column(children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                            child: Image.asset(
                              products[index].image,
                              height: 90,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(products[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  })),
          /*child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  // itemCount: _product.length,
                  //itemBuilder: (BuildContext context, int index) {
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              product: _product[index],
                            ),
                          ),
                        );
                      },
                      child: _productItem(
                        title: _product[index].title,
                        image: _product[index].image,
                        price: _product[index].price.toString(),
                        isFavorited: Random().nextBool(),
                      ),
                    ),
                  ]
                  //staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  //mainAxisSpacing: 24,
                  //crossAxisSpacing: 24,
                  ),*/
        ]),
      ),
    );
  }

  /* Widget _productItem(
      {required String title, image, price, required bool isFavorited}) {
    return Container(
      //height: double.infinity,
      /* decoration: BoxDecoration(
          border: Border.all(
              width: 3, color: const Color.fromARGB(255, 200, 221, 171)),
          //color: Color.fromARGB(255, 200, 221, 171),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage('assets/images/$image'), fit: BoxFit.cover)),*/
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/$image',
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          // ignore: unnecessary_string_interpolations
                          '$title',
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    /*return Container(
      //width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(14),
      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.green,),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    /*   Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(100, 25)),
                          ),
                        ),
                      ),
                    ),*/
                    Row(
                      children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/$image',
                          width: 150,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    // ignore: unnecessary_string_interpolations
                    '$title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                //Text( '\$$price',style: const TextStyle(fontWeight: FontWeight.bold),),
                /*Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isFavorited
                        ? Colors.pink.shade100
                        : Colors.grey.shade400,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: isFavorited ? Colors.red : Colors.black,
                    size: 15,
                  ),
                  /* padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade400,
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                  */
                ), */
              ],
            ),
          ],
        ),
      ),
    );
    */
  }
  */
}
