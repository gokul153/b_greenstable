import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Pomegranate extends StatelessWidget {
  const Pomegranate({super.key});

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
           Text(" Pomegranate will be the best choice",
           style: TextStyle(fontSize: 25)),
           
          Text("                                                                                                                             "),

          Container(
            color: Color.fromARGB(255, 240, 229, 229),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Pomegranate cultivation in Kerala is a relatively new practice, and it is mostly done on a small scale by farmers in the Malabar region. The cultivation season for pomegranate in Kerala is from October to February, which is the winter season.Pomegranate requires a dry climate with moderate temperatures for its growth, and the winter season in Kerala provides the ideal conditions for its cultivation. The crop is usually propagated through cuttings, and the plants take around two years to start bearing fruits.The yield of pomegranate in Kerala varies depending on the variety, soil type, and other factors. On average, the yield of pomegranate in Kerala is around 10-12 tons per hectare.The pomegranates grown in Kerala are known for their taste and nutritional value, and they are used for various purposes such as making juices, jams, and jellies. The state government has also taken several initiatives to promote pomegranate cultivation in the state and provide support to the farmers, including setting up nurseries for propagating planting materials and providing training on modern cultivation practices. However, the production of pomegranate in Kerala is still relatively low compared to other pomegranate-growing regions due to the challenging climate conditions",
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
                    image: AssetImage('assets/images/pomegranite.png',
                    
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

