#!/bin/bash

# Actualizar el sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar Node.js si no está instalado
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Instalar Nginx si no está instalado
if ! command -v nginx &> /dev/null; then
    sudo apt-get install -y nginx
fi

# Crear directorio para la aplicación
sudo mkdir -p /var/www/pailen-main

# Copiar archivos de la aplicación
sudo cp -r dist/* /var/www/pailen-main/

# Copiar configuración de Nginx
sudo cp nginx.conf /etc/nginx/sites-available/pailen
sudo ln -s /etc/nginx/sites-available/pailen /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default  # Eliminar configuración por defecto

# Verificar configuración de Nginx
sudo nginx -t

# Reiniciar Nginx
sudo systemctl restart nginx

# Configurar firewall si es necesario
sudo ufw allow 80
sudo ufw allow 443  # Si vas a usar HTTPS

echo "Despliegue completado. La aplicación debería estar disponible en http://[IP_DE_LA_VM]" 