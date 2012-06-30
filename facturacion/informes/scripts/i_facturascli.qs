/***************************************************************************
                 i_facturascli.qs  -  description
                             -------------------
    begin                : mie dic 21 2005
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
    function oficial( context ) { interna( context ); } 
	function bufferChanged(fN:String) {
		this.ctx.oficial_bufferChanged(fN);
	}
	function habilitarPorFiltroImportes() {
		this.ctx.oficial_habilitarPorFiltroImportes();
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
function interna_init()
{
	connect(this.cursor(), "bufferChanged(QString)", this, "iface.bufferChanged");
	this.iface.habilitarPorFiltroImportes();
	this.child("fdbTipoOrden1").close();
	this.child("fdbTipoOrden2").close();
}
//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
function oficial_bufferChanged(fN:String)
{
	var cursor:FLSqlCursor = this.cursor();
	
	switch(fN){
		/** \C Si cambia el intervalo se recalculan las fechas.
		\end */
		case "codintervalo":{
			var intervalo:Array = [];
			if(cursor.valueBuffer("codintervalo")){
				intervalo = flfactppal.iface.pub_calcularIntervalo(cursor.valueBuffer("codintervalo"));
				cursor.setValueBuffer("d_facturascli_fecha",intervalo.desde);
				cursor.setValueBuffer("h_facturascli_fecha",intervalo.hasta);
			}
			break;
		}
		case "filtrarimportes": {
			this.iface.habilitarPorFiltroImportes();
			break;
		}
	}

}

function oficial_habilitarPorFiltroImportes()
{
	var cursor:FLSqlCursor = this.cursor();
	
	if (cursor.valueBuffer("filtrarimportes")) {
		this.child("fdbDesdeImporte").setDisabled(false);
		this.child("fdbHastaImporte").setDisabled(false);
	} else {
		this.child("fdbDesdeImporte").setValue("");
		this.child("fdbHastaImporte").setValue("");
		this.child("fdbHastaImporte").setDisabled(false);
		this.child("fdbDesdeImporte").setDisabled(true);
		this.child("fdbHastaImporte").setDisabled(true);
	}
}