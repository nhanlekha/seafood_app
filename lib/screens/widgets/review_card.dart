import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  late String date;
  final String review;
  final String? image;
  final int rating;

  ReviewCard(
      {required this.name,
      required this.review,
      this.image,
      required this.rating,
      required this.date}) {
    if (rating > 5) {
      throw Exception('Rating must be less than or equal to 5');
    }
    if (name.isEmpty) {
      throw Exception('Name must not be empty');
    }

    if (review.isEmpty) {
      throw Exception('Review must not be empty');
    }

    if (date.isEmpty) {
      throw Exception('Date must not be empty');
    }

    // convert date to DateTime, change date to string ex: 2 days ago if it is 2 days ago

    DateTime currentDate = DateTime.now();
    DateTime givenDate = DateTime.parse(date);
    Duration difference = currentDate.difference(givenDate);

    if (difference.inDays > 0) {
      date = '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      date = '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      date = '${difference.inMinutes} minutes ago';
    } else {
      date = 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: image != null
                      ? Image.network(
                          image!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/man1.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < rating; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              for (int i = 0; i < 5 - rating; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            review,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
