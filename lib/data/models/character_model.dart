class CharacterModel
{
  late int charID;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late List<dynamic> apperanceOfSeasons;
  late List<dynamic> apperanceBetterCallSaul;
  late String statusDeadOrAlive;
  late String actorName;
  late String categoryForTwoSerriese;

  CharacterModel.fromJson(Map<String, dynamic>json){
    charID = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    apperanceOfSeasons = json['appearance'];
    apperanceBetterCallSaul = json['better_call_saul_appearance'];
    statusDeadOrAlive = json['status'];
    actorName = json['portrayed'];
    categoryForTwoSerriese = json['category'];
  }
}