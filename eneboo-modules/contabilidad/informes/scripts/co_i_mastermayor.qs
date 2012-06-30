/***************************************************************************
                 i_masteralbaranesprov.qs  -  description
                             -------------------
    begin                : lun abr 26 2004
    copyright            : (C) 2004 by InfoSiAL S.L.
    email                : mail@infosial.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

/** @file */

/** @class_declaration interna */
////////////////////////////////////////////////////////////////////////////
//// DECLARACION ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
class interna {
    var ctx:Object;
    function interna( context ) { this.ctx = context; }
    function init() { this.ctx.interna_init(); }
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {
	var saldoAcumulado:Number;
	var ultimaSubcuenta:Number;
	var calcularSaldoInicial:Boolean;

    function oficial( context ) { interna( context ); } 
	function lanzar() {
		return this.ctx.oficial_lanzar();
	}
	function obtenerOrden(nivel:Number, cursor:FLSqlCursor):String {
		return this.ctx.oficial_obtenerOrden(nivel, cursor);
	}
	function subTotalMayor(nodo:FLDomNode, campo:String):String {
		return this.ctx.oficial_subTotalMayor(nodo, campo);
	}
	function saldoInicial(nodo:FLDomNode, campo:String):String {
		return this.ctx.oficial_saldoInicial(nodo, campo);
	}
	function saldoActual(nodo:FLDomNode, campo:String):String {
		return this.ctx.oficial_saldoActual(nodo, campo);
	}
}
//// OFICIAL /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////
class head extends oficial {
    function head( context ) { oficial ( context ); }
}
//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_declaration ifaceCtx */
/////////////////////////////////////////////////////////////////
//// INTERFACE  /////////////////////////////////////////////////
class ifaceCtx extends head {
    function ifaceCtx( context ) { head( context ); }
	function pub_subTotalMayor(nodo:FLDomNode, campo:String):String {
		return this.subTotalMayor(nodo, campo);
	}
	function pub_saldoInicial(nodo:FLDomNode, campo:String):String {
		return this.saldoInicial(nodo, campo);
	}
	function pub_saldoActual(nodo:FLDomNode, campo:String):String {
		return this.saldoActual(nodo, campo);
	}
}

const iface = new ifaceCtx( this );
//// INTERFACE  /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition interna */
////////////////////////////////////////////////////////////////////////////
//// DEFINICION ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
/** \C El bot�n de impresi�n lanza el informe
\end */
function interna_init()
{
	connect(this.child("toolButtonPrint"), "clicked()", this, "iface.lanzar()");
}
//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
/** \D Lanza el informe
\end */
function oficial_lanzar()
{
	var cursor:FLSqlCursor = this.cursor();
	if (!cursor.isValid())
		return;

	this.iface.ultimaSubcuenta = 0;
	this.iface.calcularSaldoInicial = cursor.valueBuffer("saldoinicial");
	var nombreInforme:String = cursor.action();
 
/** \D Se a�ade un ORDER BY a la consulta en funci�n de los niveles de ordenamiento seleccionados
\end */
		var orderBy:String = "";
		var o:String = "";
		for (var i:Number = 1; i <= 1; i++) {
				o = this.iface.obtenerOrden(i, cursor);
				if (o) {
						if (orderBy == "")
								orderBy = o;
						else
								orderBy += ", " + o;
				}
		}
	
	flcontinfo.iface.pub_lanzarInforme(cursor, nombreInforme, "", orderBy, "", "", cursor.valueBuffer("id"));
}

/** \D Devuelve un criterio de orden para el informe en base a su nivel. Si el orden est� marcado como descendente, se a�ade DESC al valor devuelto. Se utiliza para crear la cl�usula ORDER BY de la consulta del informe

@param nivel Nivel de ordenamiento (1, 2 ...)
@param cursor Cursor sobre la tabla de informes de mayor
@return Criterio de ordenaci�n (y opcionalmente DESC).
*/
function oficial_obtenerOrden(nivel:Number, cursor:FLSqlCursor):String
{
	var ret:String = "co_subcuentas.codsubcuenta";
	var orden:String = cursor.valueBuffer("orden" + nivel.toString());

	var descAsc:String = "";
	var tipoOrden:String = cursor.valueBuffer("tipoorden" + nivel.toString());
	if (tipoOrden == "Descendente") {
		descAsc = " DESC";
	}

	switch (orden) {
		case "Asiento": {
			ret += ", co_asientos.numero " + descAsc;
			break;
		}
		case "Fecha": {
			ret += ", co_asientos.fecha " + descAsc + ", co_asientos.numero";
			break;
		}
	}

	return ret;
}

function oficial_subTotalMayor(nodo:FLDomNode, campo:String):String {

	/*
	var idSubcuenta:Number = nodo.attributeValue("co_subcuentas.idsubcuenta");
	if (idSubcuenta != this.iface.ultimaSubcuenta) {
		this.iface.saldoAcumulado = 0;
		this.iface.ultimaSubcuenta = idSubcuenta;
	}
	*/
	var debe:Number = nodo.attributeValue("co_partidas.debe");
	var haber:Number = nodo.attributeValue("co_partidas.haber");
	
	this.iface.saldoAcumulado += debe-haber;	
	return this.iface.saldoAcumulado;
}

function oficial_saldoInicial(nodo:FLDomNode, campo:String):String
{
	if (!this.iface.calcularSaldoInicial) {
		this.iface.saldoAcumulado = 0;
		return 0;
	}
	var util:FLUtil;
	var idSubcuenta:Number = nodo.attributeValue("co_subcuentas.idsubcuenta");
	var fecha:String = nodo.attributeValue("co_asientos.fecha");
	var saldoInicial = util.sqlSelect("co_partidas p INNER JOIN co_asientos a ON p.idasiento = a.idasiento", "SUM(debe) - SUM(haber)", "p.idsubcuenta = " + idSubcuenta + " AND a.fecha < '" + fecha + "'", "co_partidas,co_asientos");
	if (!saldoInicial)
		saldoInicial = 0;
	this.iface.saldoAcumulado = saldoInicial;
	return saldoInicial;
}

function oficial_saldoActual(nodo:FLDomNode, campo:String):String
{
	return this.iface.saldoAcumulado;
}
//// OFICIAL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////

//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
