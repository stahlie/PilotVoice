class AirportModel {
  String faaID;
  String airportName;


  AirportModel (
    this.faaID,
    this.airportName,
  );

  AirportModel.fromMap(dynamic obj) {
    this.faaID = obj["faaID"];
    this.airportName = obj["airportName"];
    }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["faaID"] = faaID;
    map["airportName"] = airportName;

    return map;
  }

  //Getters
  String get getfaaID => faaID;
  String get getAirport => airportName;
}