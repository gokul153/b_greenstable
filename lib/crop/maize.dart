import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Maize extends StatelessWidget {
  const Maize({super.key});

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
           Text(" Maize will be your best choice",
           style: TextStyle(fontSize: 25)),
           
          Text("                                                                                                                             "),

          Container(
            color: Color.fromARGB(255, 240, 229, 229),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Maize is an important cereal crop in Kerala and is mainly cultivated during the monsoon season, between June and September. The crop requires warm and humid weather conditions with adequate rainfall for its growth, and the monsoon season in Kerala provides the ideal conditions for its cultivation.Maize cultivation in Kerala is mainly concentrated in the districts of Thrissur, Palakkad, and Malappuram, where the soil and climatic conditions are suitable for the crop. The major maize varieties grown in Kerala include Malabar, Surya, and Ganga-5.The yield of maize in Kerala varies depending on several factors such as variety, soil fertility, climate, and irrigation. On average, the yield of maize in Kerala is around 2.5-3 tons per hectare.Maize is an important crop for both animal feed and human consumption in Kerala. It is used as a major ingredient in the production of poultry and cattle feed, and also in the production of snacks and breakfast cereals. The state government has taken several initiatives to promote maize cultivation in the state and provide support to the farmers, including providing subsidies for planting materials and equipment, and setting up maize processing units to help farmers with value addition.",
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
                    image: AssetImage('assets/images/maize.png',
                    
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
