class Place {
  final String? locationId;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? numReviews;
  final String? timezone;
  final String? locationString;
  final Photo? photo;
  final String? description;
  final String? rating;
  final String? priceLevel;
  final String? openNowText;
  final String? price;

  Place({
    this.locationId,
    this.name,
    this.latitude,
    this.longitude,
    this.numReviews,
    this.timezone,
    this.locationString,
    this.photo,
    this.description,
    this.rating,
    this.priceLevel,
    this.openNowText,
    this.price,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      locationId: json['location_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      rating: json['rating'] ?? '',
      priceLevel: json['price_level'] ?? '',
      description: json["description"],
      openNowText: json['open_now_text'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      numReviews: json['num_reviews'] ?? '',
      timezone: json['timezone'] ?? '',
      locationString: json['location_string'] ?? '',
      photo: json['photo'] != null ? Photo.fromJson(json['photo']) : null,
    );
  }
}

class Photo {
  final Images? images;
  final bool? isBlessed;
  final String? uploadedDate;
  final String? caption;
  final String? id;
  final String? helpfulVotes;
  final String? publishedDate;

  Photo({
    this.images,
    this.isBlessed,
    this.uploadedDate,
    this.caption,
    this.id,
    this.helpfulVotes,
    this.publishedDate,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      images: json['images'] != null ? Images.fromJson(json['images']) : null,
      isBlessed: json['is_blessed'],
      uploadedDate: json['uploaded_date'],
      caption: json['caption'],
      id: json['id'],
      helpfulVotes: json['helpful_votes'],
      publishedDate: json['published_date'],
    );
  }
}

class Images {
  final ImageSize? small;
  final ImageSize? thumbnail;
  final ImageSize? original;
  final ImageSize? large;
  final ImageSize? medium;

  Images({
    this.small,
    this.thumbnail,
    this.original,
    this.large,
    this.medium,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      small: json['small'] != null ? ImageSize.fromJson(json['small']) : null,
      thumbnail: json['thumbnail'] != null
          ? ImageSize.fromJson(json['thumbnail'])
          : null,
      original: json['original'] != null
          ? ImageSize.fromJson(json['original'])
          : null,
      large: json['large'] != null ? ImageSize.fromJson(json['large']) : null,
      medium:
          json['medium'] != null ? ImageSize.fromJson(json['medium']) : null,
    );
  }
}

class ImageSize {
  final String? width;
  final String? url;
  final String? height;

  ImageSize({
    this.width,
    this.url,
    this.height,
  });

  factory ImageSize.fromJson(Map<String, dynamic> json) {
    return ImageSize(
      width: json['width'],
      url: json['url'],
      height: json['height'],
    );
  }
}
