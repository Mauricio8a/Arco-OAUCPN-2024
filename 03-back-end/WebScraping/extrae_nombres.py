import requests
from bs4 import BeautifulSoup
import json

def extraer_nombres(identificacion):
    try:
        #Validación básica del número de cédula
        if len(identificacion) < 5 or len(identificacion) > 13:
            raise ValueError("Número de identifación no válido!")
        
        if len(identificacion) == 10:
            url = f"https://consultaweb.ant.gob.ec/PortalWEB/paginas/clientes/clp_grid_citaciones.jsp?ps_tipo_identificacion=CED&ps_identificacion={identificacion}&ps_placa="
        
        if len(identificacion) < 10 and len(identificacion) > 5:
            url = f"https://consultaweb.ant.gob.ec/PortalWEB/paginas/clientes/clp_grid_citaciones.jsp?ps_tipo_identificacion=PAS&ps_identificacion={identificacion}&ps_placa="
        
        if len(identificacion) == 13:
            url = f"https://consultaweb.ant.gob.ec/PortalWEB/paginas/clientes/clp_grid_citaciones.jsp?ps_tipo_identificacion=RUC&ps_identificacion={identificacion}&ps_placa="
        
        resultado = requests.get(url)
        soup = BeautifulSoup(resultado.content, 'html.parser')
            
        # Encontrar todos los elementos con una clase específica (por ejemplo, 'titulo')
        titulos = soup.find('td', class_='titulo1')
        
        # Crear una lista de diccionarios para almacenar los datos
        datos = []
        for titulo in titulos: #zip(titulos):
            datos.append({
                'nombres': titulo.text.strip()
                            })

        # Guardar los datos en un archivo JSON
        with open('datos.json', 'w') as archivo_json:
            json.dump(datos, archivo_json, indent=4)

                
        # Iterar sobre los títulos y extraer el texto
        for titulo in titulos:
            print(titulo.text)

    except requests.exceptions.RequestException as e:
        print(f"Error al realizar la solicitud: {e}")
    except ValueError as e:
        print(e)
        
# Solicitar la cédula al usuario
identificacion = input("Ingrese el número de identificación: (RUC, Cédula o Pasaporte): ")

# Llamar a la función para extraer los datos
extraer_nombres(identificacion)