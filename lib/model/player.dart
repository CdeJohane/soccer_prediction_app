import 'package:soccer_app/model/selection.dart';
import 'match.dart';

class Player{
  final int playerID;
  final String name;
  final String email;
  int points = 0;
  List<Selection> myPredictions = [];
  int indexValue = -1;
  int correct = 0;

  Player(this.playerID, this.name, this.email);

  // Enter new Prediction
  void enterNewPrediction(Selection newSelection){
    myPredictions.add(newSelection);
  }

  // Update prediction result
  void updatePredictionResult(Match match){
    if (match.completed){
      // Get home or away result and update that
      int result = match.homeOrAway;
      // Get index of match
      int predictionIndex = myPredictions.indexWhere((element) => element.matchID == match.matchID);
      // Update if element is available
      if(predictionIndex!=-1){
        if(myPredictions[predictionIndex].teamChoice == result){
          myPredictions[predictionIndex].winOrLose = 1;
        }else{
          myPredictions[predictionIndex].winOrLose = 0;
        }
        _updateTally(predictionIndex);
      }
    }
  }

  // Update points tally
  void _updateTally(int selectedIndex){
    // Check if its empty or nah
    if ((selectedIndex != -1) && (myPredictions[selectedIndex].winOrLose ==1) && (!myPredictions[selectedIndex].resultAdded)){
      correct++;
    }
    points = 2 * correct;
  }
}