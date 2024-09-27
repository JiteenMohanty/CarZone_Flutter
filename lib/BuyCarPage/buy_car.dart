import 'package:flutter/material.dart';

class BuyCarPage extends StatefulWidget {
  const BuyCarPage({super.key});

  @override
  _BuyCarPageState createState() => _BuyCarPageState();
}

class _BuyCarPageState extends State<BuyCarPage> {
  final List<Car> _cars = [
    Car(
      id: 1,
      name: 'Hyundai Creta',
      year: 2022,
      kilometersDriven: 25000,
      fuelType: 'Petrol',
      transmission: 'Automatic',
      ownerType: 'First',
      mileage: 16.8,
      engine: 1497,
      power: 113.42,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/ff/Hyundai_ix25_in_China.jpg',
      price: 1500000,
    ),
    Car(
      id: 2,
      name: 'Maruti Suzuki Swift',
      year: 2020,
      kilometersDriven: 40000,
      fuelType: 'Petrol',
      transmission: 'Manual',
      ownerType: 'Second',
      mileage: 21.21,
      engine: 1197,
      power: 81.80,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/2018_Suzuki_Swift_SZ5_Boosterjet_SHVS_1.0_Front.jpg/1200px-2018_Suzuki_Swift_SZ5_Boosterjet_SHVS_1.0_Front.jpg?20181202192251',
      price: 700000,
    ),
    Car(
      id: 3,
      name: 'Tata Nexon',
      year: 2021,
      kilometersDriven: 30000,
      fuelType: 'Diesel',
      transmission: 'Manual',
      ownerType: 'First',
      mileage: 22.4,
      engine: 1497,
      power: 108.5,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Tata_Nexon_2023_Facelift.jpg/1200px-Tata_Nexon_2023_Facelift.jpg?20230915092931',
      price: 1050000,
    ),
    Car(
      id: 4,
      name: 'Mahindra Thar',
      year: 2023,
      kilometersDriven: 10000,
      fuelType: 'Diesel',
      transmission: 'Manual',
      ownerType: 'First',
      mileage: 15.2,
      engine: 1997,
      power: 150,
      seats: 4,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Mahindra_Thar_SUV_in_%22Red_Rage%22_color_at_Ashiana_Brahmanda%2C_East_Singbhum_India_%28Ank_Kumar%2C_Infosys_limited%29_02.jpg/800px-Mahindra_Thar_SUV_in_%22Red_Rage%22_color_at_Ashiana_Brahmanda%2C_East_Singbhum_India_%28Ank_Kumar%2C_Infosys_limited%29_02.jpg?20230221060224',
      price: 1600000,
    ),
    Car(
      id: 5,
      name: 'Kia Seltos',
      year: 2020,
      kilometersDriven: 35000,
      fuelType: 'Petrol',
      transmission: 'Automatic',
      ownerType: 'First',
      mileage: 16.5,
      engine: 1497,
      power: 113.4,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Kia_Seltos_IMG_9465.jpg/1200px-Kia_Seltos_IMG_9465.jpg?20240609134522',
      price: 1350000,
    ),
    Car(
      id: 6,
      name: 'Toyota Innova Crysta',
      year: 2018,
      kilometersDriven: 60000,
      fuelType: 'Diesel',
      transmission: 'Manual',
      ownerType: 'Second',
      mileage: 13.68,
      engine: 2393,
      power: 147.8,
      seats: 7,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Toyota_Innova_Crysta_2.4_Z_front_right.jpg/1200px-Toyota_Innova_Crysta_2.4_Z_front _right.jpg?20170507082426',
      price: 1800000,
    ),
    Car(
      id: 7,
      name: 'Honda City',
      year: 2019,
      kilometersDriven: 50000,
      fuelType: 'Petrol',
      transmission: 'Manual',
      ownerType: 'First',
      mileage: 17.8,
      engine: 1498,
      power: 117.6,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Honda_City_2020.jpg/1200px-Honda_City_2020.jpg?20191213171332',
      price: 1100000,
    ),
    Car(
      id: 8,
      name: 'Ford EcoSport',
      year: 2017,
      kilometersDriven: 70000,
      fuelType: 'Petrol',
      transmission: 'Manual',
      ownerType: 'Third',
      mileage: 17,
      engine: 1498,
      power: 121.36,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/2021_Ford_EcoSport_ST-Line_EcoBoost_-_998cc_1.0_%28125PS%29_Petrol_-_Desert_Island_Blue_-_02-2024%2C_Front.jpg/1200px-2021_Ford_EcoSport_ST-Line_EcoBoost_-_998cc_1.0_%28125PS%29_Petrol_-_Desert_Island_Blue_-_02-2024%2C_Front.jpg?20240218175839',
      price: 850000,
    ),
    Car(
      id: 9,
      name: 'Volkswagen Polo',
      year: 2021,
      kilometersDriven: 20000,
      fuelType: 'Petrol',
      transmission: 'Automatic',
      ownerType: 'First',
      mileage: 18.24,
      engine: 999,
      power: 108.62,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/2018_Volkswagen_Polo_SE_TSi_1.0_Front.jpg/1199px-2018_Volkswagen_Polo_SE_TSi_1.0_Front.jpg?20181104033336',
      price: 1000000,
    ),
    Car(
      id: 10,
      name: 'Renault Kwid',
      year: 2016,
      kilometersDriven: 80000,
      fuelType: 'Petrol',
      transmission: 'Manual',
      ownerType: 'Second',
      mileage: 25.17,
      engine: 799,
      power: 53.29,
      seats: 5,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Renault_Kwid_2017_in_Montevideo_%28front%29.jpg/1200px-Renault_Kwid_2017_in_Montevideo_%28front%29.jpg?20210312081221',
      price: 400000,
    ),
  ];

  List<Car> _filteredCars = [];
  final Map<String, dynamic> _filters = {
    'minPrice': '',
    'maxPrice': '',
    'brand': '',
    'model': '',
    'year': '',
    'fuelType': '',
    'bodyType': '',
    'transmission': '',
  };

  final List<String> _popularBrands = [
    'Maruti Suzuki',
    'Hyundai',
    'Tata',
    'Mahindra',
    'Kia',
    'Toyota',
  ];

  final List<String> _allBrands = [
    'Honda',
    'Ford',
    'Volkswagen',
    'Skoda',
    'Nissan',
    'Renault',
  ];

  bool _showMoreBrands = false;

  @override
  void initState() {
    super.initState();
    _filteredCars = _cars;
  }

  void _handleFilterChange(String name, dynamic value) {
    setState(() {
      _filters[name] = value;
      _filteredCars = _cars.where((car) {
        // Price filter
        if (_filters['minPrice'] != '' &&
            car.price < int.parse(_filters['minPrice'])) return false;
        if (_filters['maxPrice'] != '' &&
            car.price > int.parse(_filters['maxPrice'])) return false;

        // Brand filter
        if (_filters['brand'] != '' &&
            !car.name.toLowerCase().contains(_filters['brand'].toLowerCase()))
          return false;

        // Model filter (you'll need to implement this based on your car data structure)
        // ... (add more filtering conditions for other filters: year, fuelType, etc.)

        return true;
      }).toList();
    });
  }

  void _handleBrandChange(String brand) {
    setState(() {
      _filters['brand'] = _filters['brand'] == brand ? '' : brand;
    });
  }

  void _toggleShowMoreBrands() {
    setState(() {
      _showMoreBrands = !_showMoreBrands;
    });
  }

  void _handlePurchase(Car car) {
    // Navigate to purchase page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Car Page'),
      ),
      body: Column(
        children: [
          // Filters section
          // Car list
          _filteredCars.isEmpty
              ? Center(child: Text('No cars match your filters.'))
              : ListView.builder(
                  itemCount: _filteredCars.length,
                  itemBuilder: (context, index) {
                    return CarCard(
                      car: _filteredCars[index],
                      onPurchase: () => _handlePurchase(_filteredCars[index]),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class Car {
  final int id;
  final String name;
  final int year;
  final int kilometersDriven;
  final String fuelType;
  final String transmission;
  final String ownerType;
  final double mileage;
  final int engine;
  final double power;
  final int seats;
  final String imageUrl;
  final int price;

  Car({
    required this.id,
    required this.name,
    required this.year,
    required this.kilometersDriven,
    required this.fuelType,
    required this.transmission,
    required this.ownerType,
    required this.mileage,
    required this.engine,
    required this.power,
    required this.seats,
    required this.imageUrl,
    required this.price,
  });
}

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onPurchase;

  CarCard({required this.car, required this.onPurchase});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(car.name),
          Image.network(car.imageUrl),
          Text('Year: ${car.year}'),
          Text('Kilometers Driven: ${car.kilometersDriven}'),
          Text('Fuel Type: ${car.fuelType}'),
          Text('Transmission: ${car.transmission}'),
          Text('Owner Type: ${car.ownerType}'),
          Text('Mileage: ${car.mileage}'),
          Text('Engine: ${car.engine}'),
          Text('Power: ${car.power}'),
          Text('Seats: ${car.seats}'),
          Text('Price: ${car.price}'),
          ElevatedButton(
            onPressed: onPurchase,
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}
