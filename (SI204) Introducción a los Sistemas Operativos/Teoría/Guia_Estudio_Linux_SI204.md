# Guía de Estudio Práctica: Uso de Linux y la Consola

## 1. **Fundamentos: ¿Qué es Linux?**
- Linux es un sistema operativo tipo UNIX. Se usa mucho en servidores, programación, y como entorno educativo.
- Todo se gestiona principalmente desde la **terminal/consola** (shell).

## 2. **La Terminal: Primeros pasos**
- Abrí la terminal (Ctrl+Alt+T en la mayoría de distros, o buscá “Terminal”).
- Prompt típico: `$` (usuario normal) o `#` (root/admin).

## 3. **Comandos Básicos y Navegación**
- `pwd`: Muestra el directorio actual.
- `ls`: Lista archivos y carpetas del directorio actual.  
  - `ls -l`: Muestra detalles (permisos, fecha, tamaño).
  - `ls -a`: Incluye archivos ocultos.
- `cd <directorio>`: Cambia de directorio.
  - Ej: `cd Documentos`
  - `cd ..` sube un nivel.
  - `cd /` va al raíz.
- `mkdir <nombre>`: Crea una carpeta.
- `touch <archivo>`: Crea un archivo vacío.
- `rm <archivo>`: Borra un archivo.
- `rm -r <carpeta>`: Borra carpeta y todo su contenido.
- `cp <origen> <destino>`: Copia archivos/carpetas.
- `mv <origen> <destino>`: Mueve/renombra archivos/carpetas.
- `cat <archivo>`: Muestra el contenido de un archivo.
- `echo <texto>`: Imprime texto (útil para redirección).
- `man <comando>`: Muestra el manual del comando (salís con `q`).

## 4. **Permisos y Usuarios**
- `whoami`: Muestra el usuario actual.
- `chmod <permisos> <archivo>`: Cambia permisos. Ej: `chmod +x script.sh`
- `chown <usuario>:<grupo> <archivo>`: Cambia propietario.

## 5. **Editar Archivos: Introducción a VIM**
- Abrí VIM: `vim <archivo>`
- **Modos de VIM:**
  - **Normal:** Navegación, comandos (cuando abrís VIM).
  - **Insert:** Para escribir texto, presioná `i`.
  - **Salir del Insert:** Presioná `Esc`.
- **Comandos Clave:**
  - `:w` → Guardar.
  - `:q` → Salir.
  - `:wq` → Guardar y salir.
  - `:q!` → Salir sin guardar.
  - `dd` → Borrar línea.
  - `x` → Borrar carácter.
  - `/texto` → Buscar texto.
- **Tips:** Practicá abrir, editar y guardar archivos de texto simple.

## 6. **Gestión de Procesos**
- `ps`: Lista procesos.
- `top` o `htop`: Monitorea en tiempo real.
- `kill <PID>`: Mata un proceso.
- `sudo <comando>`: Ejecuta como administrador.

## 7. **Instalación de Programas**
- **Debian/Ubuntu:** `sudo apt update` y `sudo apt install <paquete>`
- **Fedora:** `sudo dnf install <paquete>`
- **Arch:** `sudo pacman -S <paquete>`

## 8. **Particionado y Discos**
- `lsblk`: Lista los discos y particiones.
- `fdisk -l`: Información detallada de discos.
- `sudo fdisk /dev/sdX`: Entra al menú de particionado (¡cuidado!).
- `mkfs.ext4 /dev/sdXn`: Formatea la partición.
- `mount /dev/sdXn /mnt/punto_de_montaje`: Monta una partición.
- **Siempre hacer backup antes de modificar particiones.**

## 9. **Comandos Útiles para Resolver Problemas**
- `df -h`: Estado del disco (espacio disponible).
- `du -sh <carpeta>`: Tamaño de una carpeta.
- `grep <texto> <archivo>`: Busca texto dentro de archivos.
- `find <ruta> -name <archivo>`: Busca archivos por nombre.

## 10. **Práctica de Situaciones Comunes**
1. **Crear y editar un archivo de texto:**
   - `touch nota.txt`
   - `vim nota.txt` (escribí, guardá y salí)
2. **Crear carpetas y mover archivos:**
   - `mkdir trabajos`
   - `mv nota.txt trabajos/`
3. **Buscar archivos:**
   - `find . -name "*.pdf"`
4. **Ver espacio libre y ocupado:**
   - `df -h`
   - `du -sh trabajos/`
5. **Instalar un programa (ejemplo: htop):**
   - `sudo apt update`
   - `sudo apt install htop`
6. **Ver y matar procesos:**
   - `ps aux | grep firefox`
   - `kill <PID>`
7. **Montar una partición:**
   - `sudo mount /dev/sdb1 /mnt/usb`
   - `ls /mnt/usb`