import requests
import json

url = "https://hapim.app.cloud.cbh.kth.se/fhir"

# Construct the request body
data = {
    "resourceType": "Patient",
    "active": True,
    "name": [
        {
            "use": "official",
            "family": "Deng",
            "given": ["Yufeng"],
            "prefix": ["Dr"]
        }
    ],
    "telecom": [
        {
            "system": "phone",
            "value": "734765881"

        },
        {
            "system": "email",
            "value": "yufengd@kth.se"
        }
    ],
    "gender": "male",
    "birthDate": "2023-01-10",
    "address": [
        {
            "city": "Shenzhen",
            "country": "China"
        }
    ]
}

# 发送 POST 请求
headers = {
    "accept": "application/fhir+json",
    "Content-Type": "application/fhir+json"
}

response = requests.post(f"{url}/Patient", headers=headers, data=json.dumps(data))

# 打印响应
print(f"Status Code: {response.status_code}")
print(f"Response: {response.json()}")