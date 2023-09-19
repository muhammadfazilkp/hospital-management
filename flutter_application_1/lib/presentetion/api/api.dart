import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  final String apiKey = '36fc10e0c9mshcacf8a2f72d92b3p1b2188jsn14f4a9ea9e3f';
  List<dynamic> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://us-doctors-and-medical-professionals.p.rapidapi.com/search_npi');

    try {
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Host': 'us-doctors-and-medical-professionals.p.rapidapi.com',
          'X-RapidAPI-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        // Successful response
        final data = json.decode(response.body);
        print(data);
        setState(() {
          dataList = data;
        });
      } else {
        // Handle error
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const  Text('API Request Example'),
      ),
      body: Center(
        child: dataList.isEmpty
            ? const  CircularProgressIndicator() // Display a loading indicator
            : ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  final item = dataList[index];
                  // Replace with your desired widget to display each item
                  return ListTile(
                    title: Text(item['']),
                  );
                },
              ),
      ),
    );
  }
}
