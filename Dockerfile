# Usa una imagen base de Python oficial, que es un buen punto de partida
FROM python:3.9-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de requerimientos al contenedor
# Esto es más eficiente, ya que Docker cachea esta capa si los archivos no cambian
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos de tu proyecto al contenedor
COPY . .

# Expone el puerto en el que Gunicorn va a escuchar
EXPOSE 8000

# Define el comando para ejecutar Gunicorn cuando el contenedor se inicie
# Esto es lo mismo que el comando que ejecutaste manualmente antes
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:3050", "app:app"]