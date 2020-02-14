poblacion(valladolid,1149).
poblacion(merida,4032).
poblacion(tizimin,2066). 

superficie(valladolid,6).
superficie(merida,7).
superficie(tizimin,11).

densidad(X,Y) :- poblacion(X,P),
	superficie(X,S),
	Y is P/S.  