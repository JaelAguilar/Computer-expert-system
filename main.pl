% ==== DESCARGA DE MÓDULOS E IMÁGENES ==== %
:- encoding(utf8). 
:-use_module(library(pce)).
:-use_module(library(pce_style_item)).
:-pce_image_directory('./images'). 
resource(background, image, image('fondoJuego.jpg')). 
resource(portada, image, image('fondoInicio.jpg')).

% ==== Función para poner fondo de pantalla en las interfaces ==== %
imagen_portada(Pantalla, Imagen):-new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(0,0)).

% ==== INTERFAZ INICIAL ==== %
iniciar:-
new(D,dialog('PIA',size(500,625))),
imagen_portada(D, portada),
 new(Biniciar,button('Iniciar',and(message(@prolog,main),
 and(message(D,open),message(D,free))))),
 new(Bcancelar,button('Salir',and(message(D,destroy),message(D,free)))),

send(D, display,Biniciar,point(100,550)),
send(D, display,Bcancelar,point(210,550)),
  send(D,open_centered).


% ==== INTERFAZ PRINCIPAL ==== %
main:-
	new(D2, dialog('SISTEMA EXPERTO PC',size(500,400))),
        imagen_portada(D2, background),
	new(@texto,label(text,'')),
		new(@respl,label(text,'')),
	new(Bsalir,button('Salir',and(message(D2,destroy),message(D2,free)))),
    new(Bportada,button('Portada',and(message(@prolog,iniciar),
 and(message(D2,open),message(D2,free))))),
	new(@boton,button('INICIAR',message(@prolog,botones))),
	new(@bcomputadora,button('analisis?')), 
    
	send(D2, display,@boton,point(450,200)), 
	send(D2, display,@texto,point(350,170)), 
	send(D2, display,Bsalir,point(350,370)), 
    send(D2,display,Bportada,point(450,370)),
	send(D2, display,@respl,point(350,200)), 
	send(D2,open_centered).                

% ==== Mostrar el texto indicado dependiendo del resultado final ==== %
resultado('Laptop HP 14 dq2521la'):-hp_14_dq2521la,!.
resultado('Laptop HP ENVY x360 Convertible 13-ay1005la'):-hp_envy_x360,!.
resultado('HP Desktop One 27-ca0003la'):-hp_desktop_one,!.
resultado('All in One HP 22-dd0520la'):-all_in_one_hp_22,!.
resultado('HUAWEI MateBook D 14'):-huawei_matebook,!.
resultado('Laptop gamer Legion 5 6ta Gen'):-gamer_legion_5,!.
resultado('MacBook Pro de 13”'):-macbook_pro,!.
resultado('Samsung Notebook 9 Pro'):-samsung_notebook_9_pro,!.
resultado('Lo sentimos, no encontramos una computadora\n adecuada para ti').


% ==== PREGUNTAS DE CADA COMPUTADORA ==== %
hp_14_dq2521la:-computadora_laptop_HP_14_dq2521la,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 256 GB?').

hp_envy_x360:-computadora_laptop_HP_ENVY_x360,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres que tu computadora se pueda doblar como si fuera tablet?'),
    revisar('¿Quieres que la pantalla sea táctil?'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?').

hp_desktop_one:-computadora_hp_desktop_one_21_ca0003la,
    revisar('¿Quieres una computadora de escritorio?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres que la cámara tenga privacidad cuando no la usas?').

all_in_one_hp_22:-computadora_all_in_one_hp_22_dd050la,
    revisar('¿Quieres una computadora de escritorio?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres que tu computadora sea todo en uno').

huawei_matebook:-computadora_huawei_matebook_d14,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres que la pantalla se pueda desmontar?'),
    revisar('¿Quieres que la cámara se encuentre al nivel del teclado?').

gamer_legion_5:-computadora_laptop_gamer_5,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres una computadora hecha para videojuegos?'),
    revisar('¿Quieres que tu computadora tenga control de temperatura'),
    revisar('¿Quieres que tu computadora tenga sonido 3D?').

macbook_pro:-computadora_mackbook_pro,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Apple?').

samsung_notebook_9_pro:-computadora_samsung_notebook_9_pro,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres que tu computadora sea 2 en 1?'),
    revisar('¿Quieres que la pantalla sea táctil?'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?'),
    revisar('¿Quieres que incluya un lápiz táctil?').



% ==== PRUEBAS DE CADA COMPUTADORA (función de corte) ==== %

computadora_laptop_HP_14_dq2521la:-
    revisar('¿Quieres una laptop?'),!.
computadora_laptop_HP_ENVY_x360:-
    revisar('¿Quieres una laptop?'),!.
computadora_hp_desktop_one_21_ca0003la:-
    revisar('¿Quieres una computadora de escritorio?'),!.
computadora_all_in_one_hp_22_dd050la:-
    revisar('¿Quieres una computadora de escritorio?'),!.
computadora_huawei_matebook_d14:-
    revisar('¿Quieres una laptop?'),!.
computadora_laptop_gamer_5:-
    revisar('¿Quieres una laptop?'),!.
computadora_mackbook_pro:-
    revisar('¿Quieres una laptop?'),!.
computadora_samsung_notebook_9_pro:-revisar('¿Quieres una laptop?'),!.

% ==== VARIABLES DINÁMICAS ==== %
:-dynamic si/1,no/1. 

% ==== INTERFAZ DE PREGUNTAS ==== %
preguntar(Problema):-new(A1,dialog('Pregunta')),
	new(L9,label(texto,'Responde la siguiente pregunta')),
	new(L10,label(text,Problema)),
	new(Z1,button(si,and(message(A1,return,si)))),
	new(Z2,button(no,and(message(A1,return,no)))),
	send(A1,gap,size(25,25)),

	send(A1,append(L9)),
	send(A1,append(L10)),
	send(A1,append(Z1)),
	send(A1,append(Z2)),

	send(A1,default_button,si),
	send(A1,open_centered), get(A1,confirm,Answer),
	 send(A1,destroy),

% ==== GUARDAR RESPUESTA EN MEMORIA ==== %

 ((Answer==si)->assert(si(Problema));
 assert(no(Problema)),fail).

% ==== CAMBIO DE PREGUNTA ==== %
revisar(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar:-retract(si(_)),fail.
limpiar:-retract(no(_)),fail.
limpiar.

% ==== BORRADO DE BOTONES INTERFAZ PRINCIPAL ==== %
botones:-borrado,
	send(@boton,free),
	send(@bcomputadora,free),

% ==== RESULTADO FINAL ==== %
resultado(Computadora),
	send(@texto, selection('Deberías comprar la siguiente computadora:')),
	send(@respl,selection(Computadora)),
	limpiar.
borrado:-send(@respl,selection('')).

:-iniciar. % Inicio de programa principal