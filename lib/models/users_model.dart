// To parse this JSON data, do
//
//     final getUsers = getUsersFromJson(jsonString);

import 'dart:convert';

List<GetUsers> getUsersFromJson(String str) => List<GetUsers>.from(json.decode(str).map((x) => GetUsers.fromJson(x)));

String getUsersToJson(List<GetUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUsers {
    String? gender;
    Name? name;
    String? email;
    Id? id;
    Picture? picture;

    GetUsers({
        this.gender,
        this.name,
        this.email,
        this.id,
        this.picture,
    });

    GetUsers copyWith({
        String? gender,
        Name? name,
        String? email,
        Id? id,
        Picture? picture,
    }) => 
        GetUsers(
            gender: gender ?? this.gender,
            name: name ?? this.name,
            email: email ?? this.email,
            id: id ?? this.id,
            picture: picture ?? this.picture,
        );

    factory GetUsers.fromJson(Map<String, dynamic> json) => GetUsers(
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        email: json["email"],
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
    );

    Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "email": email,
        "id": id?.toJson(),
        "picture": picture?.toJson(),
    };
}

class Id {
    String? name;
    dynamic value;

    Id({
        this.name,
        this.value,
    });

    Id copyWith({
        String? name,
        dynamic value,
    }) => 
        Id(
            name: name ?? this.name,
            value: value ?? this.value,
        );

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}

class Name {
    String? title;
    String? first;
    String? last;

    Name({
        this.title,
        this.first,
        this.last,
    });

    Name copyWith({
        String? title,
        String? first,
        String? last,
    }) => 
        Name(
            title: title ?? this.title,
            first: first ?? this.first,
            last: last ?? this.last,
        );

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    String? large;
    String? medium;
    String? thumbnail;

    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    Picture copyWith({
        String? large,
        String? medium,
        String? thumbnail,
    }) => 
        Picture(
            large: large ?? this.large,
            medium: medium ?? this.medium,
            thumbnail: thumbnail ?? this.thumbnail,
        );

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
