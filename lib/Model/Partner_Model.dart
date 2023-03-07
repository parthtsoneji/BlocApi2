import 'dart:core';

class PostsApi {
  Pagination? pagination;
  List<Posts>? posts;

  PostsApi({this.pagination, this.posts});

  PostsApi.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    posts = (json['posts'] as List<dynamic>)
        .map((e) => Posts.fromJson(e))
        .toList();
  }
}


class Pagination {
  int? pagesize;
  int? nextpage;
  int? length;

  Pagination({this.length, this.nextpage, this.pagesize});

  Pagination.fromJson(Map<String, dynamic> json) {
    pagesize = json["pagesize"];
    nextpage = json['nextpage'];
    length = json['length'];
  }
}


class Posts {
  String? id;
  String? category;
  String? created;
  String? dataRule;
  bool? isAdvaPost;
  bool? bookByMe;
  bool? likeMe;
  String? address;
  Loc? loc;
  String? postDec;
  String? postHashtag;
  List<PostMedia>? postMedia;
  List<PostLikes>? postLikes;
  List<PostBookmarks>? postBookMarks;
  PostBy? postBy;
  SharedDetails? shareDetails;
  bool? isReported;
  List? reportId;
  String? fontColor;
  String? backgroundColor;
  String? type;
  bool? commentAllowed;

  Posts(
      {this.id,
        this.category,
        this.created,
        this.dataRule,
        this.isAdvaPost,
        this.bookByMe,
        this.likeMe,
        this.address,
        this.loc,
        this.postDec,
        this.postHashtag,
        this.postMedia,
        this.postLikes,
        this.postBookMarks,
        this.postBy,
        this.shareDetails,
        this.isReported,
        this.reportId,
        this.fontColor,
        this.backgroundColor,
        this.type,
        this.commentAllowed});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    category = json['category'];
    created = json['createdAt'];
    dataRule = json['dataPrivacyRule'];
    isAdvaPost = json['isAdvertorialPost'];
    bookByMe = json['isBookmarkedByMe'];
    likeMe = json['isLikedByMe'];
    address = json['address'];
    loc = Loc.fromJson(json['loc']);
    postDec = json['postDescription'];
    postHashtag = json['postHashTags'];
    postMedia = (json['postMedia'] as List<dynamic>)
        .map((e) => PostMedia.fromJson(e))
        .toList();
    postBookMarks =(json['postBookmarks'] as List<dynamic>)
        .map((e) => PostBookmarks.fromJson(e))
        .toList();
    postLikes = (json['postLikes'] as List<dynamic>)
        .map((e) => PostLikes.fromJson(e))
        .toList();
    // postLikes = json['postLikes'] == null
    //     ? []
    //     : (json['postLikes'] as List<dynamic>)
    //         .map((e) => PostLikes.fromjson(e))
    //         .toList();
    postBy =
        PostBy.fromJson(json['postedBy']);
    shareDetails = json['shareDetails'] != null
        ? SharedDetails.fromJson(json['shareDetails'])
        : null;
    reportId = (json['reportId'] as List?)?.toList() ?? [];
    fontColor = json['fontColor'];
    isReported = json['isReported'];
    backgroundColor = json['backgroundColor'];
    type = json['type'];
    commentAllowed = json['commentAllowed'];
  }
}



class Loc {
  String? type;
  List<double>? coordinates;

  Loc({this.type, this.coordinates});

  Loc.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }
}

class PostMedia {
  String? id;
  String? url;

  PostMedia({this.id, this.url});

  PostMedia.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    url = json['url'];
  }
}


class PostLikes {
  String? id;
  String? firstName;
  String? lastName;
  String? profileUrl;

  PostLikes({this.id, this.firstName, this.lastName, this.profileUrl});

  PostLikes.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileUrl = json['profilePicUrl'];
  }
}


class PostBy {
  String? firstName;
  String? lastName;
  String? profileUrl;
  String? userId;
  bool? defualtImage;
  String? defualtImagePath;

  PostBy(
      {this.firstName,
        this.lastName,
        this.profileUrl,
        this.userId,
        this.defualtImage,
        this.defualtImagePath});

  PostBy.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileUrl = json['profilePicUrl'];
    userId = json['userId'];
    defualtImage = json['isDefaultImage'];
    defualtImagePath = json['defaultImagePath'];
  }
}


class PostBookmarks {
  String? id;
  String? firstName;
  String? lastName;
  String? profileUrl;

  PostBookmarks({this.id, this.firstName, this.lastName, this.profileUrl});

  PostBookmarks.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileUrl = json['profilePicUrl'];
  }
}


class SharedDetails {
  SharedDetails.fromJson(Map<String, dynamic> json) {}
}

