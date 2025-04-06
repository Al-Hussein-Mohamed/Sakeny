// notes: any DateTime data type will be treated as a string

enum RentFrequency { daily, weekly, monthly, yearly }

enum UnitType { room, apartment, house, villa }

class LocationModel {
  final double longitude;
  final double latitude;

  LocationModel({
    required this.longitude,
    required this.latitude,
  });
}

class UserModel {
  final String? userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String profilePictureURL;
  final String coverPictureURL;

  final double rate;

  final LocationModel locationModel;

  // separated api takes userId and returns the user posts
  List<PostModel> posts = [];

  // separated api takes userId and returns the user units
  List<UnitModel> units = [];

  // separated api takes userId and return user's favorite units
  List<UnitModel> favorites = [];

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.profilePictureURL,
    required this.coverPictureURL,
    required this.rate,
    required this.locationModel,
  });
}

class UnitModel {
  final String unitId;
  final String userId;
  final String title;
  final String description;
  final String governorate;
  final String city;
  final String street;

  final bool isRented;
  final bool isFurnished;

  //
  final double rent;
  final double unitArea;

  final int floor;
  final int roomsCount;
  final int bathroomsCount;

  final UnitType unitType;
  final RentFrequency rentFrequency;
  final LocationModel locationModel;
  final ServicesModel servicesModel;
  final NearbyServicesModel nearbyServicesModel;

  List<String> unitPicturesURL = [];

  UnitModel({
    required this.unitId,
    required this.userId,
    required this.title,
    required this.description,
    required this.governorate,
    required this.city,
    required this.street,
    required this.isRented,
    required this.isFurnished,
    required this.rent,
    required this.unitArea,
    required this.floor,
    required this.roomsCount,
    required this.bathroomsCount,
    required this.unitType,
    required this.rentFrequency,
    required this.locationModel,
    required this.servicesModel,
    required this.nearbyServicesModel,
    required this.unitPicturesURL,
  });
}

class ServicesModel {
  final bool elevator;
  final bool landLine;
  final bool wifi;
  final bool naturalGas;
  final bool waterHeater;
  final bool airConditioner;
  final bool balcony;

  ServicesModel({
    required this.elevator,
    required this.landLine,
    required this.wifi,
    required this.naturalGas,
    required this.waterHeater,
    required this.airConditioner,
    required this.balcony,
  });
}

class NearbyServicesModel {
  bool bank;
  bool parking;
  bool hospital;
  bool restaurant;
  bool university;
  bool gym;
  bool school;

  NearbyServicesModel({
    required this.bank,
    required this.parking,
    required this.hospital,
    required this.restaurant,
    required this.university,
    required this.gym,
    required this.school,
  });
}

// will send a userId to this api
class PostModel {
  final String postId;
  final String userId;
  final String description;

  final DateTime date;

  final bool isLiked;
  final bool isFavorite;
  final bool isHide;

  final int likesCount;
  final int commentsCount;

  final UnitModel unitModel;

  final List<CommentModel> comments;

  PostModel({
    required this.postId,
    required this.userId,
    required this.description,
    required this.date,
    required this.isLiked,
    required this.isFavorite,
    required this.isHide,
    required this.likesCount,
    required this.commentsCount,
    required this.unitModel,
    required this.comments,
  });
}

// how to handle replies?
class CommentModel {
  final String parentId;
  final String commentId;
  final String postId;
  final String userId;
  final String content;

  final DateTime date;
  List<CommentModel> replies = [];

  CommentModel({
    required this.parentId,
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.content,
    required this.date,
    required this.replies,
  });
}

// chat
