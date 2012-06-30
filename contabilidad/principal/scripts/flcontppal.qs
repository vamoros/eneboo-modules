/***************************************************************************
                 flcontppal.qs  -  description
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
	function beforeCommit_co_regiva(curRegIVA:FLSqlCursor):Boolean {
		return this.ctx.interna_beforeCommit_co_regiva(curRegIVA); 
	}
	function afterCommit_co_regiva(curRegiva:FLSqlCursor):Boolean {
		return this.ctx.interna_afterCommit_co_regiva(curRegiva);
	}
	function beforeCommit_co_subcuentas(curSubcuenta:FLSqlCursor):Boolean {
		return this.ctx.interna_beforeCommit_co_subcuentas(curSubcuenta);
	}
	function beforeCommit_co_asientos(curAsiento:FLSqlCursor):Boolean {
		return this.ctx.interna_beforeCommit_co_asientos(curAsiento);
	}
	function beforeCommit_co_partidas(curPartida:FLSqlCursor):Boolean {
		return this.ctx.interna_beforeCommit_co_partidas(curPartida);
	}
	function afterCommit_co_partidas(curPartida:FLSqlCursor):Boolean {
		return this.ctx.interna_afterCommit_co_partidas(curPartida);
	}
	function beforeCommit_co_dotaciones(curDotacion:FLSqlCursor):Boolean {
		return this.ctx.interna_beforeCommit_co_dotaciones(curDotacion);
	}
	function afterCommit_co_dotaciones(curDotacion:FLSqlCursor):Boolean {
		return this.ctx.interna_afterCommit_co_dotaciones(curDotacion);
	}
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {
	var PreMemorias:Array;
	function oficial( context ) { interna( context ); }
	function ejecutarQry(tabla, campos, where, listaTablas):Array {
		return this.ctx.oficial_ejecutarQry(tabla, campos, where, listaTablas);
	}
	function valoresIniciales() {
		return this.ctx.oficial_valoresIniciales();
	}
	function generarPGC(codEjercicio) {
		return this.ctx.oficial_generarPGC(codEjercicio);
	}
	function generarCodigosBalance() {
		return this.ctx.oficial_generarCodigosBalance();
	}
	function generarSubcuentas(codEjercicio, longSubcuenta) {
		return this.ctx.oficial_generarSubcuentas(codEjercicio, longSubcuenta);
	}
	function comprobarEjercicios() {
		return this.ctx.oficial_comprobarEjercicios();
	}
	function valorPorClave(tabla, campo, where, listaTablas) {
		return this.ctx.oficial_valorPorClave(tabla, campo, where, listaTablas);
	}
	function comprobarRegIVA(idSubcuenta, idAsiento):Boolean {
		return this.ctx.oficial_comprobarRegIVA(idSubcuenta, idAsiento);
	}
	function calcularSaldo(idSubcuenta):Boolean {
		return this.ctx.oficial_calcularSaldo(idSubcuenta);
	}
	function formatearCodSubcta(curFormSubcuenta:Object, campoSubcuenta:String, longSubcuenta:Number,  posPuntoActual:Number):Number {
		return this.ctx.oficial_formatearCodSubcta(curFormSubcuenta, campoSubcuenta, longSubcuenta, posPuntoActual); 
	}
	function rellenarSubcuentas() {
		return this.ctx.oficial_rellenarSubcuentas();
	}
	function rellenarCuentaEsp() {
		return this.ctx.oficial_rellenarCuentaEsp();
	}
	function clearPreMemoria() {
		return this.ctx.oficial_clearPreMemoria();
	}
	function arrayPreMemoria():Array {
		return this.ctx.oficial_arrayPreMemoria();
	}
	function reponerArrayPreMemoria(nuevoArray:Array) {
		return this.ctx.oficial_reponerArrayPreMemoria(nuevoArray);
	}
	function putPreMemoria(nombreMemoria:String, valorMemoria:String) {
		return this.ctx.oficial_putPreMemoria(nombreMemoria, valorMemoria);
	}
	function putLugarPreMemoria(lugarOcupado:Number, nombreMemoria:String, valorMemoria:String):Number {
		return this.ctx.oficial_putLugarPreMemoria(lugarOcupado, nombreMemoria, valorMemoria);
	}
	function getPreMemoria(nombreMemoria:String):String {
		return this.ctx.oficial_getPreMemoria(nombreMemoria);
	}
	function lugarPreMemoria(nombreMemoria:String):Number {
		return this.ctx.oficial_lugarPreMemoria(nombreMemoria);
	}
	function getNombrePreMemoria(lugarOcupado:Number):String {
		return this.ctx.oficial_getNombrePreMemoria(lugarOcupado);
	}
	function cantidadPreMemoria():Number {
		return this.ctx.oficial_cantidadPreMemoria();
	}
	function siguienteNumero(codEjercicio:String, fN:String):Number {
		return this.ctx.oficial_siguienteNumero(codEjercicio, fN);
	}
	function comprobarAsiento(idAsiento:String, omitirImporte:Boolean):Boolean {
		return this.ctx.oficial_comprobarAsiento(idAsiento, omitirImporte);
	}
	function informarImporteAsiento(idAsiento:String, importe:Number):Boolean {
		return this.ctx.oficial_informarImporteAsiento(idAsiento, importe);
	}
	function generarAsientoDotacion(curDotacion:FLSqlCursor):Boolean {
		return this.ctx.oficial_generarAsientoDotacion(curDotacion);
	}
	function generarPartidasDotacion(curDotacion:FLSqlCursor, idAsiento:Number, valoresDefecto:Array):Boolean {
		return this.ctx.oficial_generarPartidasDotacion(curDotacion, idAsiento, valoresDefecto);
	}
	function copiarCuenta(codCuenta:String, codEjercicioAnt:String, codEjercicio:String):String {
		return this.ctx.oficial_copiarCuenta(codCuenta, codEjercicioAnt, codEjercicio);
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
	function pub_ejecutarQry(tabla, campos, where, listaTablas):Array {
		return this.ejecutarQry(tabla, campos, where, listaTablas);
	}
	function pub_generarPGC(codEjercicio) {
		return this.generarPGC(codEjercicio);
	}
	function pub_generarSubcuentas(codEjercicio, longSubcuenta) {
		return this.generarSubcuentas(codEjercicio, longSubcuenta);
	}
	function pub_formatearCodSubcta(curFormSubcuenta:Object, campoSubcuenta:String, longSubcuenta:Number, posPuntoActual:Number):Number {
		return this.formatearCodSubcta(curFormSubcuenta, campoSubcuenta, longSubcuenta, posPuntoActual);
	}
	function pub_calcularSaldo(idSubcuenta):Boolean {
		return this.calcularSaldo(idSubcuenta);
	}
	function pub_clearPreMemoria() {
		return this.clearPreMemoria();
	}
	function pub_arrayPreMemoria():Array {
		return this.arrayPreMemoria();
	}
	function pub_reponerArrayPreMemoria(nuevoArray:Array) {
		return this.reponerArrayPreMemoria(nuevoArray);
	}
	function pub_putPreMemoria(nombreMemoria:String, valorMemoria:String) {
		return this.putPreMemoria(nombreMemoria, valorMemoria);
	}
	function pub_putLugarPreMemoria(lugarOcupado:Number, nombreMemoria:String, valorMemoria:String):Number {
		return this.putLugarPreMemoria(lugarOcupado, nombreMemoria, valorMemoria);
	}
	function pub_getPreMemoria(nombreMemoria:String):String {
		return this.getPreMemoria(nombreMemoria);
	}
	function pub_lugarPreMemoria(nombreMemoria:String):Number {
		return this.lugarPreMemoria(nombreMemoria);
	}
	function pub_getNombrePreMemoria(lugarOcupado:Number):String {
		return this.getNombrePreMemoria(lugarOcupado);
	}
	function pub_cantidadPreMemoria():Number {
		return this.cantidadPreMemoria();
	}
	function pub_comprobarAsiento(idAsiento:String, omitirImporte:Boolean):Boolean {
		return this.comprobarAsiento(idAsiento, omitirImporte);
	}
	function pub_copiarCuenta(codCuenta:String, codEjercicioAnt:String, codEjercicio:String):String {
		return this.copiarCuenta(codCuenta, codEjercicioAnt, codEjercicio);
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
/** \D Se comprueba si se han introducido ya los valores iniciales buscando alguna cuenta especial. Si no se encuentra, se introducen valores iniciales y se comprueban los ejercicios. Se pregunta si se desea activar la integraci�n entre facturaci�n y contabilidad
\end */
function interna_init()
{
	this.iface.PreMemorias = new Array(0);
	var util:FLUtil = new FLUtil();
	var cursor:FLSqlCursor = new FLSqlCursor("co_codbalances");
	cursor.select();
	if (!cursor.first()) {
		this.iface.valoresIniciales();
		this.iface.comprobarEjercicios();
		if (util.sqlSelect("empresa", "contintegrada", "1 = 1") == false) {
			var res:Object = MessageBox.information(util.translate("scripts",  "�Desea activar la integraci�n entre facturaci�n y contabilidad?"), MessageBox.Yes, MessageBox.No, MessageBox.NoButton);
			if (res == MessageBox.Yes) {
				var curEmpresa = new FLSqlCursor("empresa");
				curEmpresa.select();
				curEmpresa.first();
				curEmpresa.setModeAccess(curEmpresa.Edit);
				curEmpresa.refreshBuffer();
				curEmpresa.setValueBuffer("contintegrada", true);
				curEmpresa.commitBuffer();
			}
		}
	}
	this.iface.rellenarSubcuentas();
	this.iface.rellenarCuentaEsp();
}

function interna_beforeCommit_co_regiva(curRegIVA):Boolean
{
/** \C El per�odo de regularizaci�n por iva debe pertenecer al ejercicio actual.
\end */
		var util:FLUtil = new FLUtil();
		if (curRegIVA.modeAccess() == curRegIVA.Insert
				|| curRegIVA.modeAccess() == curRegIVA.Edit) {
				var codEjercicio:String = util.sqlSelect("co_asientos", "codejercicio",
						"idasiento = " + curRegIVA.valueBuffer("idasiento"));
				var qryEjercicio:FLSqlQuery = new FLSqlQuery();
				qryEjercicio.setTablesList("ejercicios");
				qryEjercicio.setSelect("fechainicio, fechafin");
				qryEjercicio.setFrom("ejercicios");
				qryEjercicio.setWhere("codejercicio = '" + codEjercicio + "'");
				try { qryEjercicio.setForwardOnly( true ); } catch (e) {}
				if (!qryEjercicio.exec())
						return false;
				if (!qryEjercicio.next())
						return false;

				var iniRegIVA:Date = new Date(Date.parse(curRegIVA.valueBuffer("fechainicio").toString()));
				var finRegIVA:Date = new Date(Date.parse(curRegIVA.valueBuffer("fechafin").toString()));
				
				/** \C El per�odo no puede superponerse a ning�n otro per�odo de regularizaci�n
				\end \end */
				if (util.sqlSelect("co_regiva", "idregiva",
						"fechainicio <= '" + iniRegIVA + "' AND fechafin >= '" + iniRegIVA + "'" + 
						" AND idregiva <> " + curRegIVA.valueBuffer("idregiva"))) {
						MessageBox.warning(util.translate("scripts", 
								"La fecha de inicio del per�odo se superpone a un per�odo ya existente"),
								MessageBox.Ok, MessageBox.NoButton, MessageBox.NoButton);
						return false;
				}
				if (util.sqlSelect("co_regiva", "idregiva",
						"fechainicio <= '" + finRegIVA + "' AND fechafin >= '" + iniRegIVA + "'"  + 
						" AND idregiva <> " + curRegIVA.valueBuffer("idregiva"))) {
						MessageBox.warning(util.translate("scripts", 
								"La fecha de fin del per�odo se superpone a un per�odo ya existente"),
								MessageBox.Ok, MessageBox.NoButton, MessageBox.NoButton);
						return false;
				}
		}
		
		return true;
}

/** \C
El c�digo de subcuenta tendr� como prefijo el c�digo de la cuenta
\end */
function interna_beforeCommit_co_subcuentas(curSubcuenta):Boolean
{
		var util:FLUtil = new FLUtil();
		switch(curSubcuenta.modeAccess()) {
		case curSubcuenta.Insert:
				if (!curSubcuenta.valueBuffer("codsubcuenta").startsWith(curSubcuenta.valueBuffer("codcuenta").toString().left(3))) {
						MessageBox.warning(util.translate("scripts",
								"El c�digo de subcuenta debe tener como prefijo el c�digo de la cuenta de la que depende:") + curSubcuenta.valueBuffer("codcuenta"), MessageBox.Ok, MessageBox.NoButton, MessageBox.NoButton);
						return false;
				}
		}
		return true;
}

function interna_beforeCommit_co_asientos(curAsiento):Boolean
{
	var util:FLUtil = new FLUtil();
	
	/** \C La fecha del asiento debe pertenecer a un ejercicio abierto				
		\end \end */
	switch(curAsiento.modeAccess()) {
		case curAsiento.Edit: {
			if (!util.sqlSelect("ejercicios", "codejercicio", "fechainicio <= '" + curAsiento.valueBufferCopy("fecha") + "'" +  " AND fechafin >= '" + curAsiento.valueBufferCopy("fecha") + "'" +  " AND estado = 'ABIERTO'")) {
				MessageBox.warning(util.translate("scripts", "S�lo pueden modificarse los asientos que pertenecen a un ejercicio abierto"), MessageBox.Ok, MessageBox.NoButton);
				return false;
			}
		}
		case curAsiento.Del:
		case curAsiento.Insert: {
			if (!util.sqlSelect("ejercicios", "codejercicio", "codejercicio = '" + curAsiento.valueBuffer("codejercicio") + "'" +  " AND fechainicio <= '" + curAsiento.valueBuffer("fecha") + "'" + " AND fechafin >= '" + curAsiento.valueBuffer("fecha") + "'" + " AND estado = 'ABIERTO'")) {
				MessageBox.warning(util.translate("scripts",  "El asiento contable no pertenece al per�odo del ejercicio asignado, o el ejercicio no est� abierto"), MessageBox.Ok, MessageBox.NoButton);
				return false;
			}
			if (curAsiento.modeAccess() == curAsiento.Insert || curAsiento.modeAccess() == curAsiento.Edit) {
				if (util.sqlSelect("co_asientos", "numero", "codejercicio = '" + curAsiento.valueBuffer("codejercicio") + "' AND numero = '" + curAsiento.valueBuffer("numero") + "' AND idasiento <> " + curAsiento.valueBuffer("idasiento"))) {
					//MessageBox.information(util.translate("scripts", "Ya existe un asiento con el n�mero y ejercicio especificados.\nEl n�mero de asiento volver� a calcularse."), MessageBox.Ok, MessageBox.NoButton);
					curAsiento.setValueBuffer("numero", this.iface.siguienteNumero(curAsiento.valueBuffer("codejercicio"), "nasiento"));
				}
			}
		}
	}

	switch(curAsiento.modeAccess()) {
		case curAsiento.Insert: {
			if (curAsiento.valueBuffer("numero") == 0) {
				numero = this.iface.siguienteNumero(curAsiento.valueBuffer("codejercicio"), "nasiento");
				if (!numero)
					return false;
				curAsiento.setValueBuffer("numero", numero);
			}
		}
	}
	return true;
}

/** \C Si la partida es de IVA, la fecha del asiento al que pertenece no puede estar incluida en un per�odo de I.V.A. regularizado
\end \end */
function interna_beforeCommit_co_partidas(curPartida):Boolean
{
	var idSubcuenta:Number = curPartida.valueBuffer("idsubcuenta");
	var idSubcuentaPrevia:Number = curPartida.valueBufferCopy("idsubcuenta");
	var idAsiento:Number = curPartida.valueBuffer("idasiento");
	switch (curPartida.modeAccess()) {
	case curPartida.Edit: {
			if (idSubcuenta == idSubcuentaPrevia) {
				if (curPartida.valueBuffer("debe") == curPartida.valueBufferCopy("debe") && curPartida.valueBuffer("haber") == curPartida.valueBufferCopy("haber"))
					return true;
			} else {
				if (!this.iface.comprobarRegIVA(idSubcuentaPrevia, idAsiento))
					return false;
			}
		}
	case curPartida.Insert:
	case curPartida.Del: {
			if (!this.iface.comprobarRegIVA(idSubcuenta, idAsiento))
				return false;
			break;
		}
	}

	return true;
}


/** \C Rec�lculo del debe, haber y saldo de la correspondiente subcuenta
\end */
function interna_afterCommit_co_partidas(curPartida):Boolean
{
		var util:FLUtil = new FLUtil();
		var curAsiento:FLSqlCursor = new FLSqlCursor("co_asientos");
		var idAsiento:String = curPartida.valueBuffer("idasiento");
		var idSubcuentaPrevia:Number = curPartida.valueBufferCopy("idsubcuenta");
		var idSubcuenta:Number = curPartida.valueBuffer("idsubcuenta");
		switch (curPartida.modeAccess()) {
			case curPartida.Edit: {
				if (idSubcuenta != idSubcuentaPrevia) {
					if (!this.iface.calcularSaldo(idSubcuentaPrevia))
						return false;
				}
			}
			case curPartida.Insert:
			case curPartida.Del: {
				if (!this.iface.calcularSaldo(idSubcuenta))
					return false;
			}
		}
		return true;

}

/** \C Borra el asiento asociado al registro de regularizaci�n de I.V.A.
\end */
function interna_afterCommit_co_regiva(curRegiva):Boolean
{
	var util:FLUtil = new FLUtil;
	switch(curRegiva.modeAccess()) {
		case curRegiva.Del: {
			var curAsiento:FLSqlCursor = new FLSqlCursor("co_asientos");
			curAsiento.select("idasiento = " + curRegiva.valueBuffer("idasiento"));
			if (curAsiento.first()) {
				curAsiento.setUnLock("editable", true);
				curAsiento.setModeAccess(curAsiento.Del);
				curAsiento.refreshBuffer();
				if (!curAsiento.commitBuffer())
					return false;
			}
			break;
		}
	}
	
	return true;	
}

function interna_beforeCommit_co_dotaciones(curDotacion:FLSqlCursor):Boolean
{
	if (!this.iface.generarAsientoDotacion(curDotacion)) {
		return false;
	}
	
	return true;
}

function interna_afterCommit_co_dotaciones(curDotacion:FLSqlCursor):Boolean
{
	switch (curDotacion.modeAccess()) {
		case curDotacion.Del: {
			if (!flfacturac.iface.pub_eliminarAsiento(curDotacion.valueBuffer("idasiento")))
				return false;
			break;
		}
		case curDotacion.Edit: {
			if (curDotacion.valueBuffer("nogenerarasiento")) {
				var idAsientoAnterior:String = curDotacion.valueBufferCopy("idasiento");
				if (idAsientoAnterior && idAsientoAnterior != "") {
					if (!flfacturac.iface.pub_eliminarAsiento(idAsientoAnterior))
						return false;
				}
			}
			break;
		}
	}

	return true;
}

//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
/** \D Ejecuta una query especificada
 
@param tabla Argumento de setTablesList 
@param campo Argumento de setSelect
@param tabla Argumento de setWhere
@param tabla Argumento de setFrom

@return Un array con los datos de los campos seleccionados. Un campo extra 'result' que es 1 = Ok, 0 = Error, -1 No encontrado
\end */
function oficial_ejecutarQry(tabla, campos, where, listaTablas):Array
{
		var util:FLUtil = new FLUtil;
		var campo:Array = campos.split(",");
		var valor = [];
		valor["result"] = 1;
		var query:FLSqlQuery = new FLSqlQuery();
		if (listaTablas)
				query.setTablesList(listaTablas);
		else
				query.setTablesList(tabla);
		query.setSelect(campo);
		query.setFrom(tabla);
		query.setWhere(where);
		try { query.setForwardOnly( true ); } catch (e) {}
		if (query.exec()) {
				if (query.next()) {
						for (var i = 0; i < campo.length; i++) {
								valor[campo[i]] = query.value(i);
						}
				} else {
						valor.result = -1;
				}
		} else {
				MessageBox.critical
						(util.translate("scripts", "Fall� la consulta") + query.sql(),
						MessageBox.Ok, MessageBox.NoButton, MessageBox.NoButton);
				valor.result = 0;
		}

		return valor;
}

/** \D Se dan de alta las cuentas especiales
\end */
function oficial_valoresIniciales()
{
		var datos =
				[["IVAREP","Cuentas de IVA repercutido"],
				["IVASOP","Cuentas de IVA soportado"],
				["IVARUE","Cuentas de IVA repercutido en adquisiciones intracomunitarias"],
				["IVASUE","Cuentas de IVA soportado en adquisiciones intracomunitarias"],
				["IVASIM","Cuentas de IVA soportado en importaciones"],
				["IVAEUE","Cuentas de IVA repercutido en entregas intracomunitarias"],
				["IVAREX","Cuentas de IVA repercutido para clientes exentos de IVA"],
				["IVARXP","Cuentas de IVA repercutido en exportaciones"],
				["IVAACR","Cuentas acreedoras de IVA en la regularizaci�n"],
				["IVADEU","Cuentas deudoras de IVA en la regularizaci�n"],
				["PYG","P�rdidas y ganancias"],
				["PREVIO","Cuentas relativas al ejercicio previo"],
				["CAMPOS","Cuentas de diferencias positivas de cambio"],
				["CAMNEG","Cuentas de diferencias negativas de cambio"],
				["DIVPOS","Cuentas por diferencias positivas en divisa extranjera"],
				["EURPOS","Cuentas por diferencias positivas de conversi�n a la moneda local"],
				["EURNEG","Cuentas por diferencias negativas de conversi�n a la moneda local"],
				["CLIENT","Cuentas de clientes"],
				["PROVEE","Cuentas de proveedores y acreedores"],
				["COMPRA","Cuentas de compras"],
				["VENTAS","Cuentas de ventas"],
				["CAJA","Cuentas de caja"],
				["IRPFPR","Cuentas de retenciones para proveedores IRPFPR"],
				["IRPF","Cuentas de retenciones IRPF"],
				["GTORF","Gastos por recargo financiero"],
				["INGRF","Ingresos por recargo financiero"],
				["DEVCOM","Devoluciones de compras"],
				["DEVVEN","Devoluciones de ventas"]];
				
		var cursor:FLSqlCursor = new FLSqlCursor("co_cuentasesp");
		for (i = 0; i < datos.length; i++) {
				cursor.setModeAccess(cursor.Insert);
				cursor.refreshBuffer();
				cursor.setValueBuffer("idcuentaesp", datos[i][0]);
				cursor.setValueBuffer("descripcion", datos[i][1]);
				cursor.commitBuffer();
		} 
		this.iface.generarCodigosBalance();
}

/** \D Se comprueba si el ejercicio actual tiene plan general contable asociado y, en caso de no tenerlo, se propone crearlo
\end */
function oficial_comprobarEjercicios()
{
		var util:FLUtil = new FLUtil();
		var q:FLSqlQuery = new FLSqlQuery();
		q.setTablesList("empresa,ejercicios,co_epigrafes");
		q.setSelect("ej.codejercicio, ej.nombre, ej.longsubcuenta");
		q.setFrom("empresa em INNER JOIN ejercicios ej" + 
				" ON em.codejercicio = ej.codejercicio" +
				" LEFT OUTER JOIN co_epigrafes ep" +
				" ON em.codejercicio = ep.codejercicio");
		q.setWhere("ep.codejercicio IS NULL");
		try { q.setForwardOnly( true ); } catch (e) {}
		
		if (!q.exec())
				return;
		
		var res;
		if (q.next()) {
				res = MessageBox.information(util.translate("scripts", "El ejercicio actual: ") +
						q.value(0) + "-" + q.value(1) +
						util.translate("scripts", 
						" no tiene Plan General Contable asociado\n�desea crearlo ahora?"),
						MessageBox.Yes, MessageBox.No, MessageBox.NoButton);

				if (res == MessageBox.Yes) {
						var dialog:Dialog = new Dialog;
						dialog.okButtonText = util.translate("scripts", "Aceptar");
						dialog.cancelButtonText = util.translate("scripts", "Cancelar");
						
						var ledLongSubcuenta:SpinBox = new SpinBox;
						ledLongSubcuenta.value = q.value(2);
						ledLongSubcuenta.minimum = 5;
						ledLongSubcuenta.maximum = 15;
						ledLongSubcuenta.label = "N�mero de d�gitos de subcuenta: ";
						dialog.add(ledLongSubcuenta);
						
						if(dialog.exec()) {
								var curEjercicio:FLSqlCursor = new FLSqlCursor("ejercicios");
								curEjercicio.select("codejercicio = '" + q.value(0) + "'");
								curEjercicio.first();
								curEjercicio.setModeAccess(curEjercicio.Edit);
								curEjercicio.refreshBuffer();
								curEjercicio.setValueBuffer("longsubcuenta", ledLongSubcuenta.value);
								if (!curEjercicio.commitBuffer())
										return false;
						} else
								return false;

						this.iface.generarPGC(q.value(0));
						this.iface.generarSubcuentas(q.value(0), ledLongSubcuenta.value);
				}
		}
}

/** \D Se comienza la creaci�n de un nuevo plan general contable. Se introducen cuentas y ep�grafes
@param codEjercicio C�digo del ejercicio sobre el que se genera el PGC
\end */
function oficial_generarPGC(codEjercicio)
{
		var util:FLUtil = new FLUtil();
		
		var numCuentasEsp:Number = this.iface.valorPorClave("co_cuentasesp", "count(idcuentaesp)", "1 = 1");
		if (numCuentasEsp == 0) this.iface.valoresIniciales();
		
		var curEpi:FLSqlCursor = new FLSqlCursor("co_epigrafes");
		var curCue:FLSqlCursor = new FLSqlCursor("co_cuentas");
		
		var datos =	[["1","1. FINANCIACION BASICA","EPI","1","","1","",""],
				["2","10. CAPITAL","EPI","10","1","10","",""],
				["1","100. Capital social","CUE","100","2","10","","P-A-I"],
				["2","1000. Capital ordinario","CUE","1000","2","10","","P-A-I"],
				["3","1001. Capital privilegiado","CUE","1001","2","10","","P-A-I"],
				["4","1002. Capital sin derecho a voto","CUE","1002","2","10","","P-A-I"],
				["5","1003. Capital con derechos restringidos","CUE","1003","2","10","","P-A-I"],
				["6","101. Fondo social","CUE","101","2","10","","P-A-I"],
				["7","102. Capital","CUE","102","2","10","","P-A-I"],
				["3","11. RESERVAS","EPI","11","1","11","",""],
				["8","110. Prima de emision de acciones","CUE","110","3","11","","P-A-II"],
				["9","111. Reservas de revalorizaci�n","CUE","111","3","11","","P-A-III"],
				["10","112. Reserva legal","CUE","112","3","11","","P-A-IV-1"],
				["11","113. Reservas especiales","CUE","113","3","11","","P-A-IV-5"],
				["12","114. Reservas para acciones de la sociedad dominante","CUE","114","3","11","","P-A-IV-3"],
				["13","115. Reservas para acciones propias","CUE","115","3","11","","P-A-IV-2"],
				["14","116. Reservas estatutarias","CUE","116","3","11","","P-A-IV-4"],
				["15","117. Reservas voluntarias","CUE","117","3","11","","P-A-IV-5"],
				["16","118. Reserva por capital amortizado","CUE","118","3","11","","P-A-IV-5"],
				["17","119. Diferencias por ajuste del capital a euros","CUE","119","3","11","","P-A-IV-5"],
				["4","12. RESULTADOS PENDIENTES DE APLICACION","EPI","12","1","12","",""],
				["18","120. Remanente","CUE","120","4","12","PREVIO","P-A-V-1"],
				["19","121. Resultados negativos de ejercicios anteriores","CUE","121","4","12","PREVIO","P-A-V-2"],
				["20","122. Aportaciones de socios para compensaci�n de p�rdidas","CUE","122","4","12","","P-A-V-3"],
				["21","129. P�rdidas y Ganancias","CUE","129","4","12","PYG","P-A-VI"],
				["5","13. INGRESOS A DISTRIBUIR EN VARIOS EJERCICIOS","EPI","13","1","13","",""],
				["22","130. Subvenciones oficiales de capital","CUE","130","5","13","","P-B-I"],
				["23","1300. Subvenciones del Estado","CUE","1300","5","13","","P-B-I"],
				["24","1301. Subvenciones de otras Administraciones P�blicas","CUE","1301","5","13","","P-B-I"],
				["25","131. Subvenciones de capital","CUE","131","5","13","","P-B-I"],
				["26","135. Ingresos por intereses diferidos","CUE","135","5","13","","P-B-III"],
				["27","136. Diferencias positivas en moneda extranjera","CUE","136","5","13","DIVPOS","P-B-II"],
				["28","137. Ingresos fiscales por diferencias permantes a distribuir en varios ejercicios","CUE","137","5","13","","P-B-IV"],
				["29","138. Ingresos fiscales por deducciones y bonificaciones fiscales a distribuir en varios ejercicios","CUE","138","5","13","","P-B-IV"],
				["6","14. PROVISIONES PARA RIESGOS Y GASTOS","EPI","14","1","14","",""],
				["30","140. Provisi�n para pensiones y obligaciones similares","CUE","140","6","14","","P-C-I"],
				["31","141. Provisi�n para impuestos","CUE","141","6","14","","P-C-II"],
				["32","142. Provisi�n para responsabilidades","CUE","142","6","14","","P-C-III"],
				["33","143. Provisi�n para grandes reparaciones","CUE","143","6","14","","P-C-III"],
				["34","144. Fondo de reversi�n","CUE","144","6","14","","P-C-IV"],
				["7","15. EMPRESTITOS Y OTRAS EMISIONES ANALOGAS","EPI","15","1","15","",""],
				["35","150. Obligaciones y bonos","CUE","150","7","15","","P-D-I-1"],
				["36","1500. Obligaciones y bonos simples","CUE","1500","7","15","","P-D-I-1"],
				["37","1501. Obligaciones y bonos garantizados","CUE","1501","7","15","","P-D-I-1"],
				["38","1502. Obligaciones y bonos subordinados","CUE","1502","7","15","","P-D-I-1"],
				["39","1503. Obligaciones y bonos cup�n cero","CUE","1503","7","15","","P-D-I-1"],
				["40","1504. Obligaciones y bonos con opci�n de adquisici�n de acciones","CUE","1504","7","15","","P-D-I-1"],
				["41","1505. Obligaciones y bonos con participaci�n en beneficios","CUE","1505","7","15","","P-D-I-1"],
				["42","151. Obligaciones y bonos convertibles","CUE","151","7","15","","P-D-I-2"],
				["43","155. Deudas representadas en otros valores negociables","CUE","155","7","15","","P-D-I-3"],
				["8","16. DEUDAS LARGO PLAZO CON EMPRESAS DEL GRUPO Y ASOCIADAS","EPI","16","1","16","",""],
				["44","160. Deudas a largo plazo con empresas del grupo","CUE","160","8","16","","P-D-III-1"],
				["45","1600. Pr�stamos a largo plazo de empresas del grupo","CUE","1600","8","16","","P-D-III-1"],
				["46","1608. Deudas a l/p con empresas del grupo por efecto impositivo","CUE","1608","8","16","","P-D-III-1"],
				["47","1609. Otras deudas a largo plazo con empresas del grupo","CUE","1609","8","16","","P-D-III-1"],
				["48","161. Deudas a largo plazo con empresas asociadas","CUE","161","8","16","","P-D-III-2"],
				["49","162. Deudas a l/p con entidades de cr�dito del grupo","CUE","162","8","16","","P-D-III-1"],
				["50","163. Deudas a l/p con entidades de cr�dito asociadas","CUE","163","8","16","","P-D-III-2"],
				["51","164. Proveedores de inmovilizado a l/p, empresas grupo","CUE","164","8","16","","P-D-III-1"],
				["52","165. Proveedores de inmovilizado l/p, empresas asociadas","CUE","165","8","16","","P-D-III-2"],
				["9","17. DEUDAS A LARGO PLAZO POR PRESTAMOS RECIBIDOS Y OTROS CONCEPTOS","EPI","17","1","17","",""],
				["53","170. Deudas a largo plazo con entidades de cr�dito","CUE","170","9","17","","P-D-II-1"],
				["54","1700. Pr�stamos a largo plazo de entidades de cr�dito","CUE","1700","9","17","","P-D-II-1"],
				["55","1709. Otras deudas a largo plazo con entidades de cr�dito","CUE","1709","9","17","","P-D-II-1"],
				["56","171. Deudas a largo plazo","CUE","171","9","17","","P-D-IV-2"],
				["57","172. Deudas a largo plazo transformables en subvenciones","CUE","172","9","17","","P-D-IV-2"],
				["58","173. Proveedores de inmovilizado a largo plazo","CUE","173","9","17","","P-D-IV-2"],
				["59","174. Efectos a pagar a largo plazo","CUE","174","9","17","","P-D-IV-1"],
				["10","18. FIANZAS Y DEPOSITOS RECIBIDOS A LARGO PLAZO","EPI","18","1","18","",""],
				["60","180. Fianzas recibidas a largo plazo","CUE","180","10","18","","P-D-IV-3"],
				["61","185. Dep�sitos recibidos a largo plazo","CUE","185","10","18","","P-D-IV-3"],
				["11","19. SITUACIONES TRANSITORIAS DE FINANCIACION","EPI","19","1","19","",""],
				["62","190. Accionistas por desembolsos no exigidos","CUE","190","11","19","","A-A"],
				["63","191. Accionistas por desembolsos no exigidos, empresas del grupo","CUE","191","11","19","","A-A"],
				["64","192. Accionistas por desembolsos no exigidos, empresas asociadas","CUE","192","11","19","","A-A"],
				["65","193. Accionistas por aportaciones no dinerarias pendientes","CUE","193","11","19","","A-A"],
				["66","194. Accionistas por aportaciones no dinerarias pendientes, empresas del grupo","CUE","194","11","19","","A-A"],
				["67","195. Accionistas por aportaciones no dinerarias pendientes, empresas asociadas","CUE","195","11","19","","A-A"],
				["68","196. Socios, parte no desembolsada","CUE","196","11","19","","A-A"],
				["69","198. Acciones propias en situaciones especiales","CUE","198","11","19","","A-B-V"],
				["70","199. Acciones propias para reducci�n de capital","CUE","199","11","19","","P-A-VIII"],
				["12","2. INMOVILIZADO","EPI","2","","2","",""],
				["13","20. GASTOS DE ESTABLECIMIENTO","EPI","20","12","20","",""],
				["71","200. Gastos de constituci�n","CUE","200","13","20","","A-B-I"],
				["72","201. Gastos de primer establecimiento","CUE","201","13","20","","A-B-I"],
				["73","202. Gastos de ampliaci�n de capital","CUE","202","13","20","","A-B-I"],
				["14","21. INMOVILIZACIONES INMATERIALES","EPI","21","12","21","",""],
				["74","210. Gastos de investigaci�n y desarrollo","CUE","210","14","21","","A-B-II-1"],
				["75","2100. Gastos de I+D en proyectos no terminados","CUE","2100","14","21","","A-B-II-1"],
				["76","2101. Gastos de I+D en proyectos terminados","CUE","2101","14","21","","A-B-II-1"],
				["77","211. Concesiones administrativas","CUE","211","14","21","","A-B-II-2"],
				["78","212. Propiedad industrial","CUE","212","14","21","","A-B-II-2"],
				["79","213. Fondo de comercio","CUE","213","14","21","","A-B-II-3"],
				["80","214. Derechos de traspaso","CUE","214","14","21","","A-B-II-4"],
				["81","215. Aplicaciones inform�ticas","CUE","215","14","21","","A-B-II-5"],
				["82","217. Derechos sobre bienes en r�gimen de arrendamiento financiero","CUE","217","14","21","","A-B-II-6"],
				["83","219. Anticipos para inmovilizaciones inmateriales","CUE","219","14","21","","A-B-II-7"],
				["15","22. INMOVILIZACIONES MATERIALES","EPI","22","12","22","",""],
				["84","220. Terrenos y bienes naturales","CUE","220","15","22","","A-B-III-1"],
				["85","221. Construcciones","CUE","221","15","22","","A-B-III-1"],
				["86","222. Instalaciones t�cnicas","CUE","222","15","22","","A-B-III-2"],
				["87","223. Maquinaria","CUE","223","15","22","","A-B-III-2"],
				["88","224. Utillaje","CUE","224","15","22","","A-B-III-3"],
				["89","225. Otras instalaciones","CUE","225","15","22","","A-B-III-3"],
				["90","226. Mobiliario","CUE","226","15","22","","A-B-III-3"],
				["91","227. Equipos para procesos de informaci�n","CUE","227","15","22","","A-B-III-5"],
				["92","228. Elementos de transporte","CUE","228","15","22","","A-B-III-5"],
				["93","229. Otro inmovilizado material","CUE","229","15","22","","A-B-III-5"],
				["16","23. INMOVILIZACIONES MATERIALES EN CURSO","EPI","23","12","23","",""],
				["94","230. Adaptaci�n de terrenos y de bienes naturales","CUE","230","16","23","","A-B-III-4"],
				["95","231. Construcciones en curso","CUE","231","16","23","","A-B-III-4"],
				["96","232. Instalaciones t�cnicas en montaje","CUE","232","16","23","","A-B-III-4"],
				["97","233. Maquinaria en montaje","CUE","233","16","23","","A-B-III-4"],
				["98","237. Equipos para procesos de informaci�n en montaje","CUE","237","16","23","","A-B-III-4"],
				["99","239. Anticipos para inmovilizaciones materiales","CUE","239","16","23","","A-B-III-4"],
				["17","24. INVERSIONES FINANCIERAS EN EMPRESAS DEL GRUPO Y ASOCIADAS","EPI","24","12","24","",""],
				["100","240. Participaciones en empresas del grupo","CUE","240","17","24","","A-B-IV-1"],
				["101","241. Participaciones en empresas asociadas","CUE","241","17","24","","A-B-IV-3"],
				["102","242. Valores de renta fija de empresas del grupo","CUE","242","17","24","","A-B-IV-2"],
				["103","243. Valores de renta fija de empresas asociadas","CUE","243","17","24","","A-B-IV-4"],
				["104","244. Cr�ditos a largo plazo a empresas del grupo","CUE","244","17","24","","A-B-IV-2"],
				["105","2448. Cr�ditos a l/p con empresas del grupo por efecto impositivo","CUE","2448","17","24","","A-B-IV-2"],
				["106","245. Cr�ditos a largo plazo a empresas asociadas","CUE","245","17","24","","A-B-IV-4"],
				["107","246. Intereses a l/p de inversiones financieras en empresas del grupo","CUE","246","17","24","","A-B-IV-2"],
				["108","247. Intereses a l/p de inversiones financieras en empresas asociadas","CUE","247","17","24","","A-B-IV-4"],
				["109","248. Desembolsos pendientes sobre acciones de empresas del grupo","CUE","248","17","24","","P-D-V-1"],
				["110","249. Desembolsos pendientes sobre acciones de empresas asociadas","CUE","249","17","24","","P-D-V-2"],
				["18","25. OTRAS INVERSIONES FINANCIERAS PERMANENTES","EPI","25","12","25","",""],
				["111","250. Inversiones financieras permanentes en capital","CUE","250","18","25","","A-B-IV-5"],
				["112","2500. Inversiones financieras permantes en acciones con cotizaci�n en mercado secundario organizado","CUE","2500","18","25","","A-B-IV-5"],
				["113","2501. Inversiones financieras permantes en acciones sin cotizaci�n en mercado secundario organizado","CUE","2501","18","25","","A-B-IV-5"],
				["114","2502. Otras inversiones financieras en capital","CUE","2502","18","25","","A-B-IV-5"],
				["115","251. Valores de renta fija","CUE","251","18","25","","A-B-IV-5"],
				["116","2158. Participaci�n en Fondos de Inversi�n en Activos del Mercado Monetario a l/p","CUE","2158","14","21","","A-B-IV-5"],
				["117","252. Cr�ditos a largo plazo","CUE","252","18","25","","A-B-IV-6"],
				["118","253. Cr�ditos a l/p por enajenaci�n de inmovilizado","CUE","253","18","25","","A-B-IV-6"],
				["119","254. Creditos a largo plazo al personal","CUE","254","18","25","","A-B-IV-6"],
				["120","256. Intereses a largo plazo de valores de renta fija","CUE","256","18","25","","A-B-IV-5"],
				["121","257. Intereses a largo plazo de cr�ditos","CUE","257","18","25","","A-B-IV-6"],
				["122","258. Imposiciones a largo plazo","CUE","258","18","25","","A-B-IV-6"],
				["123","259. Desembolsos pendientes sobre acciones","CUE","259","18","25","","P-D-V-3"],
				["19","26. FIANZAS Y DEPOSITOS CONSTITUIDOS A LARGO PLAZO","EPI","26","12","26","",""],
				["124","260. Fianzas constituidas a largo plazo","CUE","260","19","26","","A-B-IV-7"],
				["125","265. Depositos constituidos a largo plazo","CUE","265","19","26","","A-B-IV-7"],
				["20","27. GASTOS A DISTRIBUIR EN VARIOS EJERCICIOS","EPI","27","12","27","",""],
				["126","270. Gastos de formalizaci�n de deudas","CUE","270","20","27","","A-C"],
				["127","271. Gastos por intereses diferidos de valores negociables","CUE","271","20","27","","A-C"],
				["128","272. Gastos por intereses diferidos","CUE","272","20","27","","A-C"],
				["21","28. AMORTIZACION ACUMULADA DEL INMOVILIZADO","EPI","28","12","28","",""],
				["129","281. Amortizaci�n acumulada del inmovilizado inmaterial","CUE","281","21","28","","A-B-II-9"],
				["130","2810. Amortizaci�n acumulada de gastos de I+D","CUE","2810","21","28","","A-B-II-9"],
				["131","2811. Amortizaci�n acumulada de concesiones administrativas","CUE","2811","21","28","","A-B-II-9"],
				["132","2812. Amortizaci�n acumulada de propiedad industrial","CUE","2812","21","28","","A-B-II-9"],
				["133","2813. Amortizaci�n acumulada de fondo de comercio","CUE","2813","21","28","","A-B-II-9"],
				["134","2814. Amortizaci�n acumulada de derechos de traspaso","CUE","2814","21","28","","A-B-II-9"],
				["135","2815. Amortizaci�n acumulada de aplicaciones inform�ticas","CUE","2815","21","28","","A-B-II-9"],
				["136","2817. Amortizaci�n acumulada de derechos sobre bienes en r�gimen de arrendamiento financiero","CUE","2817","21","28","","A-B-II-9"],
				["137","282. Amortizaci�n acumulada del inmovilizado material","CUE","282","21","28","","A-B-III-7"],
				["138","2821. Amortizaci�n acumulada de construcciones","CUE","2821","21","28","","A-B-III-7"],
				["139","2822. Amortizaci�n acumulada de instalaciones t�cnicas","CUE","2822","21","28","","A-B-III-7"],
				["140","2823. Amortizaci�n acumulada de maquinaria","CUE","2823","21","28","","A-B-III-7"],
				["141","2824. Amortizaci�n acumulada de utillaje","CUE","2824","21","28","","A-B-III-7"],
				["142","2825. Amortizaci�n acumulada de otras instalaciones","CUE","2825","21","28","","A-B-III-7"],
				["143","2826. Amortizaci�n acumulada de mobiliario","CUE","2826","21","28","","A-B-III-7"],
				["144","2827. Amortizaci�n acumulada de equipos para procesos inform�ticos","CUE","2827","21","28","","A-B-III-7"],
				["145","2828. Amortizaci�n acumulada de elementos de transporte","CUE","2828","21","28","","A-B-III-7"],
				["146","2829. Amortizaci�n acumulada de otro inmovilizado material","CUE","2829","21","28","","A-B-III-7"],
				["22","29. PROVISIONES DE INMOVILIZADO","EPI","29","12","29","",""],
				["147","291. Provisi�n por depreciaci�n inmovilizado inmaterial","CUE","291","22","29","","A-B-II-8"],
				["148","292. Provisi�n por depreciaci�n inmovilizado material","CUE","292","22","29","","A-B-III-6"],
				["149","293. Provisi�n por depreciaci�n valores negociables l/p de empresas del grupo","CUE","293","22","29","","A-B-IV-8"],
				["150","2930. Provisi�n por depreciaci�n participaciones en capital l/p de empresas del grupo","CUE","2930","22","29","","A-B-IV-8"],
				["151","2935. Provisi�n por depreciaci�n valores renta fija l/p de empresas del grupo","CUE","2935","22","29","","A-B-IV-8"],
				["152","294. Provisi�n por depreciaci�n valores negociables l/p de empresas asociadas","CUE","294","22","29","","A-B-IV-8"],
				["153","2941. Provisi�n por depreciaci�n participaciones en capital l/p de empresas asociadas","CUE","2941","22","29","","A-B-IV-8"],
				["154","2946. Provisi�n por depreciaci�n valores renta fija l/p de empresas asociadas","CUE","2946","22","29","","A-B-IV-8"],
				["155","295. Provisi�n para insolvencias de creditos l/p a empresas del grupo","CUE","295","22","29","","A-B-IV-8"],
				["156","296. Provisi�n para insolvencias de creditos l/p a empresasa asociadas","CUE","296","22","29","","A-B-IV-8"],
				["157","297. Provisi�n por depreciaci�n de valores negociables l/p","CUE","297","22","29","","A-B-IV-8"],
				["158","298. Provisi�n para insolvencias de cr�ditos a l/p","CUE","298","22","29","","A-B-IV-8"],
				["23","3. EXISTENCIAS","EPI","3","","3","",""],
				["24","30. COMERCIALES","EPI","30","23","30","",""],
				["159","300. Mercaderias A","CUE","300","24","30","","A-D-II-1"],
				["160","301. Mercaderias B","CUE","301","24","30","","A-D-II-1"],
				["25","31. MATERIAS PRIMAS","EPI","31","23","31","",""],
				["161","310. Materias primas A","CUE","310","25","31","","A-D-II-2"],
				["162","311. Materias primas B","CUE","311","25","31","","A-D-II-2"],
				["26","32. OTROS APROVISIONAMIENTOS","EPI","32","23","32","",""],
				["163","320. Elementos y conjuntos incorporables","CUE","320","26","32","","A-D-II-2"],
				["164","321. Combustibles","CUE","321","26","32","","A-D-II-2"],
				["165","322. Repuestos","CUE","322","26","32","","A-D-II-2"],
				["166","325. Materiales diversos","CUE","325","26","32","","A-D-II-2"],
				["167","326. Embalajes","CUE","326","26","32","","A-D-II-2"],
				["168","327. Envases","CUE","327","26","32","","A-D-II-2"],
				["169","328. Material de oficina","CUE","328","26","32","","A-D-II-2"],
				["27","33. PRODUCTOS EN CURSO","EPI","33","23","33","",""],
				["170","330. Productos en curso A","CUE","330","27","33","","A-D-II-3"],
				["171","331. Productos en curso B","CUE","331","27","33","","A-D-II-3"],
				["28","34. PRODUCTOS SEMITERMINADOS","EPI","34","23","34","",""],
				["172","340. Productos semiterminados A","CUE","340","28","34","","A-D-II-3"],
				["173","341. Productos semiterminados B","CUE","341","28","34","","A-D-II-3"],
				["29","35. PRODUCTOS TERMINADOS","EPI","35","23","35","",""],
				["174","350. Productos terminados A","CUE","350","29","35","","A-D-II-4"],
				["175","351. Productos terminados B","CUE","351","29","35","","A-D-II-4"],
				["30","36. SUBPRODUCTOS, RESIDUOS Y MATERIALES RECUPERADOS","EPI","36","23","36","",""],
				["176","360. Subproductos A","CUE","360","30","36","","A-D-II-5"],
				["177","361. Subproductos B","CUE","361","30","36","","A-D-II-5"],
				["178","365. Residuos A","CUE","365","30","36","","A-D-II-5"],
				["179","366. Residuos B","CUE","366","30","36","","A-D-II-5"],
				["180","368. Materiales recuperados A","CUE","368","30","36","","A-D-II-5"],
				["181","369. Materiales recuperados B","CUE","369","30","36","","A-D-II-5"],
				["31","39. PROVISIONES POR DEPRECIACION DE EXISTENCIAS","EPI","39","23","39","",""],
				["182","390. Provisi�n por depreciaci�n de mercader�as","CUE","390","31","39","","A-D-II-7"],
				["183","391. Provisi�n por depreciaci�n de materias primas","CUE","391","31","39","","A-D-II-7"],
				["184","392. Provisi�n por depreciaci�n de otros aprovisionamientos","CUE","392","31","39","","A-D-II-7"],
				["185","393. Provisi�n por depreciaci�n de productos en curso","CUE","393","31","39","","A-D-II-7"],
				["186","394. Provisi�n por depreciaci�n de productos semiterminados","CUE","394","31","39","","A-D-II-7"],
				["187","395. Provisi�n por depreciaci�n de productos terminado","CUE","395","31","39","","A-D-II-7"],
				["188","396. Provisi�n por depreciaci�n de subproductos,residuos y materiales recuperados","CUE","396","31","39","","A-D-II-7"],
				["32","4. ACREEDORES Y DEUDORES POR OPERACIONES DE TRAFICO","EPI","4","","4","",""],
				["33","40. PROVEEDORES","EPI","40","32","40","",""],
				["189","400. Proveedores","CUE","400","33","40","PROVEE","P-E-IV-2"],
				["191","4004. Proveedores (moneda extranjera)","CUE","4004","33","40","PROVEE","P-E-IV-2"],
				["192","4009. Proveedores facturas pendientes de recibir o formalizar","CUE","4009","33","40","PROVEE","P-E-IV-2"],
				["193","401. Proveedores, efectos comerciales a pagar","CUE","401","33","40","PROVEE","P-E-IV-3"],
				["194","402. Proveedores, empresas del grupo","CUE","402","33","40","PROVEE","P-E-III-1"],
				["195","4020. Proveedores, empresas del grupo (euros)","CUE","4020","33","40","PROVEE","P-E-III-1"],
				["196","4021. Efectos comerciales a pagar, empresas del grupo","CUE","4021","33","40","PROVEE","P-E-III-1"],
				["197","4024. Proveedores, empresas del grupo (moneda extranjera","CUE","4024","33","40","PROVEE","P-E-III-1"],
				["198","4026. Envases y embalajes a devolver a proveedores, empresas del grupo","CUE","4026","33","40","PROVEE","P-E-III-1"],
				["199","4029. Proveedores, empresas del grupo,facturas pendientes de recibir o formalizar","CUE","4029","33","40","PROVEE","P-E-III-1"],
				["200","403. Proveedores, empresas asociadas","CUE","403","33","40","PROVEE","P-E-III-2"],
				["201","406. Envases y embalajes a devolver a proveedores","CUE","406","33","40","PROVEE","P-E-IV-2"],
				["202","407. Anticipos a proveedores","CUE","407","33","40","PROVEE","A-D-II-6"],
				["34","41. ACREEDORES VARIOS","EPI","41","32","41","",""],
				["203","410. Acreedores por prestaciones de servicios","CUE","410","34","41","PROVEE","P-E-IV-2"],
				["204","4100. Acreedores por prestaciones de servicios (euros)","CUE","4100","34","41","PROVEE","P-E-IV-2"],
				["205","4104. Acreedores por prestaciones de servicios (moneda extranjera)","CUE","4104","34","41","PROVEE","P-E-IV-2"],
				["206","4109. Acreedores por prestaciones de servicios,facturas pendientes de recibir o formalizar","CUE","4109","34","41","PROVEE","P-E-IV-2"],
				["207","411. Acreedores, efectos comerciales a pagar","CUE","411","34","41","PROVEE","P-E-IV-3"],
				["208","419. Acreedores por operaciones en com�n","CUE","419","34","41","PROVEE","P-E-IV-2"],
				["35","43. CLIENTES","EPI","43","32","43","",""],
				["209","430. Clientes","CUE","430","35","43","CLIENT","A-D-III-1"],
				["211","4304. Clientes (moneda extranjera)","CUE","4304","35","43","CLIENT","A-D-III-1"],
				["212","4309. Clientes, facturas pendientes de formalizar","CUE","4309","35","43","CLIENT","A-D-III-1"],
				["213","431. Clientes, efectos comerciales a cobrar","CUE","431","35","43","CLIENT","A-D-III-1"],
				["214","4310. Efectos comerciales en cartera","CUE","4310","35","43","CLIENT","A-D-III-1"],
				["215","4311. Efectos comerciales descontados","CUE","4311","35","43","CLIENT","A-D-III-1"],
				["216","4312. Efectos comerciales en gesti�n de cobro","CUE","4312","35","43","CLIENT","A-D-III-1"],
				["217","4315. Efectos comerciales impagados","CUE","4315","35","43","CLIENT","A-D-III-1"],
				["218","432. Clientes, empresas del grupo","CUE","432","35","43","CLIENT","A-D-III-2"],
				["219","4320. Clientes, empresas del grupo (euros)","CUE","4320","35","43","CLIENT","A-D-III-2"],
				["220","4321. Efectos comerciales a cobrar, empresas del grupo","CUE","4321","35","43","CLIENT","A-D-III-2"],
				["221","4324. Clientes, empresas del grupo (moneda extranjera)","CUE","4324","35","43","CLIENT","A-D-III-2"],
				["222","4326. Envases y embalajes a devolver a clientes, empresas del grupo","CUE","4326","35","43","CLIENT","A-D-III-2"],
				["223","4329. Clientes, empresas del grupo, facturas pendientes formalizar","CUE","4329","35","43","CLIENT","A-D-III-2"],
				["224","433. Clientes, empresas asociadas","CUE","433","35","43","CLIENT","A-D-III-3"],
				["225","435. Clientes de dudoso cobro","CUE","435","35","43","CLIENT","A-D-III-1"],
				["226","436. Envases y embalajes a devolver por clientes","CUE","436","35","43","CLIENT","A-D-III-1"],
				["227","437. Anticipos de clientes","CUE","437","35","43","CLIENT","P-E-IV-1"],
				["36","44. DEUDORES VARIOS","EPI","44","32","44","",""],
				["228","440. Deudores","CUE","440","36","44","CLIENT","A-D-III-4"],
				["229","4400. Deudores (euros)","CUE","4400","36","44","CLIENT","A-D-III-4"],
				["230","4404. Deudores (moneda extranjera)","CUE","4404","36","44","CLIENT","A-D-III-4"],
				["231","4409. Deudores, facturas pendientes de formalizar","CUE","4409","36","44","CLIENT","A-D-III-4"],
				["232","441. Deudores, efectos comerciales a cobrar","CUE","441","36","44","CLIENT","A-D-III-4"],
				["233","4410. Deudores, efectos comerciales en cartera","CUE","4410","36","44","CLIENT","A-D-III-4"],
				["234","4411. Deudores, efectos comerciales descontados","CUE","4411","36","44","CLIENT","A-D-III-4"],
				["235","4412. Deudores, efectos comerciales en gesti�n de cobro","CUE","4412","36","44","CLIENT","A-D-III-4"],
				["236","4415. Deudores, efectos comerciales impagados","CUE","4415","36","44","CLIENT","A-D-III-4"],
				["237","445. Deudores de dudoso cobro","CUE","445","36","44","CLIENT","A-D-III-4"],
				["238","449. Deudores por operaciones en com�n","CUE","449","36","44","CLIENT","A-D-III-4"],
				["37","46. PERSONAL","EPI","46","32","46","",""],
				["239","460. Anticipos de remuneraciones","CUE","460","37","46","","A-D-III-5"],
				["240","465. Remuneraciones pendientes de pago","CUE","465","37","46","","P-E-V-4"],
				["38","47. ADMINISTRACIONES PUBLICAS","EPI","47","32","47","",""],
				["241","470. Hacienda P�blica, deudor por diversos conceptos","CUE","470","38","47","IVADEU","A-D-III-6"],
				["242","4700. Hacienda P�blica, deudor por IVA","CUE","4700","38","47","IVADEU","A-D-III-6"],
				["243","4707. Hacienda P�blica, deudor por IGIC","CUE","4707","38","47","","A-D-III-6"],
				["244","47070. Hacienda P�blica, deudor por IGIC","CUE","47070","38","47","","A-D-III-6"],
				["245","47071. Hacienda P�blica, deudor por IGIC r�gimen transitorio, circulante","CUE","47071","38","47","","A-D-III-6"],
				["246","47072. Hacienda P�blica, deudor por IGIC r�gimen transitorio, inversi�n","CUE","47072","38","47","","A-D-III-6"],
				["247","4708. Hacienda P�blica, deudor por subvenciones concedidas","CUE","4708","38","47","","A-D-III-6"],
				["248","4709. Hacienda P�blica, deudor por devoluci�n impuestos","CUE","4709","38","47","","A-D-III-6"],
				["249","471. Organismos de la Seguridad Social, deudores","CUE","471","38","47","","A-D-III-6"],
				["250","472. Hacienda Publica, IVA soportado","CUE","472","38","47","IVASOP","A-D-III-6"],
				["251","4720. IVA soportado","CUE","4720","38","47","IVASOP","A-D-III-6"],
				["252","4727. IGIC soportado","CUE","4727","38","47","","A-D-III-6"],
				["253","473. Hacienda P�blica, retenciones y pagos a cuenta","CUE","473","38","47","","P-E-V-1"],
				["254","4732. Hacienda P�blica, retenciones y pagos a cuenta","CUE","4732","38","47","","P-E-V-1"],
				["255","474. Impuesto sobre beneficios anticipado y compensaci�n de p�rdidas","CUE","474","38","47","","A-D-III-6"],
				["256","4740. Impuesto sobre beneficios anticipado","CUE","4740","38","47","","A-D-III-6"],
				["257","4741. Impuestos sobre beneficios anticipado a l/p","CUE","4741","38","47","","A-D-III-6"],
				["258","4745. Cr�dito por p�rdidas a compensar del ejercicio....","CUE","4745","38","47","","A-D-III-6"],
				["259","4746. Cr�dito por p�rdidas a compensar del ejercicio..a l/p","CUE","4746","38","47","","A-D-III-6"],
				["260","4748. Impuesto sobre beneficios anticipado por operaciones intra-grupo","CUE","4748","38","47","","A-D-III-6"],
				["261","4749. Cr�dito por perdidas a compensar en r�gimen de declaraci�n consolidada del ejercicio...","CUE","4749","38","47","","A-D-III-6"],
				["262","475. Hacienda P�blica, acreedor por conceptos fiscales","CUE","475","38","47","IVAACR","P-E-V-1"],
				["263","4750. Hacienda P�blica, acreedor por IVA","CUE","4750","38","47","IVAACR","P-E-V-1"],
				["264","4751. Hacienda P�blica, acreedor por retenciones practicadas","CUE","4751","38","47","IRPFPR","P-E-V-1"],
				["265","4752. Hacienda P�blica, acreedor por impuesto sobre sociedades","CUE","4752","38","47","","P-E-V-1"],
				["266","4757. Hacienda P�blica, acreedor por IGIC","CUE","4757","38","47","","P-E-V-1"],
				["267","4758. Hacienda P�blica, acreedor por subvenciones a reintegrar","CUE","4758","38","47","","P-E-V-1"],
				["268","476. Organismos de la Seguridad Social, acreedores","CUE","476","38","47","","P-E-V-1"],
				["269","477. Hacienda P�blica, IVA repercutido","CUE","477","38","47","IVAREP","P-E-V-1"],
				["270","4770. IVA repercutido","CUE","4770","38","47","IVAREP","P-E-V-1"],
				["271","4777. IGIC repercutido","CUE","4777","38","47","","P-E-V-1"],
				["272","479. Impuesto sobre beneficios diferido","CUE","479","38","47","","P-E-V-1"],
				["273","4791. Impuesto sobre beneficios diferido a l/p","CUE","4791","38","47","","P-E-V-1"],
				["274","4798. Impuesto sobre beneficios diferido por operaciones intra-grupo","CUE","4798","38","47","","P-E-V-1"],
				["39","48. AJUSTES POR PERIODIFICACION","EPI","48","32","48","",""],
				["275","480. Gastos anticipados","CUE","480","39","48","","A-D-VII"],
				["276","485. Ingresos anticipados","CUE","485","39","48","","P-E-VII"],
				["40","49. PROVISIONES POR OPERACIONES DE TRAFICO","EPI","49","32","49","",""],
				["277","490. Provisi�n para insolvencias de tr�fico","CUE","490","40","49","","A-D-III-7"],
				["278","493. Provisi�n para insolvencias de tr�fico de empresas del grupo","CUE","493","40","49","","A-D-III-7"],
				["279","494. Provisi�n para insolvencias de tr�fico de empresas asociadas","CUE","494","40","49","","A-D-III-7"],
				["280","499. Provisi�n para otras operaciones de tr�fico","CUE","499","40","49","","P-E-VI"],
				["41","5. CUENTAS FINANCIERAS","EPI","5","","5","",""],
				["42","50. EMPRESTITOS Y OTRAS EMISIONES ANALOGAS A CORTO PLAZO","EPI","50","41","50","",""],
				["281","500. Obligaciones y bonos a corto plazo","CUE","500","42","50","","P-E-I-1"],
				["282","501. Obligaciones y bonos convertibles a corto plazo","CUE","501","42","50","","P-E-I-2"],
				["283","505. Deudas representadas otros valores negociables c/p","CUE","505","42","50","","P-E-I-3"],
				["284","506. Intereses de empr�stitos y otras emisiones an�logas","CUE","506","42","50","","P-E-I-4"],
				["285","509. Valores negociables amortizados","CUE","509","42","50","","P-E-V-3"],
				["286","5090. Obligaciones y bonos amortizados","CUE","5090","42","50","","P-E-V-3"],
				["287","5091. Obligaciones y bonos convertibles amortizados","CUE","5091","42","50","","P-E-V-3"],
				["288","5095. Otros valores negociables amortizados","CUE","5095","42","50","","P-E-V-3"],
				["43","51. DEUDAS A CORTO PLAZO CON EMPRESAS DEL GRUPO Y ASOCIADAS","EPI","51","41","51","",""],
				["289","510. Deudas a corto plazo con empresas del grupo","CUE","510","43","51","","P-E-III-1"],
				["290","5100. Pr�stamos a corto plazo de empresas del grupo","CUE","5100","43","51","","P-E-III-1"],
				["291","5108. Deudas a c/p con empresas del grupo por efectos impositivos","CUE","5108","43","51","","P-E-III-1"],
				["292","5109. Otras deudas a corto plazo con empresas del grupo","CUE","5109","43","51","","P-E-III-1"],
				["293","511. Deudas a corto plazo con empresas asociadas","CUE","511","43","51","","P-E-III-2"],
				["294","512. Deudas a c/p con entidades de cr�dito del grupo","CUE","512","43","51","","P-E-III-1"],
				["295","5120. Pr�stamos a c/p de entidades de cr�dito del grupo","CUE","5120","43","51","","P-E-III-1"],
				["296","5128. Deudas por efectos descontados en entididades de cr�dito del grupo","CUE","5128","43","51","","P-E-III-1"],
				["297","5129. Otras deudas c/p con entidades de cr�dito del grupo","CUE","5129","43","51","","P-E-III-1"],
				["298","513. Deudas a c/p con entidades de credito asociadas","CUE","513","43","51","","P-E-III-2"],
				["299","514. Proveedores de inmovilizado a c/p, empresas del grupo","CUE","514","43","51","","P-E-III-1"],
				["300","515. Proveedores de inmovilizado a c/p, empresas asociadas","CUE","515","43","51","","P-E-III-2"],
				["301","516. Intereses a c/p de deudas con empresas del grupo","CUE","516","43","51","","P-E-III-1"],
				["302","517. Intereses a c/p de deudas con empresas asociadas","CUE","517","43","51","","P-E-III-2"],
				["44","52. DEUDAS A CORTO PLAZO POR PRESTAMOS RECIBIDOS Y OTROS CONCEPTOS","EPI","52","41","52","",""],
				["303","520. Deudas a corto plazo con entidades de cr�dito","CUE","520","44","52","","P-E-II-1"],
				["304","5200. Pr�stamos a corto plazo de entidades de cr�dito","CUE","5200","44","52","","P-E-II-1"],
				["305","5201. Deudas a corto plazo por cr�dito dispuesto","CUE","5201","44","52","","P-E-II-1"],
				["306","5208. Deudas por efectos descontados","CUE","5208","44","52","","P-E-II-1"],
				["307","521. Deudas a corto plazo","CUE","521","44","52","","P-E-V-3"],
				["308","523. Proveedores de inmovilizado a corto plazo","CUE","523","44","52","","P-E-V-3"],
				["309","524. Efectos a pagar a corto plazo","CUE","524","44","52","","P-E-V-2"],
				["310","525. Dividendo activo a pagar","CUE","525","44","52","","P-E-V-3"],
				["311","526. Intereses a c/p de deudas con entidades de cr�dito","CUE","526","44","52","","P-E-II-2"],
				["312","527. Intereses a corto plazo de deudas","CUE","527","44","52","","P-E-V-3"],
				["45","53. INVERSIONES FINANCIERAS A CORTO PLAZO EN EMPRESAS DEL GRUPO Y ASOCIADAS","EPI","53","41","53","",""],
				["313","530. Participaciones a c/p en empresas del grupo","CUE","530","45","53","","A-D-IV-1"],
				["314","531. Participaciones a c/p en empresas asociadas","CUE","531","45","53","","A-D-IV-3"],
				["315","532. Valores de renta fija a c/p de empresas del grupo","CUE","532","45","53","","A-D-IV-2"],
				["316","533. Valores de renta fija a c/p de empresas asociadas","CUE","533","45","53","","A-D-IV-4"],
				["317","534. Cr�ditos a corto plazo a empresas del grupo","CUE","534","45","53","","A-D-IV-2"],
				["318","5348. Cr�ditos a c/p con empresas del grupo por efecto impositivo","CUE","5348","45","53","","A-D-IV-2"],
				["319","535. Cr�ditos a corto plazo a empresas asociadas","CUE","535","45","53","","A-D-IV-4"],
				["320","536. Intereses a c/p de inversiones financieras en empresas del grupo","CUE","536","45","53","","A-D-IV-2"],
				["321","5360. Intereses c/p valores renta fija de empresas del grupo","CUE","5360","45","53","","A-D-IV-2"],
				["322","5361. Intereses c/p de cr�ditos a empresas del grupo","CUE","5361","45","53","","A-D-IV-2"],
				["323","537. Intereses a c/p de inversiones financieras en empresas asociadas","CUE","537","45","53","","A-D-IV-4"],
				["324","538. Desembolsos pendientes sobre acciones a c/p de empresas del grupo","CUE","538","45","53","","A-D-IV-1"],
				["325","539. Desembolsos pendientes sobre acciones a c/p de empresas asociadas","CUE","539","45","53","","A-D-IV-3"],
				["46","54. OTRAS INVERSIONES FINANCIERAS TEMPORALES","EPI","54","41","54","",""],
				["326","540. Inversiones financieras temporales en capital","CUE","540","46","54","","A-D-IV-5"],
				["327","5400. Inversiones financieras temporales en acciones con cotizaci�n en mercado secundario organizado","CUE","5400","46","54","","A-D-IV-5"],
				["328","5401. Inversiones financieras temporales en acciones sin cotizaci�n en mercado secundario organizado","CUE","5401","46","54","","A-D-IV-5"],
				["329","5409. Otras inversiones financieras temporales en capital","CUE","5409","46","54","","A-D-IV-5"],
				["330","541. Valores de renta fija a corto plazo","CUE","541","46","54","","A-D-IV-5"],
				["331","5418. Participaciones en Fondos de Inversi�n en Activos del Mercado Monetario a c/p","CUE","5418","46","54","","A-D-IV-5"],
				["332","542. Cr�ditos a corto plazo","CUE","542","46","54","","A-D-IV-6"],
				["333","543. Creditos a c/p por enajenaci�n de inmovilizado","CUE","543","46","54","","A-D-IV-6"],
				["334","544. Cr�ditos a corto plazo al personal","CUE","544","46","54","","A-D-III-5"],
				["335","545. Dividendo a cobrar","CUE","545","46","54","","A-D-IV-6"],
				["336","546. Intereses a corto plazo de valores de renta fija","CUE","546","46","54","","A-D-IV-5"],
				["337","547. Intereses a corto plazo de cr�ditos","CUE","547","46","54","","A-D-IV-6"],
				["338","548. Imposiciones a corto plazo","CUE","548","46","54","","A-D-IV-6"],
				["339","549. Desembolsos pendientes sobre acciones a corto plazo","CUE","549","46","54","","A-D-IV-5"],
				["47","55. OTRAS CUENTAS NO BANCARIAS","EPI","55","41","55","",""],
				["340","550. Titular de la explotaci�n","CUE","550","47","55","","P-E-V-3"],
				["341","551. Cuenta corriente con empresas del grupo","CUE","551","47","55","","A-D-III-2"],
				["342","552. Cuenta corriente con empresas asociadas","CUE","552","47","55","","P-E-III-2"],
				["343","553. Cuenta corriente con socios y administradores","CUE","553","47","55","","A-D-III-4"],
				["344","555. Partidas pendientes de aplicaci�n","CUE","555","47","55","","A-D-III-4"],
				["345","556. Desembolsos exigidos sobre acciones","CUE","556","47","55","","P-E-V-3"],
				["346","5560. Desembolsos exigidos sobre acciones de empresas del grupo","CUE","5560","47","55","","P-E-V-3"],
				["347","5561. Desembolsos exigidos sobre acciones de empresas asociadas","CUE","5561","47","55","","P-E-V-3"],
				["348","5562. Desembolsos exigidos sobre acciones de otras empresas","CUE","5562","47","55","","P-E-V-3"],
				["349","557. Dividendo activo a cuenta","CUE","557","47","55","","P-A-VII"],
				["350","558. Accionistas por desembolsos exigidos","CUE","558","47","55","","A-D-I"],
				["48","56. FIANZAS Y DEPOSITOS RECIBIDOS Y CONSTITUIDOS A CORTO PLAZO","EPI","56","41","56","",""],
				["351","560. Fianzas recibidas a corto plazo","CUE","560","48","56","","P-E-V-5"],
				["352","561. Dep�sitos recibidos a corto plazo","CUE","561","48","56","","P-E-V-5"],
				["353","565. Fianzas constituidas a corto plazo","CUE","565","48","56","","A-D-IV-7"],
				["354","566. Dep�sitos constituidos a corto plazo","CUE","566","48","56","","A-D-IV-7"],
				["49","57. TESORERIA","EPI","57","41","57","",""],
				["355","570. Caja, euros","CUE","570","49","57","CAJA","A-D-VI"],
				["356","571. Caja, moneda extranjera","CUE","571","49","57","","A-D-VI"],
				["357","572. Bancos e instituciones de cr�dito c/c. vista, euros","CUE","572","49","57","","A-D-VI"],
				["358","573. Bancos e instituciones de cr�dito c/c. vista, moneda extranjera","CUE","573","49","57","","A-D-VI"],
				["359","574. Bancos e instituciones de cr�dito, cuentas de ahorro, euros","CUE","574","49","57","","A-D-VI"],
				["360","575. Bancos e instituciones de cr�dito, cuentas de ahorro, moneda extranjera","CUE","575","49","57","","A-D-VI"],
				["50","58. AJUSTES POR PERIODIFICACION","EPI","58","41","58","",""],
				["361","580. Intereses pagados por anticipado","CUE","580","50","58","","A-D-VII"],
				["362","585. Intereses cobrados por anticipado","CUE","585","50","58","","P-E-VII"],
				["51","59. PROVISIONES FINANCIERAS","EPI","59","41","59","",""],
				["363","593. Provisi�n por depreciaci�n de valores negociables a c/p de empresas del grupo","CUE","593","51","59","","A-D-IV-8"],
				["364","594. Provisi�n por depreciaci�n de valores negociables a c/p de empresas asociadas","CUE","594","51","59","","A-D-IV-8"],
				["365","595. Provisi�n para insolvencias de cr�ditos a c/p a empresas del grupo","CUE","595","51","59","","A-D-IV-8"],
				["366","596. Provisi�n para insolvencias de cr�ditos a c/p a empresas asociadas","CUE","596","51","59","","A-D-IV-8"],
				["367","597. Provisi�n por depreciaci�n de valores negociables a c/p","CUE","597","51","59","","A-D-IV-8"],
				["368","598. Provisi�n para insolvencias de cr�ditos a c/p","CUE","598","51","59","","A-D-IV-8"],
				["52","6. COMPRAS Y GASTOS","EPI","6","","6","",""],
				["53","60. COMPRAS","EPI","60","52","60","",""],
				["369","600. Compras de mercader�as","CUE","600","53","60","COMPRA","D-A-2-a"],
				["370","601. Compras de materias primas","CUE","601","53","60","","D-A-2-b"],
				["371","602. Compras de otros aprovisionamientos","CUE","602","53","60","","D-A-2-b"],
				["372","607. Trabajos realizados por otras empresas","CUE","607","53","60","","D-A-2-c"],
				["373","608. Devoluciones de compras y operaciones similares","CUE","608","53","60","DEVCOM","D-A-2-a"],
				["374","6080. Devoluciones de compras de mercader�as","CUE","6080","53","60","","D-A-2-a"],
				["375","6081. Devoluciones de compras de materias primas","CUE","6081","53","60","","D-A-2-b"],
				["376","6082. Devoluciones de compras de otros aprovisionamients","CUE","6082","53","60","","D-A-2-b"],
				["377","609. Rappels por compras","CUE","609","53","60","","D-A-2-a"],
				["378","6090. Rappels por compras de mercader�as","CUE","6090","53","60","","D-A-2-a"],
				["379","6091. Rapels por compras de materias primas","CUE","6091","53","60","","D-A-2-b"],
				["380","6092. Rappels por compras de otros aprovisionamientos","CUE","6092","53","60","","D-A-2-b"],
				["54","61. VARIACION DE EXISTENCIAS","EPI","61","52","61","",""],
				["381","610. Variaci�n de existencias de mercader�as","CUE","610","54","61","","D-A-2-a"],
				["382","611. Variaci�n de existencias de materias primas","CUE","611","54","61","","D-A-2-b"],
				["383","612. Variaci�n de existencias de otros aprovisionamientos","CUE","612","54","61","","D-A-2-b"],
				["55","62. SERVICIOS EXTERIORES","EPI","62","52","62","",""],
				["384","620. Gastos en investigaci�n y desarrollo del ejercicio","CUE","620","55","62","","D-A-6-a"],
				["385","621. Arrendamientos y c�nones","CUE","621","55","62","","D-A-6-a"],
				["386","622. Reparaciones y conservaci�n","CUE","622","55","62","","D-A-6-a"],
				["387","623. Servicios de profesionales independientes","CUE","623","55","62","","D-A-6-a"],
				["388","624. Transportes","CUE","624","55","62","","D-A-6-a"],
				["389","625. Primas de seguros","CUE","625","55","62","","D-A-6-a"],
				["390","626. Servicios bancarios y similares","CUE","626","55","62","","D-A-6-a"],
				["391","627. Publicidad, propaganda y relaciones p�blicas","CUE","627","55","62","","D-A-6-a"],
				["392","628. Suministros","CUE","628","55","62","","D-A-6-a"],
				["393","629. Otros servicios","CUE","629","55","62","","D-A-6-a"],
				["56","63. TRIBUTOS","EPI","63","52","63","",""],
				["394","630. Impuesto sobre beneficios","CUE","630","56","63","","D-V-5"],
				["395","631. Otros tributos","CUE","631","56","63","","D-A-6-b"],
				["396","632. Sociedades transparentes, efecto impositivo","CUE","632","56","63","","D-V-5"],
				["397","6320. Importes a cuenta no recuperables por entidades transparentes","CUE","6320","56","63","","D-V-6"],
				["398","6321. Importes a cuenta no recuperables por agrupaciones de inter�s econ�mico","CUE","6321","56","63","","D-V-5"],
				["399","6323. Ajustes negativos en la imposici�n en sociedades transparentes","CUE","6323","56","63","","D-V-5"],
				["400","6328. Ajustes positivos en la imposici�n en sociedades transparentes","CUE","6328","56","63","","D-V-5"],
				["401","633. Ajustes negativos en imposicion sobre beneficios","CUE","633","56","63","","D-V-5"],
				["402","634. Ajustes negativos en la imposicion indirecta","CUE","634","56","63","","D-A-6-b"],
				["403","6341. Ajustes negativos en IVA de circulante","CUE","6341","56","63","","D-A-6-b"],
				["404","6342. Ajustes negativos en IVA de inversiones","CUE","6342","56","63","","D-A-6-b"],
				["405","6343. Ajustes negativos en IGIC, de circulante","CUE","6343","56","63","","D-A-6-b"],
				["406","6344. Ajustes negativos en IGIC, de inversi�n","CUE","6344","56","63","","D-A-6-b"],
				["407","635. Impuesto sobre beneficios extranjero","CUE","635","56","63","","D-V-6"],
				["408","636. Devoluci�n de impuestos","CUE","636","56","63","","D-A-6-b"],
				["409","637. Imposici�n indirecta, reg�menes especiales","CUE","637","56","63","","D-V-6"],
				["410","6371. R�gimen simplificado, IVA","CUE","6371","56","63","","D-V-6"],
				["411","6372. R�gimen simplificado, IGIC","CUE","6372","56","63","","D-V-6"],
				["412","6373. R�gimen de la agricultura,ganader�a y pesca, IVA","CUE","6373","56","63","","D-V-6"],
				["413","6374. R�gimen de la agricultura y ganader�a, IGIC","CUE","6374","56","63","","D-V-6"],
				["414","638. Ajustes positivos en imposicion sobre beneficios","CUE","638","56","63","","D-V-5"],
				["415","639. Ajustes positivos en la imposicion indirecta","CUE","639","56","63","","D-A-6-b"],
				["416","6391. Ajustes positivos en IVA de circulante","CUE","6391","56","63","","D-A-6-b"],
				["417","6392. Ajustes positivos en IVA de inversiones","CUE","6392","56","63","","D-A-6-b"],
				["418","6393. Ajustes positivos en IGIC de circulante","CUE","6393","56","63","","D-A-6-b"],
				["419","6394. Ajustes positivos en IGIC de inversi�n","CUE","6394","56","63","","D-A-6-b"],
				["57","64. GASTOS DE PERSONAL","EPI","64","52","64","",""],
				["420","640. Sueldos y salarios","CUE","640","57","64","","D-A-3-a"],
				["421","641. Indemnizaciones","CUE","641","57","64","","D-A-3-a"],
				["422","642. Seguridad Social a cargo de la empresa","CUE","642","57","64","","D-A-3-b"],
				["423","643. Aportaciones a sistemas complementarios pensiones","CUE","643","57","64","","D-A-3-b"],
				["424","649. Otros gastos sociales","CUE","649","57","64","","D-A-3-b"],
				["58","65. OTROS GASTOS DE GESTION","EPI","65","52","65","",""],
				["425","650. P�rdidas de cr�ditos comerciales incobrables","CUE","650","58","65","","D-A-5-b"],
				["426","651. Resultados de operaciones en com�n","CUE","651","58","65","","D-A-6-c"],
				["427","6510. Beneficio transferido (gestor)","CUE","6510","58","65","","D-A-6-c"],
				["428","6511. P�rdida soportada (part�cipe o asociado no gestor)","CUE","6511","58","65","","D-A-6-c"],
				["429","659. Otras p�rdidas en gesti�n corriente","CUE","659","58","65","","D-A-6-c"],
				["59","66. GASTOS FINANCIEROS","EPI","66","52","66","",""],
				["430","661. Intereses de obligaciones y bonos","CUE","661","59","66","","D-I-7-a"],
				["431","6610. Intereses de obligaciones y bonos l/p en empresas del grupo","CUE","6610","59","66","","D-I-7-a"],
				["432","6611. Intereses de obligaciones y bonos l/p en empresas asociadas","CUE","6611","59","66","","D-I-7-b"],
				["433","6613. Intereses de obligaciones y bonos l/p en otras empresas","CUE","6613","59","66","","D-I-7-c"],
				["434","6615. Intereses de obligaciones y bonos c/p en empresas del grupo","CUE","6615","59","66","","D-I-7-a"],
				["435","6616. Intereses de obligaciones y bonos c/p en empresas asociadas","CUE","6616","59","66","","D-I-7-b"],
				["436","6618. Intereses de obligaciones y bonos c/p en otras empresas","CUE","6618","59","66","","D-I-7-c"],
				["437","662. Intereses de deudas a largo plazo","CUE","662","59","66","","D-I-7-a"],
				["438","6620. Intereses de deudas a l/p con empresas del grupo","CUE","6620","59","66","","D-I-7-a"],
				["439","6621. Intereses de deudas a l/p con empresas asociadas","CUE","6621","59","66","","D-I-7-b"],
				["440","6622. Intereses de deudas a l/p con entidades de cr�dito","CUE","6622","59","66","","D-I-7-c"],
				["441","6623. Intereses de deudas a l/p con otras empresas","CUE","6623","59","66","","D-I-7-c"],
				["442","663. Intereses de deudas a corto plazo","CUE","663","59","66","","D-I-7-a"],
				["443","6630. Intereses de deudas a c/p con empresas del grupo","CUE","6630","59","66","","D-I-7-a"],
				["444","6631. Intereses de deudas a c/p con empresas asociadas","CUE","6631","59","66","","D-I-7-b"],
				["445","6632. Intereses de deudas a c/p con entidades de cr�dito","CUE","6632","59","66","","D-I-7-c"],
				["446","6633. Intereses de deudas a c/p con otras empresas","CUE","6633","59","66","","D-I-7-c"],
				["447","664. Intereses por descuento de efectos","CUE","664","59","66","","D-I-7-a"],
				["448","6640. Intereses por descuento de efectos en entidades de cr�dito del grupo","CUE","6640","59","66","","D-I-7-a"],
				["449","6641. Intereses por descuento de efectos en entidades de cr�dito asociadas","CUE","6641","59","66","","D-I-7-b"],
				["450","6643. Intereses por descuento de efectos en otras entidades de cr�dito","CUE","6643","59","66","","D-I-7-c"],
				["451","665. Descuentos sobre ventas por pronto pago","CUE","665","59","66","","D-I-7-a"],
				["452","6650. Descuentos sobre ventas por pronto pago a empresas del grupo","CUE","6650","59","66","","D-I-7-a"],
				["453","6651. Descuentos sobre ventas por pronto pago a empresas asociadas","CUE","6651","59","66","","D-I-7-b"],
				["454","6653. Descuentos sobre ventas por pronto pago a otras empresas","CUE","6653","59","66","","D-I-7-c"],
				["455","666. P�rdidas en valores negociables","CUE","666","59","66","","D-I-7-d"],
				["456","6660. P�rdidas en valores negociables a l/p de empresas del grupo","CUE","6660","59","66","","D-I-7-d"],
				["457","6661. P�rdidas en valores negociables a l/p de empresas asociadas","CUE","6661","59","66","","D-I-7-d"],
				["458","6663. P�rdidas en valores negociables a l/p de otras empresas","CUE","6663","59","66","","D-I-7-d"],
				["459","6665. P�rdidas en valores negociables a c/p de empresas del grupo","CUE","6665","59","66","","D-I-7-d"],
				["460","6666. P�rdidas en valores negociables a c/p de empresas asociadas","CUE","6666","59","66","","D-I-7-d"],
				["461","6668. P�rdidas en valores negociables a c/p de otras empresas","CUE","6668","59","66","","D-I-7-d"],
				["462","667. P�rdidas de cr�ditos","CUE","667","59","66","","D-I-7-d"],
				["463","6670. P�rdidas de cr�ditos a l/p a empresas del grupo","CUE","6670","59","66","","D-I-7-d"],
				["464","6671. P�rdidas de cr�ditos a l/p a empresas asociadas","CUE","6671","59","66","","D-I-7-d"],
				["465","6673. P�rdidas de cr�ditos a l/p a otras empresas","CUE","6673","59","66","","D-I-7-d"],
				["466","6675. P�rdidas de cr�ditos a c/p a empresas del grupo","CUE","6675","59","66","","D-I-7-d"],
				["467","6676. P�rdidas de cr�ditos a c/p a empresas asociadas","CUE","6676","59","66","","D-I-7-d"],
				["468","6678. P�rdidas de cr�ditos a c/p a otras empresas","CUE","6678","59","66","","D-I-7-d"],
				["469","668. Diferencias negativas de cambio","CUE","668","59","66","CAMNEG","D-I-9"],
				["470","6680. Diferencias negativas de cambio por la introducci�n del euro","CUE","6680","59","66","EURNEG","D-I-9"],
				["471","6681. Diferencias negativas de cambio","CUE","6681","59","66","","D-I-9"],
				["472","669. Otros gastos financieros","CUE","669","59","66","","D-I-7-c"],
				["473","6690. Gastos por diferencias derivadas del redondeo del euro","CUE","6690","59","66","","D-I-7-c"],
				["474","6691. Otros gastos financieros","CUE","6691","59","66","","D-I-7-c"],
				["60","67. PERDIDAS PROCEDENTES DEL INMOVILIZADO Y GASTOS EXCEPCIONALES","EPI","67","52","67","",""],
				["475","670. P�rdidas procedentes de inmovilizado inmaterial","CUE","670","60","67","","D-III-1"],
				["476","671. P�rdidas procedentes de inmovilizado material","CUE","671","60","67","","D-III-1"],
				["477","672. P�rdidas procedentes de participaciones en capital a l/p de empresas del grupo","CUE","672","60","67","","D-III-1"],
				["478","673. P�rdidas procedentes de participaciones en capital a l/p de empresas asociadas","CUE","673","60","67","","D-III-1"],
				["479","674. P�rdidas por operaciones con acciones y obligaciones propias","CUE","674","60","67","","D-III-2"],
				["480","676. Donaciones del inmovilizado material","CUE","676","60","67","","D-III-1"],
				["481","678. Gastos extraordinarios","CUE","678","60","67","","D-III-3"],
				["482","6780. Gastos producidos por la introducci�n del euro","CUE","6780","60","67","","D-III-3"],
				["483","6781. Otros gastos extraordinarios","CUE","6781","60","67","","D-III-3"],
				["484","679. Gastos y p�rdidas de ejercicios anteriores","CUE","679","60","67","","D-III-4"],
				["61","68. DOTACIONES PARA AMORTIZACIONES","EPI","68","52","68","",""],
				["485","680. Amortizaci�n de gastos de establecimiento","CUE","680","61","68","","D-A-4"],
				["486","681. Amortizaci�n del inmovilizado inmaterial","CUE","681","61","68","","D-A-4"],
				["487","682. Amortizaci�n del inmovilizado material","CUE","682","61","68","","D-A-4"],
				["62","69. DOTACIONES A LAS PROVISIONES","EPI","69","52","69","",""],
				["488","690. Dotaci�n al fondo de reversi�n","CUE","690","62","69","","D-A-6-d"],
				["489","691. Dotaci�n a la provisi�n de inmovilizado inmaterial","CUE","691","62","69","","D-III-0"],
				["490","692. Dotaci�n a la provisi�n del inmovilizado material","CUE","692","62","69","","D-III-0"],
				["491","693. Dotaci�n a la provisi�n de existencias","CUE","693","62","69","","D-A-5-a"],
				["492","694. Dotaci�n a la provisi�n para insolvencias de tr�fico","CUE","694","62","69","","D-A-5-b"],
				["493","695. Dotaci�n a la provisi�n para otras operaciones de tr�fico","CUE","695","62","69","","D-A-5-c"],
				["494","696. Dotaci�n a la provisi�n para valores negociables a l/p","CUE","696","62","69","","D-I-8"],
				["495","6960. Dotaci�n a la provisi�n para participaciones en capital a l/p de empresas del grupo","CUE","6960","62","69","","D-III-0"],
				["496","6961. Dotaci�n a la provisi�n para participaciones en capital a l/p de empresas asociadas","CUE","6961","62","69","","D-III-0"],
				["497","6963. Dotaci�n a la provisi�n para participaciones en capital a l/p de otras empresas","CUE","6963","62","69","","D-I-8"],
				["498","6965. Dotaci�n a la provisi�n para valores de renta fija a l/p de empresas del grupo","CUE","6965","62","69","","D-I-8"],
				["499","6966. Dotaci�n a la provisi�n para valores de renta fija a l/p de empresas asociadas","CUE","6966","62","69","","D-I-8"],
				["500","697. Dotaci�n a la provisi�n para insolvencias de cr�ditos a l/p","CUE","697","62","69","","D-I-8"],
				["501","6970. Dotaci�n a la provisi�n para insolvencias de cr�ditos a l/p a empresas del grupo","CUE","6970","62","69","","D-I-8"],
				["502","6971. Dotaci�n a la provisi�n para insolvencias de cr�ditos a l/p a empresas asociadas","CUE","6971","62","69","","D-I-8"],
				["503","6973. Dotaci�n a la provisi�n para insolvencias de cr�ditos a l/p a otras empresas","CUE","6973","62","69","","D-I-8"],
				["504","698. Dotacion a la provisi�n para valores negociables a c/p","CUE","698","62","69","","D-I-8"],
				["505","6980. Dotacion a la provisi�n para valores negociables a c/p de empresas del grupo","CUE","6980","62","69","","D-I-8"],
				["506","6981. Dotacion a la provisi�n para valores negociables a c/p de empresas asociadas","CUE","6981","62","69","","D-I-8"],
				["507","6983. Dotacion a la provisi�n para valores negociables a c/p de otras empresas","CUE","6983","62","69","","D-I-8"],
				["508","699. Dotaci�n a la provisi�n para insolvencias de cr�ditos a c/p","CUE","699","62","69","","D-I-8"],
				["509","6990. Dotaci�n a la provisi�n para insolvencias de cr�ditos a c/p a empresas del grupo","CUE","6990","62","69","","D-I-8"],
				["510","6991. Dotaci�n a la provisi�n para insolvencias de cr�ditos a c/p a empresas asociadas","CUE","6991","62","69","","D-I-8"],
				["511","6993. Dotaci�n a la provisi�n para insolvencias de cr�ditos a c/p a otras empresas","CUE","6993","62","69","","D-I-8"],
				["63","7. VENTAS E INGRESOS","EPI","7","","7","",""],
				["64","70. VENTAS DE MERCADERIAS,DE PRODUCCION PROPIA,DE SERVICIOS, ETC.","EPI","70","63","70","",""],
				["512","700. Ventas de mercader�as","CUE","700","64","70","VENTAS","H-B-1-a"],
				["513","701. Ventas de productos terminados","CUE","701","64","70","VENTAS","H-B-1-a"],
				["514","702. Ventas de productos semiterminados","CUE","702","64","70","VENTAS","H-B-1-a"],
				["515","703. Ventas de subproductos y residuos","CUE","703","64","70","VENTAS","H-B-1-a"],
				["516","704. Ventas de envases y embalajes","CUE","704","64","70","VENTAS","H-B-1-a"],
				["517","705. Prestaciones de servicios","CUE","705","64","70","VENTAS","H-B-1-b"],
				["518","708. Devoluciones de ventas y operaciones similares","CUE","708","64","70","DEVVEN","H-B-1-c"],
				["519","7080. Devoluciones de ventas de mercader�as","CUE","7080","64","70","","H-B-1-c"],
				["520","7081. Devoluciones de ventas de productos terminados","CUE","7081","64","70","","H-B-1-c"],
				["521","7082. Devoluciones de ventas de productos semiterminados","CUE","7082","64","70","","H-B-1-c"],
				["522","7083. Devoluciones de ventas de subproductos y residuos","CUE","7083","64","70","","H-B-1-c"],
				["523","7084. Devoluciones de ventas de envases y embalajes","CUE","7084","64","70","","H-B-1-c"],
				["524","709. Rappels sobre ventas","CUE","709","64","70","","H-B-1-c"],
				["525","7090. Rappels sobre ventas de mercader�as","CUE","7090","64","70","","H-B-1-c"],
				["526","7091. Rappels sobre ventas de productos terminados","CUE","7091","64","70","","H-B-1-c"],
				["527","7092. Rappels sobre ventas de productos semiterminados","CUE","7092","64","70","","H-B-1-c"],
				["528","7093. Rappels sobre ventas de subproductos y residuos","CUE","7093","64","70","","H-B-1-c"],
				["529","7094. Rappels sobre ventas de envases y embalajes","CUE","7094","64","70","","H-B-1-c"],
				["65","71. VARIACION DE EXISTENCIAS","EPI","71","63","71","",""],
				["530","710. Variaci�n de existencias de productos en curso","CUE","710","65","71","","D-A-1"],
				["531","711. Variaci�n de existencias de productos semiterminados","CUE","711","65","71","","H-B-2"],
				["532","712. Variaci�n de existencias de productos terminados","CUE","712","65","71","","H-B-2"],
				["533","713. Variaci�n de existencias de subproductos, residuos y materiales recuperados","CUE","713","65","71","","H-B-2"],
				["66","73. TRABAJOS REALIZADOS PARA LA EMPRESA","EPI","73","63","73","",""],
				["534","730. Incorporaci�n al activo de gastos de establecimiento","CUE","730","66","73","","H-B-3"],
				["535","731. Trabajos realizados para inmovilizado inmaterial","CUE","731","66","73","","H-B-3"],
				["536","732. Trabajos realizados para inmovilizado material","CUE","732","66","73","","H-B-3"],
				["537","733. Trabajos realizados para inmovilizado material en curso","CUE","733","66","73","","H-B-3"],
				["538","737. Incorporaci�n al activo de gastos de formalizaci�n de deudas","CUE","737","66","73","","H-B-3"],
				["67","74. SUBVENCIONES A LA EXPLOTACION","EPI","74","63","74","",""],
				["539","740. Subvenciones oficiales a la explotaci�n","CUE","740","67","74","","H-B-4-b"],
				["540","741. Otras subvenciones a la explotaci�n","CUE","741","67","74","","H-B-4-b"],
				["68","75. OTROS INGRESOS DE GESTION","EPI","75","63","75","",""],
				["541","751. Resultados de operaciones en com�n","CUE","751","68","75","","H-B-4-a"],
				["542","7510. P�rdida transferida (gestor)","CUE","7510","68","75","","H-B-4-a"],
				["543","7511. Beneficio atribuido (part�cipe o asociado no gestor)","CUE","7511","68","75","","H-B-4-a"],
				["544","752. Ingresos por arrendamientos","CUE","752","68","75","","H-B-4-a"],
				["545","753. Ingresos de propiedad industrial cedida en explotaci�n","CUE","753","68","75","","H-B-4-a"],
				["546","754. Ingresos por comisiones","CUE","754","68","75","","H-B-4-a"],
				["547","755. Ingresos por servicios al personal","CUE","755","68","75","","H-B-4-a"],
				["548","759. Ingresos por servicios diversos","CUE","759","68","75","","H-B-4-a"],
				["69","76. INGRESOS FINANCIEROS","EPI","76","63","76","",""],
				["549","760. Ingresos de participaciones en capital","CUE","760","69","76","","H-I-5-a"],
				["550","7600. Ingresos de participaciones en capital de empresas del grupo","CUE","7600","69","76","","H-I-5-a"],
				["551","7601. Ingresos de participaciones en capital de empresas asociadas","CUE","7601","69","76","","H-I-5-b"],
				["552","7603. Ingresos de participaciones en capital de otras empresas","CUE","7603","69","76","","H-I-5-c"],
				["553","761. Ingresos de valores de renta fija","CUE","761","69","76","","H-I-6-a"],
				["554","7610. Ingresos de valores renta fija de empresas del grupo","CUE","7610","69","76","","H-I-6-a"],
				["555","7611. Ingresos de valores renta fija de empresas asociadas","CUE","7611","69","76","","H-I-6-b"],
				["556","7613. Ingresos de valores renta fija de otras empresas","CUE","7613","69","76","","H-I-6-c"],
				["557","7618. Ingresos de participaciones en Fondos de Inversi�n en Activos del Mercado Monetario","CUE","7618","69","76","","H-I-6-c"],
				["558","762. Ingresos de cr�ditos a largo plazo","CUE","762","69","76","","H-I-6-a"],
				["559","7620. Ingresos de cr�ditos a l/p a empresas del grupo","CUE","7620","69","76","","H-I-6-a"],
				["560","7621. Ingresos de cr�ditos a l/p a empresas asociadas","CUE","7621","69","76","","H-I-6-b"],
				["561","7623. Ingresos de cr�ditos a l/p a otras empresas","CUE","7623","69","76","","H-I-6-c"],
				["562","763. Ingresos de cr�ditos a corto plazo","CUE","763","69","76","","H-I-7-a"],
				["563","7630. Ingresos de cr�ditos a c/p a empresas del grupo","CUE","7630","69","76","","H-I-7-a"],
				["564","7631. Ingresos de cr�ditos a c/p a empresas asociadas","CUE","7631","69","76","","H-I-7-b"],
				["565","7633. Ingresos de cr�ditos a c/p a otras empresas","CUE","7633","69","76","","H-I-7-c"],
				["566","765. Descuentos sobre compras por pronto pago","CUE","765","69","76","","H-I-7-a"],
				["567","7650. Descuentos sobre compras por pronto pago de empresas del grupo","CUE","7650","69","76","","H-I-7-a"],
				["568","7651. Descuentos sobre compras por pronto pago de empresas asociadas","CUE","7651","69","76","","H-I-7-b"],
				["569","7653. Descuentos sobre compras por pronto pago de otras empresas","CUE","7653","69","76","","H-I-7-c"],
				["570","766. Beneficios en valores negociables","CUE","766","69","76","","H-I-7-d"],
				["571","7660. Beneficios en valores negociables a l/p de empresas del grupo","CUE","7660","69","76","","H-I-7-d"],
				["572","7661. Beneficios en valores negociables a l/p de empresas asociadas","CUE","7661","69","76","","H-I-7-d"],
				["573","7663. Beneficios en valores negociables a l/p de otras empresas","CUE","7663","69","76","","H-I-7-d"],
				["574","7665. Beneficios en valores negociables a c/p de empresas del grupo","CUE","7665","69","76","","H-I-7-d"],
				["575","7666. Beneficios en valores negociables a c/p de empresas asociadas","CUE","7666","69","76","","H-I-7-d"],
				["576","7668. Beneficios en valores negociables a c/p de otras empresas","CUE","7668","69","76","","H-I-7-d"],
				["577","768. Diferencias positivas de cambio","CUE","768","69","76","CAMPOS","H-I-8"],
				["578","7680. Diferencias positivas de cambio por la introducci�n del euro","CUE","7680","69","76","EURPOS","H-I-8"],
				["579","7681. Diferencias positivas de cambio","CUE","7681","69","76","","H-I-8"],
				["580","769. Otros ingresos financieros","CUE","769","69","76","","H-I-7-c"],
				["581","7690. Ingresos por diferencias derivadas del redondeo del euro","CUE","7690","69","76","","H-I-7-c"],
				["582","7691. Otros ingresos financieros","CUE","7691","69","76","","H-I-7-c"],
				["70","77. BENEFICIOS PROCEDENTES DEL INMOVILIZADO E INGRESOS EXCEPCIONALES","EPI","77","63","77","",""],
				["583","770. Beneficios procedentes de inmovilizado inmaterial","CUE","770","70","77","","H-III-A"],
				["584","771. Beneficios procedentes de inmovilizado material","CUE","771","70","77","","H-III-A"],
				["585","772. Beneficios procedentes de participaciones en capital a l/p de empresas del grupo","CUE","772","70","77","","H-III-A"],
				["586","773. Beneficios procedentes de participaciones en capital a l/p de empresas asociadas","CUE","773","70","77","","H-III-A"],
				["587","774. Beneficios por operaciones con acciones y obligaciones propias","CUE","774","70","77","","H-III-B"],
				["588","775. Subvenciones de capital traspasadas al resultado del ejercicio","CUE","775","70","77","","H-III-C"],
				["589","778. Ingresos extraordinarios","CUE","778","70","77","","H-III-D"],
				["590","779. Ingresos y beneficios de ejercicios anteriores","CUE","779","70","77","","H-III-E"],
				["71","79. EXCESOS Y APLICACIONES DE PROVISIONES","EPI","79","63","79","",""],
				["591","790. Exceso de provisi�n para riesgos y gastos","CUE","790","71","79","","H-B-4-c"],
				["592","791. Exceso de provisi�n del inmovilizado inmaterial","CUE","791","71","79","","D-III-0"],
				["593","792. Exceso de provisi�n del inmovilizado material","CUE","792","71","79","","D-III-0"],
				["594","793. Provisi�n de existencias aplicada","CUE","793","71","79","","D-A-5-a"],
				["595","794. Provisi�n para insolvencias de tr�fico aplicada","CUE","794","71","79","","D-A-5-b"],
				["596","795. Provisi�n para otras operaciones de tr�fico aplicada","CUE","795","71","79","","D-A-5-c"],
				["597","796. Exceso de provisi�n para valores negociables a l/p","CUE","796","71","79","","D-III-1"],
				["598","7960. Exceso de provisi�n para participaciones en capital a l/p de empresas del grupo","CUE","7960","71","79","","D-III-0"],
				["599","7961. Exceso de provisi�n para participaciones en capital a l/p de empresas asociadas","CUE","7961","71","79","","D-III-0"],
				["600","7963. Exceso de provisi�n para valores negociables a l/p de otras empresas","CUE","7963","71","79","","D-I-8"],
				["601","7965. Exceso de provisi�n para valores de renta fija a l/p de empresas del grupo","CUE","7965","71","79","","D-I-8"],
				["602","7966. Exceso de provisi�n para valores de renta fija a l/p de empresas asociadas","CUE","7966","71","79","","D-I-8"],
				["603","797. Exceso de provisi�n para insolvencias de cr�ditos a l/p","CUE","797","71","79","","D-I-8"],
				["604","7970. Exceso de provisi�n para insolvencias de cr�ditos a l/p de empresas del grupo","CUE","7970","71","79","","D-I-8"],
				["605","7971. Exceso de provisi�n para insolvencias de cr�ditos a l/p de empresas asociadas","CUE","7971","71","79","","D-I-8"],
				["606","7973. Exceso de provisi�n para insolvencias de cr�ditos a l/p de otras empresas","CUE","7973","71","79","","D-I-8"],
				["607","798. Exceso de provisi�n para valores negociables a c/p","CUE","798","71","79","","D-I-8"],
				["608","7980. Exceso de provisi�n para valores negociables a c/p de empresas del grupo","CUE","7980","71","79","","D-I-8"],
				["609","7981. Exceso de provisi�n para valores negociables a c/p de empresas asociadas","CUE","7981","71","79","","D-I-8"],
				["610","7983. Exceso de provisi�n para valores negociables a c/p de otras empresas","CUE","7983","71","79","","D-I-8"],
				["611","799. Exceso de provisi�n para insolvencias de cr�ditos a c/p","CUE","799","71","79","","D-I-8"],
				["612","7990. Exceso de provisi�n para insolvencias de cr�ditos a c/p de empresas del grupo","CUE","7990","71","79","","D-I-8"],
				["613","7991. Exceso de provisi�n para insolvencias de cr�ditos a c/p de empresas asociadas","CUE","7991","71","79","","D-I-8"],
				["614","7993. Exceso de provisi�n para insolvencias de cr�ditos a c/p de otras empresas","CUE","7993","71","79","","D-I-8"]];

		var idEpigrafeIni:Number = util.sqlSelect("co_epigrafes", "MAX(idepigrafe)","idepigrafe <> 0");
		var idCuentaIni:Number = util.sqlSelect("co_cuentas", "MAX(idcuenta)","idcuenta <> 0");
		idEpigrafeIni = parseFloat (idEpigrafeIni);  
		idCuentaIni = parseFloat (idCuentaIni);
		if (!idEpigrafeIni)
				idEpigrafeIni = 0;
		if (!idCuentaIni)
				idCuentaIni = 0;
		var idEpigrafe:Number = 0;
		var idPadre:Number = 0;
		var idCuenta:Number = 0;
		util.createProgressDialog(util.translate("scripts", "Creando Plan General Contable"),
				datos.length);
		var j:Number = 0;
		util.setProgress(0);
		for (i = 0; i < datos.length; i++) {
				if (datos[i][2] == "EPI") {
						if (idPadre == 0)
								idPadre = "";
								
						curEpi.setModeAccess(curEpi.Insert);
						curEpi.refreshBuffer();
						curEpi.setValueBuffer("descripcion", datos[i][1]);
						curEpi.setValueBuffer("codepigrafe", datos[i][3]);
						curEpi.setValueBuffer("codejercicio", codEjercicio);
						
						if (parseFloat(datos[i][4]) == 0)
								idPadre = "";
						else 
								idPadre = idEpigrafeIni + parseFloat(datos[i][4]);
						curEpi.setValueBuffer("idpadre", idPadre);
						idEpigrafe = idEpigrafeIni + parseFloat(datos[i][0]);
						curEpi.setValueBuffer("idepigrafe", idEpigrafe);
						curEpi.commitBuffer();
				} else {
						idCuenta = idCuentaIni + parseFloat(datos[i][0]);
						idEpigrafe = idEpigrafeIni + parseFloat(datos[i][4]);
								
						curCue.setModeAccess(curCue.Insert);
						curCue.refreshBuffer();
						curCue.setValueBuffer("descripcion", datos[i][1]);
						curCue.setValueBuffer("codcuenta", datos[i][3]);
						curCue.setValueBuffer("codejercicio", codEjercicio);
						curCue.setValueBuffer("idepigrafe", idEpigrafe);
						curCue.setValueBuffer("codepigrafe", datos[i][5]);
						curCue.setValueBuffer("idcuentaesp", datos[i][6]);
						curCue.setValueBuffer("codbalance", datos[i][7]);
						curCue.commitBuffer();
				
				}
				if (j++ > 50) {
						j = 0;
						util.setProgress(i);
				}
		}
		util.setProgress(datos.length);
		util.destroyProgressDialog();
}

/** \D Se introducen los c�digos de balance, independientes del ejercicio
\end */
function oficial_generarCodigosBalance()
{

		var curCbl:FLSqlCursor = new FLSqlCursor("co_codbalances");
		curCbl.setActivatedCheckIntegrity(false);
		
		var datos =
				[["A","A","ACTIVO","","","","","",""],
				["A-A","A","ACTIVO","A","A) ACCIONISTAS ( SOCIOS ) POR DESEMBOLSOS NO EXIGIDOS","","","",""],
				["A-B","A","ACTIVO","B","B) INMOVILIZADO","","","",""],
				["A-B-I","A","ACTIVO","B","B) INMOVILIZADO","I","I. Gastos de establecimiento","",""],
				["A-B-II","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","",""],
				["A-B-II-1","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","1","1. Gastos de investigaci�n y desarrollo"],
				["A-B-II-2","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","2","2. Concesiones, patentes, licencias, marcas y similares"],
				["A-B-II-3","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","3","3. Fondo de comercio"],
				["A-B-II-4","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","4","4. Derechos de traspaso"],
				["A-B-II-5","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","5","5. Aplicaciones inform�ticas"],
				["A-B-II-6","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","6","6. Derechos s/bienes en r�gimen de arrendamiento financiero"],
				["A-B-II-7","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","7","7. Anticipos"],
				["A-B-II-8","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","8","8. Provisiones"],
				["A-B-II-9","A","ACTIVO","B","B) INMOVILIZADO","II","II. Inmovilizaciones inmateriales","9","9. Amortizaciones"],
				["A-B-III","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","",""],
				["A-B-III-1","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","1","1. Terrenos y construcciones"],
				["A-B-III-2","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","2","2. Instalaciones t�cnicas y maquinaria"],
				["A-B-III-3","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","3","3. Otras instalaciones, utillaje y mobiliario"],
				["A-B-III-4","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","4","4. Anticipos e inmovilizaciones materiales en curso"],
				["A-B-III-5","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","5","5. Otro inmovilizado"],
				["A-B-III-6","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","6","6. Provisiones"],
				["A-B-III-7","A","ACTIVO","B","B) INMOVILIZADO","III","III. Inmovilizaciones materiales","7","7. Amortizaciones"],
				["A-B-IV","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","",""],
				["A-B-IV-1","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","1","1. Participaciones en empresas del grupo"],
				["A-B-IV-2","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","2","2. Cr�ditos a empresas del grupo"],
				["A-B-IV-3","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","3","3. Participaciones en empresas asociadas"],
				["A-B-IV-4","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","4","4. Cr�ditos a empresas asociadas"],
				["A-B-IV-5","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","5","5. Cartera de valores a largo plazo"],
				["A-B-IV-6","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","6","6. Otros Cr�ditos"],
				["A-B-IV-7","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","7","7. Dep�sitos y fianzas constituidos a largo plazo"],
				["A-B-IV-8","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","8","8. Provisiones"],
				["A-B-IV-9","A","ACTIVO","B","B) INMOVILIZADO","IV","IV. Inmovilizaciones financieras","9","9. Administraciones p�blicas a largo plazo"],
				["A-B-V","A","ACTIVO","B","B) INMOVILIZADO","V","V. Acciones propias","",""],
				["A-B-VI","A","ACTIVO","B","B) INMOVILIZADO","VI","VI. Deudores por operaciones de tr�fico a largo plazo","",""],
				["A-C","A","ACTIVO","C","C) GASTOS A DISTRIBUIR EN VARIOS EJERCICIOS","","","",""],
				["A-D","A","ACTIVO","D","D) ACTIVO CIRCULANTE","","","",""],
				["A-D-I","A","ACTIVO","D","D) ACTIVO CIRCULANTE","I","I. Accionistas por desembolsos exigidos","",""],
				["A-D-II","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","",""],
				["A-D-II-1","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","1","1. Comerciales"],
				["A-D-II-2","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","2","2. Materias primas y otros aprovisionamientos"],
				["A-D-II-3","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","3","3. Productos en curso y semiterminados"],
				["A-D-II-4","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","4","4. Productos terminados"],
				["A-D-II-5","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","5","5. Subproductos, residuos y materiales recuperados"],
				["A-D-II-6","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","6","6. Anticipos"],
				["A-D-II-7","A","ACTIVO","D","D) ACTIVO CIRCULANTE","II","II. Existencias","7","7. Provisiones"],
				["A-D-III","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","",""],
				["A-D-III-1","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","1","1. Clientes por ventas y prestaciones de servicios"],
				["A-D-III-2","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","2","2. Empresas del grupo, deudores"],
				["A-D-III-3","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","3","3. Empresas asociadas, deudores"],
				["A-D-III-4","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","4","4. Deudores varios"],
				["A-D-III-5","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","5","5. Personal"],
				["A-D-III-6","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","6","6. Administraciones p�blicas"],
				["A-D-III-7","A","ACTIVO","D","D) ACTIVO CIRCULANTE","III","III. Deudores","7","7. Provisiones"],
				["A-D-IV","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","",""],
				["A-D-IV-1","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","1","1. Participaciones en empresas del grupo"],
				["A-D-IV-2","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","2","2. Cr�ditos a empresas del grupo"],
				["A-D-IV-3","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","3","3. Participaciones en empresas asociadas"],
				["A-D-IV-4","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","4","4. Cr�ditos a empresas asociadas"],
				["A-D-IV-5","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","5","5. Cartera de valores a corto plazo"],
				["A-D-IV-6","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","6","6. Otros cr�ditos"],
				["A-D-IV-7","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","7","7. Dep�sitos y fianzas constituidos a corto plazo"],
				["A-D-IV-8","A","ACTIVO","D","D) ACTIVO CIRCULANTE","IV","IV. Inversiones financieras temporales","8","8. Provisiones"],
				["A-D-V","A","ACTIVO","D","D) ACTIVO CIRCULANTE","V","V. Acciones propias a corto plazo","",""],
				["A-D-VI","A","ACTIVO","D","D) ACTIVO CIRCULANTE","VI","VI. Tesorer�a","",""],
				["A-D-VII","A","ACTIVO","D","D) ACTIVO CIRCULANTE","VII","VII. Ajustes por periodificaci�n","",""],
				["A-E","A","ACTIVO","E","TOTAL  ACTIVO","","","",""],
				["D","D","DEBE","","","","","",""],
				["D-A","D","DEBE","A","A) GASTOS ( A1 a A16 )","","","",""],
				["D-A-1","D","DEBE","A","A) GASTOS ( A1 a A16 )","1","A1. Reducci�n de existencias de productos terminados y en curso de fabricaci�n","",""],
				["D-A-2","D","DEBE","A","A) GASTOS ( A1 a A16 )","2","A2. Aprovisionamientos","",""],
				["D-A-2-a","D","DEBE","A","A) GASTOS ( A1 a A16 )","2","A2. Aprovisionamientos","a","a) Consumo de mercader�as"],
				["D-A-2-b","D","DEBE","A","A) GASTOS ( A1 a A16 )","2","A2. Aprovisionamientos","b","b) Consumo de materias primas y otras materias consumibles"],
				["D-A-2-c","D","DEBE","A","A) GASTOS ( A1 a A16 )","2","A2. Aprovisionamientos","c","c) Otros gastos externos"],
				["D-A-3","D","DEBE","A","A) GASTOS ( A1 a A16 )","3","A3. Gastos de personal","",""],
				["D-A-3-a","D","DEBE","A","A) GASTOS ( A1 a A16 )","3","A3. Gastos de personal","a","a) Sueldos, salarios y asimilados"],
				["D-A-3-b","D","DEBE","A","A) GASTOS ( A1 a A16 )","3","A3. Gastos de personal","b","b) Cargas sociales"],
				["D-A-4","D","DEBE","A","A) GASTOS ( A1 a A16 )","4","A4. Dotaciones para amortizaciones de inmovilizado","",""],
				["D-A-5","D","DEBE","A","A) GASTOS ( A1 a A16 )","5","A5. Variaci�n de las provisiones de tr�fico","",""],
				["D-A-5-a","D","DEBE","A","A) GASTOS ( A1 a A16 )","5","A5. Variaci�n de las provisiones de tr�fico","a","a) Variaci�n de provisiones de existencias"],
				["D-A-5-b","D","DEBE","A","A) GASTOS ( A1 a A16 )","5","A5. Variaci�n de las provisiones de tr�fico","b","b) Variaci�n de provisiones y p�rdidas de cr�ditos incobrables"],
				["D-A-5-c","D","DEBE","A","A) GASTOS ( A1 a A16 )","5","A5. Variaci�n de las provisiones de tr�fico","c","c) Variaci�n de otras provisiones de tr�fico"],
				["D-A-6","D","DEBE","A","A) GASTOS ( A1 a A16 )","6","A6. Otros gastos de explotaci�n","",""],
				["D-A-6-a","D","DEBE","A","A) GASTOS ( A1 a A16 )","6","A6. Otros gastos de explotaci�n","a","a) Servicios exteriores"],
				["D-A-6-b","D","DEBE","A","A) GASTOS ( A1 a A16 )","6","A6. Otros gastos de explotaci�n","b","b) Tributos"],
				["D-A-6-c","D","DEBE","A","A) GASTOS ( A1 a A16 )","6","A6. Otros gastos de explotaci�n","c","c) Otros gastos de gesti�n corriente"],
				["D-A-6-d","D","DEBE","A","A) GASTOS ( A1 a A16 )","6","A6. Otros gastos de explotaci�n","d","d) Dotaci�n al fondo de reversi�n"],
				["D-I","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","","","",""],
				["D-I-7","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","7","A7. Gastos financieros y gastos asimilados","",""],
				["D-I-7-a","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","7","A7. Gastos financieros y gastos asimilados","a","a) Por deudas con empresas del grupo"],
				["D-I-7-b","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","7","A7. Gastos financieros y gastos asimilados","b","b) Por deudas con empresas asociadas"],
				["D-I-7-c","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","7","A7. Gastos financieros y gastos asimilados","c","c) Por deudas con terceros y gastos asimilados"],
				["D-I-7-d","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","7","A7. Gastos financieros y gastos asimilados","d","d) P�rdidas de inversiones financieras"],
				["D-I-8","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","8","A8. Variaci�n de las provisiones de inversiones financieras","",""],
				["D-I-9","D","DEBE","I","AI. BENEFICIOS DE EXPLOTACION   ( B1+B2+B3+B4-A1-A2-A3-A4-A5-A6 )","9","A9. Diferencias negativas de cambio","",""],
				["D-II","D","DEBE","II","AII. RESULTADOS FINANCIEROS POSITIVOS  ( B5+B6+B7+B8-A7-A8-A9 )","","","",""],
				["D-III","D","DEBE","III","AIII. BENEFICIOS DE LAS ACTIVIDADES ORDINARIAS ( AI+AII-BI-BII )","","","",""],
				["D-III-0","D","DEBE","III","AIII. BENEFICIOS DE LAS ACTIVIDADES ORDINARIAS ( AI+AII-BI-BII )","10","A10. Variaci�n de las provisiones de inmovilizado inmaterial, material y cartera de control","",""],
				["D-III-1","D","DEBE","III","AIII. BENEFICIOS DE LAS ACTIVIDADES ORDINARIAS ( AI+AII-BI-BII )","11","A11. P�rdidas procedentes de inmovilizado inmaterial, material y cartera de control","",""],
				["D-III-2","D","DEBE","III","AIII. BENEFICIOS DE LAS ACTIVIDADES ORDINARIAS ( AI+AII-BI-BII )","12","A12. P�rdidas por operaciones con acciones y obligaciones propias","",""],
				["D-III-3","D","DEBE","III","AIII. BENEFICIOS DE LAS ACTIVIDADES ORDINARIAS ( AI+AII-BI-BII )","13","A13. Gastos extraordinarios","",""],
				["D-III-4","D","DEBE","III","AIII. BENEFICIOS DE LAS ACTIVIDADES ORDINARIAS ( AI+AII-BI-BII )","14","A14. Gastos y p�rdidas de otros ejercicios","",""],
				["D-IV","D","DEBE","IV","AIV. RESULTADOS EXTRAORDINARIOS POSITIVOS ( B9+B10+B11+B12+B13-A10-A11-A12-A13-A14 )","","","",""],
				["D-V","D","DEBE","V","AV. BENEFICIOS ANTES DE IMPUESTOS ( AIII + AIV - BIII - BIV )","","","",""],
				["D-V-5","D","DEBE","V","AV. BENEFICIOS ANTES DE IMPUESTOS ( AIII + AIV - BIII - BIV )","15","A15. Impuesto sobre sociedades","",""],
				["D-V-6","D","DEBE","V","AV. BENEFICIOS ANTES DE IMPUESTOS ( AIII + AIV - BIII - BIV )","16","A16. Otros impuestos","",""],
				["D-VI","D","DEBE","VI","AVI. RESULTADOS DEL EJERCICIO ( BENEFICIOS ) ( AV - A15 - A16 )","","","",""],
				["H","H","HABER","","","","","",""],
				["H-B","H","HABER","B","B) INGRESOS( B1 a B13 )","","","",""],
				["H-B-1","H","HABER","B","B) INGRESOS( B1 a B13 )","1","B1. Importe neto de la cifra de negocios","",""],
				["H-B-1-a","H","HABER","B","B) INGRESOS( B1 a B13 )","1","B1. Importe neto de la cifra de negocios","a","a) Ventas"],
				["H-B-1-b","H","HABER","B","B) INGRESOS( B1 a B13 )","1","B1. Importe neto de la cifra de negocios","b","b) Prestaciones de servicios"],
				["H-B-1-c","H","HABER","B","B) INGRESOS( B1 a B13 )","1","B1. Importe neto de la cifra de negocios","c","c) Devoluciones y rappels sobre ventas"],
				["H-B-2","H","HABER","B","B) INGRESOS( B1 a B13 )","2","B2. Aumento de existencias de productos terminados y en curso de fabricaci�n","",""],
				["H-B-3","H","HABER","B","B) INGRESOS( B1 a B13 )","3","B3. Trabajos efectuados por la empresa para el inmovilizado","",""],
				["H-B-4","H","HABER","B","B) INGRESOS( B1 a B13 )","4","B4. Otros ingresos de explotaci�n","",""],
				["H-B-4-a","H","HABER","B","B) INGRESOS( B1 a B13 )","4","B4. Otros ingresos de explotaci�n","a","a) Ingresos accesorios y otros de gesti�n corriente"],
				["H-B-4-b","H","HABER","B","B) INGRESOS( B1 a B13 )","4","B4. Otros ingresos de explotaci�n","b","b) Subvenciones"],
				["H-B-4-c","H","HABER","B","B) INGRESOS( B1 a B13 )","4","B4. Otros ingresos de explotaci�n","c","c) Exceso de provisiones de riesgos y gastos"],
				["H-I","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","","","",""],
				["H-I-5","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","5","B5. Ingresos de participaciones en capital","",""],
				["H-I-5-a","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","5","B5. Ingresos de participaciones en capital","a","a) En empresas del grupo"],
				["H-I-5-b","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","5","B5. Ingresos de participaciones en capital","b","b) En empresas asociadas"],
				["H-I-5-c","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","5","B5. Ingresos de participaciones en capital","c","c) En empresas fuera del grupo"],
				["H-I-6","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","6","B6. Ingresos de otros valores negociables y de cr�ditos de activo inmovilizado","",""],
				["H-I-6-a","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","6","B6. Ingresos de otros valores negociables y de cr�ditos de activo inmovilizado","a","a) De empresas del grupo"],
				["H-I-6-b","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","6","B6. Ingresos de otros valores negociables y de cr�ditos de activo inmovilizado","b","b) De empresas asociadas"],
				["H-I-6-c","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","6","B6. Ingresos de otros valores negociables y de cr�ditos de activo inmovilizado","c","c) De empresas fuera del grupo"],
				["H-I-7","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","7","B7. Otros intereses o ingresos asimilados","",""],
				["H-I-7-a","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","7","B7. Otros intereses o ingresos asimilados","a","a) De empresas del grupo"],
				["H-I-7-b","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","7","B7. Otros intereses o ingresos asimilados","b","b) De empresas asociadas"],
				["H-I-7-c","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","7","B7. Otros intereses o ingresos asimilados","c","c) Otros intereses"],
				["H-I-7-d","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","7","B7. Otros intereses o ingresos asimilados","d","d) Beneficios en inversiones financieras"],
				["H-I-8","H","HABER","I","BI. PERDIDAS DE EXPLOTACION  ( A1+A2+A3+A4+A5+A6-B1-B2-B3-B4 )","8","B8. Diferencias positivas de cambio","",""],
				["H-II","H","HABER","II","BII. RESULTADOS FINANCIEROS NEGATIVOS  ( A7+A8+A9-B5-B6-B7-B8 )","","","",""],
				["H-III","H","HABER","III","BIII. PERDIDAS DE LAS ACTIVIDADES ORDINARIAS ( BI + BII - AI - AII )","","","",""],
				["H-III-A","H","HABER","III","BIII. PERDIDAS DE LAS ACTIVIDADES ORDINARIAS ( BI + BII - AI - AII )","B9","B9. Beneficios en enajenaci�n de inmovilizado inmaterial, material y cartera de control","",""],
				["H-III-B","H","HABER","III","BIII. PERDIDAS DE LAS ACTIVIDADES ORDINARIAS ( BI + BII - AI - AII )","B10","B10. Beneficios por operaciones con acciones y obligaciones propias","",""],
				["H-III-C","H","HABER","III","BIII. PERDIDAS DE LAS ACTIVIDADES ORDINARIAS ( BI + BII - AI - AII )","B11","B11. Subvenciones de capital transferidas al resultado del ejercicio","",""],
				["H-III-D","H","HABER","III","BIII. PERDIDAS DE LAS ACTIVIDADES ORDINARIAS ( BI + BII - AI - AII )","B12","B12. Ingresos extraordinarios","",""],
				["H-III-E","H","HABER","III","BIII. PERDIDAS DE LAS ACTIVIDADES ORDINARIAS ( BI + BII - AI - AII )","B13","B13. Ingresos y beneficios de otros ejercicios","",""],
				["H-IV","H","HABER","IV","BIV. RESULTADOS EXTRAORDINARIOS NEGATIVOS ( A10+A11+A12+A13+A14-B9-B10-B11-B12-B13 )","","","",""],
				["H-V","H","HABER","V","BV. PERDIDAS ANTES DE IMPUESTOS ( BIII + BIV - AIII - AIV )","","","",""],
				["H-VI","H","HABER","VI","BVI. RESULTADOS DEL EJERCICIO ( PERDIDAS ) ( BV + A15 + A16 )","","","",""],
				["P","P","PASIVO","","","","","",""],
				["P-A","P","PASIVO","A","A) FONDOS PROPIOS","","","",""],
				["P-A-I","P","PASIVO","A","A) FONDOS PROPIOS","I","I. Capital suscrito","",""],
				["P-A-II","P","PASIVO","A","A) FONDOS PROPIOS","II","II. Prima de emisi�n","",""],
				["P-A-III","P","PASIVO","A","A) FONDOS PROPIOS","III","III. Reserva de revalorizaci�n","",""],
				["P-A-IV","P","PASIVO","A","A) FONDOS PROPIOS","IV","IV. Reservas","",""],
				["P-A-IV-1","P","PASIVO","A","A) FONDOS PROPIOS","IV","IV. Reservas","1","1. Reserva legal"],
				["P-A-IV-2","P","PASIVO","A","A) FONDOS PROPIOS","IV","IV. Reservas","2","2. Reservas para acciones propias"],
				["P-A-IV-3","P","PASIVO","A","A) FONDOS PROPIOS","IV","IV. Reservas","3","3. Reservas para acciones de la sociedad dominante"],
				["P-A-IV-4","P","PASIVO","A","A) FONDOS PROPIOS","IV","IV. Reservas","4","4. Reservas estatutarias"],
				["P-A-IV-5","P","PASIVO","A","A) FONDOS PROPIOS","IV","IV. Reservas","5","5. Diferencias por ajuste del capital a euros"],
				["P-A-V","P","PASIVO","A","A) FONDOS PROPIOS","V","V. Resultados de ejercicios anteriores","",""],
				["P-A-V-1","P","PASIVO","A","A) FONDOS PROPIOS","V","V. Resultados de ejercicios anteriores","1","1. Remanente"],
				["P-A-V-2","P","PASIVO","A","A) FONDOS PROPIOS","V","V. Resultados de ejercicios anteriores","2","2. Resultados negativos de ejercicios anteriores"],
				["P-A-V-3","P","PASIVO","A","A) FONDOS PROPIOS","V","V. Resultados de ejercicios anteriores","3","3. Aportaciones de socios para compensaci�n de p�rdidas"],
				["P-A-VI","P","PASIVO","A","A) FONDOS PROPIOS","VI","VI. P�rdidas y ganancias ( Beneficio o P�rdida )","",""],
				["P-A-VII","P","PASIVO","A","A) FONDOS PROPIOS","VII","VII. Dividendo a cuenta entregado en el ejercicio","",""],
				["P-A-VIII","P","PASIVO","A","A) FONDOS PROPIOS","VIII","VIII. Acciones propias para reducci�n de capital","",""],
				["P-B","P","PASIVO","B","B) INGRESOS A DISTRIBUIR EN VARIOS EJERCICIOS","","","",""],
				["P-B-I","P","PASIVO","B","B) INGRESOS A DISTRIBUIR EN VARIOS EJERCICIOS","I","1. Subvenciones de capital","",""],
				["P-B-II","P","PASIVO","B","B) INGRESOS A DISTRIBUIR EN VARIOS EJERCICIOS","II","2. Diferencias positivas de cambio","",""],
				["P-B-III","P","PASIVO","B","B) INGRESOS A DISTRIBUIR EN VARIOS EJERCICIOS","III","3. Otros ingresos a distribuir en varios ejercicios","",""],
				["P-B-IV","P","PASIVO","B","B) INGRESOS A DISTRIBUIR EN VARIOS EJERCICIOS","IV","4. Ingresos fiscales a distribuir en varios ejercicios","",""],
				["P-C","P","PASIVO","C","C) PROVISIONES PARA RIESGOS Y GASTOS","","","",""],
				["P-C-I","P","PASIVO","C","C) PROVISIONES PARA RIESGOS Y GASTOS","I","1. Provisiones para pensiones y obligaciones similares","",""],
				["P-C-II","P","PASIVO","C","C) PROVISIONES PARA RIESGOS Y GASTOS","II","2. Provisiones para impuestos","",""],
				["P-C-III","P","PASIVO","C","C) PROVISIONES PARA RIESGOS Y GASTOS","III","3. Otras provisiones","",""],
				["P-C-IV","P","PASIVO","C","C) PROVISIONES PARA RIESGOS Y GASTOS","IV","4. Fondo de reversi�n","",""],
				["P-D","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","","","",""],
				["P-D-I","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","",""],
				["P-D-I-1","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","1","1. Obligaciones no convertibles"],
				["P-D-I-2","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","2","2. Obligaciones convertibles"],
				["P-D-I-3","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","3","3. Otras deudas representadas en valores negociables"],
				["P-D-II","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","II","II. Deudas con entidades de cr�dito","",""],
				["P-D-II-1","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","II","II. Deudas con entidades de cr�dito","1","1. Deudas a largo plazo con entidades de cr�dito"],
				["P-D-II-2","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","II","II. Deudas con entidades de cr�dito","2","2. Acreedores por arrendamiento financiero a largo plazo"],
				["P-D-III","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","III","III. Deudas con empresas del grupo y asociadas","",""],
				["P-D-III-1","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","III","III. Deudas con empresas del grupo y asociadas","1","1. Deudas con empresas del grupo"],
				["P-D-III-2","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","III","III. Deudas con empresas del grupo y asociadas","2","2. Deudas con empresas asociadas"],
				["P-D-IV","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","IV","IV. Otros acreedores","",""],
				["P-D-IV-1","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","IV","IV. Otros acreedores","1","1. Deudas representadas por efectos a pagar"],
				["P-D-IV-2","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","IV","IV. Otros acreedores","2","2. Otras deudas"],
				["P-D-IV-3","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","IV","IV. Otros acreedores","3","3. Fianzas y dep�sitos recibidos a largo plazo"],
				["P-D-IV-4","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","IV","IV. Otros acreedores","4","4. Administraciones p�blicas a largo plazo"],
				["P-D-V","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","V","V. Desembolsos pendientes sobre acciones no exigidos","",""],
				["P-D-V-1","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","V","V. Desembolsos pendientes sobre acciones no exigidos","1","1. De empresas del grupo"],
				["P-D-V-2","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","V","V. Desembolsos pendientes sobre acciones no exigidos","2","2. De empresas asociadas"],
				["P-D-V-3","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","V","V. Desembolsos pendientes sobre acciones no exigidos","3","3. De otras empresas"],
				["P-D-VI","P","PASIVO","D","D) ACREEDORES A LARGO PLAZO","VI","VI. Acreedores por operaciones de tr�fico a largo plazo","",""],
				["P-E","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","","","",""],
				["P-E-I","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","",""],
				["P-E-I-1","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","1","1. Obligaciones no convertibles"],
				["P-E-I-2","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","2","2. Obligaciones convertibles"],
				["P-E-I-3","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","3","3. Otras deudas representadas en valores negociables"],
				["P-E-I-4","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","I","I. Emisiones de obligaciones y otros valores negociables","4","4. Intereses de obligaciones y otros valores"],
				["P-E-II","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","II","II. Deudas con entidades de cr�dito","",""],
				["P-E-II-1","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","II","II. Deudas con entidades de cr�dito","1","1. Pr�stamos y otras deudas"],
				["P-E-II-2","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","II","II. Deudas con entidades de cr�dito","2","2. Deudas por intereses"],
				["P-E-II-3","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","II","II. Deudas con entidades de cr�dito","3","3. Acreedores por arrendamiento financiero a corto plazo"],
				["P-E-III","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","III","III. Deudas con empresas del grupo y asociadas a corto plazo","",""],
				["P-E-III-1","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","III","III. Deudas con empresas del grupo y asociadas a corto plazo","1","1. Deudas con empresas del grupo"],
				["P-E-III-2","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","III","III. Deudas con empresas del grupo y asociadas a corto plazo","2","2. Deudas con empresas asociadas"],
				["P-E-IV","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","IV","IV. Acreedores comerciales","",""],
				["P-E-IV-1","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","IV","IV. Acreedores comerciales","1","1. Anticipos recibidos por pedidos"],
				["P-E-IV-2","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","IV","IV. Acreedores comerciales","2","2. Deudas por compras o prestaciones de servicios"],
				["P-E-IV-3","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","IV","IV. Acreedores comerciales","3","3. Deudas representadas por efectos a pagar"],
				["P-E-V","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","V","V. Otras deudas no comerciales","",""],
				["P-E-V-1","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","V","V. Otras deudas no comerciales","1","1. Administraciones p�blicas"],
				["P-E-V-2","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","V","V. Otras deudas no comerciales","2","2. Deudas representadas por efectos a pagar"],
				["P-E-V-3","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","V","V. Otras deudas no comerciales","3","3. Otras deudas"],
				["P-E-V-4","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","V","V. Otras deudas no comerciales","4","4. Remuneraciones pendientes de pago"],
				["P-E-V-5","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","V","V. Otras deudas no comerciales","5","5. Fianzas y dep�sitos recibidos a corto plazo"],
				["P-E-VI","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","VI","VI. Provisiones para operaciones de tr�fico","",""],
				["P-E-VII","P","PASIVO","E","E) ACREEDORES A CORTO PLAZO","VII","VII. Ajustes por periodificaci�n","",""],
				["P-F","P","PASIVO","F","F) PROVISIONES PARA RIESGOS Y GASTOS A CORTO PLAZO","","","",""],
				["P-G","P","PASIVO","G","TOTAL  PASIVO","","","",""]];
		
		for (i = 0; i < datos.length; i++) {
				with(curCbl) {
						setModeAccess(curCbl.Insert);
						refreshBuffer();
						setValueBuffer("codbalance", datos[i][0]);
						setValueBuffer("naturaleza", datos[i][2]);
						setValueBuffer("nivel1", datos[i][3]);
						setValueBuffer("descripcion1", datos[i][4]);
						setValueBuffer("nivel2", datos[i][5]);
						setValueBuffer("descripcion2", datos[i][6]);
						setValueBuffer("nivel3", datos[i][7]);
						setValueBuffer("descripcion3", datos[i][8]);
						commitBuffer();
				}
		}
}

/** \D Se generan las subcuentas, independientes del ejercicio
@param codEjercicio C�digo del ejercicio sobre el que se generan las subcuentas
@param longSubcuenta N�mero de d�gitos de subcuenta del ejercicio sobre el que se generan las subcuentas
\end */
function oficial_generarSubcuentas(codEjercicio, longSubcuenta)
{
		var util:FLUtil = new FLUtil();
		var i,j:Number; 
		var numCuentas:Number = this.iface.valorPorClave("co_cuentas", "count(codcuenta)", "codejercicio = '" + codEjercicio + "'");
		
		var cont1:Number = 0
		var cont2:Number = 0;
		util.createProgressDialog(util.translate("scripts", "Generando Subcuentas"), numCuentas);
		util.setProgress(0);
		
		var curCuenta:FLSqlCursor = new FLSqlCursor("co_cuentas");
		var curSubcuenta:FLSqlCursor = new FLSqlCursor("co_subcuentas");
		curCuenta.setActivatedCheckIntegrity(false);
		curSubcuenta.setActivatedCheckIntegrity(false);
		curCuenta.select("codejercicio = '" + codEjercicio + "'");
		var codSubcuenta:String;
		var numCeros:Number;
		
		while (curCuenta.next()) {
				curCuenta.setModeAccess(curCuenta.Browse);
				curCuenta.refreshBuffer();
				codSubcuenta = curCuenta.valueBuffer("codcuenta");
				
				//D Para evitar duplicados en las subcuentas cuando hay dos cuentas con el c�digo x00 y x000
				var auxCSC:String = codSubcuenta.toString();
				
				numCeros = longSubcuenta - codSubcuenta.toString().length;
				for (var i = 0; i < numCeros; i++)
						codSubcuenta += "0";
						
				if (auxCSC.length > 3 && auxCSC.right(1) == "0") 
						codSubcuenta = codSubcuenta.left(codSubcuenta.length-1) + "1";
						
				//D Para evitar duplicados en las subcuentas durante las importaciones
				curSubcuenta.select("codsubcuenta = '" + codSubcuenta + "' AND codejercicio = '" + codEjercicio + "'");
				if (curSubcuenta.first()) {
					continue;
				}
				
				with(curSubcuenta) {
						setModeAccess(curSubcuenta.Insert);
						refreshBuffer();
						setValueBuffer("codsubcuenta", codSubcuenta);
						setValueBuffer("descripcion", curCuenta.valueBuffer("descripcion"));
						setValueBuffer("codejercicio", codEjercicio);
						setValueBuffer("idcuenta", curCuenta.valueBuffer("idcuenta"));
						setValueBuffer("codcuenta", curCuenta.valueBuffer("codcuenta"));
						setValueBuffer("idcuentaesp", curCuenta.valueBuffer("idcuentaesp"));
						setValueBuffer("coddivisa", util.sqlSelect("empresa", "coddivisa", "1 = 1"));
						commitBuffer();
				}
				
				cont1++;
				cont2++;
				if (cont2 > 20) {
						cont2 = 0;
						util.setProgress(cont1);
				}
		}
		util.setProgress(numCuentas);
}

/** \D Utilizado para realizar una consulta sencilla r�pidamente con un s�lo valor como resultado. Se realiza mediante un FLSqlQuery

@param tabla Argumento de setTablesList 
@param campo Argumento de setSelect
@param tabla Argumento de setWhere
@param tabla Argumento de setFrom

@return Resultado de la consulta, false si no se encontr� ning�n valor
\end */
function oficial_valorPorClave(tabla, campo, where, listaTablas)
{
		var query:FLSqlQuery = new FLSqlQuery();
		if (listaTablas)
				query.setTablesList(listaTablas);
		else
				query.setTablesList(tabla);
		query.setSelect(campo);
		query.setFrom(tabla);
		query.setWhere(where);
		try { query.setForwardOnly( true ); } catch (e) {}
		if ( query.exec() )
			if ( query.next() )
				return query.value( 0 );

		return false;
}

/** \D Comprueba si la subcuenta es de I.V.A. y si la fecha del asiento est� comprendida en un per�odo de regularizaci�n de I.V.A. Si el asiento es el de regularizaci�n, devuelve siempre Verdadero

@param idSubcuenta Subcuenta a comprobar
@param idAsiento Asiento a comprobar
@return Verdadero si la condici�n no se cumple (no es I.V.A. o no est� comprendida o el asiento es de regularizac�n de I.V.A.)
\end */
function oficial_comprobarRegIVA(idSubcuenta, idAsiento):Boolean
{
	var util:FLUtil = new FLUtil();
	if (util.sqlSelect("co_regiva", "idregiva", "idasiento = " + idAsiento)) {
		return true;
	}

	var idCuentaEsp:String = util.sqlSelect("co_subcuentas s INNER JOIN co_cuentas c ON s.idcuenta = c.idcuenta", "c.idcuentaesp", "s.idsubcuenta = " + idSubcuenta, "co_subcuentas,co_cuentas");
	if (idCuentaEsp == "IVAREP" || idCuentaEsp == "IVASOP") {
		var fechaAsiento:String = util.sqlSelect("co_asientos", "fecha", "idasiento = " + idAsiento);
		var ejercicioAsiento:String = util.sqlSelect("co_asientos", "codejercicio", "idasiento = " + idAsiento);
		if (util.sqlSelect("co_regiva", "idregiva", "fechainicio <= '" + fechaAsiento + "' AND fechafin >= '" + fechaAsiento + "' and codejercicio = '" + ejercicioAsiento + "'")) {
			MessageBox.warning(util.translate("scripts", "No puede modificarse una partida de I.V.A. en un per�odo ya regularizado"), MessageBox.Ok, MessageBox.NoButton);
			return false;
		}
	}
	return true;
}

/** \D Actualiza los campos Debe, Haber y Saldo de la subcuenta especificada sumando los campos debe y haber de las partidas que utilizan la subcuenta

@param idsubcuenta Id de la subcuenta
@return True en caso de �xito, false en caso contrario
\end */
function oficial_calcularSaldo(idSubcuenta):Boolean
{
	var util:FLUtil = new FLUtil;
	var qryTotales:FLSqlQuery = new FLSqlQuery();
	with (qryTotales) {
		setTablesList("co_partidas");
		setSelect("SUM(debe), SUM(haber)");
		setFrom("co_partidas");
		setWhere("idsubcuenta = " + idSubcuenta);
	}
	try { qryTotales.setForwardOnly( true ); } catch (e) {}
	if (!qryTotales.exec()) {
		return false;
	}
	var debe:Number = 0;
	var haber:Number = 0;
	var saldo:Number = 0;
	if (qryTotales.next()) {
		debe = parseFloat(qryTotales.value(0));
		if (isNaN(debe))
			debe = 0;
		debe = util.roundFieldValue(debe, "co_subcuentas", "debe");
		haber = parseFloat(qryTotales.value(1));
		if (isNaN(haber))
			haber = 0;
		haber = util.roundFieldValue(haber, "co_subcuentas", "haber");
		saldo = debe - haber;
		saldo = util.roundFieldValue(saldo, "co_subcuentas", "saldo");
	}
	var curSubcuenta:FLSqlCursor = new FLSqlCursor("co_subcuentas");
	curSubcuenta.select("idsubcuenta = " + idSubcuenta);
	if (!curSubcuenta.first())
		return false;
	with (curSubcuenta) {
		setModeAccess(curSubcuenta.Edit);
		refreshBuffer();
		setValueBuffer("debe", debe);
		setValueBuffer("haber", haber);
		setValueBuffer("saldo", saldo);
	}
	if (!curSubcuenta.commitBuffer())
		return false;
	
	return true;
}

/** \D Reformateaa el valor de codSubcuenta reemplazando el car�cter ".", si es que existe, por los ceros "0" necesarios hasta completar el n�mero de d�gitos de subcuenta del ejercicio actual, a su vez elimina los caracteres sobrantes cuando se supere el l�mite de d�gitos.

@param curFormSubcuenta: Formulario en el que se encuentra el campo subcuenta
@param campoSubcuenta: Nombre del campo subcuenta
@param longSubcuenta: Longitud de las subcuentas
@param posPuntoActual: Posici�n del punto en el valor actual de la subcuenta

@return Nueva posici�n del punto en el valor actual de la subcuenta
\end */
function oficial_formatearCodSubcta(curFormSubcuenta:Object, campoSubcuenta:String, longSubcuenta:Number, posPuntoActual:Number):Number
{
	var util:FLUtil = new FLUtil();
	var cursor:FLSqlCursor = curFormSubcuenta.cursor();
	var cambiado:Boolean = false;
	var valCodSubcta:String = curFormSubcuenta.child(campoSubcuenta).value().toString();
	var lenValCodSubcta:Number = valCodSubcta.length;
	var nuevoPunto:Number = valCodSubcta.find(".");
	
	if (nuevoPunto < 0 && lenValCodSubcta > longSubcuenta) { 
		// En caso de superar el n� de d�gitos, se eliminar�n los ceros insertados por el "."
		if (posPuntoActual >= 0) {
			if (valCodSubcta.mid(posPuntoActual,1) == "0") 
				// S�lo en caso de que sigan existiendo "0" insertados
				valCodSubcta = valCodSubcta.left(posPuntoActual) + valCodSubcta.right(longSubcuenta - posPuntoActual);
		}
		if (valCodSubcta.length > longSubcuenta) { 
			// Pero si ya se eliminaron los "0" insertados, se elimina el �ltimo d�gito tecleado.
			valCodSubcta = valCodSubcta.left(longSubcuenta);
		} 
		cambiado = true;
	}
	if (nuevoPunto > -1 && posPuntoActual > -1) {
		// El punto pulsado por segunda vez debe sustituir al anterior
		posPuntoActual = -1;
	}
	
	if (posPuntoActual == -1)
		posPuntoActual = nuevoPunto;
	if (nuevoPunto > -1) {
		var numCeros = longSubcuenta - (valCodSubcta.length-1);
		var strCeros = "";
		for (var i = 0; i < numCeros; i++)
			strCeros += "0";
		valCodSubcta = valCodSubcta.replace(".", strCeros);
		cambiado = true;
	}
	if (cambiado) {
		curFormSubcuenta.child(campoSubcuenta).setValue(valCodSubcta);
	}
	return posPuntoActual;
}

function oficial_rellenarSubcuentas()
{
	var util:FLUtil = new FLUtil;
	var i:Number = 0;
	if (!util.sqlSelect("co_subcuentascli", "id", "1 = 1")) {
		var qryClientes:FLSqlQuery = new FLSqlQuery();
		qryClientes.setTablesList("clientes");
		qryClientes.setSelect("codcliente, codsubcuenta, nombre");
		qryClientes.setFrom("clientes");
		qryClientes.setWhere("codsubcuenta IS NOT NULL AND codsubcuenta <> ''");
		if (!qryClientes.exec())
			return;
		util.createProgressDialog(util.translate("scripts", "Creando subcuentas por cliente"), qryClientes.size());
		util.setProgress(0);
		while (qryClientes.next()) {
			flfactppal.iface.pub_rellenarSubcuentasCli(qryClientes.value(0), qryClientes.value(1), qryClientes.value(2));
			util.setProgress(i++);
		}
		util.setProgress(qryClientes.size());
		util.destroyProgressDialog();
	}
	i = 0;
	if (!util.sqlSelect("co_subcuentasprov", "id", "1 = 1")) {
		var qryProveedores:FLSqlQuery = new FLSqlQuery();
		qryProveedores.setTablesList("proveedores");
		qryProveedores.setSelect("codproveedor, codsubcuenta, nombre");
		qryProveedores.setFrom("proveedores");
		qryProveedores.setWhere("codsubcuenta IS NOT NULL AND codsubcuenta <> ''");
		if (!qryProveedores.exec())
			return;
		util.createProgressDialog(util.translate("scripts", "Creando subcuentas por proveedor"), qryProveedores.size());
		util.setProgress(0);
		while (qryProveedores.next()) {
			flfactppal.iface.pub_rellenarSubcuentasProv(qryProveedores.value(0), qryProveedores.value(1), qryProveedores.value(2));
			util.setProgress(i++);
		}
		util.setProgress(qryProveedores.size());
		util.destroyProgressDialog();
	}
}

/** \D Limpia la memoria para los asientos predefinidos
\end */
function oficial_clearPreMemoria()
{
	this.iface.PreMemorias.splice(0,this.iface.PreMemorias.length);
//	delete (this.iface.PreMemorias);
//	this.iface.PreMemorias = new Array(0);
}

/** \D Retorna el array con todas las memorias
@return	el array PreMemorias
\end */
function oficial_arrayPreMemoria():Array {
	return this.iface.PreMemorias;
}

/** \D Reescribe el array con todas las memorias
@param	nuevoArray: El nuevo array para PreMemorias
\end */
function oficial_reponerArrayPreMemoria(nuevoArray:Array) {
	this.iface.PreMemorias = nuevoArray.slice(0, nuevoArray.length);
}

/** \D Establece un valor en la memoria para los asientos predefinidos
@param	nombreMemoria: Identificador de la variable
@param	valorMemoria: Nuevo valor
\end */
function oficial_putPreMemoria(nombreMemoria:String, valorMemoria:String)
{
	var lugarOcupado:Number = this.iface.lugarPreMemoria(nombreMemoria);
	if (lugarOcupado == -1) {
		this.iface.PreMemorias.push(nombreMemoria);
		this.iface.PreMemorias.push(valorMemoria);
	}
	else // Ya exist�a
		this.iface.PreMemorias[lugarOcupado+1] = valorMemoria;
}

/** \D Establece un valor en un lugar de la memoria para los asientos predefinidos
@param	lugarOcupado: posici�n de la variable en la memoria
@param	nombreMemoria: Identificador de la variable
@param	valorMemoria: Nuevo valor
@return	lugarOcupado: posici�n de la variable en la memoria
\end */
function oficial_putLugarPreMemoria(lugarOcupado:Number, nombreMemoria:String, valorMemoria:String):Number
{
	if (lugarOcupado < 0) lugarOcupado = this.iface.PreMemorias.length;
	if (lugarOcupado >= this.iface.PreMemorias.length) {
		this.iface.PreMemorias.push(nombreMemoria);
		lugarOcupado = this.iface.PreMemorias.push(valorMemoria)-2;
	}
	else { // Ya exist�a
		this.iface.PreMemorias[lugarOcupado] = nombreMemoria;
		this.iface.PreMemorias[lugarOcupado+1] = valorMemoria;
	}
	return lugarOcupado;
}

/** \D Obtiene un valor de la memoria para los asientos predefinidos
@param	nombreMemoria: Identificador de la variable
@return	valor almacenado
\end */
function oficial_getPreMemoria(nombreMemoria:String):String
{
	var lugarOcupado:Number = this.iface.lugarPreMemoria(nombreMemoria);
	var res:String = "";
	if (lugarOcupado != -1) {
		res = this.iface.PreMemorias[lugarOcupado+1];
	}
	return res;
}

/** \D Obtiene el lugar que un valor tiene en la memoria para los asientos predefinidos
@param	nombreMemoria: Identificador de la variable
@return	�ndice del valor en la memoria
\end */
function oficial_lugarPreMemoria(nombreMemoria:String):Number
{
	var contador:Number = this.iface.PreMemorias.length;
	var res:Number = -1;
	for (var i:Number = 0; i < contador; i+=2)
		if (this.iface.PreMemorias[i] == nombreMemoria)
			res = i;
	return res;
}

/** \D Obtiene un nombre identificador de la memoria para los asientos predefinidos
@param	nombreMemoria: Identificador de la variable
@return	valor almacenado
\end */
function oficial_getNombrePreMemoria(lugarOcupado:Number):String
{
	var res:String = "";
	if (lugarOcupado >= 0 && lugarOcupado < this.iface.PreMemorias.length) {
		res = this.iface.PreMemorias[lugarOcupado];
	}
	return res;
}

/** \D Obtiene la cantidad de valores existente en la memoria
@param	nombreMemoria: Identificador de la variable
@return	Cantidad de valores en la memoria
\end */
function oficial_cantidadPreMemoria():Number
{
	var total:Number = this.iface.PreMemorias.length;
	return total;
}

/** \D
Obtiene el siguiente n�mero de la secuencia de documentos contables por ejercicio
@param codEjercicio: C�digo de ejercicio del documento
@param fN: Tipo de documento (factura a cliente, a proveedor, albar�n, etc.)
@return N�mero correspondiente al siguiente documento en la serie o false si hay error
\end */
function oficial_siguienteNumero(codEjercicio:String, fN:String):Number
{
	var numero:Number;
	var siguienteNumero:Number;
	var vOut:Boolean;

	var util:FLUtil = new FLUtil;
	var cursorSecuencias:FLSqlCursor = new FLSqlCursor("co_secuencias");
	cursorSecuencias.setContext(this);
	cursorSecuencias.setActivatedCheckIntegrity(false);
	cursorSecuencias.select("upper(codejercicio)='" + codEjercicio + "' AND nombre = '" + fN + "'");
	if (cursorSecuencias.next()) {
		cursorSecuencias.setModeAccess( cursorSecuencias.Edit );
		cursorSecuencias.refreshBuffer();
		if ( !cursorSecuencias.isNull( "valorout" ) ) {
			vOut = true;
			numero = cursorSecuencias.valueBuffer( "valorout" );
		} else {
			vOut = false;
			numero = cursorSecuencias.valueBuffer( "valor" );
		}

		if (!numero)
			numero = 1;
		siguienteNumero = (parseFloat(numero) + 1);

		if (vOut) {
			cursorSecuencias.setValueBuffer( "valorout", siguienteNumero );

		} else {
			cursorSecuencias.setValueBuffer( "valor", siguienteNumero );
		}
		cursorSecuencias.commitBuffer();

	} else {
		numero = util.sqlSelect("co_asientos", "numero", "codejercicio = '" + codEjercicio + "' ORDER BY numero DESC");
		if (!numero)
			numero = 0;

		numero = parseFloat(numero) + 1;
		siguienteNumero = parseFloat(numero) + 1;
		cursorSecuencias.setModeAccess( cursorSecuencias.Insert );
		cursorSecuencias.refreshBuffer();
		cursorSecuencias.setValueBuffer( "codejercicio", codEjercicio);
		cursorSecuencias.setValueBuffer( "nombre", fN );
		cursorSecuencias.setValueBuffer( "valorout",  siguienteNumero);
		cursorSecuencias.commitBuffer();
	}
	cursorSecuencias.setActivatedCheckIntegrity(true);

	return numero;
}

/** \C Comprueba que el asiento generado est� cuadrado y que todas las subcuentas pertenezcan al mismo ejercicio
@param	idAsiento: Identificador del asiento
@return	true si el asiento es correcto, false en caso contrario
\end */
function oficial_comprobarAsiento(idAsiento:String, omitirImporte:Boolean):Boolean
{
	var util:FLUtil = new FLUtil;

	var totalDebe:Number = 0;
	var totalHaber:Number = 0;
	var lista:String = util.translate("scripts", "\nSubcuenta\tDebe\Haber\t");
	var qryPartidas:FLSqlQuery = new FLSqlQuery();
	with (qryPartidas) {
		setTablesList("co_partidas");
		setSelect("codsubcuenta, debe, haber");
		setFrom("co_partidas");
		setWhere("idasiento = " + idAsiento);
		setForwardOnly(true);
	}
	if (!qryPartidas.exec())
		return false;

	var debe:Number;
	var haber:Number;
	while (qryPartidas.next()) {
		debe = parseFloat(qryPartidas.value("debe"));
		if (isNaN(debe))
			debe = 0;
		haber = parseFloat(qryPartidas.value("haber"));
		if (isNaN(haber))
			haber = 0;

		if (debe != util.roundFieldValue(debe, "co_partidas", "debe") || haber != util.roundFieldValue(haber, "co_partidas", "haber")) {
			MessageBox.critical(util.translate("scripts", "Error de redondeo:\nSubcuenta\tDebe\Haber \n%2\n%3\n%4").arg(qryPartidas.value("codsubcuenta")).arg(debe).arg(haber), MessageBox.Ok, MessageBox.NoButton);
			return false;
		}
		debe = util.roundFieldValue(debe, "co_partidas", "debe");
		haber = util.roundFieldValue(haber, "co_partidas", "haber");
		totalDebe += parseFloat(debe);
		totalHaber += parseFloat(haber);
		lista += "\n" + qryPartidas.value("codsubcuenta") + "\t" + qryPartidas.value("debe") + "\t" + qryPartidas.value("haber");
	}
	// Redondeo porque totalDebe += parseFloat(debe); mete decimales que no existen
	totalDebe = util.roundFieldValue(totalDebe, "co_partidas", "debe");
	totalHaber = util.roundFieldValue(totalHaber, "co_partidas", "haber");
	if (totalDebe != totalHaber) {
		MessageBox.critical(util.translate("scripts", "Ha habido un error al generar el asiento:\nEl asiento no cuadra:%1").arg(lista), MessageBox.Ok, MessageBox.NoButton);
		return false;
	}

	if (util.sqlSelect("co_partidas p inner join co_asientos a on p.idasiento = a.idasiento inner join co_subcuentas s on p.idsubcuenta = s.idsubcuenta", "a.idasiento", "a.idasiento = " + idAsiento + " AND a.codejercicio <> s.codejercicio", "co_asientos,co_partidas,co_subcuentas")) {
		MessageBox.critical(util.translate("scripts", "Ha habido un error al generar el asiento:\nEl ejercicio de las distintas subcuentas no coincide.\n Aseg�rese de estar en el ejercicio correcto y vuelva a generar el asiento."), MessageBox.Ok, MessageBox.NoButton);
		return false;
	}

	if (!omitirImporte) {
		if (!this.iface.informarImporteAsiento(idAsiento, totalDebe)) {
			return false;
		}
	}
	return true;
}

function oficial_informarImporteAsiento(idAsiento:String, importe:Number):Boolean
{
	var curAsiento:FLSqlCursor = new FLSqlCursor("co_asientos");
	curAsiento.select("idasiento = " + idAsiento);
	if (!curAsiento.first()) {
		return false;
	}

	var editable:Boolean = curAsiento.valueBuffer("editable");
	if (!editable) {
		curAsiento.setUnLock("editable", true);
		curAsiento.select("idasiento = " + idAsiento);
		if (!curAsiento.first()) {
			return false;
		}
	}
	curAsiento.setModeAccess(curAsiento.Edit);
	curAsiento.refreshBuffer();
	curAsiento.setValueBuffer("importe", importe);
	if (!curAsiento.commitBuffer()) {
		return false;
	}

	if (!editable) {
		curAsiento.select("idasiento = " + idAsiento);
		if (!curAsiento.first()) {
			return false;
		}
		curAsiento.setUnLock("editable", false);
	}
	return true;
}

function oficial_generarAsientoDotacion(curDotacion:FLSqlCursor):Boolean
{
	if (curDotacion.modeAccess() != curDotacion.Insert && curDotacion.modeAccess() != curDotacion.Edit)
		return true;

	if (curDotacion.valueBuffer("nogenerarasiento")) {
		curDotacion.setNull("idasiento");
		return true;
	}

	var util:FLUtil = new FLUtil;
	var ejercicios:Array = [];
	var datosAsiento:Array = [];
	var valoresDefecto:Array;
	var fecha:Date = curDotacion.valueBuffer("fecha");
	
	var idAsiento:Number = curDotacion.valueBuffer("idasiento");
	var ejercicio:String = "";
	if (idAsiento) {
		ejercicio = util.sqlSelect("co_asientos","codejercicio","idasiento = " + idAsiento);
	} else {
		ejercicio = flfactppal.iface.pub_ejercicioActual();
// 		var qryEjercicio:FLSqlQuery = new FLSqlQuery();
// 		qryEjercicio.setTablesList("ejercicios");
// 		qryEjercicio.setSelect("codejercicio");
// 		qryEjercicio.setFrom("ejercicios");
// 		qryEjercicio.setWhere("fechainicio <= '" + fecha + "' AND fechafin >= '" + fecha + "'");
// 		
// 		if (!qryEjercicio.exec()) {
// 			return false;
// 		}
// 	
// 		while (qryEjercicio.next()) {
// 			ejercicios[ejercicios.length] = qryEjercicio.value("codejercicio");
// 		}
// debug("Ejercicios = " + ejercicios);
// 		if (qryEjercicio.size() == 0) {
// 			MessageBox.warning(util.translate("scripts", "No existe ning�n ejercicio para la fecha de la dotaci�n"), MessageBox.Ok, MessageBox.NoButton);
// 			return false;
// 		}
// 		var seleccion:Number = -1;
// 		if (ejercicios.length > 1) {
// 			var dialog = new Dialog;
// 			dialog.caption = "Ejercicios";
// 			dialog.okButtonText = "Aceptar"
// 			dialog.cancelButtonText = "Cancelar";
// 			var gbx = new GroupBox;
// 			gbx.title = util.translate("scripts", "Existe m�s de un ejercicio para la fecha establecida. Seleccione el que corresponda.");
// 			dialog.add( gbx );
// 			var opciones:Array = [];
// 			for (var j=0; j < ejercicios.length; j++) {
// 				opciones[j] = new RadioButton;
// 				var nombreEjercicio:String = util.sqlSelect("ejercicios", "nombre", "codejercicio = '" + ejercicios[j] + "'");
// 				opciones[j].text = ejercicios[j] + " - " + nombreEjercicio;
// 				gbx.add( opciones[j] );
// 			}
// 			
// 			if (!dialog.exec() ) {
// 				return false;
// 			}
// 			
// 			for (var j=0; j < ejercicios.length; j++) {
// 				if (opciones[j].checked) {
// 					seleccion = j;
// 					break;
// 				}
// 			}
// 			if (seleccion == -1) {
// 				return false;
// 			}
// 			ejercicio = ejercicios[seleccion].split(" - ")[0];
// 		}
// 		if (ejercicios.length == 1) {
// 			ejercicio = ejercicios[0];
// 		}
	}
debug("ejercicio = " + ejercicio);
debug("curDotacion = " + curDotacion.valueBuffer("fecha"));
	valoresDefecto["codejercicio"] = ejercicio;
	valoresDefecto["coddivisa"] = flfactppal.iface.pub_valorDefectoEmpresa("coddivisa");

	datosAsiento = flfacturac.iface.pub_regenerarAsiento(curDotacion, valoresDefecto);
	if (datosAsiento.error == true)
		return false;

	if (!this.iface.generarPartidasDotacion(curDotacion, datosAsiento.idasiento, valoresDefecto))
		return false;

	curDotacion.setValueBuffer("idasiento", datosAsiento.idasiento);

	if (!flcontppal.iface.pub_comprobarAsiento(datosAsiento.idasiento))
		return false;

	return true;
}

function oficial_generarPartidasDotacion(curDotacion:FLSqlCursor, idAsiento:Number, valoresDefecto:Array):Boolean
{
	var util:FLUtil = new FLUtil();

	var fecha:Date = curDotacion.valueBuffer("fecha");
	var codEjercicio:String = valoresDefecto["codejercicio"];
	var codDivisa:String = valoresDefecto["coddivisa"];
	var tasaConv:Number = parseFloat(util.sqlSelect("divisas","tasaconv","coddivisa = '" + codDivisa + "'"));

	var importe:Number = curDotacion.valueBuffer("importe");
	var importeME:Number = importe * tasaConv;		
	importe = util.roundFieldValue(importe, "co_partidas", "haber");
	importeME = util.roundFieldValue(importeME, "co_partidas", "haberme");

	var codSubcuentaElem:String = util.sqlSelect("co_amortizaciones","codsubcuentaelem","codamortizacion = '" + curDotacion.valueBuffer("codamortizacion") + "'");
	var idSubcuentaElem:Number = util.sqlSelect("co_subcuentas","idsubcuenta","codsubcuenta = '" + codSubcuentaElem + "' AND codejercicio = '" + codEjercicio + "'");
	if(!idSubcuentaElem) {
		MessageBox.warning(util.translate("scripts", "No existe la subcuenta %1 para el ejercicio %2.\nAntes de crear la dotaci�n para esta fecha debe crear la subcuenta").arg(codSubcuentaElem).arg(codEjercicio), MessageBox.Ok, MessageBox.NoButton);
		return false;
	}

	var curPartida:FLSqlCursor = new FLSqlCursor("co_partidas");
	with (curPartida) {
		setModeAccess(curPartida.Insert);
		refreshBuffer();
		setValueBuffer("idsubcuenta", idSubcuentaElem);
		setValueBuffer("codsubcuenta", codSubcuentaElem);
		setValueBuffer("idasiento", idAsiento);
		setValueBuffer("debe", 0);
		setValueBuffer("haber", importe);
		setValueBuffer("coddivisa", codDivisa);
		setValueBuffer("tasaconv", tasaConv);
		setValueBuffer("debeME", 0);
		setValueBuffer("haberME", importeME);
		setValueBuffer("concepto", util.translate("scripts", "Dotaci�n de ") + util.sqlSelect("co_amortizaciones","elemento","codamortizacion = '" + curDotacion.valueBuffer("codamortizacion") + "'") + " - " + util.dateAMDtoDMA(fecha));
	}
	
	if (!curPartida.commitBuffer())
			return false;


	var codSubcuentaAmor:String = util.sqlSelect("co_amortizaciones","codsubcuentaamor","codamortizacion = '" + curDotacion.valueBuffer("codamortizacion") + "'")
	var idSubcuentaAmor:Number = util.sqlSelect("co_subcuentas","idsubcuenta","codsubcuenta = '" + codSubcuentaAmor + "' AND codejercicio = '" + codEjercicio + "'")
	if(!idSubcuentaAmor) {
		MessageBox.warning(util.translate("scripts", "No existe la subcuenta %1 para el ejercicio %2.\nAntes de crear la dotaci�n para esta fecha debe crear la subcuenta").arg(codSubcuentaAmor).arg(codEjercicio), MessageBox.Ok, MessageBox.NoButton);
		return false;
	}

	var curPartida:FLSqlCursor = new FLSqlCursor("co_partidas");
	with (curPartida) {
		setModeAccess(curPartida.Insert);
		refreshBuffer();
		setValueBuffer("idsubcuenta", idSubcuentaAmor);
		setValueBuffer("codsubcuenta",codSubcuentaAmor);
		setValueBuffer("idasiento", idAsiento);
		setValueBuffer("debe", importe);
		setValueBuffer("haber", 0);
		setValueBuffer("coddivisa", codDivisa);
		setValueBuffer("tasaconv", tasaConv);
		setValueBuffer("debeME", importeME);
		setValueBuffer("haberME", 0);
		setValueBuffer("concepto", util.translate("scripts", "Dotaci�n de ") + util.sqlSelect("co_amortizaciones","elemento","codamortizacion = '" + curDotacion.valueBuffer("codamortizacion") + "'") + " - " + util.dateAMDtoDMA(fecha));
	}
	
	if (!curPartida.commitBuffer())
		return false;

	return true;
}

function oficial_rellenarCuentaEsp()
{
	var util:FLUtil = new FLUtil;
	if (util.sqlSelect("co_subcuentas", "idsubcuenta", "idcuentaesp IS NOT NULL AND idsubcuenta <> 0")) {
		return;
	}
	var qryCuentas:FLSqlQuery = new FLSqlQuery;
	with (qryCuentas) {
		setTablesList("co_cuentas");
		setSelect("idcuenta, idcuentaesp, codcuenta");
		setFrom("co_cuentas");
		setWhere("idcuentaesp IS NOT NULL AND idcuentaesp <> ''");
		setForwardOnly(true);
	}
	if (!qryCuentas.exec()) {
		return;
	}
	var total:Number = qryCuentas.size();
	var paso:Number = 0;
	util.createProgressDialog(util.translate("scripts", "Actualizando cuentas especiales (1/2)..."), total);
	var idCuentaEsp:String;
	while (qryCuentas.next()) {
		util.setProgress(++paso);
debug("codcuenta " + qryCuentas.value("codcuenta"))
		idCuentaEsp = qryCuentas.value("idcuentaesp");
		if (!util.sqlUpdate("co_subcuentas", "idcuentaesp", idCuentaEsp, "idcuenta = " + qryCuentas.value("idcuenta"))) {
			util.destroyProgressDialog();
			return false;
		}
	}
	util.destroyProgressDialog();

	var qryCuentasEsp:FLSqlQuery = new FLSqlQuery;
	with (qryCuentasEsp) {
		setTablesList("co_cuentasesp");
		setSelect("idcuentaesp, codsubcuenta");
		setFrom("co_cuentasesp");
		setWhere("1 = 1");
		setForwardOnly(true);
	}
	if (!qryCuentasEsp.exec()) {
		return;
	}
	total = qryCuentasEsp.size();
	paso = 0;
	util.createProgressDialog(util.translate("scripts", "Actualizando cuentas especiales (2/2)..."), total);
	var idCuentaEsp:String;
	var codSubcuenta:String;
	while (qryCuentasEsp.next()) {
		util.setProgress(++paso);
		codSubcuenta = qryCuentasEsp.value("codsubcuenta");
		idCuentaEsp = qryCuentasEsp.value("idcuentaesp");
		if (!util.sqlUpdate("co_subcuentas", "idcuentaesp", idCuentaEsp, "codsubcuenta = '" + codSubcuenta + "'")) {
			util.destroyProgressDialog();
			return false;
		}
	}
	util.destroyProgressDialog();
}

function oficial_copiarCuenta(codCuenta:String, codEjercicioAnt:String, codEjercicio:String):String
{
	var util:FLUtil = new FLUtil();
	var curCuentaOrigen:FLSqlCursor = new FLSqlCursor("co_cuentas");
	curCuentaOrigen.select("codcuenta = '" + codCuenta + "' AND codejercicio = '" + codEjercicioAnt + "'");
	if (!curCuentaOrigen.first()) {
		return false;
	}
	curCuentaOrigen.setModeAccess(curCuentaOrigen.Browse);
	curCuentaOrigen.refreshBuffer();
	

	var codEpigrafe:String = curCuentaOrigen.valueBuffer("codepigrafe");
	var idEpigrafe:String = util.sqlSelect("co_epigrafes", "idepigrafe", "codepigrafe = '" + codEpigrafe + "' AND codejercicio = '" + codEjercicio + "'");
	if (!idEpigrafe) {
		MessageBox.warning(util.translate("scripts", "El ep�grafe %1 no existe en el ejercicio %2.").arg(codEpigrafe).arg(codEjercicio), MessageBox.Ok, MessageBox.NoButton);
		return false;
	}
	
	var curCuenta:FLSqlCursor = new FLSqlCursor("co_cuentas");
	curCuenta.setModeAccess(curCuenta.Insert);
	curCuenta.refreshBuffer();
	curCuenta.setValueBuffer("codcuenta", codCuenta);
	curCuenta.setValueBuffer("descripcion", curCuentaOrigen.valueBuffer("descripcion"));
	curCuenta.setValueBuffer("codejercicio", codEjercicio);
	curCuenta.setValueBuffer("idepigrafe", idEpigrafe);
	curCuenta.setValueBuffer("codepigrafe", codEpigrafe);
	curCuenta.setValueBuffer("codbalance", curCuentaOrigen.valueBuffer("codbalance"));
	curCuenta.setValueBuffer("idcuentaesp", curCuentaOrigen.valueBuffer("idcuentaesp"));
	if (!curCuenta.commitBuffer()) {
		return false;
	}
	var idCuenta:String = curCuenta.valueBuffer("idcuenta");
	return idCuenta;
}

//// OFICIAL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////

//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
