% ==== DESCARGA DE MÓDULOS E IMÁGENES ==== %
:- encoding(utf8). % Esto permite agregar acentos y caracteres especiales
:-use_module(library(pce)). % libreria para que se muestre la interfaz
:-use_module(library(pce_style_item)).% se ocupa para estilos de letra y colores
:-pce_image_directory('./images'). % acceso a donde se tiene guardada la carpeta de la imagen
:- dynamic color/3. %Numero de colores que se utilizan
resource(pizarronutc, image, image('fondoJuego.jpg')). % instruccion para cargar la imagen en la carpeta que esta almacenada .jpg
resource(li, image, image('fondoInicio.jpg')).
resource(descripcion, image, image('descripcion.jpg')).
resource(minion,image,image('minion.jpg')).

agregar_imagen(Pantalla, Imagen, X, Y):-new(Figura, figure),                  %variables y funciones que se utilizan para que se pueda visualizar la imagen mediante la  interfaz grafica con posición arbitraria
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(X,Y)).

imagen_portada(Pantalla, Imagen) :- agregar_imagen(Pantalla, Imagen, 0, 0).
% Función inicial de portada, pero especificando la posición inicial


inicio:- %Inicio de nuestro programa, creando el objeto de dialogo con la variable D


 new(D,dialog('PIA',size(800,2350))),% inicio de nuestra interfaz pantallaResultado



 %llama a los label y los adjunta para mostrarlos en la ventana pantallaResultado
imagen_portada(D, li),
 
%crea el boton que almacenamos en nuestra variable para la funcion que se ha programado anteriormente
 new(Boton1,button('Iniciar',and(message(@prolog,pantallaResultado),
 and(message(D,open),message(D,free))))),
 send(Boton1,colour,blue),
 new(Bcancelar,button('Anular',and(message(D,destroy),message(D,free)))),
 send(Bcancelar,colour,blue),

new(Boton3,button('Carreras',and(message(@prolog,main2),
 and(message(D,open),message(D,free))))),
 send(Boton3,colour,blue),

 new(Boton4,button('Equipo',and(message(@prolog,main3),
 and(message(D,open),message(D,free))))),
 send(Boton4,colour,blue),

%llamada de los botones para que se muestren en la interfaz
 send(D,append(Boton1)),
 send(D,append(Bcancelar)),
send(D,append(Boton3)),
send(D,append(Boton4)),
  send(D,open_centered).



%llamando a la funcion pantallaResultado de nuestro boton iniciar


pantallaResultado:-
	new(D2, dialog('SISTEMA EXPERTO PC',size(500,400))), %inicio de nuestra interfaz emergente
        imagen_portada(D2, pizarronutc), % carga de imagen


	new(@texto,label(text,'')),
		new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),

    new(Boton1,button('Pantalla Incio',and(message(@prolog,inicio),
 and(message(D2,open),message(D2,free))))),

new(Boton3,button('Carreras',and(message(@prolog,main2),
 and(message(D2,open),message(D2,free))))),


%creaci�n del boton para dar inicio al TEST.

	new(@boton,button('INICIO',message(@prolog,botones))),

	new(@btncarrera,button('analisis?')), %boton para iniciar el test
	send(D2, display,@boton,point(500,200)), %Posición boton INICIO

	send(D2, display,@texto,point(350,150)), %Posición texto 
	send(D2, display,Salir,point(500,330)),  %Posición botón SALIR
    send(D2,display,Boton1,point(500,350)),
    send(D2,display,Boton3,point(500,390)),
	send(D2, display,@respl,point(400,200)), %Posición respuesta final
	send(D2,open_centered).                 %fin de la funcion





% se muestra la respuesta de tu test que realizaste por medio de las preguntas
% Muestra el texto indicado dependiendo de la carrera
resultado('ingenierO de sistemas'):-ingenieria_de_sistemas,!.
resultado(turismo):-turismo,!.
resultado(contabilidad):-contabilidad,!.
resultado(administracion):-administracion,!.
resultado(diseno):-diseno,!.
resultado(derecho):-derecho,!.
resultado(pedagogia):-pedagogia,!.
resultado(no_se_encontro_ninguna_carrera_adecuada_para_ti).


%se declran las variables de cada carrera y despues se colocan las preguntas coreespodientes

% ==== CARRERAS SISTEMA ORIGINAL ==== %
ingenieria_de_sistemas:-carrera_ingenieria_de_sistemas,
	consultar('�Eres h�bil resolviendo problemas?'),
	consultar('¿Te gusta resolver problemas matemáticos?'),
	consultar('�te interesan temas sobre tecnologia?'),
	consultar('�Tienes facilidad para ocupar computadoras?'),
	consultar('�Te gusta crear cosas?').

turismo:-carrera_turismo,
	consultar('�Tienes interes por otras culturas?'),
	consultar('¿Te gusta resolver problemas matemáticos?'),
	consultar('�Te gusta viajar?'),
	consultar('�Tienes gusto por el cuidado al patrimonio cultural?'),
	consultar('�Se te facilita adaptarte al ambiente cultural internacional?').

contabilidad:-carrera_contabilidad,
	consultar('�Te gustaria trabajar en un Banco?'),
	consultar('�Te gusta contar dinero?'),
	consultar('�Te apasionan los negocios?'),
        consultar('�Eres buen negociador?'),
        consultar('�Tienes habilidad con los numeros y sacas cuenta con facilidad?').

administracion:-carrera_administracion,
	consultar('�Eres bueno en la comunicacion continua?'),
	consultar('�Eres bueno en el manejo de tiempos?'),
	consultar('�Eres bueno para el pensamiento estrategico?'),
	consultar('�Tienes capacidad de planificar?'),
	consultar('�Te interesaria aprender ingles?').

diseno:-carrera_diseno,
         consultar('�Eres creativo?'),
	consultar('�Eres bueno dibujando?'),
	consultar('�Te gusta dise�ar arquitecturas artisticas?'),
	consultar('�Eres bueno con software de edicion?'),
	consultar('�Te gustan las pinturas?').

derecho:-carrera_derecho,
       consultar('�Tienes facilidad para argumentar?'),
       consultar('�Tienes facilidad para la expresion oral?'),
       consultar('�Tienes pasion por debatir?'),
       consultar('�Tiene capacidad para lidiar con la incertidumbre?'),
       consultar('�Te gusta la historia?').

pedagogia:-carrera_pedagogia,
       consultar('�Te gusta el aprendizaje didactico?'),
       consultar('�Te agrada las actividades recreativas?'),
       consultar('�Te gustaria crear modelos educativos que mejore la ense�anza de los profesores?'),
       consultar('�Te gustaria diseñar material didactico?'),
       consultar('�te interesa la psicologia educativa?').


no_se_encontro_ninguna_carrera_adecuada_para_ti:- dynamic no_hay_una_carrera.


%funcion de corte cada vez que se anula una pregunta de la carrera posteriormente mandara hacia la siguiente

carrera_ingenieria_de_sistemas:-consultar('�Eres h�bil resolviendo problemas?'),!.
carrera_turismo:-consultar('�Tienes interes por otras culturas?'),!.
carrera_contabilidad:-consultar('�Te gustaria trabajar en un Banco?'),!.
carrera_administracion:-consultar('�Eres bueno en la comunicacion continua?'),!.
carrera_diseno:-consultar('¿Eres creativo?'),!.
carrera_derecho:-consultar('¿Tienes facilidad para argumentar?'),!.
carrera_pedagogia:-consultar('¿Te gusta el aprendizaje didactico?'),!.




:-dynamic si/1,no/1. %suceptible a generar cambios entre verdadero o falso

preguntar(Problema):-new(A1,dialog('Pregunta')),
	new(L9,label(texto,'Responde la siguiente pregunta')),
	new(L10,label(text,Problema)),

% crear botones para si y no


	new(Z1,button(si,and(message(A1,return,si)))),
	new(Z2,button(no,and(message(A1,return,no)))),
	send(A1,gap,size(25,25)),

% llamada de los botones y ventanas emergentes

	send(A1,append(L9)),
	send(A1,append(L10)),
	send(A1,append(Z1)),
	send(A1,append(Z2)),

	send(A1,default_button,si),
	send(A1,open_centered), get(A1,confirm,Answer),
	 send(A1,destroy),

%confirmacion de respuesta si y no

 (   (Answer==si)->assert(si(Problema)); %confirma las preguntas si es si en confirmacion y si es no erroneo
 assert(no(Problema)),fail).

%cada vez que el usuario contesta una pregunta la pantalla se limpria y se vuelve a preguntar
consultar(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar:-retract(si(_)),fail.
limpiar:-retract(no(_)),fail.
limpiar.

% borrado de la ventana emergente para dar el resultado final
botones:-borrado,
	send(@boton,free),
	send(@btncarrera,free),

% resultado de la carrera elegida

resultado(Carrera),
	send(@texto, selection('Deberías comprar la siguiente computadora:')),
	send(@respl,selection(Carrera)),
	limpiar.
borrado:-send(@respl,selection('')). %fin del programa

main2:-
new(D4, dialog('PIA',size(500,400))),
	new(Label11, label(nombre,'')),send(Label11,colour,red),

        imagen_portada(D4, descripcion),
        new(Salir,button('Salir',and(message(D4,destroy),message(D4,free)))),
        new(Boton1,button('Pantalla Incio',and(message(@prolog,inicio),and(message(D4,open),message(D4,free))))),
        new(Boton3,button('De nuevo',and(message(@prolog,pantallaResultado),and(message(D4,open),message(D4,free))))),

        send(D4,display,Boton1,point(400,450)),
        send(D4,display,Boton3,point(400,430)),
        send(D4, display,Salir,point(400,400)),

  send(D4,open_centered).

main3:-
    new(D5,dialog('Equipo', size(800,1000))),
    imagen_portada(D5,minion),
    new(Salir,button('Salir',and(message(D5,destroy),message(D5,free)))),
        send(D5, display,Salir,point(400,400)),
    send(D5,open_centered).

:-inicio.