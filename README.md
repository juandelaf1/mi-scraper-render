No problem\! Here's your `README.md` in Markdown format, ready for GitHub:

-----

# Web Scraper API (FastAPI + Selenium + Gemini)

-----

## 🚀 Concepto

Este proyecto es una **API web rápida** (FastAPI) diseñada para **extraer automáticamente información de productos de cualquier página web**. Combina la potencia de **Selenium** para navegar e interactuar con sitios dinámicos, y la inteligencia de **Google Gemini** para identificar y estructurar los datos de los productos (nombre, URL, precio, imagen) de forma precisa.

-----

## ✨ Características Principales

  * **Scraping Inteligente:** Utiliza IA para extraer detalles clave de productos.
  * **Manejo de Sitios Dinámicos:** Navega y gestiona interacciones como banners de cookies con Selenium.
  * **Contenerización:** Incluye un Dockerfile para un despliegue sencillo y consistente.
  * **Salida Estructurada:** Entrega los datos en formato JSON limpio y fácil de usar.

-----

## 🛠️ Cómo Funciona

1.  **Envías una URL** a la API.
2.  **Selenium** visita la página, espera que cargue y gestiona pop-ups de cookies.
3.  El **HTML** de la página se limpia y se fragmenta.
4.  **Google Gemini** analiza los fragmentos y extrae la información relevante de los productos.
5.  La API devuelve una lista de productos en formato **JSON**.

-----

## ⚙️ Instalación y Uso (Docker)

1.  **Clona el repositorio.**
2.  **Crea un archivo `.env`** en la raíz del proyecto con tu clave API de Google:
    ```
    api_key=TU_CLAVE_API
    ```
3.  **Construye la imagen Docker:**
    ```bash
    docker build -t scraper-api .
    ```
4.  **Ejecuta el contenedor:**
    ```bash
    docker run -p 10000:10000 scraper-api
    ```
    La API estará disponible en `http://localhost:10000`.

-----

## 🔗 Endpoint Principal

  * **POST `/scrapear`**
      * **Cuerpo (JSON):**
        ```json
        {
          "url": "https://url-de-tu-tienda.com"
        }
        ```
      * **Respuesta:** Un array JSON con los productos encontrados.

-----
