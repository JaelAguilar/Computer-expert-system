% ==== DESCARGA DE MÓDULOS E IMÁGENES ==== %
:-encoding(utf8). 
:-use_module(library(pce)).
:-pce_image_directory('./images'). 
resource(background, image, image('fondoJuego.jpg')). 
resource(portada, image, image('fondoInicio.jpg')).


% ==== Función para poner fondo de pantalla en las interfaces ==== %
imagen_portada(Pantalla, Imagen):-
    new(Figura, figure),
    new(Bitmap, bitmap(resource(Imagen),@on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Pantalla, display,Figura,point(0,0)).


% ==== INTERFAZ INICIAL ==== %
iniciar:-
    new(D,dialog('PIA',size(500,625))),
    imagen_portada(D, portada),
    new(Biniciar,button('Iniciar',and(message(@prolog,ventanaJuego),and(message(D,open),message(D,free))))),
    new(Bcancelar,button('Salir',and(message(D,destroy),message(D,free)))),

    send(D, display,Biniciar,point(150,550)),
    send(D, display,Bcancelar,point(250,550)),
    send(D,open_centered).


% ==== INTERFAZ PRINCIPAL ==== %
ventanaJuego:-
	new(D2, dialog('SISTEMA EXPERTO PC',size(500,400))),
    imagen_portada(D2, background),
	new(@texto,label(text,'')),
	new(@respl,label(text,'')),
	new(Bsalir,button('Salir',and(message(D2,destroy),message(D2,free)))),
    new(Bportada,button('Portada',and(message(@prolog,iniciar), and(message(D2,open),message(D2,free))))),
	new(@boton,button('INICIAR',message(@prolog,botones))),
	new(@bcomputadora,button('analisis?')), 

	send(D2, display,@boton,point(450,200)), 
	send(D2, display,@texto,point(350,170)), 
	send(D2, display,Bsalir,point(400,370)), 
    send(D2,display,Bportada,point(500,370)),
	send(D2, display,@respl,point(350,200)), 
	send(D2,open_centered).                


% ==== Mostrar el texto indicado dependiendo del resultado final ==== %
% El orden en el que aparece aquí es el orden en el que serán revisadas al momento de realizar las preguntas %
resultado('Laptop HP 14 dq2521la'):-hp_14_dq2521la,!.
resultado('Laptop HP ENVY x360 Convertible 13-ay1005la'):-hp_envy_x360,!.
resultado('Lenovo ThinkPad T14'):-lenovo_ThinkPad_T14,!.
resultado('Lenovo IdeaCentre AIO 3i 7ma Gen'):-lenovo_ideaCentre_AIO,!.
resultado('Lenovo IdeaPad 3 15" 6ta Gen - Sand'):-lenovo_ideapad,!.
resultado('Laptop gamer Legion 5 6ta Gen'):-gamer_legion_5,!.
resultado('HUAWEI MateBook D 14'):-huawei_matebook,!.
resultado('MacBook Pro de 13”'):-macbook_pro,!.
resultado('Samsung Notebook 9 Pro'):-samsung_notebook_9_pro,!.
resultado('Laptop Dell Inspiron 13 5310'):-laptop_dell_inspiron_13,!.
resultado('All in One HP 22-dd0520la'):-all_in_one_hp_22,!.
resultado('HP Desktop One 27-ca0003la'):-hp_desktop_one,!.
resultado('Lo sentimos, no encontramos una computadora\nadecuada para ti').


% ==== BASE DE CONOCIMIENTO ==== %
% ORDEN  DE PREGUNTAS %
% - Laptop o escritorio
% - Marca de computadora
% - Procesador
% - Almacenamiento
% - Características específicas
% - Precio
hp_envy_x360:-
    computadora_laptop_HP_ENVY_x360,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?'),
    revisar('¿Quieres que la pantalla sea táctil?'),
    revisar('¿Quieres que tu computadora se pueda doblar como si fuera tablet?'),
    revisar('¿Es $28,500 un buen precio para ti?').

hp_desktop_one:-
    computadora_hp_desktop_one_21_ca0003la,
    revisar('¿Quieres una computadora de escritorio?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres un almacenamiento de 256 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que la cámara tenga privacidad cuando no la usas?'),
    revisar('¿Es $19,000 un buen precio para ti?').

all_in_one_hp_22:-
    computadora_all_in_one_hp_22_dd050la,
    revisar('¿Quieres una computadora de escritorio?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 1 TB?'),
    revisar('¿Quieres una memoria RAM de 4GB?'),
    revisar('¿Quieres que tu computadora sea todo en uno?'),
    revisar('¿Es $12,000 un buen precio para ti?').

huawei_matebook:-
    computadora_huawei_matebook_d14,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca HUAWEI?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que la pantalla se pueda desmontar?'),
    revisar('¿Quieres que la cámara se encuentre al nivel del teclado?'),
    revisar('¿Es $21,000 un buen precio para ti?').

gamer_legion_5:-
    computadora_laptop_gamer_5,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Lenovo?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 16GB?'),
    revisar('¿Quieres que tu computadora tenga control de temperatura?'),
    revisar('¿Quieres una computadora hecha para videojuegos?'),
    revisar('¿Quieres que tu computadora tenga sonido 3D?'),
    revisar('¿Es $28,000 un buen precio para ti?').

macbook_pro:-
    computadora_mackbook_pro,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Apple?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que la pantalla sea táctil?'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?'),
    revisar('¿Es $32,500 un buen precio para ti?').

samsung_notebook_9_pro:-
    computadora_samsung_notebook_9_pro,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Samsung?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 256 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?'),
    revisar('¿Quieres que la pantalla sea táctil?'),
    revisar('¿Quieres que tu computadora sea 2 en 1?'),
    revisar('¿Quieres que incluya un lápiz táctil?'),
    revisar('¿Es $25,000 un buen precio para ti?').

hp_14_dq2521la:-
    computadora_laptop_HP_14_dq2521la,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca HP?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 256 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que la batería tenga larga duración?'),
    revisar('¿Es $12,000 un buen precio para ti?').

lenovo_ideapad:-
    computadora_lenovo_ideapad_3,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Lenovo?'),
    revisar('¿Quieres un procesador AMD Ryzen?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 16GB?'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?'),
    revisar('¿Quieres que la pantalla sea táctil?'),
    revisar('¿Quieres que tu computadora tenga control de temperatura?'),
    revisar('¿Es $18,000 un buen precio para ti?').

lenovo_ideaCentre_AIO:-
    computadora_lenovo_ideaCentre_AIO,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Lenovo?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que tu computadora sea todo en uno?'),
    revisar('¿Es $19,000 un buen precio para ti?').

lenovo_ThinkPad_T14:-
    computadora_lenovo_ThinkPad_T14,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Lenovo?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que tu computadora tenga un lector de huellas?'),
    revisar('¿Quieres que tu computadora tenga una alta durabilidad?'),
    revisar('¿Es $20,000 un buen precio para ti?').

laptop_dell_inspiron_13:-
    computadora_Dell_inspiron_13_5310,
    revisar('¿Quieres una laptop?'),
    revisar('¿Quieres que tu computadora sea marca Dell?'),
    revisar('¿Quieres un procesador Intel?'),
    revisar('¿Quieres un almacenamiento de 512 GB?'),
    revisar('¿Quieres una memoria RAM de 8GB?'),
    revisar('¿Quieres que la batería tenga larga duración?'),
    revisar('¿Es $29,500 un buen precio para ti?').


% ==== PRUEBAS DE CADA COMPUTADORA ==== %
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
computadora_samsung_notebook_9_pro:-
    revisar('¿Quieres una laptop?'),!.
computadora_laptop_HP_14_dq2521la:-
    revisar('¿Quieres una laptop?'),!.
computadora_lenovo_ideapad_3:-
    revisar('¿Quieres una laptop?'),!.
computadora_lenovo_ideaCentre_AIO:-
    revisar('¿Quieres una laptop?'),!.
computadora_lenovo_ThinkPad_T14:-
    revisar('¿Quieres una laptop?'),!.
computadora_Dell_inspiron_13_5310:-
    revisar('¿Quieres una laptop?'),!.


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


% ==== INICIO DEL PROGRAMA PRINCIPAL ==== %
:-iniciar.