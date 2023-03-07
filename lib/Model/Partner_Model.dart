class Partner {
  bool? status;
  String? partnerlist;
  Data? data;
  int? count;

  Partner({this.status, this.partnerlist, this.data, this.count});

  Partner.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    partnerlist = json['message'];
    data = json['data'] != null
        ? Data.fromJson(json['data'])
        : null;
    count = json['count'];
  }
}

class Data {
  List<Partners>? partners;

  Data({this.partners});

  Data.fromJson(Map<String, dynamic> json) {
    partners = json['partners'] == null
        ? <Partners>[]
        : (json['partners'] as List<dynamic>)
        .map((e) => Partners.fromJson(e))
        .toList();
  }
}

class Partners {
  String? id;
  bool? isInvited;
  String? creationDate;
  String? partnerId;
  String? userId;
  String? statusS;
  String? subscriberPlan;
  String? name;
  String? email;
  String? blockType;
  String? duration;
  String? companyName;
  String? blockEndDate;
  List<Location>? location;
  List<Comment>? comment;

  Partners(
      {this.id,
        this.isInvited,
        this.creationDate,
        this.partnerId,
        this.userId,
        this.statusS,
        this.subscriberPlan,
        this.name,
        this.email,
        this.blockType,
        this.duration,
        this.companyName,
        this.blockEndDate,
        this.location,
        this.comment});

  Partners.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    isInvited = json['isInvited'];
    creationDate = json['creationDate'];
    partnerId = json['partnerId'];
    userId = json['userId'] ?? "";
    statusS = json['status'];
    subscriberPlan = json['subscriptionPlan'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    blockType = json['blockType'];
    duration = json['duration'];
    companyName = json['companyName'] ?? "No company name";
    blockEndDate = json['blockEndDate'] ?? "";
    location = json['location'] == null
        ? <Location>[]
        : (json['location'] as List<dynamic>)
        .map((e) => Location.fromJson(e))
        .toList();
    comment = json['comment'] == null
        ? <Comment>[]
        : (json['comment'] as List<dynamic>)
        .map((e) => Comment.fromJson(e))
        .toList();
  }
}

class Location {
  String? locId;
  bool? isBookByMe;
  bool? isLikeByMe;
  Address? address;
  Coordinate? coordinate;
  Locations? locations;
  OpeningHours? openingHours;
  String? status;
  List? images;
  List<PartnerComments>? partnerComments;
  List<PartnerLikes>? partnerLikes;
  List<PartnerBookmarks>? partnerBookmarks;

  Location.fromJson(Map<String, dynamic> json) {
    locId = json['_id'];
    isBookByMe = json['isBookmarkedByMe'];
    isLikeByMe = json['isLikedByMe'];
    address = json['address'] != null
        ? Address.fromJson(json['address'])
        : null;
    coordinate = json['coordinates'] != null ? Coordinate.fromJson(json['coordinates']) : null;
    locations = json['location'] != null ? Locations.fromJson(json['location']) : null;
    openingHours = json['openingHours'] != null ? OpeningHours.fromJson(json['openingHours']) : null;
    status = json['status'];
    images = (json['images'] as List?)?.toList() ?? [];
    partnerComments = json['partnerComments'] == null
        ? <PartnerComments>[]
        : (json['partnerComments'] as List<dynamic>)
        .map((e) => PartnerComments.fromJson(e))
        .toList();
    partnerLikes = json['partnerLikes'] == null
        ? <PartnerLikes>[]
        : (json['partnerLikes'] as List<dynamic>)
        .map((e) => PartnerLikes.fromJson(e))
        .toList();
    partnerBookmarks = json['partnerBookmarks'] == null
        ? <PartnerBookmarks>[]
        : (json['partnerBookmarks'] as List<dynamic>)
        .map((e) => PartnerBookmarks.fromJson(e))
        .toList();
  }
}

class PartnerComments {
  String? id;
  String? comment;
  String? commenton;
  CommentBy? commentBy;
  String? status;
  String? partnerLocationID;
  List<ReplyComment>? replyComment;

  PartnerComments(
      {this.id,
        this.comment,
        this.commenton,
        this.commentBy,
        this.status,
        this.partnerLocationID,
        this.replyComment});

  PartnerComments.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    comment = json['comment'];
    commenton = json['commentedOn'];
    commentBy = json['commentedBy'] != null
        ? CommentBy.fromJson(json['commentedBy'])
        : null;
    status = json['status'];
    partnerLocationID = json['partnerLocationId'];

    replyComment = json['replyComment'] == null
        ? <ReplyComment>[]
        : (json['replyComment'] as List<dynamic>)
        .map((e) => ReplyComment.fromJason(e))
        .toList();
  }
}

class ReplyComment {
  String? id;
  String? comment;
  String? commenton;
  CommentB? commentBy;
  String? status;

  ReplyComment(
      {this.id, this.comment, this.commenton, this.commentBy, this.status});

  ReplyComment.fromJason(Map<String, dynamic> json) {
    id = json['_id'];
    comment = json['comment'];
    commenton = json['commentedOn'];
    commentBy = json['commentedBy'] != null
        ? CommentB.fromJson(json['commentedBy'])
        : null;
    status = json['status'];
  }
}

class CommentB {
  String? id;
  String? firstname;
  String? lastname;
  String? profilUrl;
  bool? isDefaultImage;
  String? defaultImagePath;

  CommentB(
      {this.id,
        this.firstname,
        this.lastname,
        this.profilUrl,
        this.isDefaultImage,
        this.defaultImagePath});

  CommentB.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    profilUrl = json['profilePicUrl'];
    isDefaultImage = json['isDefaultImage'];
    defaultImagePath = json['defaultImagePath'];
  }
}

class CommentBy {
  String? id;
  String? firstname;
  String? lastname;
  String? profilUrl;
  bool? isDefaultImage;
  String? defaultImagePath;

  CommentBy(
      {this.id,
        this.firstname,
        this.lastname,
        this.profilUrl,
        this.isDefaultImage,
        this.defaultImagePath});

  CommentBy.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    profilUrl = json['profilePicUrl'];
    isDefaultImage = json['isDefaultImage'];
    defaultImagePath = json['defaultImagePath'];
  }
}

class PartnerBookmarks {
  String? id;
  String? bookMarkedBy;
  String? createdAt;

  PartnerBookmarks({this.id, this.bookMarkedBy, this.createdAt});

  PartnerBookmarks.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    bookMarkedBy = json['bookmarkedBy'];
    createdAt = json['createdAt'];
  }
}

class PartnerLikes {
  String? id;
  String? likesBy;
  String? createdAt;

  PartnerLikes({this.id, this.likesBy, this.createdAt});

  PartnerLikes.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    likesBy = json['likedBy'];
    createdAt = json['createdAt'];
  }
}

class OpeningHours {
  List<Sunday>? sunday;
  List<Monday>? monday;
  List<Tuesday>? tuesday;
  List<Wednesday>? wednesday;
  List<Thursday>? thursday;
  List<Friday>? friday;
  List<Saturday>? saturday;
  bool? open;

  OpeningHours(
      {this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.open});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'] == null
        ? <Sunday>[]
        : (json['sunday'] as List<dynamic>)
        .map((e) => Sunday.fromJson(e))
        .toList();
    monday = json['monday'] == null
        ? <Monday>[]
        : (json['monday'] as List<dynamic>)
        .map((e) => Monday.fromJson(e))
        .toList();
    tuesday = json['tuesday'] == null
        ? <Tuesday>[]
        : (json['tuesday'] as List<dynamic>)
        .map((e) => Tuesday.fromJson(e))
        .toList();
    wednesday = json['wednesday'] == null
        ? <Wednesday>[]
        : (json['wednesday'] as List<dynamic>)
        .map((e) => Wednesday.fromJson(e))
        .toList();
    thursday = json['thursday'] == null
        ? <Thursday>[]
        : (json['thursday'] as List<dynamic>)
        .map((e) => Thursday.fromJson(e))
        .toList();
    friday = json['friday'] == null
        ? <Friday>[]
        : (json['friday'] as List<dynamic>)
        .map((e) => Friday.fromJson(e))
        .toList();
    saturday = json['saturday'] == null
        ? <Saturday>[]
        : (json['saturday'] as List<dynamic>)
        .map((e) => Saturday.fromJson(e))
        .toList();
    open = json['open247'];
  }
}

class Saturday {
  String? id;
  String? openingTime;
  String? closingTime;

  Saturday({this.id, this.openingTime, this.closingTime});

  Saturday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Friday {
  String? id;
  String? openingTime;
  String? closingTime;

  Friday({this.id, this.openingTime, this.closingTime});

  Friday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Thursday {
  String? id;
  String? openingTime;
  String? closingTime;

  Thursday({this.id, this.openingTime, this.closingTime});

  Thursday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Wednesday {
  String? id;
  String? openingTime;
  String? closingTime;

  Wednesday({this.id, this.openingTime, this.closingTime});

  Wednesday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Tuesday {
  String? id;
  String? openingTime;
  String? closingTime;

  Tuesday({this.id, this.openingTime, this.closingTime});

  Tuesday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Monday {
  String? id;
  String? openingTime;
  String? closingTime;

  Monday({this.id, this.openingTime, this.closingTime});

  Monday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Sunday {
  String? id;
  String? openingTime;
  String? closingTime;

  Sunday({this.id, this.openingTime, this.closingTime});

  Sunday.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }
}

class Locations {
  String? type;
  List? coordinate;

  Locations({this.type, this.coordinate});

  Locations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinate = (json['coordinates'] as List?)?.toList() ?? [];
  }
}

class Coordinate {
  double? long;
  double? lat;

  Coordinate({this.long, this.lat});

  Coordinate.fromJson(Map<String, dynamic> json) {
    long = json['longitude'];
    lat = json['latitude'];
  }
}

class Address {
  String? street;
  String? postalCode;
  String? state;
  String? country;

  Address({this.street, this.postalCode, this.state, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    postalCode = json['postalCode'];
    state = json['state'];
    country = json['country'];
  }
}

class Comment {
  Comment.fromJson(Map<String, dynamic> json) {

  }
}
