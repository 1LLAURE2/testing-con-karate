@regresion
Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://petstore.swagger.io/v2/'

  @TEST-1
  Scenario: Verificar la creacion de una nueva mascota en Pet Store - Ok
    * def petCreation =
      """
      {
        "id": 0,
        "category": {
          "id": 0,
          "name": "string"
        },
        "name": "doggie",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "available"
      }
      """

    Given path 'pet'
    And request petCreation
    When method post
    Then status 200

    # When method get
    # Then status 200
    # And match response contains user
  @TEST-2
  Scenario: Subir imagen a Pet - Ok
    * def petId = 4
    Given path 'pet',petId,'uploadImage'
    And multipart file file = { read: 'assssssssssss.jpg', filename: 'assssssssssss.jpg', contentType: 'image/jpeg' }
    And multipart field additionalMetadata = 'Foto de prueba'
    When method post
    Then status 200

  @TEST-3
  Scenario Outline: Buscar estado de mascota por los 3 estado que son available, pending y sold
    Given path 'pet/findByStatus'
    And param status = '<estado>'
    When method get
    Then status 200

    Examples:
    | estado    |
    | available |
    | pending   |
    | sold      |


  @TEST-4
    Scenario: Actualizar mascota
    * def updatePet =
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    Given path 'pet'
    And request updatePet
    When method put
    Then status 200
    And print response
    # And match response.id == 9223372036854775807
    # And match response.name == 'doggie'
    # And match response.status == 'available'

  @TEST-05
    Scenario: Buscar mascota por Id
    * def buscarPet =
    """
    {
      "id":83635053
    }
    """
    Given path 'pet/1'
    And request buscarPet
    When method get
    Then status 200

  @TEST-06
    Scenario Outline: Verificar mascota por id - OK
    Given path 'pet/' + '<idPet>'
    When method get
    Then status 404
    And print response

    Examples:
    |idPet|
    |1    |
    |2    |
    |3    |
