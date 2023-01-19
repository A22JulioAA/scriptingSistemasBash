#!/bin/bash
#Author: Julio Acuña
#-

#Limpar pantalla antes de empezar o programa
clear

#Declarar a variable de saída do programa
exit=0

echo "Hola Gerardo!"
sleep 1s

#Función para solicitar información de salida
function salir(){
    echo Para saír pulsa 0...
    read -r num
    
    if [ "$num" == 0 ]
    then
        clear
        sair1=$num
    fi
    clear
}

#Función para listar os elementos dun directorio seleccionado polo usuario partindo do directorio HOME
function mostrarFicheiros(){
    clear
    sair1=1
    
    while (( sair1 != 0 ))
    do
        
        ls  ld $HOME
        
        echo ---------------------------------------------------------------------------------------------------------------------------------
        
        echo Introduce a ruta que queiras listar:
        read -p "$HOME/" ruta
        clear
        if [ -d "$HOME"/"$ruta" ]
        then
            for ficheiro in "$HOME"/"$ruta"/*
            do
                echo "$ficheiro"
            done
        else
            echo Non existe o directorio seleccionado
        fi
        
        salir
    done
}

function comprobarFicheiro(){
    
    sair1=1
    
    clear
    
    while (( $sair1 != 0 ))
    do
        echo Introduce a ruta na que queiras buscar o arquivo:
        read -p "$HOME/" ruta
        read -p "Introduce o nome do ficheiro: " nomeFicheiro
        
        clear
        if [ -d "$HOME"/"$ruta" ]
        then
            if [ -e "$HOME"/"$ruta"/"$nomeFicheiro" ]
            then
                echo O ficheiro "$nomeFicheiro" existe na ruta "$HOME"/"$ruta"
            else
                echo O ficheiro "$nomeFicheiro" NON existe na ruta "$HOME"/"$ruta"
            fi
        else
            echo Non existe o directorio seleccionado
        fi
        salir
    done
}

#Función para ver información de sistema WINDOWS
function infoWindows(){
    
    sair1=1;
    
    clear
    
    while (( $sair1 != 0 ))
    do
        echo ----------------------------------------------------
        echo "|Sección en mantemento, desculpe as molestias :) <3|"
        echo ----------------------------------------------------
        echo A continuación se mostrará la información de sistema Windows:
        echo "1-Procesador"
        echo "2-Propiedad de..."
        echo "3-Id. Producto"
        echo "4-Fabricante"
        echo "5-Tipo de sistema"
        echo "6-Modelo"
        echo "7-Memoria Física(MB)"
        echo "8-Tarjetas de red"
        read -p "A qué elemento quiere acceder?" elemento
        
        case $elemento in
            1)
                
                systeminfo | FIND "Procesador(es)"
            ;;
            2)
                systeminfo | FIND "Propiedad de"
            ;;
            3)
                systeminfo | FIND "Id. del producto"
            ;;
            4)
                systeminfo | FIND "Fabricante del sistema operativo"
            ;;
            5)
                systeminfo | FIND "Tipo de sistema"
            ;;
            6)
                systeminfo | FIND "Modelo el sistema"
            ;;
            7)
                systeminfo | FIND "Cantidad total de memoria física"
            ;;
            8)
                systeminfo | FIND "Tarjeta(s) de red"
            ;;
        esac
        
        salir
        
    done
}

#Función para ver información de sistema LINUX
function infoLinux(){
    
    sair1=1;
    
    clear
    
    while (( $sair1 != 0 ))
    do
        echo A continuación se mostrará la información de sistema Linux:
        echo "1-Procesador"
        echo "2-Nombre del Sistema Operativo"
        echo "3-CPU(s)"
        echo "4-Fabricante"
        echo "5-Tipo de sistema"
        echo "6-Modelo"
        echo "7-Memoria Física(MB)"
        echo "8-Tarjetas de red"
        read -p "A qué elemento quiere acceder?" elemento
        
        case $elemento in
            1)
                lscpu | grep "Nombre del modelo"
            ;;
            2)
                lscpu | grep "Nombre del modelo"
            ;;
            3)
                lscpu | grep "CPU(s)"
            ;;
            4)
                lscpu | grep "ID de fabricante"
            ;;
            5)
                lscpu | grep "Arquitectura"
            ;;
            6)
                lscpu | grep "Modelo"
            ;;
            7)
                vmstat -s -S M
            ;;
            8)
                lspci
            ;;
        esac
        
        salir
        
    done
}

#Función para entrar nunha páxina web
function accederPaxina(){
    
    sair1=1;
    
    clear
    
    while (( $sair1 != 0 ))
    do
        
        read -p "Introduce a páxina á que queres acceder: " paxina
        
        read -p "Desexa entrar á páxina en incógnito?(s/n)" incognito
        
        if [ "$incognito" == "s" ]
        then
            Start chrome /incognito www."$paxina".es
        else
            Start chrome www."$paxina".es
        fi
        
        salir
    done
}

#Función calculadora para operar con 2 números
function calculadora(){
    
    sair1=1;
    
    clear
    
    while (( $sair1 != 0 ))
    do
        echo "Benvido á CALCULADORA"
        echo "-Suma(+)"
        echo "-Resta(-)"
        echo "-Multiplicación(*)"
        echo "-División(/)"
        read -p "Introduce a operación que queiras realizar:" opcion
        
        read -p "Introduce el primer número: " num1
        read -p "Introduce el segundo número: " num2
        
        case $opcion in
            "+")
                echo $(($num1+$num2))
                
            ;;
            "-")
                echo $(($num1-$num2))
                
            ;;
            "*")
                echo $(($num1*$num2))
                
            ;;
            "/")
                if [ "$num2" == 0 ]
                then
                    echo Non se pode dividir entre 0
                else
                    echo $(($num1/$num2))
                fi
            ;;
        esac
        salir
    done
}

#Función para crear arquivos de texto
function cambiarUsuario(){
    sair1=1
    
    clear
    
    while(( $sair1 != 0 ))
    do
        
        echo El nombre actual de usuario es "$USERNAME"
        read -p "Nuevo nombre: " nuevoNombre
        
        USERNAME=$nuevoNombre
        
        echo Nombre actualizado!
        echo ------------------------------
        echo Nuevo nombre: "$USERNAME"
        
        read -p "Quiere actualizar también la contraseña?(s/n)" passw
        
        if [ "$passw" == "s" ]
        then
            read -sp "Introduce la nueva contraseña: " con1
            echo
            read -sp "Vuelve a introducir la contraseña: " con2
            echo
            
            if [ "$con1" == "$con2" ]
            then
                echo ------------------------------
                echo Contraseña actualizada!
                echo ------------------------------
            else
                echo Las contraseñas no son iguales
            fi
        else
            echo La contraseña no será actualiada
        fi
        
        salir
    done
}

#Función para decidir se continuar no programa ou saír
function saida(){
    clear
    echo "Seleccionouse a opción de saída, adiós Gerardo!"
    exit=1
    sleep 1s
}

#función para amosar as opcións que se lle ofrecen ao usuario
function mostrarOpcions(){
    #Limpeza de consola antes de iniciar a selección de opcións
    clear
    
    echo ----------------------------------------------------------
    echo "|Selecciona a opción:                                    |"
    echo "|1- Mostrar ficheiros dentro do directorio seleccionado  |"
    echo "|2- Comprobar se existe un ficheiro na ruta              |"
    echo "|3- Ver información de sistema Windows                   |"
    echo "|4- Ver información de sistema Linux                     |"
    echo "|5- Acceder a páxina web                                 |"
    echo "|6- Calculadora                                          |"
    echo "|7- Cambiar nombre de usuario                            |"
    echo "|8- Saír                                                 |"
    echo ----------------------------------------------------------
}

#Función para seleccionar a opción que usa un CASE para estructurar as diferentes opciones
function seleccionarOpcion(){
    read -p "Selección: " seleccion
    
    case $seleccion in
        1)
            mostrarFicheiros
        ;;
        2)
            comprobarFicheiro
        ;;
        3)
            infoWindows
        ;;
        4)
            infoLinux
        ;;
        5)
            accederPaxina
        ;;
        6)
            calculadora
            echo $?
        ;;
        7)
            cambiarUsuario
        ;;
        8)
            saida
        ;;
        
    esac
}



#Bloque principal onde se executan as funcións

while (( exit == 0 ))
do
    
    mostrarOpcions
    seleccionarOpcion
    
done

echo O programa finalizou correctamente
