import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Banana extends StatelessWidget {
  const Banana({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Disease Analysis"),backgroundColor: Colors.green,),
       //Text("Orange"),


          //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
      body: Column(
         //Text("Orange"),


          //Text("The cultivation season of oranges in Kerala typically begins in November and lasts until February or March. This period is known as the winter season in Kerala, and it provides the ideal growing conditions for oranges. The cooler temperatures during this time help the fruit to ripen properly and develop their signature sweet and tangy taste.Kerala is known for its high-quality oranges, which are grown in the hilly regions of the state, such as Wayanad, Kozhikode, and Palakkad. These areas have the perfect combination of fertile soil, adequate rainfall, and cool temperatures, which are essential for the growth and development of oranges.Overall, the cultivation of oranges in Kerala is an important part of the state's agriculture industry "),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(" The disease recognized is Bacterial Spot",
           style: TextStyle(fontSize: 25)),
           
          Text("                                                                                                                             "),

          Container(
            color: Color.fromARGB(255, 240, 229, 229),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(" This bacterium survives in the soil for extended periods and enters the roots through wounds made by transplanting, cultivation, insect feeding damage, and natural wounds where secondary roots emerge. Disease development is favored by high temperatures and high moisture. The bacteria multiply rapidly inside the water-conducting tissue of the plant, filling it with slime. This results in rapid wilt of the plant while the leaves stay green. \n Using pathogen-free seed and disease-free transplants, when possible, is the best way to avoid bacterial spot on tomato. Avoiding sprinkler irrigation and cull piles near greenhouse or field operations, and rotating with a nonhost crop also helps control the disease.",              style: TextStyle(fontSize: 20,)),
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
                    image: AssetImage('assets/demages/bact.jpg',
                    
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