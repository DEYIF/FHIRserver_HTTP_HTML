import requests
import json

url = "https://hapim.app.cloud.cbh.kth.se/fhir"

# Construct the request body
data = {
    "resourceType": "Observation",
    "meta" : {
    "profile" : ["http://hl7.org/fhir/StructureDefinition/vitalsigns"]
    },
    "text" : {
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Observation</b><a name=\"heart-rate\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Observation &quot;heart-rate&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"vitalsigns.html\">Vital Signs Profile</a></p></div><p><b>status</b>: final</p><p><b>category</b>: Vital Signs <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.1.0/CodeSystem-observation-category.html\">Observation Category Codes</a>#vital-signs)</span></p><p><b>code</b>: Heart rate <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"https://loinc.org/\">LOINC</a>#8867-4)</span></p><p><b>subject</b>: <a href=\"patient-example.html\">Patient/example</a> &quot;Peter CHALMERS&quot;</p><p><b>effective</b>: 1999-07-02</p><p><b>value</b>: 44 beats/minute<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM code /min = '/min')</span></p></div>"
    },
    "status" : "final",
    "code" : {
        "coding" : [{
        "system" : "http://loinc.org",
        "code" : "8867-4",
        "display" : "Heart rate"
        }],
        "text" : "Heart rate"
    },
    "subject" : {
        "reference" : "Patient/229"
    },
    "effectiveInstant": "2024-09-25T00:00:00Z",
    "valueQuantity" : {
        "value" : 44,
        "unit" : "beats/minute",
        "system" : "http://unitsofmeasure.org",
        "code" : "/min"
    },
    "method": {
        "coding": [
            {
                "system": "http://loinc.org",
                "code": "8867-4",
                "display": "Pulse Oximetry"
            }
        ]
    }
    
}

# 发送 POST 请求
headers = {
    "accept": "application/fhir+json",
    "Content-Type": "application/fhir+json"
}

response = requests.post(f"{url}/Observation", headers=headers, data=json.dumps(data))

# 打印响应
print(f"Status Code: {response.status_code}")
print(f"Response: {response.json()}")