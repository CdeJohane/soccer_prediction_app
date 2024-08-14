class Selection{
  final int selectionID;
  final int playerID;
  final int predictionID;
  int winOrLose = -1; // 0 for loss, 1 for win, -1 for not completed yet
  DateTime? date; 

  Selection({required this.selectionID, required this.playerID, required this.predictionID, this.date});
}