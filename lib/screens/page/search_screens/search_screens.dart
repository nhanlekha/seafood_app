import 'package:flutter/material.dart';

class SearchScreens extends StatefulWidget {
  @override
  _SearchScreensState createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  double _minPrice = 102000;
  double _maxPrice = 1432000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Bạn tìm gì hôm nay?',
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            onChanged: (value) {
              // Implement search functionality
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.black),
            onPressed: () {
              // Implement filter or additional actions
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Category and Sort dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Danh mục',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['Tất cả', 'Sushi', 'Tôm', 'Cua']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Handle category change
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Sắp xếp',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['Mới nhất', 'Giá tăng dần', 'Giá giảm dần']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Handle sort change
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Price Range Slider
            Row(
              children: [
                Text('${_minPrice ~/ 1000}k'),
                Expanded(
                  child: Slider(
                    value: _maxPrice,
                    min: 102000,
                    max: 1432000,
                    divisions: 100,
                    label: '${_maxPrice ~/ 1000}k',
                    onChanged: (value) {
                      setState(() {
                        _maxPrice = value;
                      });
                    },
                  ),
                ),
                Text('${_maxPrice ~/ 1000}k'),
              ],
            ),
            SizedBox(height: 10),

            // Product Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // Replace with your product count
                itemBuilder: (context, index) {
                  return ProductCard2();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://via.placeholder.com/150', // Replace with product image URL
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name', // Replace with actual product name
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Category', // Replace with product category
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('4.5'), // Replace with product rating
                    Text(' (20 đánh giá)'),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  '120,000 đ / 1 kg', // Replace with product price
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
