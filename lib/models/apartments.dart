class Apartments {
  String apartmentID;
  String name;
  String budget;
  String address;
  String type;
  String bedrooms;
  String imageurl;
  bool isfavourite;
  Apartments({
    this.apartmentID,
    this.name,
    this.budget,
    this.address,
    this.bedrooms,
    this.imageurl,
    this.type,
    this.isfavourite,
  });
  Map<String, dynamic> toMap() {
    return {
      'apartmentID': apartmentID,
      'name': name,
      'budget': budget,
      'address': address,
      'type': type,
      'bedrooms': bedrooms,
      'imageurl': imageurl,
      'isfavourite': isfavourite
    };
  }
  

  Apartments.fromFirestore(Map<String, dynamic> firestore)
      : apartmentID = firestore['apartmentID'],
        name = firestore['name'],
        budget = firestore['budget'],
        address = firestore['address'],
        type = firestore['type'],
        bedrooms = firestore['bedrooms'],
        imageurl = firestore['imageurl'],
        isfavourite = firestore['isfavourite'];

 
        
}
