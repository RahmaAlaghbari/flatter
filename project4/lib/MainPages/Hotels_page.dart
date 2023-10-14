import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Hotal_detail.dart';

class Hotel {
  final String name;
  final String description;
  final double rating;
  final String image;
  final String price;

  Hotel({
    required this.name,
    required this.description,
    required this.rating,
    required this.image,
    required this.price,
  });
}

List<Hotel> hotels = [
  Hotel(
    name: 'Hotel A',
    description: 'Luxurious hotel with stunning views',
    rating: 4.5,
    image: 'assets/hotel_1.png',
    price: '\$200', // Replace with the actual price
  ),
  Hotel(
    name: 'Hotel B',
    description: 'Cozy hotel in the heart of the city',
    rating: 4.2,
    image: 'assets/hotel_2.png',
    price: '\$150', // Replace with the actual price
  ),
  Hotel(
    name: 'Hotel C',
    description: 'Seaside resort with a private beach',
    rating: 4.8,
    image: 'assets/hotel_3.png',
    price: '\$300', // Replace with the actual price
  ),
  Hotel(
    name: 'Hotel D',
    description: 'Charming boutique hotel in a historic building',
    rating: 4.6,
    image: 'assets/hotel_4.png',
    price: '\$180', // Replace with the actual price
  ),
  Hotel(
    name: 'Hotel E',
    description: 'Family-friendly hotel with entertainment facilities',
    rating: 4.3,
    image: 'assets/hotel_5.png',
    price: '\$250', // Replace with the actual price
  ),
];

class HotelColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: hotels.map((hotel) => HotelCard(hotel: hotel)).toList(),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to another page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HotelDetailsPage(hotel: hotel)),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  hotel.image,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hotel.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${hotel.price}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                hotel.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.0),
              RatingBar.builder(
                initialRating: hotel.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 24,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating update
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}