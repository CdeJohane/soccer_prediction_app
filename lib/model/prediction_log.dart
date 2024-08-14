import 'package:soccer_app/model/player.dart';

class PredictionLog{
  List<Player> standings = [];

  PredictionLog(this.standings);

  // Quicksort to sort the positions
  void sortPositions({int? lo, int? hi}){
    lo ??= 0;
    hi ??= standings.length-1;

    // Commence the split and sort
    Player pivotPlayer = standings[hi];
    int i = lo -1;
    for (int a = lo; a<hi; a++){
      if (standings[a].points.compareTo(pivotPlayer.points) > 0){
        i++;
        Player temp = standings[i+1];
        standings[i+1] = standings[hi];
        standings[hi] = temp;
      }
    }
    Player temp = standings[i + 1];
    standings[i + 1] = standings[hi];
    standings[hi] = temp;
    // return i+1
    sortPositions(lo: lo, hi: i);
    sortPositions(lo: i+2, hi: hi);
  }
}