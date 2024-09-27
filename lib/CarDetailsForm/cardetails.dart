import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class CarDetailsForm extends StatefulWidget {
  const CarDetailsForm({super.key});

  @override
  _CarDetailsFormState createState() => _CarDetailsFormState();
}

class _CarDetailsFormState extends State<CarDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _carDetails = {
    'Name': '',
    'Year': '',
    'Kilometers_Driven': '',
    'Fuel_Type': 'Petrol',
    'Transmission': 'Manual',
    'Owner_Type': 'First',
    'Mileage': '',
    'Engine': '',
    'Power': '',
    'Seats': '',
  };

  String? _predictedPrice;
  String? _error;
  bool _isLoading = false;

  void _handleChange(String name, String value) {
    setState(() {
      _carDetails[name] = value;
    });
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      // Save the form data to _carDetails
      _formKey.currentState!.save();

      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushNamed(context, '/LoginPage').then((_) {
          setState(() {});
        });
        return; // Stop execution if user is not logged in
      }

      setState(() {
        _isLoading = true;
        _error = null; // Clear any previous errors
        _predictedPrice = null; // Clear any previous predictions
      });

      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/predict'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'Year': int.parse(_carDetails['Year'] ?? ''),
            'Kilometers_Driven':
                int.parse(_carDetails['Kilometers_Driven'] ?? ''),
            'Fuel_Type': {
                  'Petrol': 2,
                  'Diesel': 1,
                  'CNG': 3,
                  'LPG': 4,
                }[_carDetails['Fuel_Type']] ??
                0,
            'Transmission': _carDetails['Transmission'] == 'Manual' ? 1 : 2,
            'Owner_Type': {
                  'First': 1,
                  'Second': 2,
                  'Third': 3,
                  'Fourth & Above': 4,
                }[_carDetails['Owner_Type']] ??
                0,
            'Seats': int.parse(_carDetails['Seats'] ?? ''),
            'Company':
                companyNameToCode[_carDetails['Name']?.split(' ')[0]] ?? 0,
            'Mileage': double.parse(_carDetails['Mileage'] ?? ''),
            'Engine': double.parse(_carDetails['Engine'] ?? ''),
            'Power': double.parse(_carDetails['Power'] ?? ''),
          }),
        );
        print('Response: ${response.statusCode} ${response.body}');

        setState(() {
          _isLoading = false;
        });

        if (response.statusCode >= 200 && response.statusCode < 300) {
          final data = jsonDecode(response.body);
          setState(() {
            _predictedPrice = data['price'].toString();
          });
        } else {
          setState(() {
            _error = 'Error: ${response.statusCode}';
          });
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          _error = 'Error: $e';
        });
      }
    }
  }

  void _handleSell() async {
    if (_carDetails['Name'] == null ||
        _carDetails['Year'] == null ||
        _carDetails['Kilometers_Driven'] == null ||
        _carDetails['Fuel_Type'] == null ||
        _carDetails['Transmission'] == null ||
        _carDetails['Owner_Type'] == null ||
        _carDetails['Mileage'] == null ||
        _carDetails['Engine'] == null ||
        _carDetails['Power'] == null ||
        _carDetails['Seats'] == null) {
      setState(() {
        _error = 'Please fill all fields';
      });
      return;
    }

    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushNamed(context, '/LoginPage').then((_) {
        setState(() {});
      });
      return; // Stop execution if user is not logged in
    }

    try {
      final response = await http.post(
        Uri.parse('/api/cars'), // Check if this URL is correct
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_carDetails),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Car added to the marketplace!')),
        );
      } else {
        setState(() {
          _error = 'Could not add car to marketplace.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error occurred';
      });
    }
  }

  Map<String, int> companyNameToCode = {
    "Maruti": 1,
    "Hyundai": 2,
    "Honda": 3,
    "Audi": 4,
    "Nissan": 5,
    "Toyota": 6,
    "Volkswagen": 7,
    "Tata": 8,
    "Land": 9,
    "Mitsubishi": 10,
    "Renault": 11,
    "Mercedes-Benz": 12,
    "Bmw": 13,
    "Mahindra": 14,
    "Ford": 15,
    "Porsche": 16,
    "Datsun": 17,
    "Jaguar": 18,
    "Volvo": 19,
    "Chevrolet": 20,
    "Skoda": 21,
    "Mini": 22,
    "Fiat": 23,
    "Jeep": 24,
    "Ambassador": 25,
    "Isuzu": 26,
    "Force": 27,
    "Bentley": 28,
    "Lamborghini": 29
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _carDetails['Name'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter car name';
                  }
                  return null;
                },
                onSaved: (value) => _handleChange('Name', value ?? ''),
              ),
              TextFormField(
                initialValue: _carDetails['Year'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter year';
                  }
                  return null;
                },
                onSaved: (value) => _handleChange('Year', value ?? ''),
              ),
              TextFormField(
                initialValue: _carDetails['Kilometers_Driven'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter kilometers driven';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _handleChange('Kilometers_Driven', value ?? ''),
              ),
              DropdownButtonFormField<String>(
                value: _carDetails['Fuel_Type'],
                onChanged: (value) => _handleChange('Fuel_Type', value ?? ''),
                items: [
                  'Petrol',
                  'Diesel',
                  'CNG',
                  'LPG',
                ].map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select fuel type';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _carDetails['Transmission'],
                onChanged: (value) =>
                    _handleChange('Transmission', value ?? ''),
                items: [
                  'Manual',
                  'Automatic',
                ].map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select transmission';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _carDetails['Owner_Type'],
                onChanged: (value) => _handleChange('Owner_Type', value ?? ''),
                items: [
                  'First',
                  'Second',
                  'Third',
                  'Fourth & Above',
                ].map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select owner type';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _carDetails['Mileage'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mileage';
                  }
                  return null;
                },
                onSaved: (value) => _handleChange('Mileage', value ?? ''),
              ),
              TextFormField(
                initialValue: _carDetails['Engine'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter engine';
                  }
                  return null;
                },
                onSaved: (value) => _handleChange('Engine', value ?? ''),
              ),
              TextFormField(
                initialValue: _carDetails['Power'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter power';
                  }
                  return null;
                },
                onSaved: (value) => _handleChange('Power', value ?? ''),
              ),
              TextFormField(
                initialValue: _carDetails['Seats'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seats';
                  }
                  return null;
                },
                onSaved: (value) => _handleChange('Seats', value ?? ''),
              ),
              if (_predictedPrice != null)
                Text('Predicted Price: $_predictedPrice'),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Predict Price'),
              ),
              ElevatedButton(
                onPressed: _handleSell,
                child: Text('Sell Car'),
              ),
              if (_error != null) Text('Error: $_error'),
              if (_isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
