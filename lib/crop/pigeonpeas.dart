import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Pigeon extends StatelessWidget {
  const Pigeon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Suitable crop"),
        backgroundColor: Colors.green,
      ),
      //Text("Orange"),

      //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
      body: Column(
        //Text("Orange"),

        //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" Pigeon Pea will be the best choice",
              style: TextStyle(fontSize: 25)),
          Text(
              "                                                                                                                             "),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 400,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/peigionpeas.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                // child: Image.asset("assets/images/range.png",height: MediaQuery.of(context).size.height *0.65,
                //width: MediaQuery.of(context).size.width),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Color.fromARGB(255, 240, 229, 229),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Pigeon pea, also known as red gram or tur, is an important pulse crop grown in Kerala. The best time to cultivate pigeon pea in Kerala is during the monsoon season, between June and September.Pigeon pea requires a warm and humid climate with good rainfall for its growth. The crop is usually sown in June and harvested in September. However, in some parts of the state, it is also grown during the winter season, between October and February, as a mixed crop with other crops such as coconut and areca nut.The yield of pigeon pea in Kerala varies depending on the variety, soil type, climate, and other factors. On average, the yield of pigeon pea in Kerala is around 1.5 to 2 tons per hectare.Pigeon pea is an important crop for small and marginal farmers in Kerala, and it is used for various purposes such as making dals, soups, and curries. It is also used as an animal feed and in the production of organic fertilizers. The state government has also taken several initiatives to promote pigeon pea cultivation in the state and provide support to the farmers, including providing subsidies for planting materials and equipment, and setting up processing units to help farmers with value addition. ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
