#!/bin/bash

echo ".:Menu Prinvipal:."
echo "1. Crear usuarios"
echo "2. Modificar usuarios"
echo "3. Eliminar usuarios"
echo "4. Subir ficheros"
echo "5. Crear directorios"
echo "6. Listar procesos"
echo "7. Detener procesos"
echo "8. Listar archivos y directorios"
echo "9. Enviar y recibir archivos compresos"
echo "10. Enviar y recibir mensajes cifrados"
echo "11. Leer mensajes recibidos"
echo "12. Salir"

echo "Seleccione una opcion: "
read opcion

while [ $opcion -ne 12 ]
do
    
    if [ $opcion -eq 1 ];
    then
        clear
        echo "Digite el nombre del usuario a crear: "
        read usuario
        echo "Digite la contraseña del usuario: "
         read pass
       sudo adduser $usuario
       sudo $pass $usuario
    fi

    if [ $opcion -eq 2 ];
    then
        clear
        echo "Digite la nueva contraseña del usuario actual: "
        read pass
        sudo usermod -p $pass
    fi
 

    if [ $opcion -eq 3 ];
    then
    clear
    echo "Digite el usuario a eliminar: "
     read usuario
     sudo userdel -r $usuario
    fi


    if [ $opcion -eq 4 ];
    then
         clear
         echo "Digite la ruta donde se encuentra el fichero a copiar: "
         read origen
         echo "Digite la ruta donde deseas copiar el fichero: "
         read destino

     sudo cp $origen $destino
    fi

    if [ $opcion -eq 5 ];
    then
          clear
         echo "Digite la ruta donde deseas crear el directorio: "
         read ruta
         echo "Digite el nombre del directorio a crear: "
         read nombredir
         sudo mkdir $ruta+$nombredir
    fi

    if [ $opcion -eq 6 ];
    then
          clear
          sudo ps -aux

    fi

    if [ $opcion -eq 7 ];
    then

        clear
        echo "Digite el identificador del proceso a detenet: "
        read pid
        sudo kill $pid

    fi

    if [ $opcion -eq 8 ];
    then
  
        clear
        echo "Digite la ruta del directorio que desea listar su contenido: "
        read ruta
        sudo $ruta -alh

    fi

    if [ $opcion -eq 9 ];
    then

      clear
      echo "Digite la ruta del fichero a comprimir: "
      read rorigen
      echo "Digite la ruta donde se trans firira el archivo compreso: "
      read rdestino
      sudo zip -r $ruta
      sudo cp $torigen $rdestino

    fi
             
    if [ $opcion -eq 10 ];
    then
      clear
      read -p "Enter your email : " sender
      read -p "Enter recipient email : " reciever
      read -p "Enter your Google App password : " gapp
      read -p "Enter the subject of mail : " sub
      echo "Enter the body of mail : "
      cat > tempfile.txt                # using cat command for multiline input
      body=$(cat tempfile.txt)          # storing the content of file in a variable

      rm tempfile.txt


      # check for provided attachment file as a positional parameter
      # -z indicating an empy positional parameter
      # attachment doesn't exist condtion
  

if [ -z "$1" ]; then 


# curl command for accessing the smtp server

    curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
    --mail-from $sender \
    --mail-rcpt $reciever\
    --user $sender:$gapp \
     -T <(echo -e "From: ${sender}
To: ${reciever}
Subject:${sub}

 ${body}")


# attachment exists condition
else

    file="$1"           # set file as the 1st positional parameter
    
    # MIME type for multiple type of input file extensions
    
    MIMEType=`file --mime-type "$file" | sed 's/.*: //'`
    curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
    --mail-from $sender \
    --mail-rcpt $reciever\
    --user $sender:$gapp \
     -H "Subject: $sub" -H "From: $sender" -H "To: $reciever" -F \
    '=(;type=multipart/mixed' -F "=$body;type=text/plain" -F \
      "file=@$file;type=$MIMEType;encoder=base64" -F '=)'
fi
    fi
 

    if [ $opcion -eq 11 ];
    then

         clear
         echo "Solo necesitas acceder a la bandeja de entrada de tu cliente de correo para vidualizar tus mails"
    fi

    if [ $opcion -eq 12 ];
    then
         clear
         echo "Pulsa cualquier tecla para salir"

    fi

done
