:- encoding(utf8). % Esto permite agregar acentos y caracteres especiales
:-use_module(library(pce)). % libreria para que se muestre la interfaz
:-use_module(library(pce_style_item)).% se ocupa para estilos de letra y colores
:-pce_image_directory('./images'). % acceso a donde se tiene guardada la carpeta de la imagen
:- dynamic color/2. %Numero de colores que se utilizan
resource(pizarronutc, image, image('whiteBack.jpg')). % instruccion para cargar la imagen en la carpeta que esta almacenada .jpg
resource(li, image, image('comprarPC.jpg')).
resource(descripcion, image, image('descripcion.jpg')).

agregar_imagen(Pantalla, Imagen, X, Y):-new(Figura, figure),                  %variables y funciones que se utilizan para que se pueda visualizar la imagen mediante la  interfaz grafica con posición arbitraria
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(X,Y)).

imagen_portada(Pantalla, Imagen) :- agregar_imagen(Pantalla, Imagen, 0, 0).
% Función inicial de portada, pero especificando la posición inicial






inicio:- %Inicio de nuestro programa, creando el objeto de dialogo con la variable D



 new(D,dialog('PIA',size(800,2350))),% inicio de nuestra interfaz principal


new(Label1,label(text,'                    UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN')),% muestra texto dentro de los label

	send(Label1,colour,red), %sirve para poner los colores en las letras
new(Label2,label(text,'               FACULTAD DE INGENIERÍA MECÁNICA Y ELÉCTRICA')),
	send(Label2,colour,red),
new(Label3,label(text,'')),
	send(Label3,colour,blue),
new(Label4,label(text,'      Sistema experto de decisión de Computadoras')),
	send(Label4,colour,blue),
new(Label5,label(text,'¿Quieres una computadora y no sabes cuál es la indicada para ti?')),
	send(Label5,colour,blue),
new(Label6,label(text,'                       ¡Nosotros te ayudamos!')),
	send(Label6,colour,blue),
new(Label7,label(text,'')),
	send(Label7,colour,blue),
new(Label8,label(text,'Da click en Iniciar y contesta las preguntas que aparecen en pantalla')),
	send(Label8,colour,red),
new(Label9,label(text,'                                  ')),
	send(Label9,colour,red),
new(Label10,label(text,'                                  ')),
	send(Label10,colour,red),
	new(Label12,label(text,'')),
	send(Label12,colour,blue),


 %llama a los label y los adjunta para mostrarlos en la ventana principal
imagen_portada(D, li),
 send(D,append(Label1)),
 send(D,append(Label2)),
 send(D,append(Label3)),
 send(D,append(Label4)),
 send(D,append(Label5)),
 send(D,append(Label6)),
 send(D,append(Label7)),
 send(D,append(Label8)),
 send(D,append(Label9)),
 send(D,append(Label10)),
 send(D,append(Label12)),

%crea el boton que almacenamos en nuestra variable para la funcion que se ha programado anteriormente
 new(Boton1,button('Iniciar',and(message(@prolog,principal),
 and(message(D,open),message(D,free))))),
 send(Boton1,colour,blue),
 new(Bcancelar,button('Anular',and(message(D,destroy),message(D,free)))),
 send(Bcancelar,colour,blue),

 new(Boton2,button('Ayuda',and(message(@prolog,main1),
 and(message(D,open),message(D,free))))),
 send(Boton2,colour,blue),

new(Boton3,button('Carreras',and(message(@prolog,main2),
 and(message(D,open),message(D,free))))),
 send(Boton3,colour,blue),

%llamada de los botones para que se muestren en la interfaz
 send(D,append(Boton1)),
 send(D,append(Bcancelar)),
 send(D,append(Boton2)),
send(D,append(Boton3)),
  send(D,open_centered).


:-inicio.

%llamando a la funcion principal de nuestro boton iniciar


principal:-
	new(D2, dialog('SISTEMA EXPERTO PC',size(500,400))), %inicio de nuestra interfaz emergente
	new(Label10, label(nombre,'')),send(Label10,colour,red),%color de texto de la variable D2

        imagen_portada(D2, pizarronutc), % carga de imagen


	new(@texto,label(text,'                                            Podrás ver aquí tu resultado cuando respondas las preguntas')),
		new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),




%creaci�n del boton para dar inicio al TEST.

	new(@boton,button('INICIO',message(@prolog,botones))),

	send(D2, append(Label10)),
	new(@btncarrera,button('analisis?')), %boton para iniciar el test
        send(D2, display,Label10,point(10,20)), %mostrar el contenido de nuestra ventana
	send(D2, display,@boton,point(310,80)), %numeros ajustan las posiciones del  boton
	send(D2, display,@texto,point(50,40)),
	send(D2, display,Salir,point(350,330)),
	send(D2, display,@respl,point(90,90)),
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


ingenieria_de_sistemas:-carrera_ingenieria_de_sistemas,
	consultar('�Eres h�bil resolviendo problemas?'),
	consultar('�Te gusta resolver problemas matem�ticos?'),
	consultar('�te interesan temas sobre tecnologia?'),
	consultar('�Tienes facilidad para ocupar computadoras?'),
	consultar('�Te gusta crear cosas?').

turismo:-carrera_turismo,
	consultar('�Tienes interes por otras culturas?'),
	consultar('�tienes gusto y facilidad por los idiomas?'),
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
	write(Answer), send(A1,destroy),

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
	new(@boton, button('Iniciar su evaluacion',message(@prolog, botones))),
	send(Menu, display,@boton,point(40,600)),       %llamando los resultados de la ventana emergente
	send(Menu, display,@btncarrera,point(20,50)),
	send(Menu, append, new(Ayuda, popup(Ayuda))),
	limpiar.

borrado:-send(@respl,selection('')). %fin del programa

%boton de textos para saber la guia basica
main1:-
	new(D3, dialog('SISTEMA EXPERTO UTC',size(500,400))),
	new(Label10, label(nombre,'')),send(Label10,colour,red),

        imagen_portada(D3, pizarronutc),


	new(@texto,label(text,'                                      Guia basica para saber el guncionamiento de la pagina de prolog:')),
         new(@texto1,label(text,'Este sistema est� dise�ado para interactuar e informar al usuario que desee saber informaci�n sobre la ')),
	 new(@texto2,label(text,'Universidad Tres Culturas, adem�s de dar una orientaci�n sobre las carreras que se imparten en la')),
         new(@texto3,label(text,'instituci�n tomando como base la toma de decisiones con respecto a los datos ingresados.')),
	  new(@texto4,label(text,'Da clic en inicio y responde las preguntas que te aparecen en la interfaz')),
          new(@texto5,label(text,'Contesta las preguntas de acuerdo con las habilidades y aptitudes que consideres tengas y pongas ')),
          new(@texto6,label(text,'en pr�ctica.')),
          new(@texto7,label(text,'Despu�s se te mostraran tus resultados de acuerdo a la carrera que consideremos m�s apta para ti')),
          new(@texto8,label(text,'y despu�s presi�n salir. �')),
		new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D3,destroy),message(D3,free)))),







	send(D3, append(Label10)),
	send(D3, display,Label10,point(10,20)),
	send(D3, display,@texto,point(50,40)),
        send(D3, display,@texto1,point(70,70)),
        send(D3, display,@texto2,point(78,82)),
        send(D3, display,@texto3,point(88,94)),
        send(D3, display,@texto4,point(150,150)),
        send(D3, display,@texto5,point(85,200)),
        send(D3, display,@texto6,point(85,214)),
        send(D3, display,@texto7,point(85,230)),
        send(D3, display,@texto8,point(85,245)),
	send(D3, display,Salir,point(400,400)),
	send(D3, display,@respl,point(90,90)),
	send(D3,open_centered).

main2:-
new(D4, dialog('PIA',size(500,400))),
	new(Label11, label(nombre,'')),send(Label11,colour,red),

        imagen_portada(D4, descripcion),

  send(D4,open_centered).

