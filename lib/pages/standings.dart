import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:soccer_app/model/dummy_data.dart';
import 'package:soccer_app/model/prediction_log.dart';
import 'package:soccer_app/model/selection.dart';
import 'package:soccer_app/model/match.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({super.key});

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

    List<Match> results = [];
    // Filter out matches that havent been completed
    for (int i =0; i< matchList.length; i++){
      if (matchList[i].completed){
        results.add(matchList[i]);
      }
    }

    // For loop to add u all the scores
    for (int i=0; i<dummyPlayers.length; i++){
      if (dummyPlayers[i].myPredictions.isNotEmpty){
        for (int j = 0; j<results.length; j++){
          dummyPlayers[i].updatePredictionResult(results[j]);
        }
      }
    }

    // Create Standings list
    final PredictionLog theLog = PredictionLog(dummyPlayers);
    // Sort that List Immediately
    theLog.sortPositions();
    return Center(
      child: ListView.builder(
        itemCount: theLog.standings.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('${index+1}'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(theLog.standings[index].name)
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('${theLog.standings[index].points}')
                  )
                ]
              ),
            ),
          );
        },
      ),
    );
  }
}