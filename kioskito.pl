
% Punto 1
% Horario(Persona, Dia(Inicio, Fin)). 

horario(dodain,lunes,9,15).
horario(dodain,miercoles,9,15). 
horario(dodain,viernes,9,15). 

horario(lucas,martes,10,20).

horario(juanC, sabados,18,22).
horario(juanC, domingos,18,22).

horario(juanFdS, jueves,10,20).
horario(juanFds, viernes,12,20).

horario(leoC, lunes,14,18).
horario(leoC, miercoles,14,18).

horario(martu, miercoles,23,24). 

horario(vale,lunes,9,15).
horario(vale,miercoles,9,15). 
horario(vale,viernes,9,15). 

horario(vale, sabados,18,22).
horario(vale, domingos,18,22).

%Punto 2

atiende(Dia, Hora, Persona) :- 
    horario(Persona, Dia, HorarioIncio, HorarioSalida), 
    between(HorarioIncio, HorarioSalida, Hora). 
    
%Punto 3

%foreverAlone(Persona, Dia, Horario) :- 
 %   atiende(Dia, Horario, Persona),
  %  forall(horario(OtraPersona,_,_,_), not(atiende(Dia,Hora,Otrapersona))),
   % Persona \= OtraPersona.

%Punto 4

%posibilidadesDeAtencion(Dia) :- 
 %   horario(Persona, Dia, _, _). 

 % Punto 5 

venta(dodain, lunes ,[golosinas(1200), golosinas(50), cigarrillos(jockey)]).
venta(dodain, miercoles, [bebidas(alcoholicas, 8), bebidas(no-alcoholicas,1), golosinas(10)]).
venta(martu, miercoles, [golosinas(1000), cigarrillos([chesterfield, colorado,parisiennes])]).
venta(lucas, martes, [golosinas(600)]).
venta(lucas,martes, [bebidas(no-alcoholicas), cigarrillos(derby)]).



vendedorSuertudo(Vendedor) :- 
    venta(Vendedor,Dia, _),
    forall(venta(Vendedor, Dia,Ventas) , primeraVentaImportante(Ventas)).


primeraVentaImportante(Ventas) :- 
    nth0(0, Ventas, PrimeraVenta),
    ventaImportante(PrimeraVenta). 
    

ventaImportante(golosinas(Cantidad)) :-
    Cantidad > 1000. 

ventaImportante(bebidas(alcoholicas, _)).

ventaImportante(bebidas(_, Cantidad)) :- 
    Cantidad > 5. 

ventaImportante(cigarrillos(Marcas)) :- 
    length(Marcas, CantMarcas),
    CantMarcas > 2. 
    