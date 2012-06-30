/***************************************************************************
                 regstocks.qs  -  description
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
	function calculateField(fN:String):String {
		return this.ctx.interna_calculateField(fN);
	}
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {
    function oficial( context ) { interna( context ); }
	function calcularCantidad() {
		return this.ctx.oficial_calcularCantidad();
	}
	function commonCalculateField(fN:String, cursor:FLSqlCursor):String {
		return this.ctx.oficial_commonCalculateField(fN, cursor);
	}
	function bufferChanged(fN:String) {
		return this.ctx.oficial_bufferChanged(fN);
	}
	//function cambiarCantidad(cantidadNueva:Number) { return this.ctx.oficial_cambiarCantidad(cantidadNueva); }
	//function deshabilitarCantidad() { return this.ctx.oficial_deshabilitarCantidad(); }
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
	function pub_cambiarCantidad(cantidad:Number) { return this.cambiarCantidad(cantidad); }
	function pub_commonCalculateField(fN:String, cursor:FLSqlCursor):String {
		return this.commonCalculateField(fN, cursor);
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
/** \C La cantidad est� deshabilitada

El valor del stock de un art�culo se modificar� de forma autom�tica cuando haya modificaci�n de:

- Lineas de albar�n de proveedor (incrementan el stock)

- Lineas de factura de proveedor no autom�ticas (incrementan el stock)

- Lineas de pedido de cliente (decrementan el stock)

- Lineas de albar�n de cliente no provenientes de un pedido (decrementan el stock)

- Lineas de factura de cliente no autom�ticas (decrementan el stock)

El valor del stock de un art�culo se puede modificar de forma manual desde la ventana de regularizaciones de stock

\end */
function interna_init()
{
	var cursor:FLSqlCursor = this.cursor();
	//this.iface.deshabilitarCantidad();
	//connect(this.child("tdbLineasRegStocks").cursor(), "newBuffer()", this, "iface.deshabilitarCantidad");
	connect(this.child("tdbLineasRegStocks").cursor(), "bufferCommited()", this, "iface.calcularCantidad");
	connect(cursor, "bufferChanged(QString)", this, "iface.bufferChanged");
	switch (cursor.modeAccess()) {
		case cursor.Edit: {
			this.child("pushButtonAcceptContinue").close();
			this.child("fdbReferencia").setDisabled(true);
			this.child("fdbCodAlmacen").setDisabled(true);
			break;
		}
	}
}

function interna_calculateField(fN:String):String
{
	var cursor:FLSqlCursor = this.cursor();
	return this.iface.commonCalculateField(fN, cursor);
}
//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
/*
function oficial_cambiarCantidad(cantidadNueva:Number)
{
		this.child("fdbCantidad").setValue(cantidadNueva);
		this.iface.deshabilitarCantidad();
}

function oficial_deshabilitarCantidad()
{
		this.child("fdbCantidad").setDisabled(true);
}
*/
function oficial_bufferChanged(fN:String)
{
	var cursor:FLSqlCursor = this.cursor();
	switch (fN) {
		case "cantidad":
		case "reservada": {
			cursor.setValueBuffer("disponible", this.iface.calculateField("disponible"));
			break;
		}
	}
}

function oficial_commonCalculateField(fN:String, cursor:FLSqlCursor):String
{
	var valor:String;
	switch (fN) {
		case "disponible": {
			var cantidad:Number = parseFloat(cursor.valueBuffer("cantidad"));
			var reservada:Number = parseFloat(cursor.valueBuffer("reservada"));
			valor = cantidad - reservada;
			break;
		}
	}
	return valor;
}

function oficial_calcularCantidad()
{
	var cursor:FLSqlCursor = this.cursor();
	var util:FLUtil = new FLUtil;
	var cantidad:Number = util.sqlSelect("lineasregstocks", "cantidadfin", "idstock = " + cursor.valueBuffer("idstock") + " ORDER BY fecha DESC, hora DESC");
	this.child("fdbCantidad").setValue(cantidad);
}

//// OFICIAL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////

//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
