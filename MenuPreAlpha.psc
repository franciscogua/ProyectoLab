Algoritmo MenuPreAlpha
	
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
			Escribir Sin Saltar "Ingrese usuario: "
			Leer usuario
			Escribir Sin Saltar "Ingrese contrase�a: "
			Leer contrase�a
			
			Segun rol Hacer
				1:
					menuAdmin(rol,usuario, contrase�a)
				2:
					menuDocente(rol, usuario, contrase�a)
				3:
					menuEstudiante(rol, usuario, contrase�a)
			Fin Segun
		SiNo
			Escribir "Adios!"
		FinSi
	Hasta Que (rol = 4)
	
FinAlgoritmo


//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES MEN�


//-----------------------------------------------------------------------------------------\\
//ADMIN
Funcion menuAdmin (rol Por Referencia, usuario Por Referencia, contrase�a Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. ABM Estudiante"
			Escribir "2. ABM Docente"
			Escribir "3. ABM Materias"
			Escribir "4. ABM Ex�menes"
			Escribir "5. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 5) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 5)
		
		Si (op <> 5) Entonces
			Segun op Hacer
				1:
					abmEstudiante
				2:
					abmDocente
				3:
					abmMaterias
				4:
					abmExamenes
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesi�n."
			pausa
		FinSi
	Hasta Que (op = 5)
	
FinFuncion


//OPCIONES ADMIN
//------------------------------------------------------------
//ABM ESTUDIANTE
Funcion abmEstudiante()
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "ABM ESTUDIANTE"
		salto
		
		Repetir
			linea
			Escribir "1. Crear estudiante"
			Escribir "2. Baja estudiante"
			Escribir "3. Modificar estudiante"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� CREAR ESTUDIANTE"
					pausa
				2:
					Escribir "Todavia no se implement� BAJA ESTUDIANTE"
					pausa
				3:
					Escribir "Todavia no se implement� MODIFICAR ESTUDIANTE"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a menu administrador."
			pausa
		FinSi
	Hasta Que (op = 4)
	
FinFuncion


//------------------------------------------------------------
//ABM DOCENTE
Funcion abmDocente()
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "ABM DOCENTE"
		salto
		
		Repetir
			linea
			Escribir "1. Crear docente"
			Escribir "2. Baja docente"
			Escribir "3. Modificar docente"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� CREAR DOCENTE"
					pausa
				2:
					Escribir "Todavia no se implement� BAJA DOCENTE"
					pausa
				3:
					Escribir "Todavia no se implement� MODIFICAR DOCENTE"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a menu administrador."
			pausa
		FinSi
	Hasta Que (op = 4)
	
FinFuncion


//------------------------------------------------------------
Funcion abmMaterias()
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "ABM MATERIAS"
		salto
		
		Repetir
			linea
			Escribir "1. Crear materia"
			Escribir "2. Baja materia"
			Escribir "3. Modificar materia"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� CREAR MATERIA"
					pausa
				2:
					Escribir "Todavia no se implement� BAJA MATERIA"
					pausa
				3:
					Escribir "Todavia no se implement� MODIFICAR MATERIA"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a menu administrador."
			pausa
		FinSi
	Hasta Que (op = 4)
	
FinFuncion


//------------------------------------------------------------
Funcion abmExamenes()
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "ABM EX�MENES"
		salto
		
		Repetir
			linea
			Escribir "1. Crear examen"
			Escribir "2. Baja examen"
			Escribir "3. Modificar examen"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implement� CREAR EXAMEN"
					pausa
				2:
					Escribir "Todavia no se implement� BAJA EXAMEN"
					pausa
				3:
					Escribir "Todavia no se implement� MODIFICAR EXAMEN"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a menu administrador."
			pausa
		FinSi
	Hasta Que (op = 4)
	
FinFuncion


//-----------------------------------------------------------------------------------------\\
//DOCENTE
Funcion menuDocente (rol Por Referencia, usuario Por Referencia, contrase�a Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. Modificar mis datos"
			Escribir "2. Ver materias"
			Escribir "3. Ver ex�menes"
			Escribir "4. ABM ex�menes"
			Escribir "5. Poner notas"
			Escribir "6. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 6) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 6)
		
		Si (op <> 6) Entonces
			Segun op Hacer
				1:
					modificarDatos(rol, usuario, contrase�a)
				2:
					Escribir "Todavia no se implement� VER MATERIAS"
					pausa
				3:
					Escribir "Todavia no se implement� VER EX�MENES"
					pausa
				4:
					Escribir "Todavia no se implement� ABM EX�MENES"
					pausa
				5:
					Escribir "Todavia no se implement� PONER NOTAS"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesi�n."
			pausa
		FinSi
	Hasta Que (op = 6)
	
FinFuncion

//FIN OPCIONES ADMIN

//-----------------------------------------------------------------------------------------\\
//ESTUDIANTE
Funcion menuEstudiante (rol Por Referencia, usuario Por Referencia, contrase�a Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. Modificar mis datos"
			Escribir "2. Ver mis materias"
			Escribir "3. Ver mis ex�menes" 
			Escribir "4. Inscripci�n a materias" 
			Escribir "5. Dar de baja una materia" 
			Escribir "6. Inscripci�n a ex�menes"
			Escribir "7. Dar de baja un examen"
			Escribir "8. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 8) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 8)
		
		Si (op <> 8) Entonces
			Segun op Hacer
				1:
					modificarDatos(rol, usuario, contrase�a)
				2:
					Escribir "Todavia no se implement� VER MIS MATERIAS"
					pausa
				3:
					Escribir "Todavia no se implement� VER MIS EX�MENES"
					pausa
				4:
					Escribir "Todavia no se implement� INSCRIPCI�N A MATERIAS"
					pausa
				5:
					Escribir "Todavia no se implement� DAR DE BAJA UNA MATERIA"
					pausa
				6:
					Escribir "Todavia no se implement� INSCRIPCI�N A EX�MENES"
					pausa
				7:
					Escribir "Todavia no se implement� DAR DE BAJA UN EXAMEN"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesi�n."
			pausa
		FinSi
	Hasta Que (op = 8)
	
FinFuncion


//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES GENERALES

Funcion modificarDatos(rol Por Referencia, usuario Por Referencia, contrase�a Por Referencia)
	
	Definir op Como Entero
	Definir exUsuario, exContra, verificacionContra, nuevoUsuario, nuevaContra Como Caracter
	
	exUsuario <- usuario
	exContrase�a <- contrase�a
	
	Repetir
		Limpiar Pantalla
		Escribir "MODIFICAR DATOS"
		salto
		
		Repetir
			linea
			Escribir "1. Modificar nombre de usuario"
			Escribir "2. Modificar contrase�a"
			Escribir "3. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opci�n que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 3) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opci�n ingresada es inv�lida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 3)
		
		Si (op <> 3) Entonces
			Segun op Hacer
				1:
					Escribir "Ingrese el nuevo nombre de usuario o 0 para volver: "
					Leer nuevoUsuario
					salto
					
					Si (nuevoUsuario <> '0') Entonces
						Repetir
							Escribir "Ingrese la contrase�a para confirmar o 0 para volver: "
							Leer verificacionContra
							salto
							
							Si (verificacionContra = contrase�a) Entonces
								usuario <- nuevoUsuario
								Escribir "El nombre de usuario se ha modificado exitosamente!"
								pausa
							SiNo
								Limpiar Pantalla
								Escribir "ERROR: la contrase�a ingresada es inv�lida."
								salto
							FinSi
						Hasta Que (verificacionContra = contrase�a o verificacionContra = '0')
					FinSi
				2:
					Repetir
						Escribir "Ingrese la contrase�a anterior para confirmar o 0 para volver: "
						Leer verificacionContra
						salto
						
						Si (verificacionContra <> '0') Entonces
							Si (verificacionContra = contrase�a) Entonces
								Limpiar Pantalla
								Escribir "Ingrese la nueva contrase�a o 0 para volver: "
								Leer nuevaContra
								salto
								
								Si (nuevaContra <> '0') Entonces
									verificacionContra <- nuevaContra
									
									Repetir
										Escribir "Ingrese nuevamente la contrase�a para confirmar o 0 para volver: "
										Leer nuevaContra
										salto
										
										Si (nuevaContra <> '0') Entonces
											Si (nuevaContra = verificacionContra) Entonces
												contrase�a <- nuevaContra
												Escribir "La nueva contrase�a se ha modificado exitosamente!"
												pausa
											SiNo
												Limpiar Pantalla
												Escribir "ERROR: la contrase�a ingresada es inv�lida."
												salto
											FinSi
										FinSi
									Hasta Que  (nuevaContra = verificacionContra o nuevaContra = '0')
								FinSi
							SiNo
								Limpiar Pantalla
								Escribir "ERROR: la contrase�a ingresada es inv�lida."
								salto
							Fin Si
						FinSi
					Hasta Que (verificacionContra = contrase�a o verificacionContra = '0')
			Fin Segun
		SiNo
			Segun rol Hacer
				1:
					Escribir "Volviendo a menu administrador."
				2:
					Escribir "Volviendo a menu docente."
				3:
					Escribir "Volviendo a menu estudiante."
			Fin Segun
			pausa
		FinSi
	Hasta Que (op = 3)
FinFuncion


//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES AUXILIARES

//-----------------------------------------------------------------------------------------\\
Funcion linea
	Escribir "----------------------------------"
FinFuncion

//-----------------------------------------------------------------------------------------\\
Funcion salto
	Escribir " "
FinFuncion

//-----------------------------------------------------------------------------------------\\
Funcion pausa
	Definir enter Como Caracter
	
	Escribir " "
	Escribir sin saltar "Presione enter para continuar..."
	Leer enter
FinFuncion