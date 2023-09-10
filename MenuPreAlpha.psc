Algoritmo MenuPreAlpha
	
	Definir rol Como Entero
	Definir usuario, contraseña Como Caracter
	
	Repetir
		Limpiar Pantalla
		Escribir "Iniciar sesión como:"
		salto
		
		Repetir
			linea
			Escribir "1. Administrador"
			Escribir "2. Docente"
			Escribir "3. Estudiante"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer rol
			
			Si (rol < 1 o rol > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (rol >= 1 y rol <= 4)
		
		Si (rol <> 4) Entonces
			Limpiar Pantalla
			Escribir Sin Saltar "Ingrese usuario: "
			Leer usuario
			Escribir Sin Saltar "Ingrese contraseña: "
			Leer contraseña
			
			Segun rol Hacer
				1:
					menuAdmin(rol,usuario, contraseña)
				2:
					menuDocente(rol, usuario, contraseña)
				3:
					menuEstudiante(rol, usuario, contraseña)
			Fin Segun
		SiNo
			Escribir "Adios!"
		FinSi
	Hasta Que (rol = 4)
	
FinAlgoritmo


//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES MENÚ


//-----------------------------------------------------------------------------------------\\
//ADMIN
Funcion menuAdmin (rol Por Referencia, usuario Por Referencia, contraseña Por Referencia)
	
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
			Escribir "4. ABM Exámenes"
			Escribir "5. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 5) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
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
			Escribir "Volviendo a inicio de sesión."
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
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implementó CREAR ESTUDIANTE"
					pausa
				2:
					Escribir "Todavia no se implementó BAJA ESTUDIANTE"
					pausa
				3:
					Escribir "Todavia no se implementó MODIFICAR ESTUDIANTE"
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
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implementó CREAR DOCENTE"
					pausa
				2:
					Escribir "Todavia no se implementó BAJA DOCENTE"
					pausa
				3:
					Escribir "Todavia no se implementó MODIFICAR DOCENTE"
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
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implementó CREAR MATERIA"
					pausa
				2:
					Escribir "Todavia no se implementó BAJA MATERIA"
					pausa
				3:
					Escribir "Todavia no se implementó MODIFICAR MATERIA"
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
		Escribir "ABM EXÁMENES"
		salto
		
		Repetir
			linea
			Escribir "1. Crear examen"
			Escribir "2. Baja examen"
			Escribir "3. Modificar examen"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					Escribir "Todavia no se implementó CREAR EXAMEN"
					pausa
				2:
					Escribir "Todavia no se implementó BAJA EXAMEN"
					pausa
				3:
					Escribir "Todavia no se implementó MODIFICAR EXAMEN"
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
Funcion menuDocente (rol Por Referencia, usuario Por Referencia, contraseña Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. Modificar mis datos"
			Escribir "2. Ver materias"
			Escribir "3. Ver exámenes"
			Escribir "4. ABM exámenes"
			Escribir "5. Poner notas"
			Escribir "6. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 6) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 6)
		
		Si (op <> 6) Entonces
			Segun op Hacer
				1:
					modificarDatos(rol, usuario, contraseña)
				2:
					Escribir "Todavia no se implementó VER MATERIAS"
					pausa
				3:
					Escribir "Todavia no se implementó VER EXÁMENES"
					pausa
				4:
					Escribir "Todavia no se implementó ABM EXÁMENES"
					pausa
				5:
					Escribir "Todavia no se implementó PONER NOTAS"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesión."
			pausa
		FinSi
	Hasta Que (op = 6)
	
FinFuncion

//FIN OPCIONES ADMIN

//-----------------------------------------------------------------------------------------\\
//ESTUDIANTE
Funcion menuEstudiante (rol Por Referencia, usuario Por Referencia, contraseña Por Referencia)
	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", usuario, "!"
		salto
		
		Repetir
			linea
			Escribir "1. Modificar mis datos"
			Escribir "2. Ver mis materias"
			Escribir "3. Ver mis exámenes" 
			Escribir "4. Inscripción a materias" 
			Escribir "5. Dar de baja una materia" 
			Escribir "6. Inscripción a exámenes"
			Escribir "7. Dar de baja un examen"
			Escribir "8. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 8) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 8)
		
		Si (op <> 8) Entonces
			Segun op Hacer
				1:
					modificarDatos(rol, usuario, contraseña)
				2:
					Escribir "Todavia no se implementó VER MIS MATERIAS"
					pausa
				3:
					Escribir "Todavia no se implementó VER MIS EXÁMENES"
					pausa
				4:
					Escribir "Todavia no se implementó INSCRIPCIÓN A MATERIAS"
					pausa
				5:
					Escribir "Todavia no se implementó DAR DE BAJA UNA MATERIA"
					pausa
				6:
					Escribir "Todavia no se implementó INSCRIPCIÓN A EXÁMENES"
					pausa
				7:
					Escribir "Todavia no se implementó DAR DE BAJA UN EXAMEN"
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesión."
			pausa
		FinSi
	Hasta Que (op = 8)
	
FinFuncion


//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES GENERALES

Funcion modificarDatos(rol Por Referencia, usuario Por Referencia, contraseña Por Referencia)
	
	Definir op Como Entero
	Definir exUsuario, exContra, verificacionContra, nuevoUsuario, nuevaContra Como Caracter
	
	exUsuario <- usuario
	exContraseña <- contraseña
	
	Repetir
		Limpiar Pantalla
		Escribir "MODIFICAR DATOS"
		salto
		
		Repetir
			linea
			Escribir "1. Modificar nombre de usuario"
			Escribir "2. Modificar contraseña"
			Escribir "3. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1 o op > 3) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida"
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
							Escribir "Ingrese la contraseña para confirmar o 0 para volver: "
							Leer verificacionContra
							salto
							
							Si (verificacionContra = contraseña) Entonces
								usuario <- nuevoUsuario
								Escribir "El nombre de usuario se ha modificado exitosamente!"
								pausa
							SiNo
								Limpiar Pantalla
								Escribir "ERROR: la contraseña ingresada es inválida."
								salto
							FinSi
						Hasta Que (verificacionContra = contraseña o verificacionContra = '0')
					FinSi
				2:
					Repetir
						Escribir "Ingrese la contraseña anterior para confirmar o 0 para volver: "
						Leer verificacionContra
						salto
						
						Si (verificacionContra <> '0') Entonces
							Si (verificacionContra = contraseña) Entonces
								Limpiar Pantalla
								Escribir "Ingrese la nueva contraseña o 0 para volver: "
								Leer nuevaContra
								salto
								
								Si (nuevaContra <> '0') Entonces
									verificacionContra <- nuevaContra
									
									Repetir
										Escribir "Ingrese nuevamente la contraseña para confirmar o 0 para volver: "
										Leer nuevaContra
										salto
										
										Si (nuevaContra <> '0') Entonces
											Si (nuevaContra = verificacionContra) Entonces
												contraseña <- nuevaContra
												Escribir "La nueva contraseña se ha modificado exitosamente!"
												pausa
											SiNo
												Limpiar Pantalla
												Escribir "ERROR: la contraseña ingresada es inválida."
												salto
											FinSi
										FinSi
									Hasta Que  (nuevaContra = verificacionContra o nuevaContra = '0')
								FinSi
							SiNo
								Limpiar Pantalla
								Escribir "ERROR: la contraseña ingresada es inválida."
								salto
							Fin Si
						FinSi
					Hasta Que (verificacionContra = contraseña o verificacionContra = '0')
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