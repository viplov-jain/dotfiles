import argparse
import json

import requests


def get_request(stock):
    return requests.get(
        f"https://query1.finance.yahoo.com/v8/finance/chart/{stock}",
        params={"metrics": "high", "interval": "1h", "range": "1d"},
        headers={"User-agent": "Mozilla/5.0"},
    )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("stock", type=str)
    args = parser.parse_args()
    data = get_request(args.stock).json()["chart"]["result"][0]
    data = data["meta"]
    value = data["regularMarketPrice"]
    prev_value = data["chartPreviousClose"]
    did_increase = value > prev_value
    print(
        json.dumps(
            {
                "symbol": data["symbol"],
                "name": data["shortName"],
                "value": value,
                "did_increase": did_increase,
                "change": f"{value - prev_value:+.2f}",
            }
        )
    )
    # print(data['chart']['result'][0]['meta']['regularMarketPrice'])


if __name__ == "__main__":
    main()
