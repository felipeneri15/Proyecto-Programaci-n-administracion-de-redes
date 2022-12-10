DO
{
    clear-host
    Write-Host ".:Menu Principal:."
    Write-Host "1. Crear usuarios"
    Write-Host "2. Modificar usuarios"
    Write-Host "3. Eliminar usuarios"
    Write-Host "4. Subir ficheros"
    Write-Host "5. Crear directorios"
    Write-Host "6. Listar procesos"
    Write-Host "7. Detener procesos"
    Write-Host "8. Listar ficheros y directorios"
    Write-Host "9. Enviar y recibir archivos"
    Write-Host "10. Enviar y recibir mensajes"
    Write-Host "11. Visualizar mensajes"
    Write-Host "12. Salir"

    $x = Read-Host "Seleccione una opcion: "
    if($x -eq 1) {
        Clear-Host
        $nombre = Read-Host "Digite el nombre para el usuario: "
        $contra = Read-Host "Digite la contraseña para el nuevo usuario: "-AsSecureString
        New-LocalUser $nombre -Password $contra

    }

     if($x -eq 2) {
        Clear-Host
        $nombreviejo = Read-Host "Digite un nombre de usuario existente: "
        $nombrenuevo = Read-Host "Digite un nuevo nombre: "
         Rename-LocalUser $nombreviejo -NewName $nombrenuevo

    }

    if($x -eq 3) {
        Clear-Host
        $nombre = Read-Host "Digite el nombre del usuario a eliminar: "
        Remove-LocalUser $nombre -Confirm

    }

    if($x -eq 4) {
        Clear-Host
        $origen = Read-Host "Digite la ruta donde se encuentra el archivo a copiar: "
        $destino = Read-Host "Digite la ruta donde se copiara el archivo: "
        Copy-Item -Path $origen -Destination $destino

    }

    if($x -eq 5) {
    
        Clear-Host
        $ruta = Read-Host "Digite la ruta donde desea crear el directorio:"
        $nombredir = Read-Host "Digite el nombre del directorio a crear: "
        New-Item -ItemType Directory -Path $ruta+$nombredi  
    }
        
        

    if($x -eq 6){
        Clear-Host
        $equiporemoto = Read-Host "Digite el nombre de la computadora que desea listar procesos: "
     Get-Process -ComputeName $equiporemoto

    }

    if($x -eq 7) {
        Clear-Host
        $equiporemoto = Read-Host "Digite el nombre de la maquina a detener procesos: "
        Stop-Process ComputerName $equiporemoto

    }
 
    if($x -eq 8) {
        Clear-Host
        $recursocompartido = Read-Host "Digite el recurso compartido del cual listar procesos: "
        Get-ChildItem -Path $recursocompartido -Recurse

    }

    if($x -eq 9) {
        Clear-Host
        $fuente = Read-Host "Digite la ruta del directorio o del archivo a comprimir: "
        $destino = Read-Host "Digite la ruta donde se generara el archivo compreso: "
        Compress-Archive -Path $fuente -DestinationPath $destino -CompressionLevel Optimal

    }
    if($x -eq 10) {
        Clear-Host
        $desde = Read-Host "Digite la cuenta donde se enviara el correo: "
        $a = Read-Host "Digite la cuenta a donde se enviara el correo: "
        $motivo = Read-Host "Digite el motivo o la razon del correo: "
        $cuerpo = Read-Host "Digite el mensaje del correo:"
        $servidor = Read-Host "Digite el servidor smtp para enviar el correo: "
        $puertp= Read-Host "Digite el puerto del servidor del correo: "
        Send-MailMessage -From $desde -To $a -Subject $motivo -Body $motivo -SmtpServer $servidor -Port $puerto

    }

    if($x -eq 11) {
        Write-Host "Solo tienes que acceder a tu bandeja de entrada de tu cliente de correo para leer tus mails "

    }

    if ($x -ne 12) {
        Read-Host "Pulse una tecla para continuar "
    }

} while ($x -ne 12)