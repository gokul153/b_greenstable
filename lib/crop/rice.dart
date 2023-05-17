import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Rice extends StatelessWidget {
  const Rice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Suitable crop"),
        backgroundColor: Colors.green,
      ),
      //Text("Orange"),

      //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
      body: SingleChildScrollView(
        child: Column(
          //Text("Orange"),
      
          //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" Rice will be the best choice", style: TextStyle(fontSize: 25)),
            Text(
                "                                                                                                                             "),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 85, 139, 47),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(188, 101, 101, 101),
                            blurRadius: 5,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          // ignore: unnecessary_string_interpolations
                          image: AssetImage('assets/images/rice..png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 240, 229, 229),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Rice is a major staple crop in Kerala and is grown throughout the year. However, the peak season for rice cultivation in Kerala is during the monsoon season, from June to September.The main varieties of rice grown in Kerala include Jaya, Veliyan, Navara, Jeerakasala, and Basmati. Rice cultivation in Kerala is mainly done in the low-lying areas, especially in the districts of Thrissur, Palakkad, Alappuzha, and Kottayam.The yield of rice in Kerala varies depending on the variety, soil type, climate, and other factors. On average, the yield of rice in Kerala is around 2-3 tons per hectare.Kerala has a strong tradition of rice cultivation using traditional organic farming methods, which helps to maintain soil fertility and preserve the environment. The state government has also taken several initiatives to promote organic rice cultivation and provide support to the farmers, including setting up organic farming clusters, providing training and financial assistance, and promoting the use of traditional rice varieties.Rice is a staple food in Kerala, and it is used for various purposes such as making rice dishes, breakfast items like dosa and idli, and snacks like murukku and pappadam. Rice is also an important crop for the state's economy, as it provides employment opportunities for a large number of farmers and helps to support the local food industry.",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
