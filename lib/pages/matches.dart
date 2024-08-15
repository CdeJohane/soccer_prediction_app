import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soccer_app/model/dummy_data.dart';
import 'package:soccer_app/model/selection.dart';
import 'package:soccer_app/model/match.dart';
import 'package:intl/intl.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
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
        for (int j = 0; j<matchList.length; j++){
          dummyPlayers[i].updatePredictionResult(matchList[j]);
        }
      }
    }

    List<Match> fixtures = [];
    // Filter out atches that havent been completed
    for (int i =0; i< matchList.length; i++){
      if (!matchList[i].completed){
        fixtures.add(matchList[i]);
      }
    }

    return Center(
      child: ListView.builder(
        itemCount: fixtures.length,
        itemBuilder:(context, index) {
          // Get proper match time
          String matchDate = DateFormat('dd-MM-yyyy hh:mm a').format(fixtures[index].date);
          // Check if selection exists for that match
          int indexSelection = dummyPlayers[1].myPredictions.indexWhere((element) => element.matchID == matchList[index].matchID);
          int choice = -2;
          if (indexSelection != -1){
            choice = dummyPlayers[1].myPredictions[indexSelection].teamChoice;
          }else{
            dummyPlayers[1].enterNewPrediction(Selection(selectionID: allSelections.length, playerID: dummyPlayers[1].playerID, matchID: matchList[index].matchID, teamChoice: -1, resultAdded: false));
            indexSelection = dummyPlayers[1].myPredictions.length - 1;
          }


          return Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Color.fromARGB(255, 234, 245, 242),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date and Time
                    Text(matchDate),
                    // Text For home team and score
                    Text(
                      allTeams[fixtures[index].homeID - 1].teamName,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    // Text For away team and score
                    Text(
                      allTeams[fixtures[index].awayID - 1].teamName,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    // If condition for when the bet was placed or not
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                              ElevatedButton(
                                onPressed: () {
                                  dummyPlayers[1].myPredictions[indexSelection].teamChoice = 1;
                                  // Update state
                                  setState(() {
                                    choice = 1;
                                  });
                                },
                                child: Text('Home'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: choice == 1 ? Colors.green : Colors.greenAccent[100],
                                    foregroundColor: Colors.black
                                ),
                              ),
                              ElevatedButton(onPressed: () {
                                dummyPlayers[1].myPredictions[indexSelection].teamChoice = 0;
                                  // Update state
                                  setState(() {
                                    choice = 0;
                                  });
                              },
                              child: Text('Draw'),
                              style: ElevatedButton.styleFrom(
                                    backgroundColor: choice == 0? Colors.green : Colors.greenAccent[100],
                                    foregroundColor: Colors.black
                                ),
                              ),
                              ElevatedButton(onPressed: () {
                                dummyPlayers[1].myPredictions[indexSelection].teamChoice = 2;
                                  // Update state
                                  setState(() {
                                    choice = 2;
                                  });
                              }, 
                              child: Text('Away'),
                              style: ElevatedButton.styleFrom(
                                    backgroundColor: choice == 2 ? Colors.green : Colors.greenAccent[100],
                                    foregroundColor: Colors.black
                                ),
                              )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}