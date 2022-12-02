% ==== DESCARGA DE MÓDULOS E IMÁGENES ==== %
:- encoding(utf8). % Esto permite agregar acentos y caracteres especiales
:-use_module(library(pce)). % libreria para que se muestre la interfaz
:-use_module(library(pce_style_item)).% se ocupa para estilos de letra y colores
:-pce_image_directory('./images'). % acceso a donde se tiene guardada la carpeta de la imagen
:- dynamic color/3. %Numero de colores que se utilizan
resource(pizarronutc, image, image('fondoJuego.jpg')). % instruccion para cargar la imagen en la carpeta que esta almacenada .jpg
resource(li, image, image('fondoInicio.jpg')).

imagen_portada(Pantalla, Imagen):-new(Figura, figure),                  %variables y funciones que se utilizan para que se pueda visualizar la imagen mediante la  interfaz grafica con posición arbitraria
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(0,0)).

inicio:- %Inicio de nuestro programa
new(D,dialog('PIA',size(500,625))),



 %llama a los label y los adjunta para mostrarlos en la ventana pantallaResultado
imagen_portada(D, li),
 
%crea el boton que almacenamos en nuestra variable para la funcion que se ha programado anteriormente
 new(Biniciar,button('Iniciar',and(message(@prolog,pantallaResultado),
 and(message(D,open),message(D,free))))),
 send(Biniciar,colour,blue),
 new(Bcancelar,button('Salir',and(message(D,destroy),message(D,free)))),
 send(Bcancelar,colour,blue),

%llamada de los botones para que se muestren en la interfaz
send(D, display,Biniciar,point(100,550)),
send(D, display,Bcancelar,point(210,550)),
  send(D,open_centered).



%llamando a la funcion pantallaResultado de nuestro boton iniciar


pantallaResultado:-
	new(D2, dialog('SISTEMA EXPERTO PC',size(500,400))), %inicio de nuestra interfaz emergente
        imagen_portada(D2, pizarronutc), % carga de imagen


	new(@texto,label(text,'')),
		new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),

    new(Bportada,button('Portada',and(message(@prolog,inicio),
 and(message(D2,open),message(D2,free))))),

%creaci�n del boton para dar inicio al TEST.

	new(@boton,button('INICIAR',message(@prolog,botones))),

	new(@btncarrera,button('analisis?')), %boton para iniciar el test
	send(D2, display,@boton,point(450,200)), %Posición boton INICIO

	send(D2, display,@texto,point(350,170)), %Posición texto 
	send(D2, display,Salir,point(350,370)),  %Posición botón SALIR
    send(D2,display,Bportada,point(450,370)),
	send(D2, display,@respl,point(350,200)), %Posición respuesta final
	send(D2,open_centered).                 %fin de la funcion





% se muestra la respuesta de tu test que realizaste por medio de las preguntas
% Muestra el texto indicado dependiendo de la carrera
resultado('Laptop HP 14 dq2521la'):-hp_14_dq2521la,!.
resultado('Laptop HP ENVY x360 Convertible 13-ay1005la'):-hp_envy_x360,!.
resultado('HP Desktop One 27-ca0003la'):-hp_desktop_one,!.
resultado('All in One HP 22-dd0520la'):-all_in_one_hp_22,!.
resultado('HUAWEI MateBook D 14'):-huawei_matebook,!.
resultado('Laptop gamer Legion 5 6ta Gen'):-gamer_legion_5,!.
resultado('MacBook Pro de 13”'):-macbook_pro,!.
resultado('Samsung Notebook 9 Pro'):-samsung_notebook_9_pro,!.
resultado('Lo sentimos, no encontramos una computadora\n adecuada para ti').



%se declran las variables de cada carrera y despues se colocan las preguntas coreespodientes

% ==== COMPUTADORAS NUEVO SISTEMA ==== %
hp_14_dq2521la:-computadora_laptop_HP_14_dq2521la,
    consultar('¿Quieres una laptop?'),
    consultar('¿Quieres que tu computadora sea marca HP?'),
    consultar('¿Quieres un procesador Intel?'),
    consultar('¿Quieres un almacenamiento de 256 GB?').

hp_envy_x360:-computadora_laptop_HP_ENVY_x360,
    consultar('¿Quieres una laptop?'),
    consultar('¿Quieres que tu computadora sea marca HP?'),
    consultar('¿Quieres un procesador AMD Ryzen?'),
    consultar('¿Quieres que tu computadora se pueda doblar como si fuera tablet?'),
    consultar('¿Quieres que la pantalla sea táctil?'),
    consultar('¿Quieres que tu computadora tenga un lector de huellas?').

hp_desktop_one:-computadora_hp_desktop_one_21_ca0003la,
    consultar('¿Quieres una computadora de escritorio?'),
    consultar('¿Quieres que tu computadora sea marca HP?'),
    consultar('¿Quieres un procesador AMD Ryzen?'),
    consultar('¿Quieres que la cámara tenga privacidad cuando no la usas?').

all_in_one_hp_22:-computadora_all_in_one_hp_22_dd050la,
    consultar('¿Quieres una computadora de escritorio?'),
    consultar('¿Quieres que tu computadora sea marca HP?'),
    consultar('¿Quieres un procesador Intel?'),
    consultar('¿Quieres que tu computadora sea todo en uno').

huawei_matebook:-computadora_huawei_matebook_d14,
    consultar('¿Quieres una laptop?'),
    consultar('¿Quieres un procesador Intel?'),
    consultar('¿Quieres un almacenamiento de 512 GB?'),
    consultar('¿Quieres que la pantalla se pueda desmontar?'),
    consultar('¿Quieres que la cámara se encuentre al nivel del teclado?').
gamer_legion_5:-computadora_laptop_gamer_5,
    consultar('¿Quieres una laptop?'),
    consultar('¿Quieres un procesador AMD Ryzen?'),
    consultar('¿Quieres una computadora hecha para videojuegos?'),
    consultar('¿Quieres que tu computadora tenga control de temperatura'),
    consultar('¿Quieres que tu computadora tenga sonido 3D?').
macbook_pro:-computadora_mackbook_pro,
    consultar('¿Quieres una laptop?'),
    consultar('¿Quieres que tu computadora sea marca Apple?').
samsung_notebook_9_pro:-computadora_samsung_notebook_9_pro,
    consultar('¿Quieres una laptop?'),
    consultar('¿Quieres un procesador Intel?'),
    consultar('¿Quieres que tu computadora sea 2 en 1?'),
    consultar('¿Quieres que la pantalla sea táctil?'),
    consultar('¿Quieres que tu computadora tenga un lector de huellas?'),
    consultar('¿Quieres que incluya un lápiz táctil?').



%funcion de corte cada vez que se anula una pregunta de la carrera posteriormente mandara hacia la siguiente

computadora_laptop_HP_14_dq2521la:-
    consultar('¿Quieres una laptop?'),!.
computadora_laptop_HP_ENVY_x360:-
    consultar('¿Quieres una laptop?'),!.
computadora_hp_desktop_one_21_ca0003la:-
    consultar('¿Quieres una computadora de escritorio?'),!.
computadora_all_in_one_hp_22_dd050la:-
    consultar('¿Quieres una computadora de escritorio?'),!.
computadora_huawei_matebook_d14:-
    consultar('¿Quieres una laptop?'),!.
computadora_laptop_gamer_5:-
    consultar('¿Quieres una laptop?'),!.
computadora_mackbook_pro:-
    consultar('¿Quieres una laptop?'),!.
computadora_samsung_notebook_9_pro:-consultar('¿Quieres una laptop?'),!.




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

:-inicio.