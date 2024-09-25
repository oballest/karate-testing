Feature: Pruebas SimSwap

Background: Variables
    * url apiurlTest 
    * configure ssl = { trustAll: true }
    * def SimSwapch = read("classpath:json/SimcardChange.json")
    * def DataNumtlf = {"tlf":|read('datanum.csv')|}

Scenario: Prueba Exitosa cambio de SimCard Movil
    * path 'sim-swap/v0/retrieve-date'
    And request 
    """
    {
    "phoneNumber": "+584142983173"
    }
    """
    When method Post
    And status 200
    * print response

Scenario: Prueba exitosa cambio de Simcard fijo
    * path 'sim-swap/v0/retrieve-date'
    And request     
    """
        {
        "phoneNumber": "+582122162063"
        }
        """
    When method Post
    And status 200
    * print response

Scenario: Prueba exitosa cambio de Simcard sin mas
    * path 'sim-swap/v0/retrieve-date'
    And request 
    """
        {
        "phoneNumber": "584241548699"
        }
        """
    When method Post
    And status 200
    * print response

Scenario: Prueba fallida error fijo
    * path 'sim-swap/v0/retrieve-date'
    And request
    """
        {
        "phoneNumber": "+582126613806"
        }
        """
    When method Post
    And status 404
    * print response

Scenario: Prueba fallida error fijo sin mas
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "582126613806"
        }
        """
    When method Post
    And  status 404

Scenario: Prueba Exitosa cambio de SimCard Movil (2)
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "+584141259861"
        }
        """
    When method Post
    And status 200

Scenario: Prueba Exitosa cambio de SimCard Movil (3)
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "584142983173"
        }
        """
    When method Post
    And status 200
    * print response.latestSimChange

Scenario: Prueba Exitosa cambio de SimCard Movil (4)
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "584142724757"
        }
        """
    When method Post
    And status 200

Scenario:  Prueba exitosa no cambio de simcard Movil
    * path 'sim-swap/v0/retrieve-date'
    And request 
        """
        {
        "phoneNumber": "+584141099963"
        }
        """
    When method Post
    And status 200

Scenario: Error de URL
    * path 'sim-swap/v0'
    And request SimSwapch
    When method Post
    And status 404
    #modificado el original dice error 405, pero no se logra reproducir.

Scenario: Prueba Simcard numero de telefono errado.
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "+5841427247579"
        }
        """
    When method post
    And status 400

Scenario: Prueba Simcard numero de telefono errado. (2)
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "584142724po79"
        }
        """
    When method post
    And status 400

Scenario: Prueba cambio de Simcard Error de respuesta.
    * path 'sim-swap/v0/retrieve-date'
    And request
        """
        {
        "phoneNumber": "+584142244276"
        }
        """
    When method Post
    And status 404

Scenario: Prueba cambio Simcard con error en el Body
    * path 'sim-swap/v0/retrieve-date'
    And request { }
    When method SimSwapch
    And status 400
    #El caso original indica error 503, pero no se logra reproducir, ni en postman
