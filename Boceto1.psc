Algoritmo Boceto1
	
	Definir rol Como Entero
	Definir usuario, contrase�a Como Caracter
	
	Repetir
		Limpiar Pantalla
		Escribir "Iniciar sesi�n como:"
		salto
		
		Repetir
			linea
			Escribir "1. Administrador"
			Escribir "2. Docente"
			Escribir "3. Estudiante"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer rol
			
			Si (rol < 1 o rol > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (rol >= 1 y rol <= 4)
		
		Si (rol <> 4) Entonces
			Limpiar Pantalla
			Escribir Sin Saltar "Ingrese usuario: " //legajo?
			Leer usuario
			Escribir Sin Saltar "Ingrese contrase�a: "
			Leer contrase�a
			
			Segun rol Hacer
				1:
					menuAdmin(usuario)
				2:
					menuDocente(usuario)
				3:
					menuEstudiante(usuario)
			Fin Segun
		SiNo
			Escribir "Adios!"
		FinSi
	Hasta Que (rol = 4)
	
FinAlgoritmo


//-----------------------------------------------------------------------
//FUNCIONES MEN�

//------------------------------------------------------------
//ADMIN
Funcion menuAdmin (usuario Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. Ingresar/modificar/eliminar planes de estudio"
			Escribir "2. Ingresar/modificar/eliminar docentes"
			Escribir "3. Ingresar/modificar/eliminar estudiantes"
			Escribir "4. Asignar docentes a materias"
			Escribir "5. Cambio de contrase�a"
			Escribir "6. Enviar mensajes/comentarios"
			Escribir "7. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 7) Entonces
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 7)
		
		Si (op <> 7) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� INGRESAR/MODIFICAR/ELIMINAR PLANES DE ESTUDIO"
					pausa
				2:
					Escribir "Todavia no se implement� INGRESAR/MODIFICAR/ELIMINAR DOCENTES"
					pausa
				3:
					Escribir "Todavia no se implement� INGRESAR/MODIFICAR/ELIMINAR ESTUDIANTES"
					pausa
				4:
					Escribir "Todavia no se implement� ASIGNAR DOCENTES A MATERIAS"
					pausa
				5:
					Escribir "Todavia no se implement� CAMBIO DE CONTRASE�A"
					pausa
				6:
					Escribir "Todavia no se implement� ENVIAR MENSAJES/COMENTARIOS"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesi�n"
			pausa
		FinSi
	Hasta Que (op = 7)
	
FinFuncion

//------------------------------------------------------------
//DOCENTE
Funcion menuDocente (usuario Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. Ingresar/modificar/eliminar notas"
			Escribir "2. Estudiantes en mis materias"
			Escribir "3. Crear/modificar/dar de baja ex�menes" //materia, fecha
			Escribir "4. Cambio de contrase�a"
			Escribir "5. Enviar mensajes/comentarios"
			Escribir "6. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 6) Entonces
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 6)
		
		Si (op <> 6) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� INGRESAR/MODIFICAR/ELIMINAR NOTAS"
					pausa
				2:
					Escribir "Todavia no se implement� ESTUDIANTES EN MIS MATERIAS"
					pausa
				3:
					Escribir "Todavia no se implement� CREAR/MODIFICAR/DAR DE BAJA EX�MENES"
					pausa
				4:
					Escribir "Todavia no se implement� CAMBIO DE CONTRASE�A"
					pausa
				5:
					Escribir "Todavia no se implement� ENVIAR MENSAJES/COMENTARIOS"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesi�n"
			pausa
		FinSi
	Hasta Que (op = 6)
	
FinFuncion

//------------------------------------------------------------
//ESTUDIANTE
Funcion menuEstudiante (usuario Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			//En el SysAcad hay opcion correlatividad para cursar la opci�n correlatividad para rendir, ambas muestran la lista completa de materias,
			//con sus respectivas correlativas.
			Escribir "1. Anotar a una carrera"
			Escribir "2. Anotar/dar de baja materias"
			Escribir "3. Estado acad�mico" //Materias inscriptas (cursa en qu� comisi�n, aprobada, etc.)
			Escribir "4. Inscripci�n a ex�menes" 
			Escribir "5. Mis notas" //Hay una opci�n "EX�MENES", donde figura fecha, materia, nota, carrera, plan, c�digo, etc.
			Escribir "6. Cambio de contrase�a"
			Escribir "7. Enviar mensajes/comentarios"
			Escribir "8. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 8) Entonces
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 8)
		
		Si (op <> 8) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� ANOTAR A UNA CARRERA"
					pausa
				2:
					Escribir "Todavia no se implement� ANOTAR/DAR DE BAJA MATERIAS"
					pausa
				3:
					Escribir "Todavia no se implement� ESTADO ACAD�MICO"
					pausa
				4:
					Escribir "Todavia no se implement� INSCRIPCI�N A EX�MENES"
					pausa
				5:
					Escribir "Todavia no se implement� MIS NOTAS"
					pausa
				6:
					Escribir "Todavia no se implement� CAMBIO DE CONTRASE�A"
					pausa
				7:
					Escribir "Todavia no se implement� ENVIAR MENSAJES/COMENTARIOS"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesi�n"
			pausa
		FinSi
	Hasta Que (op <> 8)
	
FinFuncion


//-----------------------------------------------------------------------
//FUNCIONES AUXILIARES

//------------------------------------------------------------
Funcion linea
	Escribir "------------------------------"
FinFuncion

//------------------------------------------------------------
Funcion salto
	Escribir " "
FinFuncion

//------------------------------------------------------------
Funcion pausa
	Definir enter Como Caracter
	
	Escribir " "
	Escribir sin saltar "Presione enter para continuar..."
	Leer enter
FinFuncion