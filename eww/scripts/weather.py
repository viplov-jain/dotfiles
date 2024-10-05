import json, time

data = json.loads(input())


def get_data(condition):
    day = 'night' if condition['is_day'] == 0 else 'day'
    icon = condition['condition']['icon']
    icon = icon[icon.rfind('/') + 1:]
    return {
        'temp': condition['temp_c'],
        'condition': condition['condition']['text'],
        'icon': f'images/weather/64x64/{day}/{icon}',
        'time': condition.get('time_epoch')
    }

forecast_data = []
for d in data['forecast']['forecastday']:
    forecast_data += d['hour']

print(json.dumps({
    'location': data['location']['name'],
    'current': get_data(data['current']),
    'forecast': data['forecast']['forecastday'][0]['day'],
    'forecast_h': [get_data(h) for h in forecast_data if h['time_epoch'] > time.time()]
}))
