
class MoneyProvider {
  static double _money = 500;

  double get money => _money;

  void addMoney(double value) {
    _money += value;
  }

  void removeMoney(double value) {
    _money -= value;
  }
  
}
