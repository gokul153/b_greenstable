import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Coffee extends StatelessWidget {
  const Coffee({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Your Suitable crop"),backgroundColor: Colors.green,),
       //Text("Orange"),


          //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
      body: Column(
         //Text("Orange"),


          //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(" Coffee will be your best choice",
           style: TextStyle(fontSize: 25)),
           
          Text("                                                                                                                             "),

          Container(
            color: Color.fromARGB(255, 240, 229, 229),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Coffee is an important commercial crop in Kerala and is mainly grown in the hilly areas of the state. The cultivation of coffee in Kerala is mainly done in the districts of Wayanad, Idukki, and Palakkad.The peak season for coffee cultivation in Kerala is between September and December, during the post-monsoon season. Coffee requires a cool and humid climate with well-distributed rainfall for its growth, and the post-monsoon season in Kerala provides the ideal conditions for its cultivation.The major coffee varieties grown in Kerala include Arabica and Robusta. Arabica coffee is mainly grown in the higher altitudes above 1000 meters, while Robusta coffee is grown in the lower altitudes.The yield of coffee in Kerala varies depending on the variety, soil type, climate, and other factors. On average, the yield of Arabica coffee in Kerala is around 700-800 kg per hectare, while the yield of Robusta coffee is around 1000-1200 kg per hectare.Coffee grown in Kerala is known for its quality and aroma, and it is used for various purposes such as making filter coffee, instant coffee, and espresso. The state government has also taken several initiatives to promote coffee cultivation in the state and provide support to the farmers, including providing subsidies for planting materials and equipment, and setting up coffee processing units to help farmers with value addition. ",
              style: TextStyle(fontSize: 20,)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:0.100,
              width:400,
              
               decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cofee.png',
                    
                    ),
                    fit: BoxFit.fill,
                  ),
               ),
               // child: Image.asset("assets/images/range.png",height: MediaQuery.of(context).size.height *0.65,
                //width: MediaQuery.of(context).size.width),
                 ),
            ),
              
          ),
          
        ],
      ),
    );
  }
}

