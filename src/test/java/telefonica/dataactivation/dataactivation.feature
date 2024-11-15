Feature: Pruebas osb-extractdataactivarion

Background: Variables
    * url apiurlTest
    * configure ssl = { trustAll: true }
    * configure connectTimeout = 60000
    * configure readTimeout = 60000

Scenario: Prueba Exitosa cambio de SimCard Movil
    * path '/feature/activate'
    And header Content-Type = 'application/json'
    And request 
    """
    {
    "ExtraDataActivationBS": {
        "Header": {
            "country": "VE",
            "lang": "ES",
            "entity": "TMVE",
            "system": "76",
            "subsystem": "APPMM",
            "origin": "VE:TMVE:76:APP",
            "userId": "142606425",
            "operation": "ExtradataActivation",
            "destiny": "VE:TMVE:93:RSB",
            "timestamp": "2018-09-04T10:23:23.233-04:00",
            "msgType": "REQUEST"
        },
        "Body": {
            "extraDataActivationRequest": {
                "subscriberId": "143335615",
                "idPaidPlatformCustomer": "1",
                "idFeaturePlan": "4010",
                "idTypeNationalIdentityCardIdentification": "1",
                "cardNrNationalIdentityCardIdentification": "23107240",
                "pinPartyAccount": "380593508"
            }
        }
    }
    }
    """
    When method Post
    And status 200
    * print response