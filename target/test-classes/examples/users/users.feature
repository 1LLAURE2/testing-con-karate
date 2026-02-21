@regresion
Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url apiPetStore
    * def jsonCrearMascota = read('classpath:examples/jsonData/crearMascota.json')
    * def jsonUpdateMascota = read('classpath:examples/jsonData/updateMascota.json')

  @TEST-1
  Scenario: Verificar la creacion de una nueva mascota en Pet Store - Ok
    Given path 'pet'
    And request jsonCrearMascota
    When method post
    Then status 200
    And print response

    # When method get
    # Then status 200
    # And match response contains user
  @TEST-2
  Scenario: Subir imagen a Pet - Ok
    * def petId = 4
    Given path 'pet',petId,'uploadImage'
    And multipart file file = { read: 'classpath:examples/imagenes/assssssssssss.jpg', filename: 'assssssssssss.jpg', contentType: 'image/jpeg' }
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
    Given path 'pet'
    And request jsonUpdateMascota.id='3'
    And request jsonUpdateMascota.name='kills'
    And request jsonUpdateMascota
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
