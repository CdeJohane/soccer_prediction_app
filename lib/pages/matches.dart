import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soccer_app/model/dummy_data.dart';
import 'package:soccer_app/model/selection.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // For loop to populate the matches
    for (Selection temp in allSelections){
      // numbers.indexWhere((element) => element == target);
      int index = dummyPlayers.indexWhere((element) => element.playerID == temp.playerID);

      if(index >= 0){
        dummyPlayers[index].enterNewPrediction(temp);
      }
    }

    // For loop to add u all the scores
    for (int i=0; i<dummyPlayers.length; i++){
      if (dummyPlayers[i].myPredictions.isNotEmpty){
        for (int j =0; j<dummyPlayers[i].myPredictions.length; j++){
          dummyPlayers[i].updateTally();
        }
      }
    }

    return Center(
      child: ListView.builder(
        itemCount: matchList.length,
        itemBuilder:(context, index) {
          // Get Match ID info
          int matchID_verify = matchList[index].matchID;

          return Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Color.fromARGB(255, 234, 245, 242),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              child: Column(
                children: [
                  // One Row for Home Team
                  Row(
                    children: [
                      // Text For home team and score
                      Text(allTeams[matchList[index].homeID - 1].teamName),
                      Text(matchList[index].homeScore.toString())
                    ],
                  ),

                  Row(
                    children: [
                      // Text For away team and score
                      Text(allTeams[matchList[index].awayID - 1].teamName),
                      Text(matchList[index].awayScore.toString())
                    ],
                  ),

                  // If condition for when the bet was placed or not
                  Row(
                    children: [
                      matchList[index].completed
                        ? dummyPlayers[0].myPredictions.indexWhere((element) => element.matchID == matchID_verify) != -1
                          ? Text('You predicted ${dummyPlayers[0].myPredictions[dummyPlayers[0].myPredictions.indexWhere((element) => element.matchID == matchID_verify)].teamChoiceID}')
                          : Text('You havent made a prediction yet')
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: () {}, child: Text('Home')),
                            ElevatedButton(onPressed: () {}, child: Text('Draw')),
                            ElevatedButton(onPressed: () {}, child: Text('Away'))
                          ],
                        )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}