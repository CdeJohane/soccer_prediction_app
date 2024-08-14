import 'package:soccer_app/model/selection.dart';

class Player{
  final int playerID;
  final String name;
  final String email;
  int points = 0;
  List<Selection> myPredictions = [];
  int indexValue = -1;
  int correct = 0;
  int wrong = 0;

  Player(this.playerID, this.name, this.email);

  // Enter new Prediction
  void enterNewPrediction(Selection newSelection){
    myPredictions.add(newSelection);
  }

  // Update points tally
  void updateTally(){
    if(myPredictions.isNotEmpty && (indexValue<myPredictions.length)){
      // Calculate Score
      for (int i=indexValue+1; i<myPredictions.length; i++){
        Selection index = myPredictions[i];
        if(index.winOrLose == 1){
          correct++;
          points+=2;
          indexValue++;
        }else if(index.winOrLose == 0){
          wrong++;
          indexValue++;
        }
      }
    }
  }
}