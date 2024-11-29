# CatBreeds

Este proyecto fue desarrollado como una prueba técnica para la posición de Desarrollador Flutter en la empresa Pragma. El objetivo del proyecto es mostrar razas de gatos consultadas a través de una API, permitiendo filtrar por el nombre de las razas y visualizar sus detalles. La idea principal fue implementar los estilos de diseño nativos de cada plataforma (Material y Cupertino).

# Decisiones del Proyecto
Aunque el alcance del proyecto es sencillo, se tomaron algunas decisiones pensando en un proyecto más robusto y escalable.

## Arquitectura:
La arquitectura está basada en los principios de Clean Architecture, dividiendo el código en tres capas principales:
Domain: Donde se encuentran las reglas de negocio y los casos de uso.
Data: Responsable del acceso a los datos (API o fuentes externas).
Presentation: Encargada de la interfaz de usuario y la gestión del estado.
Gestión de Estado:

## Bloc:
Se utilizó BloC (Business Logic Component) para demostrar experiencia en el uso de este patrón. BloC permite una separación clara entre la lógica de negocio y la interfaz de usuario.
Inyección de Dependencias:

## GetIt:
Se implementó GetIt, un paquete ligero y eficiente para la inyección de dependencias, facilitando la gestión de las clases y sus instancias.
Gestión de Rutas:

## Routes:
No se utilizó ningún paquete de gestión de rutas, ya que la aplicación tiene solo 3 páginas principales:
Splash Screen
Página principal (Home)
Detalles de las razas
Requisiciones HTTP:

## Dio:
Para realizar las solicitudes a la API, se utilizó el paquete Dio.
Se implementó un Interceptor para inyectar automáticamente el token de autenticación en las solicitudes.
Solo se implementó el método GET, ya que era suficiente para cumplir los requisitos del proyecto.
Operador de Igualdad:

## Equatable:
Se utilizó el paquete Equatable para sobrescribir fácilmente el operador de igualdad del lenguaje Dart, asegurando el correcto funcionamiento del BloC al comparar estados.
Gestión de Variables de Entorno:

## Env:
Para trabajar con la API Key, se utilizó el paquete Envied, ya que ofrece una capa de ofuscación, dificultando el acceso no autorizado a la clave.
En el archivo .env.example se incluyen las instrucciones necesarias para configurar la API Key correctamente.

## Pruebas Unitarias:
Se utilizaron los paquetes Mocktail y BlocTest para garantizar la calidad del código y probar la lógica de negocio, así como los casos de uso y el BloC.

# Pasos para Configurar

### Clonar el repositorio.

### Crear un archivo .env en la raíz del proyecto y configurar la API Key siguiendo el ejemplo en .env.example.
Instalar las dependencias ejecutando:
bash
Copiar código
flutter pub get
Generar el archivo de entorno ejecutando:
bash
Copiar código
flutter pub run build_runner build
Ejecutar la aplicación:
bash
Copiar código
flutter run
Si tienes alguna duda o sugerencia sobre el proyecto, no dudes en contactarme. 🚀