import 'dart:convert';

class Scan {
    Scan({
        this.id,
        this.type,
        required this.value,
    }){
      if(value.contains('http')){
        type = 'http';
      }else{
        type = 'geo';
      }
    }

    int? id;
    String? type;
    String value;

    factory Scan.fromJson(String str) => Scan.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Scan.fromMap(Map<String, dynamic> json) => Scan(
        id: json["id"],
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "value": value,
    };
}
