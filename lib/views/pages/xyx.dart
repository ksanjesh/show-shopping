import 'package:flutter/material.dart';

class Sanjesh extends StatelessWidget {
  const Sanjesh({Key? key, this.networkImage}) : super(key: key);
  final networkImage;


  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){

                    },
                    child: Icon(Icons.close,color: Colors.grey,)),
                GestureDetector(
                    onTap: (){

                    },
                    child: Icon(Icons.more_horiz,color: Colors.grey,))
              ],
            ),
          ),
          pinned: true,
          backgroundColor: Colors.transparent,
          expandedHeight: MediaQuery.of(context).size.height*0.5,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.5,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context,int index){
                        return Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.39,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade300,
                              child: Image.network(networkImage,fit: BoxFit.cover
                                ,),
                            ),
                            Positioned(
                                top: MediaQuery.of(context).size.height*0.1,
                                right: 22,
                                child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.1)

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite_border),
                                    )))
                          ],
                        );
                      }),
                ),

              ],
            ),
          ),



        ),
        SliverToBoxAdapter(
          child: Text("Although most people consider piranhas to be quite dangerous, they are, for the"
              " most part, entirely harmless. Piranhas rarely feed on large animals; they eat smaller fish"
              ""
              " and aquatic plants. When confronted with humans, piranhas’ first instinct is to flee, "
              "not attack. Their fear of humans makes sense. Far more piranhas are eaten by people than"
              " people are eaten by piranhas. If the fish are well-fed, they won’t bite humans"

              "Once you have mastered the use of topic sentences, you may decide that the topic sentence fo"
              "r a particular paragraph really shouldn’t be the first sentence of the paragraph. This "
              "is fine—the topic sentence can actually go at the beginning, middle, or end of a paragraph"
              "; what’s important is that it is in there somewhere so that readers know what the main idea of"
              " the paragraph is and how it relates back to the thesis of your paper. Suppose that we wanted "
              "to start the piranha paragraph with a transition sentence—something that reminds the reader of "
              "what happened in the previous paragraph—rather than with the topic sentence. Let’s suppose that the previo"
              "us paragraph was about all kinds of animals that people are afraid of, like sharks, snakes, and spiders. Ou"
              "r paragraph might look like this (the topic sentence is bold"

              "Like sharks, snakes, and spiders, piranhas are widely feared. Although most people cons"
              "ider piranhas to be quite dangerous, they are, for the most part, entirely harmless. Piranhas"
              " rarely feed on large animals; they eat smaller fish and aquatic plants. When confronted with humans, piranhas’ first instinct is to flee, not attack. Their fear of humans makes sense. Far more piranhas are eaten by people than people are eaten by piranhas. If the fish are well-fed, they won’t bite humans."),
        )
      ],

    );
  }
}



