import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Banana extends StatelessWidget {
  const Banana({super.key});

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
           Text(" Banana will be your best choice",
           style: TextStyle(fontSize: 25)),
           
          Text("                                                                                                                             "),

          Container(
            color: Color.fromARGB(255, 240, 229, 229),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Banana is an important fruit crop in Kerala and is grown throughout the year. However, the peak season for banana cultivation in Kerala is between June and October, during the southwest monsoon season.Banana cultivation in Kerala is mainly done in the low-lying areas, especially in the districts of Kozhikode, Thrissur, and Malappuram. The major banana varieties grown in Kerala include Nendran, Poovan, Robusta, Red banana, and Palayankodan.The yield of banana in Kerala varies depending on the variety, soil type, climate, and other factors. On average, the yield of banana in Kerala is around 18-20 tons per hectare.Bananas grown in Kerala are known for their quality and taste, and they are used for various purposes such as making banana chips, banana powder, and banana wine. The state government has also taken several initiatives to promote banana cultivation in the state and provide support to the farmers, including providing subsidies for planting materials and equipment, and setting up banana processing units to help farmers with value addition. ",
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
                    image: AssetImage('assets/images/blackgram.png',
                    
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

