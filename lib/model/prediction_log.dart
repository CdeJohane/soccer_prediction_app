import 'package:soccer_app/model/player.dart';

class PredictionLog{
  List<Player> standings = [];

  PredictionLog(this.standings);

  // Quicksort to sort the positions
  /*void sortPositions({int? lo, int? hi}){
    lo ??= 0;
    hi ??= standings.length-1;

    // Commence the split and sort
    Player pivotPlayer = standings[hi];
    int i = lo;
    for (int a = lo; a<hi; a++){
      if (standings[a].points.compareTo(pivotPlayer.points) > 0){
        Player temp = standings[i];
        standings[i] = standings[a];
        standings[a] = temp;
        i++;
      }
    }
    Player temp = standings[i];
    standings[i] = standings[hi];
    standings[hi] = temp;

    int pi = i;
    // return i+1
    sortPositions(lo: lo, hi: pi-1);
    sortPositions(lo: pi+1, hi: hi);
  }*/

  void sortPositions({int? lo, int? hi}) {
  lo ??= 0;
  hi ??= standings.length - 1;

  if (lo < hi) {
    int pi = partition(lo, hi);
    sortPositions(lo: lo, hi: pi - 1);
    sortPositions(lo: pi + 1, hi: hi);
  }
}

int partition(int low, int high) {
  Player pivot = standings[high];
  int i = low;

  for (int j = low; j < high; j++) {
    if (standings[j].points.compareTo(pivot.points) > 0) {
      Player temp = standings[i];
      standings[i] = standings[j];
      standings[j] = temp;
      i++;
    }
  }

  Player temp = standings[i];
  standings[i] = standings[high];
  standings[high] = temp;
  return i;
}
}