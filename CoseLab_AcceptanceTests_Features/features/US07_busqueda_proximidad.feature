Feature: Búsqueda y filtro por proximidad geográfica
  Como vecino consumidor
  Quiero filtrar excedentes agrícolas dentro de un radio de 2 km
  Para encontrar productos frescos cercanos y recogerlos sin traslados largos

  Scenario Outline: Visualización de huertos activos dentro del radio permitido
    Given que el vecino se encuentra en "<ubicacion_vecino>" con geolocalización activa
    When aplica el filtro de búsqueda por proximidad de "<radio_km>" km
    Then el sistema lista únicamente los lotes cuya distancia sea menor o igual a "<radio_km>" km
    And ordena los resultados desde el huerto más cercano ("<huerto_cercano>")
#Esto es un avance.-.
    Examples:
      | ubicacion_vecino        | radio_km | huerto_cercano           |
      | Av. Universitaria, S.M. | 2.0      | Biohuerto PUCP           |
      | Plaza San Miguel        | 1.5      | Huerto Vecinal La Mar    |
      | Jr. Camaná, Lima Centro | 2.0      | Biohuerto Municipal Lima |

  Scenario: Notificación cuando no existen excedentes en el radio cercano
    Given que el vecino tiene activa su ubicación en "San Miguel"
    And no existen lotes activos en un radio de 2 km
    When ejecuta la búsqueda de excedentes cercanos
    Then el sistema muestra el mensaje "No hay excedentes disponibles a menos de 2 km en este momento"
