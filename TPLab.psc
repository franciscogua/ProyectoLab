//   TRABAJO PRACTICO DE LA MATERIA LABORATORIO I
//			Francisco Guarino
//			Yago Mendez
//			Hugo Miranda
//			Federico Nadal
Algoritmo TPLab
	
	Definir rol Como Entero
	Definir idUsuario Como Entero
	Definir usuario, contraseña Como Caracter
	
	Definir cantAdmin Como Entero
	cantAdmin <- 1
	Definir cantEstudiantes Como Entero
	cantEstudiantes <- 30
	Definir cantDocentes como Entero
	cantDocentes <- 30
	Definir cantMaterias como Entero
	cantMaterias <- 30
	Definir cantPlanesDeEstudio como Entero
	cantPlanesDeEstudio <- 10
	
	Definir cantNotas como Entero
	cantNotas <- 4
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------
	//DECLARACIÓN DIMENSIONES DE LA BBDD
	
	Dimension idPlanesDeEstudio[cantPlanesDeEstudio]
	Dimension idEstudiante[cantEstudiantes]
	Dimension idDocente[cantDocentes]
	Dimension idMateria[cantMaterias]
	
	Dimension planDeEstudios[cantPlanesDeEstudio,2]
	Dimension admin[cantAdmin,2]
	Dimension estudiante[cantEstudiantes,5]	
	Dimension docente[cantDocentes,5]
	Dimension materia[cantMaterias,2]
	
	Dimension planDeEstudios_estudiante[cantPlanesDeEstudio,cantEstudiantes]
	Dimension planesDeEstudios_materias[cantPlanesDeEstudio,cantMaterias]
	
	Dimension materia_estudiantes[cantMaterias,cantEstudiantes]
	Dimension materia_docente[cantMaterias,cantDocentes]
	
	Dimension estudiante_materia_notas[cantEstudiantes,cantMaterias,cantNotas]
	
	Dimension examen[cantMaterias,31,12,cantEstudiantes]
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------
	//INICIALIZAR VECTORES
	
	inicializarVector(idPlanesDeEstudio, cantPlanesDeEstudio)
	inicializarVector(idEstudiante, cantEstudiantes)
	inicializarVector(idDocente, cantDocentes)
	inicializarVector(idMateria, cantMaterias)
	
	linea
	Escribir "                    SYSACAD"
	linea
	Escribir""
	Escribir"Este proyecto fue desarrollado para LABORATORIO"
	salto
	Escribir "Integrantes:"
	Escribir"                Francisco Guarino"
	Escribir"                Yago Mendez"
	Escribir"                Hugo Miranda"
	Escribir"                Federico Nadal"
	linea
	
	cargaBBDDPrueba(idPlanesDeEstudio,idEstudiante,idDocente,idMateria, planDeEstudios,admin,estudiante,docente,materia,planDeEstudios_estudiante,planesDeEstudios_materias, materia_estudiantes, materia_docente,estudiante_materia_notas,examen,cantMaterias,cantEstudiantes)
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------
	//ASIGNACIÓN ID NULO Y LLAMADO A INICIO DE SESIÓN
	idUsuario <- 0
	inicioSesion(idEstudiante, cantEstudiantes, estudiante, idDocente, cantDocentes, docente, admin, idUsuario, idMateria, cantMaterias, materia, materia_docente, materia_estudiantes, estudiante_materia_notas,examen)
	
FinAlgoritmo

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES DE SEGURIDAD

//-----------------------------------------------------------------------------------------\\
//INICIO SESIÓN
Funcion inicioSesion(idEstudiante por Referencia, cantEstudiantes Por Referencia, estudiante Por Referencia, idDocente Por Referencia, cantDocentes Por Referencia, docente Por Referencia, admin Por Referencia, idUsuario Por Referencia, idMateria Por Referencia, cantMaterias Por Referencia, materia Por Referencia,materia_docente Por Referencia, materia_estudiantes Por Referencia, estudiante_materia_notas Por Referencia,examen Por Referencia)
	Definir validPassword, barrera, validUser, rol, volver Como Entero
	Definir usuario,  contraseña Como Caracter	
	
	validUser <- 0
	validPassword <- 0
	barrera <- 0
	
	Limpiar Pantalla
	
	Repetir
		Repetir
			volver <- 0
			Limpiar Pantalla
			Escribir "Iniciar sesión como: "
			salto
			
			linea
			Escribir "1. Administrador"
			Escribir "2. Docente"
			Escribir "3. Estudiante"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer rol
			
			Si (rol < 1) o (rol > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (rol >= 1) y (rol <= 4)
		
		Si (rol <> 4) Entonces
			Limpiar Pantalla
			Repetir
				Repetir
					volver <- 0
					barrera <- 0
					Escribir "Ingrese el nombre de usuario o 0 para volver: "
					Leer usuario
					
					Si (usuario <> '0') Entonces
						validUser <- validarUsuario(rol, usuario, cantDocentes, cantEstudiantes, admin, docente, estudiante, idUsuario)
						
						Si (validUser = 0) Entonces
							Limpiar Pantalla
							Escribir "ERROR: El nombre de usuario ingresado es inválido."
							salto
						FinSi
					SiNo
						volver <- 1
					FinSi
				Hasta Que (validUser = 1) o (volver = 1)
				
				salto
				
				Si (volver <> 1) Entonces
					Repetir
						Escribir "Ingrese la contraseña o 0 para volver: "
						Leer contraseña
						
						Si (contraseña <> "0") Entonces
							validPassword <- validarContraseña(rol, contraseña, cantDocentes, cantEstudiantes, admin, docente, estudiante, idUsuario)
							
							Si (validPassword = 0) Entonces
								Limpiar Pantalla
								Escribir "ERROR: La contraseña ingresada no es válida."
								salto
							FinSi
						SiNo
							volver <- 1
						FinSi
						
					Hasta Que (validPassword = 1) o (volver = 1)	
					
					Si (validUser = 1) y (validPassword = 1) Entonces
						barrera <- 1
					FinSi
				FinSi
			Hasta Que (barrera = 1) o (volver = 1)
		SiNo
			Escribir "Adios!"
		FinSi
		
		Si (volver = 1) Entonces
			Limpiar Pantalla
			Escribir "Volviendo a selección de roles."
			Pausa
		FinSi
		
		Si (barrera = 1) Entonces
			Segun rol Hacer
				1:
					menuAdmin(rol, usuario, contraseña, idEstudiante, estudiante, cantEstudiantes, idDocente, docente, cantDocentes, examen, idMateria, materia, cantMaterias)
				2:
					menuDocente(rol, usuario, contraseña, idUsuario, cantMaterias, materia, materia_docente, materia_estudiantes, estudiante_materia_notas, estudiante, idEstudiante, examen, docente)
				3:
					menuEstudiante(rol, usuario, contraseña, idUsuario, cantMaterias,cantEstudiantes, materia, materia_estudiantes, estudiante_materia_notas, examen, docente, estudiante)
			Fin Segun
		FinSi
	Hasta Que (rol = 4)
FinFuncion 

//-----------------------------------------------------------------------------------------\\
//validarUsuario
Funcion validUser <- validarUsuario(rol Por Referencia, usuario Por Referencia, cantDocentes Por Referencia, cantEstudiantes Por Referencia, admin Por Referencia, docente Por Referencia, estudiante Por Referencia, idUsuario Por Referencia)
	Definir validUser Como Entero
	validUser <- 0
	
	Segun rol Hacer
		1:
			Si (usuario = admin[1,1]) Entonces
				validUser <- 1
			FinSi
		2:
			Para i<-1 Hasta cantDocentes Con Paso 1 Hacer
				Si (usuario = docente[i,4]) y (usuario <> "") Entonces
					validUser <- 1
					idUsuario <- i
				FinSi
			FinPara
		3:
			Para i<-1 Hasta cantEstudiantes Con Paso 1 Hacer
				Si (usuario = estudiante[i,4]) y (usuario <> "") Entonces
					validUser <- 1
					idUsuario <- i
				FinSi
			FinPara
	Fin Segun
FinFuncion

//-----------------------------------------------------------------------------------------\\
//validarContraseña
Funcion validPassword <- validarContraseña(rol Por Referencia, contraseña Por Referencia, cantDocentes Por Referencia, cantEstudiantes Por Referencia, admin Por Referencia, docente Por Referencia, estudiante Por Referencia, idUsuario Por Referencia)
	Definir validPassword Como Entero
	validPassword <- 0
	
	Segun rol Hacer
		1:
			Si (admin[1,2] = contraseña) Entonces
				validPassword <- 1
			FinSi
		2:
			Si (contraseña = docente[idUsuario,5]) Entonces 
				validPassword <- 1
			FinSi
		3:
			Si (contraseña = estudiante[idUsuario,5]) Entonces
				validPassword <- 1
			FinSi
	Fin Segun
FinFuncion

//FIN FUNCIONES SEGURIDAD

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES MENÚ

//-----------------------------------------------------------------------------------------\\
//ADMIN
Funcion menuAdmin (rol Por Referencia, usuario Por Referencia, contraseña Por Referencia, idEstudiante Por Referencia, estudiante Por Referencia, cantEstudiantes Por Valor, idDocente Por Referencia, docente Por Referencia, cantDocentes Por Valor, examen Por Referencia, idMateria Por Referencia, materia por referencia, cantMaterias Por Valor)
	
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
			
			Si (op < 1) o (op > 5) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1) y (op <= 5)
		
		Si (op <> 5) Entonces
			Segun op Hacer
				1:
					abmEstudiante(idEstudiante, estudiante, cantEstudiantes)
				2:
					abmDocente(idDocente, docente, cantDocentes)
				3:
					abmMaterias(idMateria, materia, cantMaterias)
				4:
					abmExamenes(examen, materia, cantEstudiantes, cantMaterias)
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
Funcion abmEstudiante(idEstudiante Por Referencia, estudiante Por Referencia, cantEstudiantes Por Valor)
	
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
			
			Si (op < 1) o (op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1) y (op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					altaPersona(idEstudiante, estudiante, cantEstudiantes)
					pausa
				2:
					bajaPersona(idEstudiante, estudiante, cantEstudiantes)
					pausa
				3:
					modificarPersona(idEstudiante, estudiante, cantEstudiantes)
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
Funcion abmDocente(idDocente Por Referencia, docente Por Referencia, cantDocentes Por Valor)
	
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
			
			Si (op < 1) o (op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1) y (op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					altaPersona(idDocente, docente, cantDocentes)
					pausa
				2:
					bajaPersona(idDocente, docente, cantDocentes)
					pausa
				3:
					modificarPersona(idDocente, docente, cantDocentes)
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a menu administrador."
			pausa
		FinSi
	Hasta Que (op = 4)
FinFuncion


//------------------------------------------------------------
//ABM MATERIAS
Funcion abmMaterias(idMateria Por Referencia, materia Por Referencia, cantMaterias Por Valor)
	
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
			
			Si (op < 1) o (op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1) y (op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					altaMateria(idMateria, materia, cantMaterias)
					pausa
				2:
					bajaMateria(idMateria, materia, cantMaterias)
					pausa
				3:
					modificarMateria(idMateria, materia, cantMaterias)
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a menu administrador."
			pausa
		FinSi
	Hasta Que (op = 4)
FinFuncion

//------------------------------------------------------------
//ABM EXÁMENES
Funcion abmExamenes(examen Por Referencia, materia Por Referencia, cantEstudiantes Por Valor, cantMaterias Por Valor)
	
	Definir op Como Entero
	definir dia, mes, matExamen,incriptos como enteros
	
	Repetir
		Limpiar Pantalla
		Escribir "ABM EXÁMENES"
		salto
		
		Repetir
			linea
			Escribir "1. Crear examen"
			Escribir "2. Baja examen"
			//Escribir "3. Modificar examen"
			Escribir "4. Salir"
			linea
			
			salto
			Escribir Sin Saltar "Ingrese la opción que desee: "
			Leer op
			Limpiar Pantalla
			
			Si (op < 1) o (op > 4) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 4)
		
		Si (op <> 4) Entonces
			Segun op Hacer
				1:
					altaExamen(examen, materia, cantEstudiantes)
					pausa
				2:
					bajaExamen(examen, materia, cantEstudiantes)
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

Funcion altaExamen(examen Por Referencia, materia Por Referencia, cantEstudiantes Por Valor)
	Definir dia, mes, matExamen, inscriptos como Enteros
	
	Escribir "Ingrese el id de la materia o ingrese 0 para volver: "
	Leer matExamen
	
	Si (matExamen <> 0) Entonces
		Repetir
			Escribir "Ingrese el dia del examen: "
			Leer dia
			
			Si (dia < 1) o (dia > 31) Entonces
				Escribir "ERROR: el día ingresado es inválido."
			FinSi
		Hasta Que (dia >= 1) y (dia <= 31)
		
		Repetir
			Escribir "Ingrese el mes del examen: "
			Leer mes
			
			Si (mes < 1) o (mes > 12) Entonces
				Escribir "ERROR: el mes ingresado es inválido."
			FinSi
		Hasta Que (mes >= 1) y (mes <= 12)
		
		Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
			examen[matExamen,dia,mes,1] <- 0
		Fin Para
		
		Escribir "Se habilitó la inscripción del examen de ", materia[matExamen,1], " el dia ", dia, "/", mes 
	FinSi
FinFuncion

Funcion bajaExamen(examen Por Referencia, materia Por Referencia, cantEstudiantes Por Valor)
	Definir dia, mes, matExamen, inscriptos como Enteros
	
	matExamen <- 1
	
	Escribir "Ingrese el id de la materia o ingrese 0 para volver:"
	Leer matExamen
	
	Si (matExamen <> 0) Entonces
		Repetir
			Escribir "Ingrese el dia del examen: "
			Leer dia
			
			Si (dia < 1) o (dia > 31) Entonces
				Escribir "ERROR: el día ingresado es inválido."
			FinSi
		Hasta Que (dia >= 1) y (dia <= 31)
		
		Repetir
			Escribir "Ingrese el mes del examen: "
			Leer mes
			
			Si (mes < 1) o (mes > 12) Entonces
				Escribir "ERROR: el mes ingresado es inválido."
			FinSi
		Hasta Que (mes >= 1) y (mes <= 12)
		
		Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
			examen[matExamen,dia,mes,1] <- -1
		Fin Para
		
		Escribir "Se dio de baja el examen de " materia[matExamen,1] , " del dia ", dia, "/", mes
	FinSi
FinFuncion

//FIN OPCIONES ADMIN

//-----------------------------------------------------------------------------------------\\
//DOCENTE
Funcion menuDocente(rol Por Referencia, usuario Por Referencia, contraseña Por Referencia, idUsuario Por Referencia, cantMaterias Por referencia, materia Por Referencia, materia_docente Por Referencia, materia_estudiantes Por Referencia, estudiante_materia_notas Por Referencia, estudiante Por Referencia, idEstudiante Por Referencia, examen por referencia, docente Por Referencia)	
	Definir op Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", docente[idUsuario, 4], "!"
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
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 6)
		
		Si (op <> 6) Entonces
			Segun op Hacer
				1:
					modificarDatos(rol, usuario, contraseña, idUsuario, docente, estudiante)
				2:
					Para  iMat <- 1 Hasta cantMaterias Con Paso 1 Hacer
						Si (materia_docente[iMat,1] = idUsuario) o (materia_docente[iMat,2] = idUsuario) Entonces
							Escribir iMat, ". ", materia[iMat,1]
						FinSi
					Fin Para
					pausa
				3:
					Escribir "Todavia no se implementó VER EXÁMENES"
					pausa
				4:  
					abmExamenes(examen, materia, cantEstudiantes, cantMaterias)
					pausa
				5:
					ponerNotas(idUsuario, cantMaterias, materia, materia_docente, materia_estudiantes, estudiante_materia_notas, estudiante, idEstudiante)	
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesión."
			pausa
		FinSi
	Hasta Que (op = 6)
FinFuncion

//OPCIONES DOCENTE

//------------------------------------------------------------
//PONER NOTAS
Funcion ponerNotas(idUsuario Por Referencia, cantMaterias Por referencia, materia Por Referencia, materia_docente Por Referencia, materia_estudiantes Por Referencia, estudiante_materia_notas Por Referencia, estudiante Por Referencia, idEstudiante Por Referencia)	
	Definir opEstNota, opMatNota, opParcialNota, nota Como Entero
	Definir indiceMat Como Entero
	
	Repetir
		
		Para  iMat <- 1 Hasta cantMaterias Con Paso 1 Hacer
			Si (materia_docente[iMat,1] = idUsuario) o (materia_docente[iMat,2] = idUsuario) Entonces
				Escribir iMat, ". " materia[iMat,1]
				indiceMat <- iMat
			FinSi
		Fin Para
		
		Salto
		
		Escribir "Seleccione materia o ingrese 0 para volver: "
		Leer opMatNota
		
		Si(opMatNota <> indiceMat) y (opMatNota <> 0) Entonces
			Limpiar Pantalla
			Escribir "ERROR: el índice de materia ingresado es inválido."
		FinSi
	Hasta Que (opMatNota = indiceMat) o (opMatNota = 0)
	
	Si (opMatNota <> 0) Entonces
		Repetir
			
			Limpiar Pantalla
			linea
			Para Inscriptos <- 1 Hasta 10 Con Paso 1 Hacer
				Escribir idEstudiante[materia_estudiantes[opMatNota,Inscriptos]], ". " estudiante[materia_estudiantes[opMatNota,Inscriptos],1]," " estudiante[materia_estudiantes[opMatNota,Inscriptos],2] 
			Fin Para
			linea
			
			salto
			
			Escribir "Seleccione un estudiante inscripto o ingrese 0 para volver: "
			Leer opEstNota
			
			Si (opEstNota < 0) o (opEstNota > 10) Entonces
				Limpiar Pantalla
				Escribir "ERROR: el índice de estudiante ingresado es inválido."
			FinSi
		Hasta Que (opEstNota >= 0) y (opEstNota <= 10)
		
		Limpiar Pantalla
		
		Si (opEstNota <> 0) Entonces
			
			Repetir
				
				linea
				Escribir "1. Primer parcial"
				Escribir "2. Segundo parcial"
				Escribir "3. Tercer parcial"
				Escribir "4. NOTA FINAL"
				linea
				salto
				
				Escribir "Seleccione la instancia a calificar o ingrese 0 para volver: "
				Leer opParcialNota
				
				Si (opParcialNota < 0) o (opParcialNota > 4) Entonces
					Limpiar Pantalla
					Escribir "ERROR: la opción ingresada es inválida."
				FinSi
			Hasta Que (opParcialNota >= 0) y (opParcialNota <= 4)
			
			Si (opParcialNota <> 0) Entonces
				Repetir
					Escribir "Ingrese la nota o ingrese 0 para volver: "
					Leer nota
					
					Si (nota <> 0) Entonces
						Si (nota >= 0) y (nota <= 10)  Entonces
							Limpiar Pantalla
							estudiante_materia_notas[opEstNota,opMatNota,opParcialNota] <- nota
							Escribir "La nota fue ingresada correctamente"
						SiNo
							Limpiar Pantalla
							Escribir "ERROR: La nota ingresada es inválida."
						FinSi
					FinSi
				Hasta Que (nota >= 0) y (nota <= 10)
			FinSi
		FinSi
	FinSi
FinFuncion

//FIN OPCIONES DOCENTE

//-----------------------------------------------------------------------------------------\\
//ESTUDIANTE
Funcion menuEstudiante(rol Por Referencia, usuario Por Referencia, contraseña Por Referencia, idUsuario Por Referencia, cantMaterias Por referencia,cantEstudiantes por referencia, materia Por Referencia, materia_estudiantes Por Referencia, estudiante_materia_notas por referencia, examen Por Referencia, docente Por Referencia, estudiante Por Referencia)
	
	Definir op Como Entero
	Definir matExamen, inscripcionExamen Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "Bienvenido ", estudiante[idUsuario, 4], "!"
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
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1 y op <= 8)
		
		Si (op <> 8) Entonces
			Segun op Hacer
				1:
					modificarDatos(rol, usuario, contraseña, idUsuario, docente, estudiante)
				2:
					verMaterias(idUsuario, cantMaterias, materia, materia_estudiantes, estudiante_materia_notas)
					pausa
				3:
					
					Para matExamen<-1 hasta cantMaterias Con Paso 1 Hacer
						Para dia<-1 hasta 31  Con Paso 1 Hacer
							Para mes<-1 Hasta 12 Con Paso 1 Hacer
								Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
									Si examen[matExamen,dia,mes,inscriptos] = idUsuario Entonces
										escribir matExamen , ". " , materia[matExamen,1], " ", dia, "/",mes
									FinSi
								Fin Para
							Fin Para
						Fin Para
					Fin Para
					pausa
				4:
					inscripcionMaterias(idUsuario, cantMaterias, materia, materia_estudiantes)
					pausa
				5:
					bajaMaterias(idUsuario, cantMaterias, materia, materia_estudiantes)
					pausa
				6:
					linea
					Para matExamen<-1 hasta cantMaterias Con Paso 1 Hacer
						Para dia<-1 hasta 31  Con Paso 1 Hacer
							Para mes<-1 Hasta 12 Con Paso 1 Hacer
								Si (examen[matExamen,dia,mes,1] >= 0) Entonces
									Escribir matExamen , ". " , materia[matExamen,1]
								FinSi
							Fin Para
						Fin Para
					Fin Para
					linea
					
					Escribir "Seleccione la materia del examen a la que desea inscribirse:"
					Leer matExamen
					
					Para dia<-1 hasta 31 Con Paso 1 Hacer
						Para mes<-1 Hasta 12 Con Paso 1 Hacer
							Si (examen[matExamen,dia,mes,1] >= 0) Entonces
								Escribir matExamen , ". " , materia[matExamen,1], " ", dia, "/",mes
							FinSi
						Fin Para
					Fin Para
					
					Repetir
						Escribir "Ingrese el dia del examen: "
						Leer dia
						
						Si (dia < 1) o (dia > 31) Entonces
							Escribir "ERROR: el día ingresado es inválido."
						FinSi
					Hasta Que (dia >= 1) y (dia <= 31)
					
					Repetir
						Escribir "Ingrese el mes del examen: "
						Leer mes
						
						Si (mes < 1) o (mes > 12) Entonces
							Escribir "ERROR: el mes ingresado es inválido."
						FinSi
					Hasta Que (mes >= 1) y (mes <= 12)
					
					inscripcionExamen <- 0
					Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
						Si (examen[matExamen,dia,mes,inscriptos] = 0) y (inscripcionExamen = 0) Entonces
							examen[matExamen,dia,mes,inscriptos] <- idUsuario
							inscripcionExamen <- 1
						FinSi
					Fin Para
					Escribir "Inscripción exitosa!"
					pausa
				7: 
					linea
					inscripcionExamen <- 0
					
					Escribir "Usted esta inscripto en los siguientes examenes: "
					
					Para matExamen<-1 hasta cantMaterias Con Paso 1 Hacer
						Para dia<-1 hasta 31  Con Paso 1 Hacer
							Para mes<-1 Hasta 12 Con Paso 1 Hacer
								Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
									Si examen[matExamen,dia,mes,inscriptos] = idUsuario Entonces
										escribir matExamen , ". " , materia[matExamen,1], " ", dia, "/",mes
									FinSi
								Fin Para
							Fin Para
						Fin Para
					Fin Para
					linea
					
					Escribir "Seleccione la materia del examen a la que desea darse de baja:"
					Leer matExamen
					
					Repetir
						Escribir "Ingrese el dia del examen: "
						Leer dia
						
						Si (dia < 1) o (dia > 31) Entonces
							Escribir "ERROR: el día ingresado es inválido."
						FinSi
					Hasta Que (dia >= 1) y (dia <= 31)
					
					Repetir
						Escribir "Ingrese el mes del examen: "
						Leer mes
						
						Si (mes < 1) o (mes > 12) Entonces
							Escribir "ERROR: el mes ingresado es inválido."
						FinSi
					Hasta Que (mes >= 1) y (mes <= 12)
					
					Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
						Si (examen[matExamen,dia,mes,inscriptos] = idUsuario) Entonces
							examen[matExamen,dia,mes,inscriptos] <- 0
							Escribir "Baja exitosa!"
						FinSi
					Fin Para
					pausa
			Fin Segun
		SiNo
			Escribir "Volviendo a inicio de sesión."
			pausa
		FinSi
	Hasta Que (op = 8)
FinFuncion

//OPCIONES ESTUDIANTE

//------------------------------------------------------------
//VER MATERIAS
Funcion verMaterias(idUsuario Por Referencia, cantMaterias Por referencia, materia Por Referencia, materia_estudiantes Por Referencia, estudiante_materia_notas por referencia)
	
	linea
	Para i<-1 Hasta cantMaterias Con Paso 1 Hacer
		Para j<-1 Hasta 11 Con Paso 1 Hacer
			Si (materia_estudiantes[i,j] = idUsuario) Entonces
				Escribir i, ". ", materia[i,1]	
			finSi
		Fin Para
	Fin para
	linea
	
	salto
	
	Repetir
		Escribir "Seleccione la materia para ver sus notas o ingrese 0 para salir: "
		leer op2
		
		Si (op2 < 0) o (op > 20) Entonces
			Limpiar Pantalla
			Escribir "ERROR: el índice de materia ingresada es inválida."
		FinSi
	Hasta Que (op2 >= 0) y (op2 <= 20)
	
	Si (op2 <> 0) Entonces
		Limpiar Pantalla
		Escribir "Sus notas en " , materia[op2,1], " son: "
		salto
		
		linea
		Escribir "Primer parcial: ", estudiante_materia_notas[idUsuario, op2, 1]
		Escribir "Segundo parcial: ", estudiante_materia_notas[idUsuario, op2, 2]
		Escribir "Tercer parcial: ", estudiante_materia_notas[idUsuario, op2, 3]
		Escribir "NOTA FINAL: ", estudiante_materia_notas[idUsuario ,op2 , 4]
		
		Si (estudiante_materia_notas[idUsuario, op2, 4] >= 7) Entonces
			salto
			Escribir "La materia esta APROBADA"
		FinSi
		linea
	FinSi
FinFuncion

//------------------------------------------------------------
//INSCRIPCION MATERIAS
Funcion inscripcionMaterias(idUsuario Por Referencia, cantMaterias Por referencia, materia Por Referencia, materia_estudiantes Por Referencia)
	Definir opIns, inscriptosMateria, flagInscripcion Como Entero
	
	opIns <- 1	
	
	linea
	Para iMat<-1 hasta cantMaterias con paso 1
		Escribir iMat, ". " materia[iMat,1]
	FinPara
	linea
	
	salto
	Escribir "Seleccione la materia a inscribirse:"
	
	Leer opIns
	flagInscripcion <- 0
	
	Para inscriptosMateria<-1 hasta 11 con paso 1
		Si (materia_estudiantes[opIns,inscriptosMateria]=0)  y (flagInscripcion = 0) Entonces
			materia_estudiantes[opIns,inscriptosMateria] <- idUsuario
			
			Escribir "Inscripción exitosa"
			flagInscripcion <- 1
		FinSi
	FinPara
	
	Si (flagInscripcion = 0) Entonces
		Escribir "La materia no tiene mas cupo ese cuatrimestre"
	FinSi
FinFuncion

//------------------------------------------------------------
//BAJA MATERIAS
Funcion bajaMaterias(idUsuario Por Referencia, cantMaterias Por referencia, materia Por Referencia, materia_estudiantes Por Referencia)
	Definir opBaja como Entero
	
	linea
	Para i<-1 Hasta cantMaterias Con Paso 1 Hacer
		Para j<-1 Hasta 11 Con Paso 1 Hacer
			Si (materia_estudiantes[i,j] = idUsuario) Entonces
				Escribir i, ". ", materia[i,1]	
			finSi
		Fin Para
	Fin para
	linea
	salto
	
	Escribir "Seleccione la materia para dar de baja o ingrese 0 para volver: "
	Leer opBaja
	
	Si (opBaja <> 0) Entonces
		Para inscriptosMateria <- 1 hasta 11 con paso 1
			Si (materia_estudiantes[opBaja,inscriptosMateria] = idUsuario) entonces
				Escribir "ATENCIÓN, USTED ESTÁ A PUNTO DE DARSE DE BAJA DE ", materia[opBaja,1] 
				pausa
				materia_estudiantes[opBaja,inscriptosMateria] <- 0
			FinSi
		FinPara
		
		salto
		Escribir "Baja exitosa"
	FinSi
FinFuncion

//FIN OPCIONES ESTUDIANTE

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES GENERALES

//-----------------------------------------------------------------------------------------\\
//MODIFICAR DATOS
Funcion modificarDatos(rol Por Referencia, usuario Por Referencia, contraseña Por Referencia, idUsuario Por Referencia, docente Por Referencia, estudiante Por Referencia)
	
	Definir op Como Entero
	Definir exContra, verificacionContra, nuevoUsuario, nuevaContra Como Caracter
	Definir confirmado Como Logico
	
	confirmado <- Falso
	
	Si (rol = 2) Entonces
		exContraseña <- docente[idUsuario, 5]
	SiNo
		exContraseña <- estudiante[idUsuario, 5]
	FinSi
	
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
			
			Si (op < 1) o (op > 3) Entonces
				Limpiar Pantalla
				Escribir "ERROR: la opción ingresada es inválida."
				salto
			Fin Si
		Hasta Que (op >= 1) y (op <= 3)
		
		Si (op <> 3) Entonces
			Segun op Hacer
				1:
					modificarUsuario(rol, idUsuario, docente, estudiante)
					pausa
				2:
					modificarContraseña(rol, idUsuario, docente, estudiante)
					pausa
			Fin Segun
		SiNo
			Si (rol = 2) Entonces
				Escribir "Volviendo a menu docente."
			SiNo
				Escribir "Volviendo a menu estudiante."
			FinSi
			pausa
		FinSi
	Hasta Que (op = 3)
FinFuncion

//------------------------------------------------------------
//MODIFICAR USUARIO
Funcion modificarUsuario(rol Por Referencia, idUsuario Por Referencia, docente Por Referencia, estudiante Por Referencia)
	
	Definir verificacionContra, nuevoUsuario Como Caracter
	Definir confirmado Como Logico
	
	confirmado <- Falso
	
	Escribir "Ingrese el nuevo nombre de usuario o 0 para volver: "
	Leer nuevoUsuario
	salto
	
	Si (nuevoUsuario <> '0') Entonces
		Repetir
			Escribir "Ingrese la contraseña para confirmar o 0 para volver: "
			Leer verificacionContra
			salto
			
			Si (verificacionContra <> '0') Entonces
				Si (rol = 2) Entonces
					Si (verificacionContra = docente[idUsuario, 5]) Entonces
						confirmado <- Verdadero
						docente[idUsuario, 4] <- nuevoUsuario
					FinSi
				SiNo
					Si (verificacionContra = estudiante[idUsuario, 5]) Entonces
						confirmado <- Verdadero
						estudiante[idUsuario, 4] <- nuevoUsuario
					FinSi
				FinSi
				
				Si (confirmado = Falso) Entonces
					Limpiar Pantalla
					Escribir "ERROR: la contraseña ingresada es inválida."
					salto
				FinSi
				Escribir "El nombre de usuario se ha modificado exitosamente!"
			FinSi
		Hasta Que (confirmado = Verdadero) o (verificacionContra = '0')
	FinSi
FinFuncion

//------------------------------------------------------------
//MODIFICAR CONTRASEÑA
Funcion modificarContraseña(rol Por Referencia, idUsuario Por Referencia, docente Por Referencia, estudiante Por Referencia)
	
	Definir verificacionContra, nuevoUsuario, nuevaContra Como Caracter
	Definir confirmado Como Logico
	
	confirmado <- Falso
	
	Repetir
		Escribir "Ingrese la contraseña anterior para confirmar o 0 para volver: "
		Leer verificacionContra
		salto
		
		Si (verificacionContra <> '0') Entonces
			Si (rol = 2) Entonces
				Si (verificacionContra = docente[idUsuario, 5]) Entonces
					Limpiar Pantalla
					Escribir "Ingrese la nueva contraseña o 0 para volver: "
					Leer nuevaContra
					salto
					
					Si (nuevaContra <> '0') Entonces
						verificacionContra <- nuevaContra
						
						Escribir "Ingrese nuevamente la contraseña para confirmar o 0 para volver: "
						Leer nuevaContra
						
						Si (nuevaContra <> '0') Entonces
							Si (nuevaContra = verificacionContra) Entonces
								confirmado <- Verdadero
								docente[idUsuario, 5] <- nuevaContra
								
								salto
								Escribir "La nueva contraseña se ha modificado exitosamente!"
							SiNo
								Limpiar Pantalla
								Escribir "ERROR: la contraseña ingresada es inválida."
								salto
							FinSi
						SiNo
							confirmado <- Verdadero
						FinSi
					SiNo
						confirmado <- Verdadero
					FinSi
				SiNo
					Limpiar Pantalla
					Escribir "ERROR: la contraseña ingresada es inválida."
					salto
				Fin Si
			SiNo
				Si (verificacionContra = estudiante[idUsuario, 5]) Entonces
					Limpiar Pantalla
					Escribir "Ingrese la nueva contraseña o 0 para volver: "
					Leer nuevaContra
					salto
					
					Si (nuevaContra <> '0') Entonces
						verificacionContra <- nuevaContra
						
						Escribir "Ingrese nuevamente la contraseña para confirmar o 0 para volver: "
						Leer nuevaContra
						
						Si (nuevaContra <> '0') Entonces
							Si (nuevaContra = verificacionContra) Entonces
								confirmado <- Verdadero
								estudiante[idUsuario, 5] <- nuevaContra
								
								salto
								Escribir "La nueva contraseña se ha modificado exitosamente!"
							SiNo
								Limpiar Pantalla
								Escribir "ERROR: la contraseña ingresada es inválida."
								salto
							FinSi
						SiNo
							confirmado <- Verdadero
						FinSi
					SiNo
						confirmado <- Verdadero
					FinSi
				SiNo
					Limpiar Pantalla
					Escribir "ERROR: la contraseña ingresada es inválida."
					salto
				Fin Si
			FinSi
		SiNo
			confirmado <- Verdadero
		FinSi
	Hasta Que (confirmado = Verdadero)
FinFuncion

//FIN MODIFICAR DATOS

//-----------------------------------------------------------------------------------------\\
Funcion linea
	Escribir "--------------------------------------------------"
FinFuncion

//-----------------------------------------------------------------------------------------\\
Funcion salto
	Escribir " "
FinFuncion

//-----------------------------------------------------------------------------------------\\
Funcion pausa
	Definir enter Como Caracter
	
	salto
	Escribir sin saltar "Presione enter para continuar..."
	Leer enter
FinFuncion

//FIN FUNCIONES GENERALES

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCIONES DEL ABM
//inicializa los vectores de ID en 0 para utilizarlo
Funcion inicializarVector(vector Por Referencia, tamanio Por Valor)
	
	Para i <- 1 Hasta tamanio Con Paso 1 Hacer
		vector[i] <- 0
	Fin Para
	
FinFuncion

//busca en un vector el primer ID=0, es decir, vacío y devuelve el indice: se usará para el alta
Funcion devolucion <- buscarLibre(vector Por Referencia, tamanio Por Valor)
	
	Definir devolucion Como Entero
	Definir encontrado Como Logico
	
	encontrado <- Falso
	
	Para i <- 1 Hasta tamanio Con Paso 1 Hacer
		si vector[i] = 0 y encontrado = Falso Entonces
			devolucion <- i
			encontrado <- Verdadero
		FinSi
	Fin Para
	
FinFuncion

//-----------------------------------------------------------------------------------------\\
//ALTA ESTUDIANTE O DOCENTE DESDE ADMIN
Funcion altaPersona(idPersona Por Referencia, matrizPersona Por Referencia, tamanio Por Valor)
	Definir nombre, apellido, DNI, nombreUsuario, contrasenia Como Caracter
	Definir indice Como Entero
	Definir op Como Caracter
	Definir volver Como Logico
	
	indice <- buscarLibre(idPersona, tamanio)
	volver <- Falso
	
	Mientras (volver = Falso) Hacer
		Escribir "Desea crear un nuevo perfil? (s/n)"
		Leer op
		
		Mientras (op <> 's') y (op <> 'n') Hacer
			Limpiar Pantalla
			
			Escribir "ERROR: la opción ingresada es inválida."
			Escribir "Desea crear un nuevo perfil? (s/n)"
			Leer op
		FinMientras
		
		Si (op <> 'n') Entonces
			
			//nombre
			nombre <- pedirCadena("Ingrese el nombre:")
			
			//apellido
			apellido <- pedirCadena("Ingrese el apellido")
			
			//DNI
			DNI <- ConvertirATexto(pedirNumero("Ingrese el número de DNI: ", 999999, 99999999))
			
			//usuario
			usuario <- nombre + apellido
			
			//contrasenia
			contrasenia <- DNI
			
			idPersona[indice] <- indice;
			matrizPersona[indice, 1] <- nombre
			matrizPersona[indice, 2] <- apellido
			matrizPersona[indice, 3] <- DNI
			matrizPersona[indice, 4] <- usuario
			matrizPersona[indice, 5] <- contrasenia
			
			Limpiar Pantalla
			Escribir "Alta exitosa"
		SiNo
			volver <- Verdadero
		FinSi
	FinMientras
FinFuncion

//-----------------------------------------------------------------------------------------\\
//BAJA ESTUDIANTE O DOCENTE DESDE ADMIN
Funcion bajaPersona(idPersona Por Referencia, matrizPersona Por Referencia, tamanio Por Valor)
	Definir id Como Entero
	Definir confirmar Como Logico
	Definir volver Como Logico
	Definir seleccion Como Caracter
	Definir limite como Entero
	
	confirmar <- Falso
	volver <- Falso
	seleccion <- 'n'
	limite <- buscarLibre(idPersona, tamanio)
	
	Mientras (confirmar = Falso) y (volver = Falso) Hacer
		
		mostrarPersonas(matrizPersona, idPersona, limite)
		Escribir "Ingresa ID del usuario a eliminar o 0 para volver: "
		Leer id
		
		Mientras (id < 0) o (id > limite) Hacer
			Limpiar Pantalla
			
			Escribir "ERROR: El ID ingresado es inválido"
			mostrarPersonas(matrizPersona, idPersona, limite)
			Escribir "Ingresa ID del usuario a eliminar o 0 para volver: "
			Leer id
		FinMientras
		
		Si(id <> 0) Entonces
			Limpiar Pantalla
			
			Escribir "Eliminará al siguiente usuario"
			mostrarPersona(matrizPersona, id)
			Escribir "¿Es correcto (s/n)?"
			Leer seleccion
			
			Mientras (seleccion <> 's') y (seleccion <> 'n') Hacer
				Limpiar Pantalla
				
				Escribir "ERROR: la opción ingresada es inválida."
				mostrarPersona(matrizPersona, id)
				Escribir "¿Desea eliminar al usuario (s/n)?"
				Leer seleccion
			FinMientras
			
			Si (seleccion = 'n') Entonces
				confirmar <- Verdadero
			FinSi
			
			Si (seleccion = 's') Entonces
				confirmar <- Verdadero
				Limpiar Pantalla
				mostrarPersona(matrizPersona, id)
				Escribir "El usuario ha sido eliminado"
				idPersona[id] <- -1
			FinSi
		SiNo
			volver <- Verdadero
		FinSi
	FinMientras
FinFuncion

//-----------------------------------------------------------------------------------------\\
//MODIFICAR DOCENTE O ESTUDIANTE DESDE ADMIN
Funcion modificarPersona(idPersona Por Referencia, matrizPersona Por Referencia, tamanio Por valor)
	
	Definir id, seleccion, limite Como Entero
	Definir confirmar, error Como Logico
	Definir nombre, apellido, nombreUsuario, DNI, contrasenia Como Cadena
	
	error <- Falso
	confirmar <- Falso
	limite <- buscarLibre(idPersona, tamanio)
	
	Repetir
		
		Repetir
			Limpiar Pantalla
			Si (error = Verdadero) Entonces
				Escribir "ERROR: El ID ingresado es inválido"
			FinSi
			
			mostrarPersonas(matrizPersona, idPersona, limite)
			
			Escribir "Elija el ID de la persona a modificar o ingrese 0 para volver: "
			Leer id
			
			error <- Falso
			
			Si (id < 0) o (id >= limite) Entonces
				error <- Verdadero
			FinSi
			
		Hasta Que (error = Falso) o (id = 0)
		
		Si (id <> 0) Entonces
			seleccion <- subMenuModificar(matrizPersona, id)
			Segun seleccion Hacer
				1:
					nombre <- pedirCadena("Elija el nuevo nombre: ")
					matrizPersona[id, 1] <- nombre
				2:
					apellido <- pedirCadena("Elija el nuevo apellido: ")
					matrizPersona[id, 2] <- apellido
				3:
					DNI <- ConvertirATexto(pedirNumero("Elija el nuevo número de DNI: ", 999999, 99999999))
					matrizPersona[id, 3] <- DNI
				4:
					nombreUsuario <- matrizPersona[id, 1] + matrizPersona[id, 2]
					matrizPersona[id, 4] <- nombreUsuario
					Limpiar Pantalla
					Escribir "Nombre de usuario reiniciado"
					Escribir "El nuevo nombre de usuario es ", nombreUsuario
				5:
					contrasenia <- matrizPersona[id, 3]
					matrizPersona[id, 5] <- contrasenia
					Limpiar Pantalla
					Escribir "Contraseña reiniciada"
					Escribir "La nueva contraseña es el DNI del usuario"
			Fin Segun
		FinSi
	Hasta Que (confirmar = Falso)
FinFuncion

//-----------------------------------------------------------------------------------------\\
//SUBMENU PARA MODIFICAR
Funcion retorno <- subMenuModificar(matrizPersona Por Referencia, indice Por Valor)
	Definir error Como Logico
	error <- Falso
	Limpiar Pantalla
	Repetir 
		si error = Verdadero Entonces
			Limpiar Pantalla
			Escribir "Error. La opcion no es valida"
			pausa
		FinSi
		Escribir "Datos de la persona a modificar"
		mostrarPersona(matrizPersona, indice)
		salto
		Escribir "1. Nombre"
		Escribir "2. Apellido"
		Escribir "3. DNI"
		Escribir "4. Reiniciar nombre de usuario"
		Escribir "5. Reiniciar contrasenia"
		Escribir "0. Salir"
		
		Escribir "Ingrese qué desea modificar: "
		leer retorno
		error <- Falso
		si (retorno > 5) o (retorno < 0) Entonces
			error <- Verdadero
		FinSi
	Hasta Que error = Falso
FinFuncion

//-----------------------------------------------------------------------------------------\\
//ENCABEZADO
Funcion encabezadoMostrarPersona
	salto
	Escribir "ID     NOMBRE   APELLIDO   DNI"
FinFuncion

//-----------------------------------------------------------------------------------------\\
//MOSTRAR PERSONA
Funcion mostrarPersona(matrizPersona Por Referencia, indice Por Valor)
	Escribir indice, "     ",matrizPersona[indice, 1], "     ", matrizPersona[indice, 2], "     ", matrizPersona[indice, 3]
FinFuncion

//-----------------------------------------------------------------------------------------\\
//MOSTRAR PERSONAS
Funcion mostrarPersonas(matrizPersona Por Referencia, idPersona Por Referencia, tamanio Por Valor)
	encabezadoMostrarPersona
	Para i <- 1 Hasta tamanio Con Paso 1 Hacer
		Si (idPersona[i] > 0) Entonces
			mostrarPersona(matrizPersona, i) 
		FinSi
	Fin Para
FinFuncion


//-----------------------------------------------------------------------------------------\\
//ALTA MATERIA DESDE ADMIN
Funcion altaMateria(idMateria Por Referencia, matrizMateria Por Referencia, tamanio Por Valor)
	Definir nombre Como Caracter
	Definir indice Como Entero
	Definir op Como Caracter
	Definir volver Como Logico
	
	indice <- buscarLibre(idMateria, tamanio)
	volver <- Falso
	
	Mientras (volver = Falso) Hacer
		Escribir "Desea crear una nueva materia? (s/n)"
		Leer op
		
		Mientras (op <> 's') y (op <> 'n') Hacer
			Limpiar Pantalla
			Escribir "ERROR:la opción ingresada es inválida."
			Escribir "Desea crear un nuevo perfil? (s/n)"
			Leer op
		FinMientras
		
		Si (op <> 'n') Entonces
			
			//nombre
			nombre <- pedirCadena("Ingrese el nombre de la materia: ")
			
			idMateria[indice] <- indice;
			matrizMateria[indice, 1] <- nombre
			
			Limpiar Pantalla
			Escribir "Alta exitosa"
		SiNo
			volver <- Verdadero
		FinSi
	FinMientras
FinFuncion

//-----------------------------------------------------------------------------------------\\
//BAJA MATERIA DESDE ADMIN
Funcion bajaMateria(idMateria Por Referencia, matrizMateria Por Referencia, tamanio Por Valor)
	Definir id Como Entero
	Definir confirmar Como Logico
	Definir volver Como Logico
	Definir seleccion Como Caracter
	Definir limite como Entero
	
	confirmar <- Falso
	volver <- Falso
	seleccion <- 'n'
	limite <- buscarLibre(idMateria, tamanio)
	
	Mientras (confirmar = Falso) y (volver = Falso) Hacer
		
		mostrarMaterias(matrizMateria, idMateria, limite)
		Escribir "Ingresa ID de la materia a eliminar o 0 para volver: "
		Leer id
		
		Mientras (id < 0) o (id > limite) Hacer
			Limpiar Pantalla
			Escribir "ERROR: El ID ingresado es inválido"
			mostrarMaterias(matrizMateria, idMateria, limite)
			Escribir "Ingresa el ID de la materia a eliminar o 0 para volver: "
			Leer id
		FinMientras
		
		Si(id <> 0) Entonces
			Limpiar Pantalla
			
			Escribir "Eliminará la siguiente materia: "
			mostrarMateria(matrizMateria, id)
			Escribir "¿Es correcto (s/n)?"
			Leer seleccion
			
			Mientras (seleccion <> 's') y (seleccion <> 'n') Hacer
				Limpiar Pantalla
				
				Escribir "ERROR: la opción ingresada es inválida."
				mostrarMateria(matrizMateria, id)
				Escribir "¿Desea eliminar a la materia (s/n)?"
				Leer seleccion
			FinMientras
			
			Si (seleccion = 'n') Entonces
				confirmar <- Verdadero
			FinSi
			
			Si (seleccion = 's') Entonces
				confirmar <- Verdadero
				Limpiar Pantalla
				mostrarMateria(matrizMateria, id)
				Escribir "La materia ha sido eliminado"
				idMateria[id] <- -1
			FinSi
		SiNo
			volver <- Verdadero
		FinSi
	FinMientras
	
FinFuncion

//-----------------------------------------------------------------------------------------\\
//MODIFICAR MATERIA DESDE ADMIN
Funcion modificarMateria(idMateria Por Referencia, matrizMateria Por Referencia, tamanio Por Valor)
	
	Definir id, seleccion, limite Como Entero
	Definir confirmar, error Como Logico
	Definir nombre Como Cadena
	
	error <- Falso
	confirmar <- Falso
	limite <- buscarLibre(idMateria, tamanio)
	
	Repetir
		
		Repetir
			Limpiar Pantalla
			Si (error = Verdadero) Entonces
				Escribir "Error: El ID ingresado es inválido"
			FinSi
			
			mostrarMaterias(matrizMateria, idMateria, limite)
			
			Escribir "Elija el ID de la materia a modificar: "
			Leer id
			
			error <- Falso
			
			Si (id < 0) o (id >= limite) Entonces
				error <- Verdadero
			FinSi
		Hasta Que (error = Falso)
		
		Si (id <> 0) Entonces
			seleccion <- subMenuModificarMateria(matrizMateria, id)
			Segun seleccion Hacer
				1:
					nombre <- pedirCadena("Elija el nuevo nombre de la materia: ")
					matrizMateria[id, 1] <- nombre
			Fin Segun
		FinSi
	Hasta Que (confirmar = Falso) o (id = 0)
FinFuncion

//-----------------------------------------------------------------------------------------\\
//SUBMENU PARA MODIFICAR
Funcion retorno <- subMenuModificarMateria(matrizMateria Por Referencia, indice Por Valor)
	Definir error Como Logico
	error <- Falso
	Limpiar Pantalla
	Repetir 
		si error = Verdadero Entonces
			Limpiar Pantalla
			Escribir "ERROR: La opción es inválida"
			pausa
		FinSi
		Escribir "Datos de la materia a modificar"
		mostrarMateria(matrizMateria, indice)
		salto
		Escribir "1. Nombre"
		Escribir "0. Salir"
		
		Escribir "Ingrese cuál desea modificar: "
		leer retorno
		error <- Falso
		si (retorno > 1) o (retorno < 0) Entonces
			error <- Verdadero
		FinSi
	Hasta Que error = Falso
FinFuncion

//-----------------------------------------------------------------------------------------\\
//ENCABEZADO
Funcion encabezadoMostrarMateria
	salto
	Escribir "ID    NOMBRE"
FinFuncion
//-----------------------------------------------------------------------------------------\\
//MOSTRAR MATERIA
Funcion mostrarMateria(matrizMateria Por Referencia, indice Por Valor)
	Escribir indice, "     ", matrizMateria[indice, 1]
FinFuncion

//-----------------------------------------------------------------------------------------\\
//MOSTRAR MATERIAS
Funcion mostrarMaterias(matrizMateria Por Referencia, idMateria Por Referencia, tamanio Por Valor)
	encabezadoMostrarMateria
	Para i <- 1 Hasta tamanio Con Paso 1 Hacer
		Si (idMateria[i] > 0) Entonces
			mostrarMateria(matrizMateria, i) 
		FinSi
	Fin Para
FinFuncion

//-----------------------------------------------------------------------------------------\\
//PEDIR CADENAS
Funcion retorno <- pedirCadena(mensaje Por Valor)
	Definir error Como Logico
	error <- Falso
	
	Limpiar Pantalla
	Repetir 
		Si (error = Verdadero) Entonces
			Escribir "ERROR: el número ingresado es inválido."
		FinSi
		
		Escribir mensaje
		leer retorno
		
		error <- Falso
		Si (longitud(retorno) < 2)Entonces
			error <- Verdadero
		FinSi
	Hasta Que (error = Falso)
FinFuncion

//-----------------------------------------------------------------------------------------\\
Funcion retorno <- pedirNumero(mensaje Por Valor, limiteInferior Por Valor, limiteSuperior Por Valor)
	Definir error Como Logico
	Definir auxiliar Como Entero
	error <- Falso
	
	Limpiar Pantalla
	Repetir 
		Si (error = Verdadero) Entonces
			Escribir "ERROR: el número ingresado es inválido"
		FinSi
		
		Escribir mensaje
		Leer retorno
		error <- Falso
		Si (retorno < limiteInferior) o (retorno > limiteSuperior) Entonces
			error <- Verdadero
		FinSi
	Hasta Que (error = Falso)
FinFuncion

//FIN FUNCIONES DEL ABM

//----------------------------------------------------------------------------------------------------------------------------------------------------------
//BASE DE DATOS

Funcion cargaBBDDPrueba (idPlanesDeEstudio Por Referencia,idEstudiante Por Referencia,idDocente Por Referencia,idMateria Por Referencia, planDeEstudios Por Referencia,admin Por Referencia,estudiante Por Referencia,docente Por Referencia,materia Por Referencia,planDeEstudios_estudiante Por Referencia,planesDeEstudios_materias Por Referencia, materia_estudiantes Por Referencia, materia_docente Por Referencia,estudiante_materia_notas Por Referencia,examen Por Referencia, cantMaterias por valor, cantEstudiantes por Valor)
	//-----------------------------------------------------------------------------------------\\
	//CARRERAS	
	
	planDeEstudios[1,1] <- "Informática Aplicada"
	planDeEstudios[2,1] <- "Control Eléctrico y Acondicionamientos"
	planDeEstudios[3,1] <- "Mecánica, Automotores y Máquinas Térmicas"
	planDeEstudios[4,1] <- "Automatización y Roboótica"
	planDeEstudios[5,1] <- "Electrónica"
	planDeEstudios[6,1] <- "Automatización y Robótica"
	planDeEstudios[7,1] <- "Química y Química Aplicada"
	planDeEstudios[8,1] <- "Física y Física Aplicada"
	planDeEstudios[9,1] <- "Diseño Tecnológico"
	
	//-----------------------------------------------------------------------------------------\\
	//DATOS ADMIN
	
	admin[1,1]<-"admin"
	admin[1,2]<-"falafel"
	
	//-----------------------------------------------------------------------------------------\\
	//ESTUDIANTES INSCRIPTOS (nombre, apellido, DNI, Nusr, pwd)
	
	idEstudiante[1] <- 1
	estudiante[1,1] <- "Juan"
	estudiante[1,2] <- "Pérez"
	estudiante[1,3] <- "34089023"
	estudiante[1,4] <- "usuario1"
	estudiante[1,5] <- "contraseña1"
	
	idEstudiante[2] <- 2
	estudiante[2,1] <- "María"
	estudiante[2,2] <- "Gómez"
	estudiante[2,3] <- "34888885"
	estudiante[2,4] <- "usuario2"
	estudiante[2,5] <- "contraseña2"
	
	idEstudiante[3] <- 3
	estudiante[3,1] <- "Daniel"
	estudiante[3,2] <- "Mitsnik"
	estudiante[3,3] <- "31076523"
	estudiante[3,4] <- "usuario3"
	estudiante[3,5] <- "contraseña3"
	
	idEstudiante[4] <- 4
	estudiante[4,1] <- "Esteban"
	estudiante[4,2] <- "Caruzzini"
	estudiante[4,3] <- "59365778"
	estudiante[4,4] <- "usuario4"
	estudiante[4,5] <- "contraseña4"
	
	
	idEstudiante[5] <- 5
	estudiante[5, 1] <- "Luis"
	estudiante[5, 2] <- "García"
	estudiante[5, 3] <- "41890765"			
	estudiante[5,4] <- "usuario5"
	estudiante[5,5] <- "contraseña5"
	
	idEstudiante[6] <- 6
	estudiante[6, 1] <- "Ana"
	estudiante[6, 2] <- "López"
	estudiante[6, 3] <- "23789654"
	estudiante[6,4] <- "usuario6"
	estudiante[6,5] <- "contraseña6"	
	
	idEstudiante[7] <- 7
	estudiante[7, 1] <- "Carolina"
	estudiante[7, 2] <- "Ramírez"
	estudiante[7, 3] <- "59012345"
	estudiante[7,4] <- "usuario7"
	estudiante[7,5] <- "contraseña7"
	
	idEstudiante[8] <- 8
	estudiante[8, 1] <- "Pedro"
	estudiante[8, 2] <- "Martínez"
	estudiante[8, 3] <- "45678901"
	estudiante[8,4] <- "usuario8"
	estudiante[8,5] <- "contraseña8"
	
	idEstudiante[9] <- 9
	estudiante[9, 1] <- "Sofía"
	estudiante[9, 2] <- "Díaz"
	estudiante[9, 3] <- "89012345"
	estudiante[9,4] <- "usuario9"
	estudiante[9,5] <- "contraseña9"
	
	idEstudiante[10] <- 10
	estudiante[10, 1] <- "Alejandro"
	estudiante[10, 2] <- "Fernández"
	estudiante[10, 3] <- "78901234"
	estudiante[10,4] <- "usuario10"
	estudiante[10,5] <- "contraseña10"
	
	idEstudiante[11] <- 11
	estudiante[11, 1] <- "Lucía"
	estudiante[11, 2] <- "Giménez"
	estudiante[11, 3] <- "65432109"
	estudiante[11, 4] <- "usuario11"
	estudiante[11, 5] <- "contraseña11"
	
	
	idEstudiante[12] <- 12
	estudiante[12, 1] <- "Ricardo"
	estudiante[12, 2] <- "Ortega"
	estudiante[12, 3] <- "12345678"
	estudiante[12,4] <- "usuario12"
	estudiante[12,5] <- "contraseña12"
	
	idEstudiante[13] <- 13
	estudiante[13, 1] <- "Elena"
	estudiante[13, 2] <- "Silva"
	estudiante[13, 3] <- "90876543"
	estudiante[13,4] <- "usuario13"
	estudiante[13,5] <- "contraseña13"	
	
	idEstudiante[14] <- 14
	estudiante[14, 1] <- "Javier"
	estudiante[14, 2] <- "Hernández"
	estudiante[14, 3] <- "23456789"
	estudiante[14,4] <- "usuario14"
	estudiante[14,5] <- "contraseña14"
	
	idEstudiante[15] <- 15
	estudiante[15, 1] <- "Valentina"
	estudiante[15, 2] <- "Lara"
	estudiante[15, 3] <- "45671234"
	estudiante[15,4] <- "usuario15"
	estudiante[15,5] <- "contraseña15"
	
	idEstudiante[16] <- 16
	estudiante[16, 1] <- "Hugo"
	estudiante[16, 2] <- "Gómez"
	estudiante[16, 3] <- "56782345"
	estudiante[16,4] <- "usuario16"
	estudiante[16,5] <- "contraseña16"
	
	idEstudiante[17] <- 17
	estudiante[17, 1] <- "Isabel"
	estudiante[17, 2] <- "Vargas"
	estudiante[17, 3] <- "98765432"
	estudiante[17,4] <- "usuario17"
	estudiante[17,5] <- "contraseña17"
	
	idEstudiante[18] <- 18
	estudiante[18, 1] <- "Camila"
	estudiante[18, 2] <- "Torres"
	estudiante[18, 3] <- "23451234"
	estudiante[18,4] <- "usuario18"
	estudiante[18,5] <- "contraseña18"
	
	idEstudiante[19] <- 19
	estudiante[19, 1] <- "Mariano"
	estudiante[19, 2] <- "Ferreira"
	estudiante[19, 3] <- "76542345"
	estudiante[19,4] <- "usuario19"
	estudiante[19,5] <- "contraseña19"
	
	idEstudiante[20] <- 20
	estudiante[20, 1] <- "Diego"
	estudiante[20, 2] <- "Sánchez"
	estudiante[20, 3] <- "54328901"
	estudiante[20,4] <- "usuario20"
	estudiante[20,5] <- "contraseña20"
	
	//-----------------------------------------------------------------------------------------\\
	//NÓMINA DOCENTE (nombre, apellido, DNI, Nusr, pwd)
	
	idDocente[1] <- 1
	docente[1,1] <- "Carolina"
	docente[1,2] <- "Chávez"
	docente[1,3] <- "34085099"
	docente[1,4] <- "cchavez"
	docente[1,5] <- "ilovemath"
	
	idDocente[2] <- 2
	docente[2,1] <- "Alejandro"
	docente[2,2] <- "Behringer"
	docente[2,3] <- "18955488"
	docente[2,4] <- "alebehri"
	docente[2,5] <- "bubblesort"
	
	//Carga asisida con inteligencia artificial
	
	idDocente[3] <- 3
	docente[3, 1] <- "María"
	docente[3, 2] <- "González"
	docente[3, 3] <- "56789012"
	docente[3,4] <- "docente3"
	docente[3,5] <- "contraseña3"
	
	idDocente[4] <- 4
	docente[4, 1] <- "Luis"
	docente[4, 2] <- "Martínez"
	docente[4, 3] <- "12345678"
	docente[4,4] <- "docente4"
	docente[4,5] <- "contraseña4"
	
	idDocente[5] <- 5
	docente[5, 1] <- "Ana"
	docente[5, 2] <- "López"
	docente[5, 3] <- "98765432"
	docente[5,4] <- "docente5"
	docente[5,5] <- "contraseña5"
	
	idDocente[6] <- 6
	docente[6, 1] <- "Pedro"
	docente[6, 2] <- "Rodríguez"
	docente[6, 3] <- "45678901"
	docente[6,4] <- "docente6"
	docente[6,5] <- "contraseña6"
	
	idDocente[7] <- 7
	docente[7, 1] <- "Laura"
	docente[7, 2] <- "Fernández"
	docente[7, 3] <- "76543210"
	docente[7,4] <- "docente7"
	docente[7,5] <- "contraseña7"
	
	idDocente[8] <- 8
	docente[8, 1] <- "Diego"
	docente[8, 2] <- "Sánchez"
	docente[8, 3] <- "23456789"
	docente[8,4] <- "docente8"
	docente[8,5] <- "contraseña8"
	
	idDocente[9] <- 9
	docente[9, 1] <- "Sofía"
	docente[9, 2] <- "Díaz"
	docente[9, 3] <- "89012345"
	docente[9,4] <- "docente9"
	docente[9,5] <- "contraseña9"
	
	idDocente[10] <- 10
	docente[10, 1] <- "Andrés"
	docente[10, 2] <- "Torres"
	docente[10, 3] <- "54321098"
	docente[10,4] <- "docente10"
	docente[10,5] <- "contraseña10"
	
	idDocente[11] <- 11
	docente[11, 1] <- "Elena"
	docente[11, 2] <- "Ramírez"
	docente[11, 3] <- "67890123"
	docente[3,4] <- "docente11"
	docente[3,5] <- "contraseña11"
	
	idDocente[12] <-12 
	docente[12, 1] <- "Javier"
	docente[12, 2] <- "Hernández"
	docente[12, 3] <- "32109876"
	docente[12,4] <- "docente12"
	docente[12,5] <- "contraseña12"
	
	idDocente[13] <- 13
	docente[13, 1] <- "Valentina"
	docente[13, 2] <- "Lara"
	docente[13, 3] <- "89012345"
	docente[13,4] <- "docente13"
	docente[13,5] <- "contraseña13"
	
	idDocente[14] <- 14
	docente[14, 1] <- "Hugo"
	docente[14, 2] <- "Gómez"
	docente[14, 3] <- "56789012"
	docente[14,4] <- "docente14"
	docente[14,5] <- "contraseña14"
	
	idDocente[15] <- 15
	docente[15, 1] <- "Isabel"
	docente[15, 2] <- "Vargas"
	docente[15, 3] <- "98765432"
	docente[15,4] <- "docente15"
	docente[15,5] <- "contraseña15"
	
	idDocente[16] <- 16
	docente[16, 1] <- "Ricardo"
	docente[16, 2] <- "Ortega"
	docente[16, 3] <- "23456789"
	docente[16,4] <- "docente16"
	docente[16,5] <- "contraseña16"
	
	idDocente[17] <- 17
	docente[17, 1] <- "Camila"
	docente[17, 2] <- "Silva"
	docente[17, 3] <- "12345678"
	docente[17,4] <- "docente17"
	docente[17,5] <- "contraseña17"
	
	
	idDocente[18] <- 18
	docente[18, 1] <- "Mariano"
	docente[18, 2] <- "Ferreira"
	docente[18, 3] <- "76543210"
	docente[18,4] <- "docente18"
	docente[18,5] <- "contraseña18"
	
	idDocente[19] <- 19
	docente[19, 1] <- "Lucía"
	docente[19, 2] <- "Mendoza"
	docente[19, 3] <- "45678901"
	docente[19,4] <- "docente19"
	docente[19,5] <- "contraseña19"
	
	idDocente[20] <- 20
	docente[20, 1] <- "Daniel"
	docente[20, 2] <- "Luna"
	docente[20, 3] <- "34085099"
	docente[20,4] <- "docente20"
	docente[20,5] <- "contraseña20"
	
	//-----------------------------------------------------------------------------------------\\
	//MATERIAS
	
	idMateria[1] <- 1
	materia[1,1] <- "Análisis Matemático I"
	materia[1,2] <- "?"
	
	idMateria[2] <- 2
	materia[2,1] <- "Álgebra, Probabilidad y Estadística"
	materia[2,2] <- "?"
	
	idMateria[3] <- 3
	materia[3,1] <- "Laboratorio"
	materia[3,2] <- "?"
	
	idMateria[4] <- 4
	materia[4,1] <- "Programación I"
	materia[4,2] <- "?"
	
	idMateria[5] <- 5
	materia[5,1] <- "Inglés Técnico I"
	materia[5,2] <- "?"
	
	idMateria[6] <- 6
	materia[6,1] <- "Economía y Organización"
	materia[6,2] <- "?"
	
	idMateria[7] <- 7
	materia[7,1] <- "Complementos de Física y Química"
	materia[7,2] <- "?"
	
	idMateria[8] <- 8
	materia[8,1] <- "Modelos Discretos"
	materia[8,2] <- "?"
	
	idMateria[9] <- 9
	materia[9,1] <- "Análisis Matemático II"
	materia[9,2] <- "?"
	
	idMateria[10] <- 10
	materia[10,1] <- "Programación II"
	materia[10,2] <- "?"
	
	idMateria[11] <- 11
	materia[11,1] <- "Sistemas de Computación I"
	materia[11,2] <- "?"
	
	idMateria[12] <- 12
	materia[12,1] <- "Estructura y Base de Datos"
	materia[12,2] <- "?"
	
	idMateria[13] <- 13
	materia[13,1] <- "Inglés Técnico II"
	materia[13,2] <- "?"
	
	idMateria[14] <- 14
	materia[14,1] <- "Probabilidad Aplicada"
	materia[14,2] <- "?"
	
	idMateria[15] <- 15
	materia[15,1] <- "Técnicas Digitales / Página Web"
	materia[15,2] <- "?"
	
	idMateria[16] <- 16
	materia[16,1] <- "Programación III"
	materia[16,2] <- "?"
	
	idMateria[17] <- 17
	materia[17,1] <- "Sistemas de Computación II"
	materia[17,2] <- "?"
	
	idMateria[18] <- 18
	materia[18,1] <- "Seminario"
	materia[18,2] <- "?"
	
	idMateria[19] <- 19
	materia[19,1] <- "Inglés Técnico III"
	materia[19,2] <- "?"
	
	idMateria[20] <- 20
	materia[20,1] <- "Problemática de la Realidad Contemporánea"
	materia[20,2] <- "?"
	
	//-----------------------------------------------------------------------------------------\\
	//1er parametro es Id del plan de estudios
	//2do, orden de inscripcion
	//el valor cargado es el id del estudiante
	
	planDeEstudios_estudiante[1,1] <- 1
	planDeEstudios_estudiante[1,2] <- 2
	planDeEstudios_estudiante[1,3] <- 3
	planDeEstudios_estudiante[1,4] <- 4
	
	//-----------------------------------------------------------------------------------------\\
	
	//1er parametro es Id del plan de estudios
	//2do, orden de inscripcion
	//el valor cargado es el id (index) de la materia
	
	Para m <- 1 Hasta 20 Con Paso 1 Hacer
		planesDeEstudios_materias[1,m] <- m
	Fin Para
	
	//-----------------------------------------------------------------------------------------\\
	//el n° cargado en el campo corresponde al idUsuario del estudiante inscripto.
	//el 1er paramentro es el id de la materia, el 2do el orden de inscripcion
	
	materia_estudiantes[1,1] <- 1
	materia_estudiantes[1,2] <- 2
	materia_estudiantes[1,3] <- 3
	materia_estudiantes[1,4] <- 4
	materia_estudiantes[1,5] <- 5
	materia_estudiantes[1,6] <- 6
	materia_estudiantes[1,7] <- 7
	materia_estudiantes[1,8] <- 8
	materia_estudiantes[1,9] <- 9
	materia_estudiantes[1,10] <- 10
	
	materia_estudiantes[2,1] <- 1
	materia_estudiantes[2,2] <- 2
	materia_estudiantes[2,3] <- 3
	materia_estudiantes[2,4] <- 4
	materia_estudiantes[2,5] <- 5
	materia_estudiantes[2,6] <- 6
	materia_estudiantes[2,7] <- 7
	materia_estudiantes[2,8] <- 8
	materia_estudiantes[2,9] <- 9
	materia_estudiantes[2,10] <- 10
	
	materia_estudiantes[3,1] <- 1
	materia_estudiantes[3,2] <- 2
	materia_estudiantes[3,3] <- 3
	materia_estudiantes[3,4] <- 4
	materia_estudiantes[3,5] <- 5
	materia_estudiantes[3,6] <- 6
	materia_estudiantes[3,7] <- 7
	materia_estudiantes[3,8] <- 8
	materia_estudiantes[3,9] <- 9
	materia_estudiantes[3,10] <- 10
	
	
	materia_estudiantes[4,1] <- 1
	materia_estudiantes[4,2] <- 2
	materia_estudiantes[4,3] <- 3
	materia_estudiantes[4,4] <- 4
	materia_estudiantes[4,5] <- 5
	materia_estudiantes[4,6] <- 6
	materia_estudiantes[4,7] <- 7
	materia_estudiantes[4,8] <- 8
	materia_estudiantes[4,9] <- 9
	materia_estudiantes[4,10] <- 10
	
	materia_estudiantes[5,1] <- 1
	materia_estudiantes[5,2] <- 2
	materia_estudiantes[5,3] <- 3
	materia_estudiantes[5,4] <- 4
	materia_estudiantes[5,5] <- 5
	materia_estudiantes[5,6] <- 6
	materia_estudiantes[5,7] <- 7
	materia_estudiantes[5,8] <- 8
	materia_estudiantes[5,9] <- 9
	
	materia_estudiantes[6,10] <- 10
	materia_estudiantes[6,1] <- 1
	materia_estudiantes[6,2] <- 2
	materia_estudiantes[6,3] <- 3
	materia_estudiantes[6,4] <- 4
	materia_estudiantes[6,5] <- 5
	materia_estudiantes[6,6] <- 6
	materia_estudiantes[6,7] <- 7
	materia_estudiantes[6,8] <- 8
	materia_estudiantes[6,9] <- 9
	materia_estudiantes[6,10] <- 10
	
	materia_estudiantes[7,1] <- 1
	materia_estudiantes[7,2] <- 2
	materia_estudiantes[7,3] <- 3
	materia_estudiantes[7,4] <- 4
	materia_estudiantes[7,5] <- 5
	materia_estudiantes[7,6] <- 6
	materia_estudiantes[7,7] <- 7
	materia_estudiantes[7,8] <- 8
	materia_estudiantes[7,9] <- 9
	materia_estudiantes[7,10] <- 10
	
	materia_estudiantes[8,1] <- 11
	materia_estudiantes[8,2] <- 12
	materia_estudiantes[8,3] <- 13
	materia_estudiantes[8,4] <- 14
	materia_estudiantes[8,5] <- 15
	materia_estudiantes[8,6] <- 16
	materia_estudiantes[8,7] <- 17
	materia_estudiantes[8,8] <- 18
	materia_estudiantes[8,9] <- 19
	materia_estudiantes[8,10] <- 20
	
	materia_estudiantes[9,1] <- 11
	materia_estudiantes[9,2] <- 12
	materia_estudiantes[9,3] <- 13
	materia_estudiantes[9,4] <- 14
	materia_estudiantes[9,5] <- 15
	materia_estudiantes[9,6] <- 16
	materia_estudiantes[9,7] <- 17
	materia_estudiantes[9,8] <- 18
	materia_estudiantes[9,9] <- 19
	materia_estudiantes[9,10] <- 20
	
	materia_estudiantes[10,1] <- 11
	materia_estudiantes[10,2] <- 12
	materia_estudiantes[10,3] <- 13
	materia_estudiantes[10,4] <- 14
	materia_estudiantes[10,5] <- 15
	materia_estudiantes[10,6] <- 16
	materia_estudiantes[10,7] <- 17
	materia_estudiantes[10,8] <- 18
	materia_estudiantes[10,9] <- 19
	materia_estudiantes[10,10] <- 20
	
	materia_estudiantes[11,1] <- 11
	materia_estudiantes[11,2] <- 12
	materia_estudiantes[11,3] <- 13
	materia_estudiantes[11,4] <- 14
	materia_estudiantes[11,5] <- 15
	materia_estudiantes[11,6] <- 16
	materia_estudiantes[11,7] <- 17
	materia_estudiantes[11,8] <- 18
	materia_estudiantes[11,9] <- 19
	materia_estudiantes[11,10] <- 20
	
	materia_estudiantes[12,1] <- 11
	materia_estudiantes[12,2] <- 12
	materia_estudiantes[12,3] <- 13
	materia_estudiantes[12,4] <- 14
	materia_estudiantes[12,5] <- 15
	materia_estudiantes[12,6] <- 16
	materia_estudiantes[12,7] <- 17
	materia_estudiantes[12,8] <- 18
	materia_estudiantes[12,9] <- 19
	materia_estudiantes[12,10] <- 20
	
	materia_estudiantes[13,1] <- 11
	materia_estudiantes[13,2] <- 12
	materia_estudiantes[13,3] <- 13
	materia_estudiantes[13,4] <- 14
	materia_estudiantes[13,5] <- 15
	materia_estudiantes[13,6] <- 16
	materia_estudiantes[13,7] <- 17
	materia_estudiantes[13,8] <- 18
	materia_estudiantes[13,9] <- 19
	materia_estudiantes[13,10] <- 20
	
	materia_estudiantes[14,1] <- 11
	materia_estudiantes[14,2] <- 12
	materia_estudiantes[14,3] <- 13
	materia_estudiantes[14,4] <- 14
	materia_estudiantes[14,5] <- 15
	materia_estudiantes[14,6] <- 16
	materia_estudiantes[14,7] <- 17
	materia_estudiantes[14,8] <- 18
	materia_estudiantes[14,9] <- 19
	materia_estudiantes[14,10] <- 20
	
	//-----------------------------------------------------------------------------------------\\
	//el n° cargado en el campo corresponde al id (index) del docente a cargo de la materia.
	//el 1er parametro es el id de la materia, el 2do el cargo en la catedra (1 profesor a cargo, 2 ayudante) 
	materia_docente[1,1] <- 1
	materia_docente[2,1] <- 2
	materia_docente[3,1] <- 3
	materia_docente[4,1] <- 4
	materia_docente[5,1] <- 5
	materia_docente[6,1] <- 6
	materia_docente[7,1] <- 7
	materia_docente[8,1] <- 8
	materia_docente[9,1] <- 9
	materia_docente[10,1] <- 10
	
	//asignacion al azar de docentes para prueba
	Para mat <- 11 Hasta cantMaterias Con Paso 1 Hacer
		materia_docente[mat,1] <- mat
	Fin Para
	
	//-----------------------------------------------------------------------------------------\\
	//el n° cargado en el campo corresponde a la nota
	//el 1er paramentro es el id del estudinte, el 2do el id de la materia,el 3ro el n° de nota
	//(1er parcial, 2do parcal 3er parcial, nota final... si la nota final es mayor a la nota de aprobacion la materia esta aprobada)
	
	estudiante_materia_notas[1,1,1] <- 7
	estudiante_materia_notas[1,1,2] <- 6
	estudiante_materia_notas[1,1,3] <- 8
	estudiante_materia_notas[1,1,4] <- 7
	
	Para iEst<-1 Hasta 20 Con Paso 1 Hacer
		Para iMat<-1 Hasta 7 Con Paso 1 Hacer
			estudiante_materia_notas[iEst,iMat,1] <- azar(10+1)
			estudiante_materia_notas[iEst,iMat,2] <- azar(10+1)
			estudiante_materia_notas[iEst,iMat,3] <- azar(10+1)
			estudiante_materia_notas[iEst,iMat,4] <- azar(10+1)
		Fin Para
	Fin Para
	
	//----------------------------------------------------------------------------
	//carga examenes para prueba. 
	//el sedundo la materia por id , el terero el dia, el cuarto el id del alumno inscripto inscripcion.
	//el valor cargado es el id del estudiante inscripto
	//si el valor cargado en el 1 orden de inscripcion es negativo, el examen no esta habiitado para inscripcion. 
	//si es 0, esta habilitado, pero sin inscriptos
	
	Para matExamen<-1 hasta cantMaterias Con Paso 1 Hacer
		Para dia<-1 hasta 31  Con Paso 1 Hacer
			Para mes<-1 Hasta 12 Con Paso 1 Hacer
				Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
					examen[matExamen,dia,mes,inscriptos] <- -1
				Fin Para
			Fin Para
		Fin Para
	Fin Para
	
	examen[1,31,12,1]<-1
	examen[1,31,12,2]<-2
	examen[1,31,12,3]<-3
	
	Para inscriptos<-1 Hasta cantEstudiantes Con Paso 1 Hacer
		examen[1,5,5,inscriptos] <- 0
	Fin Para
	
FinFuncion