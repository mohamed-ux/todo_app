class TaskModel {
  String id;
  String userId;
  String title;
  String description;
  int date;
  bool isDone;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.userId,
      required this.description,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          id: json['id'],
    userId: json['userId'],
          description: json['description'],
          date: json['date'],
          isDone: json['isDone'],
        );
  Map<String,dynamic> toJson(){
    return{
      'title':title,
      'id':id,
      'userId':userId,
      'description':description,
      'date':date,
      'isDone':isDone,
    };
  }
}
