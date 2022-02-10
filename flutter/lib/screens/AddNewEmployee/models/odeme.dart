class Odeme {
  int id;
  String name;
  int fee;
  String unit;
  String description;
  String periot;
  bool grossPrice;
  bool includePayroll;

  Odeme({
    this.id = 0,
    this.name = "",
    this.fee = 0,
    this.unit = "",
    this.description = "",
    this.periot = "",
    this.grossPrice = false,
    this.includePayroll = false,
  });
}
