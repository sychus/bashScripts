#!/bin/bash
cd /tmp || exit
echo "Descargando robomongo ..."
# Faltaría una función que me busque la última versión
wget -q https://download.studio3t.com/robomongo/linux/robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
tar -xzf robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
rm robo3t-1.3.1-linux-x86_64-7419c406.tar.gz

echo "Instalando..."
if [ -d "/opt/RoboMongo" ];then
    sudo rm -rf /opt/RoboMongo
fi
sudo mv robo3t-1.3.1-linux-x86_64-7419c406 /opt/RoboMongo

echo "Creando el link simbólico ..."
if [ -L "/usr/bin/robomongo" ];then
    sudo rm -f /usr/bin/robomongo
fi
sudo ln -s /opt/RoboMongo/bin/robo3t /usr/bin/robomongo

echo "Instalación completa ;-O"

echo "Bajando el logo...."
cd /opt/RoboMongo
wget -q https://robomongo.org/static/robomongo-128x128-129df2f1.png

echo "Creando una entrada en el escritorio...."

cat > ~/.local/share/applications/robomongo.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Robo 3T
Exec=/opt/RoboMongo/bin/robo3t
Icon=/opt/RoboMongo/robomongo-128x128-129df2f1.png
Terminal=false
Type=Application
Categories=Development;IDE
StartupNotify=true
EOL

echo "Listo... ya deberías poder ver a robomongo en menú categorizado como desarrollo"
