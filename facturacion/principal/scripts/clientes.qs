/***************************************************************************
                 clientes.qs  -  description
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
	function calculateCounter():String { return this.ctx.interna_calculateCounter(); }
	function validateForm():Boolean { return this.ctx.interna_validateForm(); }
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {
	var ejercicioActual:String;
	var longSubcuenta:String;
	var bloqueoSubcuenta:Boolean;
	var posActualPuntoSubcuenta:Number;
	var toolButtonInsertSub:Object;
	var toolButtonDelSub:Object;
	var toolButtonInsertContacto:Object;
	var toolButtonDeleteContacto:Object;
	var toolButtonDeleteContactoCliente:Object;
	var toolButtonInsertContactoCliente:Object;
	var toolButtonBuscarContacto:Object;
	var toolButtonEditContacto:Object;
	var tbnMayor:Object;
	var curContacto_:FLSqlCursor;

	function oficial( context ) { interna( context ); } 
	function cambiarDomFacturacion() {
		this.ctx.oficial_cambiarDomFacturacion();
	}
	function cambiarDomEnvio() {
		this.ctx.oficial_cambiarDomEnvio();
	}
	function cambiarDom(tipo) {
		this.ctx.oficial_cambiarDom(tipo);
	}
	function cargarDomFacturacion() {
		this.ctx.oficial_cargarDomFacturacion();
	}
	function bufferChanged(fN:String) {
		this.ctx.oficial_bufferChanged(fN);
	}
	function calculateField(fN:String) {
		return this.ctx.oficial_calculateField(fN);
	}
	function cambiarCuentaDom() {
		this.ctx.oficial_cambiarCuentaDom();
	}
	function cambiarCuentaDomRecibosEmitidos() {
		this.ctx.oficial_cambiarCuentaDomRecibosEmitidos();
	}
	function borrarCuentaDom() {
		this.ctx.oficial_borrarCuentaDom();
	}
	function establecerSubcuenta() {
		this.ctx.oficial_establecerSubcuenta();
	}
	function toolButtonInsertSub_clicked() {
		this.ctx.oficial_toolButtonInsertSub_clicked();
	}
	function toolButtonDelSub_clicked() {
		this.ctx.oficial_toolButtonDelSub_clicked();
	}
	function imprimirPresupuesto() {
		this.ctx.oficial_imprimirPresupuesto();
	}
	function imprimirPedido() {
		this.ctx.oficial_imprimirPedido();
	}
	function imprimirAlbaran() {
		this.ctx.oficial_imprimirAlbaran();
	}
	function imprimirFactura() {
		this.ctx.oficial_imprimirFactura();
	}
	function imprimirRecibo() {
		this.ctx.oficial_imprimirRecibo();
	}
	function calcularSubcuentaCli(cursor:FLSqlCursor, longSubcuenta:Number):String {
		return this.ctx.oficial_calcularSubcuentaCli(cursor, longSubcuenta);
	}
	function mostrarDesCuentaDom() {
		return this.ctx.oficial_mostrarDesCuentaDom();
	}
	function insertContacto(accion:String,codigo:String) {
		return this.ctx.oficial_insertContacto(accion,codigo);
	}
	function deleteContacto(codContacto:String, tabla:String, regAsociado:String):Boolean {
		return this.ctx.oficial_deleteContacto(codContacto, tabla, regAsociado);
	}
	function deleteContacto_clicked() {
		return this.ctx.oficial_deleteContacto_clicked();
	}
	function deleteContactoAsociado() {
		return this.ctx.oficial_deleteContactoAsociado();
	}
	function insertContactoAsociado(accion:String, codigo:String) {
		return this.ctx.oficial_insertContactoAsociado(accion, codigo);
	}
	function insertContactoAsociado_clicked() {
		return this.ctx.oficial_insertContactoAsociado_clicked();
	}
	function lanzarEdicionContacto() {
		return this.ctx.oficial_lanzarEdicionContacto();
	}
	function editarContacto(codContacto:String) {
		return this.ctx.oficial_editarContacto(codContacto);
	}
	function buscarContacto() {
		return this.ctx.oficial_buscarContacto();
	}
	function mostrarMovEjerActual(nombre:String) {
		return this.ctx.oficial_mostrarMovEjerActual(nombre);
	}
	function mostrarLibroMayor() {
		return this.ctx.oficial_mostrarLibroMayor();
	}
	function validarNifIva():Boolean {
		return this.ctx.oficial_validarNifIva();
	}
	function asociarContactoCliente() {
		return this.ctx.oficial_asociarContactoCliente();
	}
	function obtenerCodigoCliente(cursor:FLSqlCursor):String {
		return this.ctx.oficial_obtenerCodigoCliente(cursor);
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
	function pub_calcularSubcuentaCli(cursor:FLSqlCursor, longSubcuenta:Number):String {
		return this.calcularSubcuentaCli(cursor, longSubcuenta);
	}
	function pub_insertContacto(accion:String,codigo:String) {
		return this.insertContacto(accion,codigo);
	}
	function pub_deleteContacto(codContacto, tabla, regAsociado) {
		return this.deleteContacto(codContacto, tabla, regAsociado);
	}
	function pub_deleteContactoAsociado() {
		return this.deleteContactoAsociado();
	}
	function pub_insertContactoAsociado(accion:String,codigo:String) {
		return this.insertContactoAsociado(accion,codigo);
	}
	function pub_obtenerCodigoCliente(cursor:FLSqlCursor):String {
		return this.obtenerCodigoCliente(cursor);
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
/** \D En el caso de el m�dulo principal de contabilidad est� cargado, el sistema actuar� de la siguiente manera:

Al crearse un cliente se crear� autom�ticamente una subcuenta asociada, cuyo c�digo por defecto estar� formado por	c�digo de la cuenta especial de clientes + ceros de relleno para completar la longitud de subcuenta + c�digo del cliente
\end */
function interna_init()
{
/** \C En la pesta�a 'documentos' se encuentran los listados de documentos asociados al cliente. Todos estos datos se presentan en modo de solo lectura
 
Si est� cargado el m�dulo de contabilidad, se habilita la pesta�a 'contabilidad' del formulario

Cada cliente puede tener un conjunto de direcciones, de las cuales existen dos especiales. La direcci�n de facturaci�n aparecer� por defecto en los documentos de facturaci�n (albaranes, facturas, etc). La direcci�n de env�o podr� utilizarse como direcci�n de destino postal o de paqueter�a. Una misma direcci�n puede ser de los dos tipos. No podr� haber m�s de una direcci�n de facturaci�n ni de env�o.

\end */
	var util:FLUtil = new FLUtil;
	
	var cursor:FLSqlCursor = this.cursor();
	if (sys.isLoadedModule("flfacturac")) {
		this.child("tdbFacturas").setEditOnly(true);
		this.child("tdbAlbaranes").setEditOnly(true);
		this.child("tdbPedidos").setEditOnly(true);
		this.child("tdbPresupuestos").setEditOnly(true);
	}
	if (sys.isLoadedModule("flfactteso")) {
		this.child("tdbRecibos").setEditOnly(true);
	}
	
	this.iface.toolButtonInsertContacto = this.child("toolButtonInsertContacto");
	this.iface.toolButtonDeleteContacto = this.child("toolButtonDeleteContacto");
	this.iface.toolButtonDeleteContactoCliente = this.child("toolButtonDeleteContactoCliente");
	this.iface.toolButtonInsertContactoCliente = this.child("toolButtonInsertContactoCliente");
	this.iface.toolButtonBuscarContacto = this.child("toolButtonBuscarContacto");
	this.iface.toolButtonEditContacto = this.child("toolButtonEditContacto");
	this.iface.tbnMayor = this.child("tbnMayor");
	
	this.iface.toolButtonInsertSub = this.child("toolButtonInsertSub");
	this.iface.toolButtonDelSub = this.child("toolButtonDeleteSub");
	
	this.iface.ejercicioActual = flfactppal.iface.pub_ejercicioActual();
	this.iface.longSubcuenta = util.sqlSelect("ejercicios", "longsubcuenta", "codejercicio = '" + this.iface.ejercicioActual + "'");
	this.iface.posActualPuntoSubcuenta = -1;

	connect(this.child("toolButtonPrintPre"), "clicked()", this, "iface.imprimirPresupuesto()");
	connect(this.child("toolButtonPrintPed"), "clicked()", this, "iface.imprimirPedido()");
	connect(this.child("toolButtonPrintAlb"), "clicked()", this, "iface.imprimirAlbaran()");
	connect(this.child("toolButtonPrintFac"), "clicked()", this, "iface.imprimirFactura()");
	connect(this.child("toolButtonPrintRec"), "clicked()", this, "iface.imprimirRecibo()");
	
	connect(this.child("pbDomFacturacion"), "clicked()", this, "iface.cambiarDomFacturacion()");
	connect(this.child("pbDomEnvio"), "clicked()", this, "iface.cambiarDomEnvio()");
	connect(this.child("tdbDirecciones").cursor(), "cursorUpdated()", this, "iface.cargarDomFacturacion()");
	connect(this.child("pbNuevoDomFacturacion"), "clicked()", this.child("tdbDirecciones"), "insertRecord()");
	connect(cursor, "bufferChanged(QString)", this, "iface.bufferChanged");
 	
	connect(this.child("pbnCuentaDom"), "clicked()", this, "iface.cambiarCuentaDom()");
	connect(this.child("pbnBorrarCuentaDom"), "clicked()", this, "iface.borrarCuentaDom()");
	this.child("gbxCuentaDom").setDisabled(true);
	
	connect(this.iface.toolButtonEditContacto, "clicked()", this, "iface.editarContacto()");
	connect(this.iface.toolButtonInsertContacto, "clicked()", this, "iface.insertContacto()");
	connect(this.iface.toolButtonDeleteContacto, "clicked()", this, "iface.deleteContacto_clicked()");
	connect(this.iface.toolButtonDeleteContactoCliente, "clicked()", this, "iface.deleteContactoAsociado()");
	connect(this.iface.toolButtonInsertContactoCliente, "clicked()", this, "iface.insertContactoAsociado_clicked()");
	connect(this.child("toolButtonEdit"), "clicked()", this, "iface.lanzarEdicionContacto()");
	connect(this.child("toolButtonBuscarContacto"), "clicked()", this, "iface.buscarContacto()");
	connect(this.iface.tbnMayor, "clicked()", this, "iface.mostrarLibroMayor()");

	this.child("tdbContactos").cursor().setMainFilter("codcontacto IN(SELECT codcontacto FROM contactosclientes WHERE codcliente = '" + cursor.valueBuffer("codcliente") + "')");
	this.child("tdbContactos").setReadOnly(false);

	/** \D Se carga el domicilio de facturaci�n
	\end */
	this.iface.cargarDomFacturacion();

	/** \C En modo inserci�n, los campos --coddivisa--, --codpago--, --codcuentarem-- y --codserie-- toman los valores por defecto definidos para la empresa
	\end */
	if (cursor.modeAccess() == cursor.Insert) {
		cursor.setValueBuffer("coddivisa", flfactppal.iface.pub_valorDefectoEmpresa("coddivisa"));
		cursor.setValueBuffer("codpago", flfactppal.iface.pub_valorDefectoEmpresa("codpago"));
		cursor.setValueBuffer("codcuentarem", flfactppal.iface.pub_valorDefectoEmpresa("codcuentarem"));
		cursor.setValueBuffer("codserie", flfactppal.iface.pub_valorDefectoEmpresa("codserie"));
		if (sys.isLoadedModule("flcontppal"))
			this.iface.bufferChanged("codcliente");
	} else {
		this.iface.mostrarDesCuentaDom();
	}

	/** \C Si est� cargado el m�dulo de contabilidad, se habilita la pesta�a 'contabilidad' del formulario
	\end */
	if (sys.isLoadedModule("flcontppal")) {
		connect(this.child("tdbSubcuentas").cursor(), "newBuffer()", this, "iface.establecerSubcuenta()");
		connect(this.iface.toolButtonInsertSub, "clicked()", this, "iface.toolButtonInsertSub_clicked()");
		connect(this.iface.toolButtonDelSub, "clicked()", this, "iface.toolButtonDelSub_clicked()");
		this.iface.establecerSubcuenta();
		this.child("tdbPartidas").setReadOnly(true);
		this.child("tdbSubcuentas").setReadOnly(true);
	} else {
		this.child("tbwCliente").setTabEnabled("contabilidad", false);
	}
	
	/// Gesti�n documental
	if (sys.isLoadedModule("flcolagedo")) {
		var datosGD:Array;
		datosGD["txtRaiz"] = cursor.valueBuffer("codcliente") + ": " + cursor.valueBuffer("nombre");
		datosGD["tipoRaiz"] = "clientes";
		datosGD["idRaiz"] = cursor.valueBuffer("codcliente");
		flcolagedo.iface.pub_gestionDocumentalOn(this, datosGD);
	} else {
		this.child("tbwDocumentos").setTabEnabled("gesdocu", false);
	}

	if (sys.isLoadedModule("flcrm_ppal"))
		this.child("tdbContactos").cursor().setAction("crm_contactos");
	else
		this.child("tdbContactos").cursor().setAction("contactos");

	try {
		connect( this.child( "tbwCliente" ), "currentChanged(QString)", this, "iface.mostrarMovEjerActual()" );
	} catch (e) {
	}
}

/** \D Calcula un nuevo c�digo de cliente
\end */
function interna_calculateCounter()
{
	var cursor:FLSqlCursor = this.cursor();
	return this.iface.obtenerCodigoCliente(cursor);
}

function interna_validateForm():Boolean
{
	var cursor:FLSqlCursor = this.cursor();
	var util:FLUtil = new FLUtil;
	/** \C Si el cliente est� de baja, la fecha de comienzo de la baja debe estar informada
	\end */
	if (cursor.valueBuffer("debaja") && cursor.isNull("fechabaja")) {
		MessageBox.warning(util.translate("scripts", "Si el cliente est� de baja deb�1e introducir la correspondiente fecha de inicio de la baja"), MessageBox.Ok, MessageBox.NoButton)
		return false;
	}

	if (!this.iface.validarNifIva()) {
		return false;
	}

	return true;
}

//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
function oficial_obtenerCodigoCliente(cursor:FLSqlCursor):String
{
	var util:FLUtil = new FLUtil();
	return util.nextCounter("codcliente", cursor);
}

/** \D Marca el domicilio seleccionado en la lista como el de facturaci�n
\end */
function oficial_cambiarDomFacturacion()
{
		this.iface.cambiarDom("domfacturacion");
}

/** \D Marca el domicilio seleccionado en la lista como el de env�o
\end */
function oficial_cambiarDomEnvio()
{
		this.iface.cambiarDom("domenvio");
}

/** \D Marca el domicilio seleccionado en la lista como el de facturaci�n o env�o modificando la tabla de direcciones de cliente

@param tipo Tipo de direcci�n (facturaci�n o env�o)
\end */
function oficial_cambiarDom(tipo)
{
		var cursor:FLSqlCursor = this.child("tdbDirecciones").cursor();
		var cursorBorrar:FLSqlCursor = new FLSqlCursor("dirclientes");

		cursorBorrar.select("codcliente = '" + cursor.valueBuffer("codcliente") + "' AND " + tipo + " = 'true'");
		cursorBorrar.first();
		cursorBorrar.setModeAccess(cursorBorrar.Edit);
		cursorBorrar.refreshBuffer();
		cursorBorrar.setValueBuffer(tipo, "false");
		cursorBorrar.commitBuffer();

		cursor.setModeAccess(cursor.Edit);
		cursor.refreshBuffer();
		cursor.setValueBuffer(tipo, "true");
		cursor.commitBuffer();

		this.child("tdbDirecciones").refresh();

		this.iface.cargarDomFacturacion();
}

/** \D Carga el domicilio de facturaci�n desde la tabla de direcciones de clientes al campo de texto del formulario. Es llamado al inicio de la carga del formulario o cuando cambia el domicilio de facturaci�n
\end */
function oficial_cargarDomFacturacion()
{
		var label:String = this.child("lblDomFacturacion");
		var textLabel:String;
		var botonNuevo:Object = this.child("pbNuevoDomFacturacion");
		var cursor:FLSqlCursor = new FLSqlCursor("dirclientes");
		var partesDireccion:Array = ["descripcion", "direccion", "codpostal", "ciudad", "provincia", "codpais"];

		cursor.select("codcliente = '" + this.cursor().valueBuffer("codcliente") + "' AND domfacturacion = 'true'");
		if (cursor.first()) {
				botonNuevo.setEnabled(false);
				cursor.refreshBuffer();
				textLabel = "";
				for (i = 0; i < partesDireccion.length; i++) {
						if (cursor.valueBuffer(partesDireccion[i])) {
								if (i > 0)
										textLabel = textLabel + "\n";
								textLabel = textLabel + cursor.valueBuffer(partesDireccion[i]);
						}
				}
				label.setText(textLabel);
		} else {
				botonNuevo.setEnabled(true);
				label.setText("");
		}
}

function oficial_bufferChanged(fN)
{
	var cursor:FLSqlCursor = this.cursor();
	switch(fN) {
	/** \C
	Al introducir --codsubcuenta--, si el usuario pulsa la tecla "punto" (.), la subcuenta se informa automaticamente con el c�digo de cuenta m�s tantos ceros como sea necesario para completar la longitud de subcuenta asociada al ejercicio actual.
	\end */
		case "codsubcuenta": {
			if (!this.iface.bloqueoSubcuenta) {
				this.iface.bloqueoSubcuenta = true;
				this.iface.posActualPuntoSubcuenta = flcontppal.iface.pub_formatearCodSubcta(this, "fdbCodSubcuenta", this.iface.longSubcuenta, this.iface.posActualPuntoSubcuenta);
				this.iface.bloqueoSubcuenta = false;
			}
			var codSubcuenta:String = this.child("fdbCodSubcuenta").value();
			break;
		}
	/** \C
	El valor de --codsubcuenta-- en modo de inserci�n ser� 430 + el c�digo de cliente, m�s los ceros intermedios necesarios para completar la longitud de subcuenta establecida para el ejercicio actual.
	\end */
		case "codcliente": {
			if (cursor.modeAccess() == cursor.Insert) {
				this.iface.bloqueoSubcuenta = true;
				this.child("fdbCodSubcuenta").setValue(this.iface.calculateField("codsubcuenta"));
				this.iface.bloqueoSubcuenta = false;
			}
			break;
		}
		case "debaja": {
			var fecha:String = this.iface.calculateField("fechabaja");
			this.child("fdbFechaBaja").setValue(fecha);
			if (fecha == "NAN") {
				cursor.setNull("fechabaja");
			}
			break;
		}
	}
}

/** \D Gestiona los datos de contabilidad de la subcuenta asociada al cliente
\end */
function oficial_calculateField(fN:String):String
{
	var util:FLUtil = new FLUtil();
	var cursor:FLSqlCursor = this.cursor();
	var res:String;
	
	switch (fN) {
		case "codsubcuenta": {
			res = this.iface.calcularSubcuentaCli(cursor, this.iface.longSubcuenta);
			break;
		}
		case "fechabaja": {
			if (cursor.valueBuffer("debaja")) {
				var hoy:Date = new Date;
				res = hoy.toString();
			} else
				res = "NAN";
			break;
		}
	}
	return res;
}

function oficial_calcularSubcuentaCli(cursor:FLSqlCursor, longSubcuenta:Number):String
{
	var util:FLUtil = new FLUtil();
	var codSubcuenta:String = util.sqlSelect("co_cuentas", "codcuenta", "idcuentaesp = 'CLIENT' ORDER BY codcuenta");
	if (!codSubcuenta)
		return false;

	var codCliente:String = cursor.valueBuffer("codcliente");
	if (!codCliente)
		codCliente = "";
	var numCeros:Number = longSubcuenta - codSubcuenta.length - codCliente.length;
	for (var i:Number = 0; i < numCeros; i++)
		codSubcuenta += "0";

	if (codSubcuenta.length + codCliente.length > longSubcuenta)
		codCliente = codCliente.right(longSubcuenta - codSubcuenta.length);

	codSubcuenta += codCliente;
	return codSubcuenta;
}

function oficial_cambiarCuentaDom()
{
	var curCuenta:FLSqlCursor = this.child("tdbCuentas").cursor();
	var codCuentaDom = curCuenta.valueBuffer("codcuenta");
	var desCuentaDom = curCuenta.valueBuffer("descripcion");
	

	if (!codCuentaDom) return;
	
	this.cursor().setValueBuffer("codcuentadom", codCuentaDom);
	this.iface.mostrarDesCuentaDom();
	//this.child("leDescCuentaDom").text = " " + desCuentaDom;
	
	var util:FLUtil = new FLUtil;
    
	var cursor:FLSqlCursor = this.cursor();
	var codCliente:String = cursor.valueBuffer("codcliente");
	
	
	var numRecibos:String = util.sqlSelect("reciboscli", "count(*)", "estado IN ('Emitido', 'Devuelto') AND codcliente = '" + codCliente + "'");
	
    if(!numRecibos||numRecibos==0){
		var res:Number = MessageBox.information(util.translate("scripts", "Se ha establecido como cuenta de domiciliaci�n %1 para este cliente.\n").arg(desCuentaDom), MessageBox.Yes, MessageBox.NoButton);
	    return;
	}
	var res:Number = MessageBox.information(util.translate("scripts", "Se ha establecido como cuenta de domiciliaci�n %1 para este cliente.\n�Desea cambiar sus %2 recibos pendientes de pago a la nueva cuenta  de domiciliaci�n?").arg(desCuentaDom).arg(numRecibos), MessageBox.Yes, MessageBox.No);
				
	if (res != MessageBox.Yes){
		return false;
	}
  	this.iface.cambiarCuentaDomRecibosEmitidos();
}

function oficial_cambiarCuentaDomRecibosEmitidos()
{
	var qryCuenta:FLSqlQuery = new FLSqlQuery();
	var cursor:FLSqlCursor = this.cursor();
	var util:FLUtil = new FLUtil;
	
	var codCuentadom:String = cursor.valueBuffer("codcuentadom");
	qryCuenta.setTablesList("cuentasbcocli");
	qryCuenta.setSelect("codcuenta,descripcion,ctaentidad,ctaagencia,cuenta");
	qryCuenta.setFrom("cuentasbcocli");
	qryCuenta.setWhere("cuentasbcocli.codcuenta = '" + codCuentadom + "'");
	try { qryCuenta.setForwardOnly( true ); } catch (e) {}
	if (!qryCuenta.exec()){
	   return false;
	}
	var curRecibo:FLSqlCursor = new FLSqlCursor("reciboscli");
	var codCliente:String = cursor.valueBuffer("codcliente");

	curRecibo.select("estado IN ('Emitido', 'Devuelto') AND codcliente = '" + codCliente + "'");
	var valoresRecibo:String;
	if (qryCuenta.first()) {
		while(curRecibo.next()){
			curRecibo.setModeAccess(curRecibo.Edit);
			curRecibo.refreshBuffer();
			curRecibo.setValueBuffer("codcuenta", qryCuenta.value("codcuenta"));
			curRecibo.setValueBuffer("descripcion", qryCuenta.value("descripcion"));
			curRecibo.setValueBuffer("ctaentidad", qryCuenta.value("ctaentidad"));
			curRecibo.setValueBuffer("ctaagencia", qryCuenta.value("ctaagencia"));
			curRecibo.setValueBuffer("cuenta", qryCuenta.value("cuenta"));
			curRecibo.setValueBuffer("dc", formRecordreciboscli.iface.pub_commonCalculateField("dc", curRecibo));
			if (!curRecibo.commitBuffer()) {
				return false;
			}
			valoresRecibo += "Recibo: " + curRecibo.valueBuffer("codigo") + "    "+ "Importe: " + util.roundFieldValue(curRecibo.valueBuffer("importeeuros"), "reciboscli", "importe") + "    " + "Fecha: " + util.dateAMDtoDMA(curRecibo.valueBuffer("fecha")) + "\n";	
		}
	}
	MessageBox.information(util.translate("scripts", "Se han cambiado correctamente  los recibos pendientes de pago:\n \n%1 ").arg(valoresRecibo),MessageBox.Ok, MessageBox.NoButton);
}

function oficial_mostrarDesCuentaDom()
{
	var util:FLUtil = new FLUtil;
	var cursor:FLSqlCursor = this.cursor();
	var desCuentaDom:String = util.sqlSelect("cuentasbcocli", "descripcion", "codcuenta = '" + cursor.valueBuffer("codcuentadom") + "'");
	if (desCuentaDom)
		this.child("leDescCuentaDom").text = " " + desCuentaDom;
}

function oficial_borrarCuentaDom()
{
	this.cursor().setValueBuffer("codcuentadom", "");
	this.child("leDescCuentaDom").text = "";
}

/** \C Al seleccionar un registro de la tabla de subcuentas por ejercicio, la pesta�a de Contabilidad muestra los datos relativos a la subcuenta seleccionada */
function oficial_establecerSubcuenta() 
{
	if (!sys.isLoadedModule("flcontppal"))
		return false;
		
	var util:FLUtil = new FLUtil;
	var curSubcuenta:FLSqlCursor = this.child("tdbSubcuentas").cursor();

	if (!curSubcuenta.isValid())
		this.cursor().setNull("idsubcuenta");
	else 
		this.cursor().setValueBuffer("idsubcuenta", curSubcuenta.valueBuffer("idsubcuenta"));
	
	this.child("tdbPartidas").refresh();
}

/** \C Para insertar una subcuenta asociada al cliente actual, el usuario debe seleccionar el ejercicio al que ir� asociada dicha subcuenta */
function oficial_toolButtonInsertSub_clicked()
{
	var cursor:FLSqlCursor = this.cursor();
	var util:FLUtil = new FLUtil;
	
	if (cursor.modeAccess() == cursor.Insert) {
		var curSubcuentas:FLSqlCursor = this.child("tdbSubcuentas").cursor();
		curSubcuentas.setModeAccess(curSubcuentas.Insert);
		curSubcuentas.commitBufferCursorRelation();
		this.child("tdbSubcuentas").refresh();
		return;
	}
	
	var codSubcuenta:String = cursor.valueBuffer("codsubcuenta");
	if (!codSubcuenta || codSubcuenta == "") {
		MessageBox.warning(util.translate("scripts", "Especifique el c�digo de subcuenta a crear en el campo Subcuenta"), MessageBox.Ok, MessageBox.NoButton);
		return;
	}
		
	var formEjercicios:Object = new FLFormSearchDB("ejercicios");
	var curEjercicios:FLSqlCursor = formEjercicios.cursor();
	
	formEjercicios.setMainWidget();
	var codEjercicio:String = formEjercicios.exec("codejercicio");

	if (codEjercicio) {
		if (!util.sqlSelect("co_epigrafes", "idepigrafe", "codejercicio = '" + codEjercicio + "'")) {
			MessageBox.warning(util.translate("scripts", "No existe plan general contable para el ejercicio seleccionado"), MessageBox.Ok, MessageBox.NoButton);
			return;
		}
		
		var longSubcuenta:Number = util.sqlSelect("ejercicios", "longsubcuenta", "codejercicio = '" + codEjercicio + "'");
		if (!longSubcuenta || longSubcuenta != codSubcuenta.length) {
			MessageBox.warning(util.translate("scripts", "La longitud de la subcuenta no coincide con la establecida para el ejercicio seleccionado"), MessageBox.Ok, MessageBox.NoButton);
			return;
		}
		var idSubcuenta:String = flfactppal.iface.pub_crearSubcuenta(codSubcuenta, cursor.valueBuffer("nombre"), "CLIENT", codEjercicio);
		if (!idSubcuenta) {
			MessageBox.critical(util.translate("scripts", "Hubo un error al crear la subcuenta"), MessageBox.Ok, MessageBox.NoButton);
			return false;
		}
		flfactppal.iface.pub_crearSubcuentaCli(codSubcuenta, idSubcuenta, cursor.valueBuffer("codcliente"), codEjercicio);
		
		this.child("tdbSubcuentas").refresh();
	}
}

/** \D Borra la vinculaci�n cliente - subcuenta seleccionada, ofreciendo la posibilidad de borrar tambi�n la subcuenta si �sta est� vac�a 
\end */
function oficial_toolButtonDelSub_clicked()
{
	var curTablaSub:FLSqlCursor = this.child("tdbSubcuentas").cursor();
	if (!curTablaSub.isValid())
		return;
	var idSubcuenta:String = curTablaSub.valueBuffer("idsubcuenta");
		
	var util:FLUtil = new FLUtil;
	var res = MessageBox.information(util.translate("scripts", "Va a eliminar la vinculaci�n de la subcuenta seleccionada al cliente actual."), MessageBox.Ok, MessageBox.Cancel);
	if (res != MessageBox.Ok)
		return;
	
	var saldo:Number = util.sqlSelect("co_subcuentas", "saldo", "idsubcuenta = " + idSubcuenta);
	if (saldo == 0) {
		if (!util.sqlSelect("co_partidas", "idpartida", "idsubcuenta = " + idSubcuenta)) {
			if (!util.sqlSelect("co_subcuentascli", "idsubcuenta", "idsubcuenta = " + idSubcuenta + " AND codcliente <> '" + this.cursor().valueBuffer("codcliente") + "'")) {
				var res = MessageBox.information(util.translate("scripts", "La subcuenta seleccionada no contiene ninguna partida ni est� vinculada a otro cliente.\n�Desea eliminarla junto con la vinculaci�n?"), MessageBox.Yes, MessageBox.No);
				if (res == MessageBox.Yes) {
					util.sqlDelete("co_subcuentas", "idsubcuenta = " + idSubcuenta);
					this.child("tdbSubcuentas").refresh();
					this.iface.establecerSubcuenta();
					return;
				}
			}
		}
	}
	
	util.sqlDelete("co_subcuentascli", "id = " + curTablaSub.valueBuffer("id"));
	this.child("tdbSubcuentas").refresh();
	this.iface.establecerSubcuenta();
}

/** \D Imprime el presupuesto seleccionado
\end */
function oficial_imprimirPresupuesto()
{
	var codPresupuesto:String = this.child("tdbPresupuestos").cursor().valueBuffer("codigo");
	if (!codPresupuesto)
		return;
	formpresupuestoscli.iface.pub_imprimir(codPresupuesto);
}
/** \D Imprime el pedido seleccionado
\end */
function oficial_imprimirPedido()
{
	var codPedido:String = this.child("tdbPedidos").cursor().valueBuffer("codigo");
	if (!codPedido)
		return;
	formpedidoscli.iface.pub_imprimir(codPedido);
}
/** \D Imprime el albar�n seleccionado
\end */
function oficial_imprimirAlbaran()
{
	var codAlbaran:String = this.child("tdbAlbaranes").cursor().valueBuffer("codigo");
	if (!codAlbaran)
		return;
	formalbaranescli.iface.pub_imprimir(codAlbaran);
}
/** \D Imprime la factura seleccionada
\end */
function oficial_imprimirFactura()
{
	var codFactura:String = this.child("tdbFacturas").cursor().valueBuffer("codigo");
	if (!codFactura)
		return;
	formfacturascli.iface.pub_imprimir(codFactura);
}
/** \D Imprime el recibo seleccionado
\end */
function oficial_imprimirRecibo()
{
	var codRecibo:String = this.child("tdbRecibos").cursor().valueBuffer("codigo");
	if (!codRecibo)
		return;
	formreciboscli.iface.pub_imprimir(codRecibo);
}

function oficial_insertContacto(accion:String,codigo:String)
{
	var cursor:FLSqlCursor = this.cursor();
	if (cursor.modeAccess() == cursor.Insert) {
		if (!this.child("tdbDirecciones").cursor().commitBufferCursorRelation())
			return false;
	}
	if (this.iface.curContacto_) {
		delete this.iface.curContacto_;
	}
	this.iface.curContacto_ = new FLSqlCursor("crm_contactos");
	if (!sys.isLoadedModule("flcrm_ppal")) {
		this.iface.curContacto_.setAction("contactos");
	}
	connect(this.iface.curContacto_, "bufferCommited()", this, "iface.asociarContactoCliente");
	this.iface.curContacto_.insertRecord();
}

function oficial_asociarContactoCliente()
{
	var util:FLUtil = new FLUtil;
	var cursor:FLSqlCursor = this.cursor();

	var codCliente:String = cursor.valueBuffer("codcliente");
	var codContacto:String = this.iface.curContacto_.valueBuffer("codcontacto");
	if (!util.sqlSelect("contactosclientes", "id", "codcontacto = '" + codContacto + "' AND codcliente = '" + codCliente + "'")) {
		var curContactoCliente:FLSqlCursor = new FLSqlCursor("contactosclientes");
		curContactoCliente.setModeAccess(curContactoCliente.Insert);
		curContactoCliente.refreshBuffer();
		curContactoCliente.setValueBuffer("codcontacto", codContacto);
		curContactoCliente.setValueBuffer("codcliente", codCliente);
		
		if (!curContactoCliente.commitBuffer()) {
			return false;
		}
	}
	var codContactoCliente = cursor.valueBuffer("codcontacto");
	if (!codContactoCliente || codContactoCliente == "") {
		this.child("fdbCodContacto").setValue(codContacto);
	}
	this.child("tdbContactos").refresh();
}

function oficial_deleteContacto_clicked()
{
	var cursor:FLSqlCursor = this.cursor();
	var codCliente:String = cursor.valueBuffer("codcliente");

	var codContacto:String = this.child("tdbContactos").cursor().valueBuffer("codcontacto");
	if(!codContacto || codContacto == "") {
		MessageBox.information(util.translate("scripts", "No hay ning�n registro seleccionado"), MessageBox.Ok, MessageBox.NoButton);
		return;
	}
	this.iface.deleteContacto(codContacto, "clientes", codCliente);
	this.child("tdbContactos").refresh();
}

function oficial_deleteContacto(codContacto:String, tabla:String, regAsociado:String):Boolean
{
	var util:FLUtil;
	
	var whereClientes:String = "";
	var whereProveedores:String = "";
	var whereTarjetas:String = "";
	switch (tabla) {
		case "clientes": {
			whereClientes = " AND codcliente <> '" + regAsociado + "'";
			break;
		}
		case "proveedores": {
			whereProveedores = " AND codproveedor <> '" + regAsociado + "'";
			break;
		}
		case "crmtarjetas": {
			whereTarjetas = " AND codtarjeta <> '" + regAsociado + "'";
			break;
		}
	}
	var preguntar:Boolean = false;
	if (sys.isLoadedModule("flcrm_ppal")) {
		if (util.sqlSelect("crm_contactostarjetas", "codcontacto", "codcontacto = '" + codContacto + "'" + whereTarjetas)) {
			preguntar = true;		
		}
	}
	if (!preguntar && util.sqlSelect("contactosclientes", "codcontacto", "codcontacto = '" + codContacto + "'" + whereClientes)) {
		preguntar = true;		
	} else if (!preguntar && util.sqlSelect("contactosproveedores", "codcontacto", "codcontacto = '" + codContacto + "'" + whereProveedores)) {
		preguntar = true;
	}
	if (preguntar) {
	var res:String = MessageBox.information(util.translate("scripts", "El contacto seleccionado est� vinculado a otros registros. Si lo elimina se eliminar�n todas las vinculaciones. �Desea continuar?"), MessageBox.Yes, MessageBox.No);
		if (res != MessageBox.Yes) {
			return true;
		}
	} else {
		var res:String = MessageBox.information(util.translate("scripts", "El registro seleccionado ser� borrado. �Est� seguro?"), MessageBox.Yes, MessageBox.No);
		if (res != MessageBox.Yes) {
			return true;
		}
	}
	
	if (!util.sqlDelete("crm_contactos", "codcontacto = '" + codContacto + "'")) {
		return false;
	}
	return true;
}

function oficial_deleteContactoAsociado()
{
	var util:FLUtil;
	var cursor:FLSqlCursor = this.cursor();
	var codCliente:String = cursor.valueBuffer("codcliente");
	
// 	if (accion == "crm_tarjetas")
// 		f = new FLFormSearchDB("crm_editcontactotarjeta");
// 	else {

	var curContactos:FLSqlCursor = this.child("tdbContactos").cursor();
	var codContacto:String = curContactos.valueBuffer("codcontacto");
	if (!codContacto) {
		MessageBox.warning(util.translate("scripts", "No hay ning�n contacto seleccionado"), MessageBox.Ok, MessageBox.NoButton);
		return false;
	}
	var res:Number;
// 	if (accion == "crm_tarjetas")
// 		res = MessageBox.information(util.translate("scripts", "Se va a desvincular el contacto seleccionado de la tarjeta. �Est� seguro?"), MessageBox.Yes, MessageBox.No);
// 	else
	res = MessageBox.information(util.translate("scripts", "Se va a desvincular el contacto seleccionado del cliente. �Est� seguro?"), MessageBox.Yes, MessageBox.No);
	if (res != MessageBox.Yes) {
		return false;
	}
	if (!util.sqlDelete("contactosclientes", "codcontacto = '" + codContacto + "' AND codcliente = '" + codCliente + "'")) {
		return false;
	}
	this.child("tdbContactos").refresh();
}

function oficial_insertContactoAsociado(accion:String, codAsociado:String):Boolean
{
	f = new FLFormSearchDB("crm_contactos");
	f.setMainWidget();
	var codContacto:String = f.exec("codcontacto");
	if (!codContacto) {
		return false;
	}

	if (f.accepted()) {
		if (accion == "crm_tarjetas") {
			var curContactoTarjeta:FLSqlCursor = new FLSqlCursor("crm_contactostarjeta");
			curContactoTarjeta.setModeAccess(curContactoTarjeta.Insert);
			curContactoTarjeta.refreshBuffer();
			curContactoTarjeta.setValueBuffer("codcontacto", codContacto);
			curContactoTarjeta.setValueBuffer("codtarjeta", codAsociado);
			
			if (!curContactoTarjeta.commitBuffer()) {
				return false;
			}
		} else {
			var curContactoCliente:FLSqlCursor = new FLSqlCursor("contactosclientes");
			curContactoCliente.setModeAccess(curContactoCliente.Insert);
			curContactoCliente.refreshBuffer();
			curContactoCliente.setValueBuffer("codcontacto", codContacto);
			curContactoCliente.setValueBuffer("codcliente", codAsociado);
			
			if (!curContactoCliente.commitBuffer()) {
				return false;
			}
		}
	}
	return true;
}

function oficial_insertContactoAsociado_clicked()
{
	var cursor:FLSqlCursor = this.cursor();
	if (cursor.modeAccess() == cursor.Insert) {
		if (!this.child("tdbDirecciones").cursor().commitBufferCursorRelation()) {
			return false;
		}
	}
	var codCliente:String = cursor.valueBuffer("codcliente");
	this.iface.insertContactoAsociado("clientes", codCliente);
	this.child("tdbContactos").refresh();
}

function oficial_editarContacto(codContacto:String)
{
	var cursor:FLSqlCursor = this.cursor();
	if (cursor.modeAccess() == cursor.Insert) {
		if (!this.child("tdbDirecciones").cursor().commitBufferCursorRelation())
			return false;
	}

	if (this.iface.curContacto_) {
		delete this.iface.curContacto_;
	}
	this.iface.curContacto_ = new FLSqlCursor("crm_contactos");
	if (!sys.isLoadedModule("flcrm_ppal")) {
		this.iface.curContacto_.setAction("contactos");
	}

	if (!codContacto) {
		codContacto = this.child("tdbContactos").cursor().valueBuffer("codcontacto");
		if (!codContacto || codContacto == "") {
			MessageBox.information(util.translate("scripts", "No hay ning�n registro seleccionado"), MessageBox.Ok, MessageBox.NoButton);
			return;
		}
	}
	this.iface.curContacto_.select("codcontacto = '" + codContacto + "'");
	if (!this.iface.curContacto_.first()) {
		return;
	}

	connect(this.iface.curContacto_, "bufferCommited()", this, "iface.asociarContactoCliente");
	this.iface.curContacto_.editRecord();
}

function oficial_lanzarEdicionContacto()
{
	var util:FLUtil;
	var cursor:FLSqlCursor = this.cursor();

	var codContacto:String = cursor.valueBuffer("codcontacto");
	if (!codContacto || codContacto == "") {
		this.iface.insertContacto();
	} else {
		this.iface.editarContacto(codContacto);
	}
	return true;
}

function oficial_buscarContacto()
{
	var cursor:FLSqlCursor = this.cursor();
	var f:Object;
	if (sys.isLoadedModule("flcrm_ppal"))
		f = new FLFormSearchDB("crm_contactos");
	else
		f = new FLFormSearchDB("contactos");

	var codCliente:String = cursor.valueBuffer("codcliente");
	if (!codCliente) {
		return;
	}

	f.setMainWidget();
	f.cursor().setMainFilter("codcontacto IN(SELECT codcontacto FROM contactosclientes WHERE codcliente = '" + codCliente + "')");
	var codContacto:String = f.exec("codcontacto");
	if (!codContacto) {
		return;
	}

	cursor.setValueBuffer("codcontacto", codContacto);
}

function oficial_mostrarMovEjerActual(nombre:String)
{
	var cursor:FLSqlCursor = this.cursor();
	var util:FLUtil = new FLUtil();
	
	switch (nombre) {
		case "contabilidad": {
			var codEjercicioActual = flfactppal.iface.pub_ejercicioActual();
			var qrySubcuentasCli:FLSqlQuery = new FLSqlQuery;
			with (qrySubcuentasCli) {
				setTablesList("co_subcuentascli");
				setSelect("codejercicio");
				setFrom("co_subcuentascli");
				setWhere("codcliente = '" + cursor.valueBuffer("codcliente") + "' ORDER BY codejercicio");
				setForwardOnly(true);
			}
			if (!qrySubcuentasCli.exec())
				return false;
			var fila:Number = -1;
			while (qrySubcuentasCli.next()) {
				fila++;
				if (qrySubcuentasCli.value("codejercicio") == codEjercicioActual) {
					break;
				}
			}
			if (fila > -1) {
				this.child("tdbSubcuentas").setCurrentRow(fila);
			}
			break;
		}
	}
}

function oficial_mostrarLibroMayor()
{
	var util:FLUtil;
	var cursor:FLSqlCursor = this.cursor();
	var codSubcuenta:String = this.child("tdbSubcuentas").cursor().valueBuffer("codsubcuenta");
	var codEjercicio:String = this.child("tdbSubcuentas").cursor().valueBuffer("codejercicio");

	var curImprimir:FLSqlCursor = new FLSqlCursor("co_i_mayor");
	curImprimir.setModeAccess(curImprimir.Insert);
	curImprimir.refreshBuffer();
	curImprimir.setValueBuffer("descripcion", "temp");
	curImprimir.setValueBuffer("d_co__subcuentas_codsubcuenta", codSubcuenta);
	curImprimir.setValueBuffer("h_co__subcuentas_codsubcuenta", codSubcuenta);
	curImprimir.setValueBuffer("i_co__subcuentas_codejercicio", codEjercicio);

	flcontinfo.iface.pub_lanzarInforme(curImprimir, "co_i_mayor", "", "co_subcuentas.codsubcuenta, co_asientos.fecha, co_asientos.numero", "", "", curImprimir.valueBuffer("id"));
}

function oficial_validarNifIva():Boolean
{
	var util:FLUtil = new FLUtil;
	var cursor:FLSqlCursor = this.cursor();
	
	var tipoIdFiscal:String = cursor.valueBuffer("tipoidfiscal");
	if (tipoIdFiscal == "NIF/IVA") {
		var error:String = flfactppal.iface.pub_validarNifIva(cursor.valueBuffer("cifnif"));
		if (!error) {
			return false;
		} else {
			if (error != "OK") {
				MessageBox.warning(util.translate("scripts", "Error al validar el NIF/IVA:\n%1").arg(error), MessageBox.Ok, MessageBox.NoButton);
				return false;
			}
		}
	}
	return true;
}
//// OFICIAL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////

//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
