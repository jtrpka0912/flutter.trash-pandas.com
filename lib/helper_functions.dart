// Models
import 'package:trashpandas/models/enums.dart';

String getCardName(CardNames cardNameEnum) {
  // This will output as CardNames.CardName. Need to separate.
  List<String> cardNameArray = cardNameEnum.toString().split('.');

  return cardNameArray[1].toString();
}