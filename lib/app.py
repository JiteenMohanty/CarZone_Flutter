import pickle
from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np

app = Flask(__name__)
CORS(app)

model = pickle.load(open('final.pkl', 'rb'))

expected_features = [
    'Year', 'Kilometers_Driven', 'Fuel_Type', 'Transmission', 'Owner_Type',
    'Seats', 'Company', 'Mileage', 'Engine', 'Power' 
]

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()

        if not data:
            return jsonify({'error': 'No data provided'}), 400
        
        app.logger.info(f"Received data: {data}")

        for field in expected_features:
            if field not in data:
                return jsonify({'error': f'Missing field: {field}'}), 400

            if not data[field] or (field != 'Company' and not isinstance(data[field], (int, float))):
                return jsonify({'error': f'Invalid or empty value for field: {field}'}), 400

        input_data = np.array([[data[field] for field in expected_features]])

        app.logger.info(f"Input data array: {input_data}")

        prediction = model.predict(input_data)[0]

        return jsonify({'price': prediction})

    except ValueError as e:
        app.logger.error(f"ValueError: {e}")
        return jsonify({'error': 'Invalid data types in input. Please check your input values.'}), 400

    except KeyError as e:
        app.logger.error(f"KeyError: {e}")
        return jsonify({'error': f'Missing field in input data: {e}'}), 400
    
    except Exception as e:
        app.logger.error(f"An error occurred: {e}")
        return jsonify({'error': 'An error occurred while processing your request'}), 500

if __name__ == '__main__':
    app.run(debug=True)
