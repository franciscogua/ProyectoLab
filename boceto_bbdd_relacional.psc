Algoritmo boceto_bbdd_relacional
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
	
	dimension materia_estudiantes[cantMaterias,cantEstudiantes]
	dimension materia_docente[cantMaterias,cantDocentes]
	
	dimension planDeEstudios_estudiante[cantPlanesDeEstudio,cantEstudiantes]
	dimension planesDeEstudios_materias[cantPlanesDeEstudio,cantMaterias]
	
	
	dimension estudiante_materia_notas[cantEstudiantes,cantMaterias,cantNotas]
	
	/////////////////////////////////////////////////////////////////////
	planDeEstudios[1,1]<-"informatica aplicada"
	planDeEstudios[2,1]<-"control electrico y acondisionameientos"
	planDeEstudios[3,1]<-"imecanica,automotores y maquinas térmicas"
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
	estudiante[1,4]<-"nombre_usr4"
	estudiante[1,5]<-"contraseña4"
	
	
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
	
	materia_estudiantes[2,1]<-2
	materia_estudiantes[2,2]<-4
	
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

	escribir "ingrese id estudiante:"
	leer i
	escribir "ingrese id Materia:"
	leer j
	
	escribir "la notas de " estudiante[i,2] "en " materia[j,1] " son:"
	escribir "en el primer parcial:" estudiante_materia_notas[i,j,1]
	escribir "en el segundo parcial:" estudiante_materia_notas[i,j,2]
	escribir "en el tercer parcial:" estudiante_materia_notas[i,j,3]
	escribir "la nota final fue de:" estudiante_materia_notas[i,j,4]

		
FinAlgoritmo




