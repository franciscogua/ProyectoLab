Algoritmo MenuPreAlpha
	
	Definir rol Como Entero
	Definir usuario, contraseña Como entero
		
		
		Definir cantEstudiantes Como Entero
		cantEstudiantes<-20
		definir cantDocentes como Entero
		cantDocentes<-20
		definir cantMaterias como Entero
		cantMaterias<-20
		definir cantPlanesDeEstudio como Entero
		cantPlanesDeEstudio<-10
		
		definir cantNotas como Entero
		cantNotas<-4
		
		//////////////////////////////////////////////////////////////////////
		
		Dimension idPlanesDeEstudio[cantPlanesDeEstudio]
		dimension idEstudiante[cantEstudiantes]
		dimension idDocente[cantDocentes]
		dimension idMateria[cantMaterias]
		
		dimension planDeEstudios[cantPlanesDeEstudio,2]
		dimension estudiante[cantEstudiantes,5]	
		dimension docente[cantDocentes,3]
		dimension materia[cantMaterias,2]
		
		
		dimension planDeEstudios_estudiante[cantPlanesDeEstudio,cantEstudiantes]
		dimension planesDeEstudios_materias[cantPlanesDeEstudio,cantMaterias]
		
		dimension materia_estudiantes[cantMaterias,cantEstudiantes]
		dimension materia_docente[cantMaterias,cantDocentes]
		
		dimension estudiante_materia_notas[cantEstudiantes,cantMaterias,cantNotas]
		
		dimension examen[cantMaterias,31,12,cantEstudiantes]
		
		/////////////////////////////////////////////////////////////////////
		planDeEstudios[1,1]<-"informatica aplicada"
		planDeEstudios[2,1]<-"control electrico y acondisionameientos"
		planDeEstudios[3,1]<-"mecanica,automotores y maquinas térmicas"
		planDeEstudios[4,1]<-"automatizacion y robotica"
		planDeEstudios[5,1]<-"electrónica"
		planDeEstudios[6,1]<-"automatizacion y robotica"
		planDeEstudios[7,1]<-"quimica y quimica aplicada"
		planDeEstudios[8,1]<-"fisica y fisica aplicada"
		planDeEstudios[9,1]<-"diseño tecnologico"
		
		/////////////////////////////////////////////////////////////////////
		//estudiantes inscriptos  (nombre, apellido,dni,Nusr,pwd)
		
		idEstudiante[1]<-1
		estudiante[1,1]<-"juan"
		estudiante[1,2]<-"perez"
		estudiante[1,3]<-"34089023"
		estudiante[1,4]<-"nombre_usr1"
		estudiante[1,5]<-"contraseña1"
		
		idEstudiante[2]<-2
		estudiante[2,1]<-"maria"
		estudiante[2,2]<-"gomez"
		estudiante[2,3]<-"34888885"
		estudiante[2,4]<-"nombre_usr2"
		estudiante[2,5]<-"contraseña2"
		
		
		idEstudiante[3]<-3
		estudiante[3,1]<-"daniel"
		estudiante[3,2]<-"mitsnik"
		estudiante[3,3]<-"31076523"
		estudiante[3,4]<-"nombre_usr3"
		estudiante[3,5]<-"contraseña3"
		
		idEstudiante[4]<-4
		estudiante[4,1]<-"esteban"
		estudiante[4,2]<-"caruzzini"
		estudiante[4,3]<-"59365778"
		estudiante[4,4]<-"nombre_usr4"
		estudiante[4,5]<-"contraseña4"
		
		
		//sigue con de carga asisida con inteligencia artificial
		estudiante[5, 1] <- "Luis"
		estudiante[5, 2] <- "García"
		estudiante[5, 3] <- "41890765"
		
		estudiante[6, 1] <- "Ana"
		estudiante[6, 2] <- "López"
		estudiante[6, 3] <- "23789654"
		
		estudiante[7, 1] <- "Carolina"
		estudiante[7, 2] <- "Ramírez"
		estudiante[7, 3] <- "59012345"
		
		estudiante[8, 1] <- "Pedro"
		estudiante[8, 2] <- "Martínez"
		estudiante[8, 3] <- "45678901"
		
		estudiante[9, 1] <- "Sofía"
		estudiante[9, 2] <- "Díaz"
		estudiante[9, 3] <- "89012345"
		
		estudiante[10, 1] <- "Alejandro"
		estudiante[10, 2] <- "Fernández"
		estudiante[10, 3] <- "78901234"
		
		estudiante[11, 1] <- "Lucía"
		estudiante[11, 2] <- "Giménez"
		estudiante[11, 3] <- "65432109"
		
		estudiante[12, 1] <- "Ricardo"
		estudiante[12, 2] <- "Ortega"
		estudiante[12, 3] <- "12345678"
		
		estudiante[13, 1] <- "Elena"
		estudiante[13, 2] <- "Silva"
		estudiante[13, 3] <- "90876543"
		
		estudiante[14, 1] <- "Javier"
		estudiante[14, 2] <- "Hernández"
		estudiante[14, 3] <- "23456789"
		
		estudiante[15, 1] <- "Valentina"
		estudiante[15, 2] <- "Lara"
		estudiante[15, 3] <- "45671234"
		
		estudiante[16, 1] <- "Hugo"
		estudiante[16, 2] <- "Gómez"
		estudiante[16, 3] <- "56782345"
		
		estudiante[17, 1] <- "Isabel"
		estudiante[17, 2] <- "Vargas"
		estudiante[17, 3] <- "98765432"
		
		estudiante[18, 1] <- "Camila"
		estudiante[18, 2] <- "Torres"
		estudiante[18, 3] <- "23451234"
		
		estudiante[19, 1] <- "Mariano"
		estudiante[19, 2] <- "Ferreira"
		estudiante[19, 3] <- "76542345"
		
		estudiante[20, 1] <- "Diego"
		estudiante[20, 2] <- "Sánchez"
		estudiante[20, 3] <- "54328901"
		
		/////////////////////////////////////////////////////////////////////
		//nomina docente
		
		idDocente[1]<-1
		docente[1,1]<-"Carolina"
		docente[1,2]<-"Chavez"
		docente[1,3]<-"34085099"
		
		docente[2,1]<-"Alejandro"
		docente[2,2]<-"Beringher"
		docente[2,3]<-"18955488"
		
		//sigue con de carga asisida con inteligencia artificial
		
		docente[3, 1] <- "María"
		docente[3, 2] <- "González"
		docente[3, 3] <- "56789012"
		
		docente[4, 1] <- "Luis"
		docente[4, 2] <- "Martínez"
		docente[4, 3] <- "12345678"
		
		docente[5, 1] <- "Ana"
		docente[5, 2] <- "López"
		docente[5, 3] <- "98765432"
		
		docente[6, 1] <- "Pedro"
		docente[6, 2] <- "Rodríguez"
		docente[6, 3] <- "45678901"
		
		docente[7, 1] <- "Laura"
		docente[7, 2] <- "Fernández"
		docente[7, 3] <- "76543210"
		
		docente[8, 1] <- "Diego"
		docente[8, 2] <- "Sánchez"
		docente[8, 3] <- "23456789"
		
		docente[9, 1] <- "Sofía"
		docente[9, 2] <- "Díaz"
		docente[9, 3] <- "89012345"
		
		docente[10, 1] <- "Andrés"
		docente[10, 2] <- "Torres"
		docente[10, 3] <- "54321098"
		
		docente[11, 1] <- "Elena"
		docente[11, 2] <- "Ramírez"
		docente[11, 3] <- "67890123"
		
		docente[12, 1] <- "Javier"
		docente[12, 2] <- "Hernández"
		docente[12, 3] <- "32109876"
		
		docente[13, 1] <- "Valentina"
		docente[13, 2] <- "Lara"
		docente[13, 3] <- "89012345"
		
		docente[14, 1] <- "Hugo"
		docente[14, 2] <- "Gómez"
		docente[14, 3] <- "56789012"
		
		docente[15, 1] <- "Isabel"
		docente[15, 2] <- "Vargas"
		docente[15, 3] <- "98765432"
		
		docente[16, 1] <- "Ricardo"
		docente[16, 2] <- "Ortega"
		docente[16, 3] <- "23456789"
		
		docente[17, 1] <- "Camila"
		docente[17, 2] <- "Silva"
		docente[17, 3] <- "12345678"
		
		docente[18, 1] <- "Mariano"
		docente[18, 2] <- "Ferreira"
		docente[18, 3] <- "76543210"
		
		docente[19, 1] <- "Lucía"
		docente[19, 2] <- "Mendoza"
		docente[19, 3] <- "45678901"
		
		docente[20, 1] <- "Daniel"
		docente[20, 2] <- "Luna"
		docente[20, 3] <- "34085099"
			
		
		
		//////////////////////////////////////////////////////////////////////
		//materias
		
		materia[1,1] <- "Análisis Matemático I"
		materia[1,2] <- "?"
		
		materia[2,1] <- "Álgebra, Probabilidades y Estadística"
		materia[2,2] <- "?"
		
		materia[3,1] <- "Laboratorio"
		materia[3,2] <- "?"
		
		materia[4,1] <- "Programación I"
		materia[4,2] <- "?"
		
		materia[5,1] <- "Inglés Técnico I"
		materia[5,2] <- "?"
		
		materia[6,1] <- "Economía y Organización"
		materia[6,2] <- "?"
		
		materia[7,1] <- "Complementos de Física y Química"
		materia[7,2] <- "?"
		
		materia[8,1] <- "Modelos Discretos"
		materia[8,2] <- "?"
		
		materia[9,1] <- "Análisis Matemático II"
		materia[9,2] <- "?"
		
		materia[10,1] <- "Programación II"
		materia[10,2] <- "?"
		
		materia[11,1] <- "Sistemas de Computación I"
		materia[11,2] <- "?"
		
		materia[12,1] <- "Estructura y Base de Datos"
		materia[12,2] <- "?"
		
		materia[13,1] <- "Inglés Técnico II"
		materia[13,2] <- "?"
		
		materia[14,1] <- "Probabilidad Aplicada"
		materia[14,2] <- "?"
		
		materia[15,1] <- "Técnicas Digitales / Página Web"
		materia[15,2] <- "?"
		
		materia[16,1] <- "Programación III"
		materia[16,2] <- "?"
		
		materia[17,1] <- "Sistemas de Computación II"
		materia[17,2] <- "?"
		
		materia[18,1] <- "Seminario"
		materia[18,2] <- "?"
		
		materia[19,1] <- "Inglés Técnico III"
		materia[19,2] <- "?"
		
		materia[20,1] <- "Problemática de la Realidad Contemporánea"
		materia[20,2] <- "?"
		
		////////////////////////////////////////////////////////////////////
		//primer parametro es Id del plan de estudios
		//segundo, orden de inscripcion
		//el valor cargado es el id del estudiante
		
		planDeEstudios_estudiante[1,1]<-1
		planDeEstudios_estudiante[1,2]<-2
		planDeEstudios_estudiante[1,3]<-3
		planDeEstudios_estudiante[1,4]<-4
		
		
		////////////////////////////////////////////////////////////////////
		
		//primer parametro es Id del plan de estudios
		//segundo, orden de inscripcion
		//el valor cargado es el id (index)de la materia
		
		Para m <-1 Hasta 20 Con Paso 1 Hacer
			planesDeEstudios_materias[1,m]<-m
		Fin Para
		
		
		
		////////////////////////////////////////////////////////////////////	
		//el n° cargado en el campo correspond el id (index) del estudiante inscripto. el primer paramentro es el id de la materia, el segundo el orden de inscripcion
		materia_estudiantes[1,1]<-1
		materia_estudiantes[1,2]<-2
		materia_estudiantes[1,3]<-3
		materia_estudiantes[1,4]<-4
		materia_estudiantes[1,5]<-5
		materia_estudiantes[1,6]<-6
		materia_estudiantes[1,7]<-7
		materia_estudiantes[1,8]<-8
		materia_estudiantes[1,9]<-9
		materia_estudiantes[1,10]<-10
		
		materia_estudiantes[2,1]<-1
		materia_estudiantes[2,2]<-2
		materia_estudiantes[2,3]<-3
		materia_estudiantes[2,4]<-4
		materia_estudiantes[2,5]<-5
		materia_estudiantes[2,6]<-6
		materia_estudiantes[2,7]<-7
		materia_estudiantes[2,8]<-8
		materia_estudiantes[2,9]<-9
		materia_estudiantes[2,10]<-10
				
		materia_estudiantes[3,1]<-1
		materia_estudiantes[3,2]<-2
		materia_estudiantes[3,3]<-3
		materia_estudiantes[3,4]<-4
		materia_estudiantes[3,5]<-5
		materia_estudiantes[3,6]<-6
		materia_estudiantes[3,7]<-7
		materia_estudiantes[3,8]<-8
		materia_estudiantes[3,9]<-9
		materia_estudiantes[3,10]<-10
		
		
		materia_estudiantes[4,1]<-1
		materia_estudiantes[4,2]<-2
		materia_estudiantes[4,3]<-3
		materia_estudiantes[4,4]<-4
		materia_estudiantes[4,5]<-5
		materia_estudiantes[4,6]<-6
		materia_estudiantes[4,7]<-7
		materia_estudiantes[4,8]<-8
		materia_estudiantes[4,9]<-9
		materia_estudiantes[4,10]<-10
		
		materia_estudiantes[5,1]<-1
		materia_estudiantes[5,2]<-2
		materia_estudiantes[5,3]<-3
		materia_estudiantes[5,4]<-4
		materia_estudiantes[5,5]<-5
		materia_estudiantes[5,6]<-6
		materia_estudiantes[5,7]<-7
		materia_estudiantes[5,8]<-8
		materia_estudiantes[5,9]<-9
		
		materia_estudiantes[6,10]<-10
		materia_estudiantes[6,1]<-1
		materia_estudiantes[6,2]<-2
		materia_estudiantes[6,3]<-3
		materia_estudiantes[6,4]<-4
		materia_estudiantes[6,5]<-5
		materia_estudiantes[6,6]<-6
		materia_estudiantes[6,7]<-7
		materia_estudiantes[6,8]<-8
		materia_estudiantes[6,9]<-9
		materia_estudiantes[6,10]<-10
		
		materia_estudiantes[7,1]<-1
		materia_estudiantes[7,2]<-2
		materia_estudiantes[7,3]<-3
		materia_estudiantes[7,4]<-4
		materia_estudiantes[7,5]<-5
		materia_estudiantes[7,6]<-6
		materia_estudiantes[7,7]<-7
		materia_estudiantes[7,8]<-8
		materia_estudiantes[7,9]<-9
		materia_estudiantes[7,10]<-10
		
		materia_estudiantes[8,1]<-11
		materia_estudiantes[8,2]<-12
		materia_estudiantes[8,3]<-13
		materia_estudiantes[8,4]<-14
		materia_estudiantes[8,5]<-15
		materia_estudiantes[8,6]<-16
		materia_estudiantes[8,7]<-17
		materia_estudiantes[8,8]<-18
		materia_estudiantes[8,9]<-19
		materia_estudiantes[8,10]<-20
		
		materia_estudiantes[9,1]<-11
		materia_estudiantes[9,2]<-12
		materia_estudiantes[9,3]<-13
		materia_estudiantes[9,4]<-14
		materia_estudiantes[9,5]<-15
		materia_estudiantes[9,6]<-16
		materia_estudiantes[9,7]<-17
		materia_estudiantes[9,8]<-18
		materia_estudiantes[9,9]<-19
		materia_estudiantes[9,10]<-20
		
		materia_estudiantes[10,1]<-11
		materia_estudiantes[10,2]<-12
		materia_estudiantes[10,3]<-13
		materia_estudiantes[10,4]<-14
		materia_estudiantes[10,5]<-15
		materia_estudiantes[10,6]<-16
		materia_estudiantes[10,7]<-17
		materia_estudiantes[10,8]<-18
		materia_estudiantes[10,9]<-19
		materia_estudiantes[10,10]<-2
		
		materia_estudiantes[11,1]<-11
		materia_estudiantes[11,2]<-12
		materia_estudiantes[11,3]<-13
		materia_estudiantes[11,4]<-14
		materia_estudiantes[11,5]<-15
		materia_estudiantes[11,6]<-16
		materia_estudiantes[11,7]<-17
		materia_estudiantes[11,8]<-18
		materia_estudiantes[11,9]<-19
		materia_estudiantes[11,10]<-20
		
		materia_estudiantes[12,1]<-11
		materia_estudiantes[12,2]<-12
		materia_estudiantes[12,3]<-13
		materia_estudiantes[12,4]<-14
		materia_estudiantes[12,5]<-15
		materia_estudiantes[12,6]<-16
		materia_estudiantes[12,7]<-17
		materia_estudiantes[12,8]<-18
		materia_estudiantes[12,9]<-19
		materia_estudiantes[12,10]<-20
		
		materia_estudiantes[13,1]<-11
		materia_estudiantes[13,2]<-12
		materia_estudiantes[13,3]<-13
		materia_estudiantes[13,4]<-14
		materia_estudiantes[13,5]<-15
		materia_estudiantes[13,6]<-16
		materia_estudiantes[13,7]<-17
		materia_estudiantes[13,8]<-18
		materia_estudiantes[13,9]<-19
		materia_estudiantes[13,10]<-20
		
		materia_estudiantes[14,1]<-11
		materia_estudiantes[14,2]<-12
		materia_estudiantes[14,3]<-13
		materia_estudiantes[14,4]<-14
		materia_estudiantes[14,5]<-15
		materia_estudiantes[14,6]<-16
		materia_estudiantes[14,7]<-17
		materia_estudiantes[14,8]<-18
		materia_estudiantes[14,9]<-19
		materia_estudiantes[14,10]<-20
		
		
		///////////////////////////////////////////////////////////////////
		//el n° cargado en el campo correspond el id (index) del docente a cargo de la materia. el primer parametro es el id de la materia, el segundo el orden de inscripcion
		materia_docente[1,1]<-1
		materia_docente[2,1]<-2
		
		
		escribir "inscriptos en la materia " , materia[1,1], " dictada por ", docente[materia_docente[1,1],1], " " docente[materia_docente[1,1],2] " :"
		escribir estudiante[Materia_estudiantes[1,1],2]
		escribir estudiante[Materia_estudiantes[1,2],2]
		escribir estudiante[Materia_estudiantes[1,3],2]
		
		escribir "_________________________________________"
		escribir " "
		escribir "inscriptos en la materia " , materia[2,1], " dictada por ", docente[materia_docente[2,1],1], " " docente[materia_docente[2,1],2] " :"
		escribir estudiante[Materia_estudiantes[2,1],2]
		escribir estudiante[Materia_estudiantes[2,2],2]
		
		//////////////////////////////////////////////////////////////////////////////
		//el n° cargado en el campo corresponde a la nota el primerparamentro es el id del estudinte, el segundo el id de la materia,el tercero el n° de nota(1°parcial, 2°parcal 3°parcial,nota final.. si la nota final es mayor a la nota de aprobacion la materia esta aprobada)
		estudiante_materia_notas[1,1,1]<-7
		estudiante_materia_notas[1,1,2]<-6
		estudiante_materia_notas[1,1,3]<-8
		estudiante_materia_notas[1,1,4]<-7
		
		definir i,j como enteros 
		
		//escribir "ingrese id estudiante:"
		//leer i
		//escribir "ingrese id Materia:"
		//leer j
		
		//escribir "la notas de " estudiante[i,2] "en " materia[j,1] " son:"
		//escribir "en el primer parcial:" estudiante_materia_notas[i,j,1]
		//escribir "en el segundo parcial:" estudiante_materia_notas[i,j,2]
		//escribir "en el tercer parcial:" estudiante_materia_notas[i,j,3]
	   //escribir "la nota final fue de:" estudiante_materia_notas[i,j,4]
	
	
	
	
	
	
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
			
			//Para x<-1 Hasta cantEstudiantes Con Paso 1 Hacer
				//si estudiante[x,4] = usuario Entonces
					//escribir "tu id es: " , x
					//pausa
				//FinSi
			//Fin Para
			
			Segun rol Hacer
				1:
					menuAdmin(rol,usuario, contraseña)
				2:
					menuDocente(rol, usuario, contraseña)
				3:
					menuEstudiante(rol, usuario, contraseña,cantMaterias, materia, Materia_estudiantes)
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
Funcion menuEstudiante (rol Por Referencia, usuario Por Referencia, contraseña Por Referencia,cantMaterias Por referencia, materia Por Referencia Materia_estudiantes Por Referencia)
	
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
					Escribir "LAS MATERIAS EN LAS QUE ESTAS INSCRIPTO SON:"
					Para i<-1 Hasta cantMaterias Con Paso 1 Hacer
					Para j<-1 Hasta 10 Con Paso 1 Hacer
						
							si materia_estudiantes[i,j]=usuario Entonces
								escribir sin saltar materia[i,1]	
								//escribir " sus notas son: "
							FinSi
						Fin Para
						fin para
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
