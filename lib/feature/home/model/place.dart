class Itinerary {
  final String time;
  final String activity;
  final String description;

  Itinerary({
    required this.time,
    required this.activity,
    required this.description,
  });
}

class Review {
  final String profileImage;
  final String name;
  final double rating;
  final String comment;

  Review({
    required this.profileImage,
    required this.name,
    required this.rating,
    required this.comment,
  });
}

class Place {
  final String name;
  final String asset;
  final String location;
  final double rating;
  final int price;
  final String headline;
  final String desc;
  final String date;
  final List<String> testimonials;
  final List<Itinerary> itineraries;
  final List<Review> reviews;

  Place({
    required this.name,
    required this.asset,
    required this.location,
    required this.rating,
    required this.price,
    required this.headline,
    required this.desc,
    required this.date,
    required this.testimonials,
    required this.itineraries,
    required this.reviews,
  });
}

final popularDestination = [
  Place(
    name: "Cafe Lereng Anteng",
    asset: "assets/machu.jpeg",
    location: "West Java",
    rating: 4.0,
    price: 850000,
    headline: "One of the Best Places on Java Island",
    desc:
        "Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement.",
    testimonials: [
      "assets/profile_1.jpeg",
      "assets/profile_2.jpeg",
      "assets/profile_3.jpeg",
      "assets/profile_4.jpeg",
    ],
    date: "24 Aug - 29 Aug 2025",
    itineraries: [
      Itinerary(
        time: "08:00 AM",
        activity: "Breakfast at Hotel",
        description: "Enjoy a delicious breakfast at the hotel before starting the day.",
      ),
      Itinerary(
        time: "09:00 AM",
        activity: "Boat Ride on Kapuas River",
        description: "Take a scenic boat ride along the Kapuas River.",
      ),
      Itinerary(
        time: "12:00 PM",
        activity: "Lunch at Riverside Restaurant",
        description: "Savor local cuisine at a riverside restaurant.",
      ),
      Itinerary(
        time: "02:00 PM",
        activity: "Visit Local Village",
        description: "Explore the culture and traditions of a local village.",
      ),
      Itinerary(
        time: "05:00 PM",
        activity: "Return to Hotel",
        description: "Head back to the hotel for some rest.",
      ),
    ],
    reviews: [
      Review(
        profileImage: "assets/profile_1.jpeg",
        name: "John Doe",
        rating: 4.5,
        comment: "Amazing experience! The tour was well-organized and the guides were very knowledgeable.",
      ),
      Review(
        profileImage: "assets/profile_2.jpeg",
        name: "Jane Smith",
        rating: 5.0,
        comment: "Absolutely loved it! The scenery was breathtaking, and the activities were so much fun.",
      ),
      Review(
        profileImage: "assets/profile_3.jpeg",
        name: "Alice Johnson",
        rating: 4.0,
        comment: "Great trip overall. The food was delicious, and the accommodations were comfortable.",
      ),
      Review(
        profileImage: "assets/profile_4.jpeg",
        name: "Bob Brown",
        rating: 4.8,
        comment: "Highly recommend this tour. Everything was perfect, from start to finish.",
      ),
    ],
  ),
  Place(
    name: "Bandung Botanical Garden",
    asset: "assets/canyon.jpeg",
    location: "Bandung, West Java",
    rating: 4.6,
    price: 400000,
    headline: "A Green Paradise in the Heart of Bandung",
    desc:
        "Bandung Botanical Garden is a nature tourism destination that offers the beauty of various plants and flowers. This place is perfect for families, nature lovers, or those who just want to relax. With cool air and soothing views, Bandung Botanical Garden is one of the favorite spots in Bandung.",
    testimonials: [
      "assets/profile_1.jpeg",
      "assets/profile_2.jpeg",
      "assets/profile_3.jpeg",
      "assets/profile_4.jpeg",
    ],
    date: "24 Aug - 29 Aug 2025",
    itineraries: [
      Itinerary(
        time: "08:00 AM",
        activity: "Breakfast at Hotel",
        description: "Enjoy a delicious breakfast at the hotel before starting the day.",
      ),
      Itinerary(
        time: "09:00 AM",
        activity: "Boat Ride on Kapuas River",
        description: "Take a scenic boat ride along the Kapuas River.",
      ),
      Itinerary(
        time: "12:00 PM",
        activity: "Lunch at Riverside Restaurant",
        description: "Savor local cuisine at a riverside restaurant.",
      ),
      Itinerary(
        time: "02:00 PM",
        activity: "Visit Local Village",
        description: "Explore the culture and traditions of a local village.",
      ),
      Itinerary(
        time: "05:00 PM",
        activity: "Return to Hotel",
        description: "Head back to the hotel for some rest.",
      ),
    ],
    reviews: [
      Review(
        profileImage: "assets/profile_1.jpeg",
        name: "John Doe",
        rating: 4.5,
        comment: "Amazing experience! The tour was well-organized and the guides were very knowledgeable.",
      ),
      Review(
        profileImage: "assets/profile_2.jpeg",
        name: "Jane Smith",
        rating: 5.0,
        comment: "Absolutely loved it! The scenery was breathtaking, and the activities were so much fun.",
      ),
      Review(
        profileImage: "assets/profile_3.jpeg",
        name: "Alice Johnson",
        rating: 4.0,
        comment: "Great trip overall. The food was delicious, and the accommodations were comfortable.",
      ),
      Review(
        profileImage: "assets/profile_4.jpeg",
        name: "Bob Brown",
        rating: 4.8,
        comment: "Highly recommend this tour. Everything was perfect, from start to finish.",
      ),
    ],
  ),
  // Add other places similarly...
];

final specialForYou = popularDestination.reversed.toList();