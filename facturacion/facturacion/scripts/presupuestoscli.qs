/***************************************************************************
                 presupuestoscli.qs  -  description
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
////////////////////////////////////////////////////////////////////////////
//// DECLARACION ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

/** @class_declaration interna */
//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
class interna {
    var ctx:Object;
    function interna( context ) { this.ctx = context; }
    function init() {
		this.ctx.interna_init();
	}
	function calculateField(fN:String):String {
		return this.ctx.interna_calculateField(fN);
	}
	function validateForm():Boolean {
		return this.ctx.interna_validateForm();
	}
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {
	var bloqueoProvincia:Boolean;
	var pbnAplicarComision:Object;
    function oficial( context ) { interna( context ); } 
	function inicializarControles() {
		return this.ctx.oficial_inicializarControles();
	}
	function bufferChanged(fN:String) {
		return this.ctx.oficial_bufferChanged(fN);
	}
	function calcularTotales() {
		return this.ctx.oficial_calcularTotales();
	}
	function verificarHabilitaciones() {
		return this.ctx.oficial_verificarHabilitaciones();
	}
	function mostrarTraza() {
		return this.ctx.oficial_mostrarTraza();
	}
	function datosDefectoCRM() {
		return this.ctx.oficial_datosDefectoCRM();
	}
	function copiarDatosCliente(curTarjeta:FLSqlCursor) {
		return this.ctx.oficial_copiarDatosCliente(curTarjeta);
	}
	function aplicarComision_clicked() {
		return this.ctx.oficial_aplicarComision_clicked();
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

////////////////////////////////////////////////////////////////////////////
//// DEFINICION ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

/** @class_definition interna */
//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
/** \C
Este formulario realiza la gesti�n de los pedidos a clientes.

Los pedidos pueden ser generados de forma manual o a partir de un presupuesto previo.
\end */
function interna_init()
{
	var util:FLUtil = new FLUtil();
	var cursor:FLSqlCursor = this.cursor();

	this.iface.bloqueoProvincia = false;
	this.iface.pbnAplicarComision = this.child("pbnAplicarComision");

    connect(this.iface.pbnAplicarComision, "clicked()", this, "iface.aplicarComision_clicked()");
	connect(cursor, "bufferChanged(QString)", this, "iface.bufferChanged");
	connect(this.child("tdbLineasPresupuestosCli").cursor(), "bufferCommited()", this, "iface.calcularTotales()");
	connect(this.child("tbnTraza"), "clicked()", this, "iface.mostrarTraza()");

	this.iface.pbnAplicarComision.setDisabled(true);

	if (cursor.modeAccess() == cursor.Insert) {
		this.child("fdbCodEjercicio").setValue(flfactppal.iface.pub_ejercicioActual());
		this.child("fdbCodDivisa").setValue(flfactppal.iface.pub_valorDefectoEmpresa("coddivisa"));
		this.child("fdbCodPago").setValue(flfactppal.iface.pub_valorDefectoEmpresa("codpago"));
		this.child("fdbCodAlmacen").setValue(flfactppal.iface.pub_valorDefectoEmpresa("codalmacen"));
		this.child("fdbCodSerie").setValue(flfactppal.iface.pub_valorDefectoEmpresa("codserie"));
		this.child("fdbTasaConv").setValue(util.sqlSelect("divisas", "tasaconv", "coddivisa = '" + this.child("fdbCodDivisa").value() + "'"));
	}
	if (cursor.modeAccess() == cursor.Edit)
		this.child("fdbCodSerie").setDisabled(true);

	if (!cursor.valueBuffer("porcomision"))
		this.child("fdbPorComision").setDisabled(true);

	if (sys.isLoadedModule("flcrm_ppal")) {
		var curRel:FLSqlCursor = cursor.cursorRelation();
		if (curRel && curRel.action() == "crm_oportunidadventa") {
			
			this.child("fdbCodCliente").setValue(curRel.valueBuffer("codcliente"));
			var curTarjeta:FLSqlCursor = curRel.cursorRelation();
			var codCliente:String = curRel.valueBuffer("codcliente");
			
			if (!codCliente || codCliente == "") {
				var codTarjeta:String = "";
				var vieneDeTarjeta:Boolean = false;
				if (!curTarjeta || curTarjeta.action() != "crm_tarjetas") {
					codTarjeta = curRel.valueBuffer("codtarjeta");
					
					if(codTarjeta && codTarjeta != "") {
						curTarjeta = new FLSqlCursor("crm_tarjetas");
						curTarjeta.select("codtarjeta = '" + codTarjeta + "'");
						
						if(curTarjeta.first()) {
							curTarjeta.refreshBuffer();
							vieneDeTarjeta = true
						}
					}
				}
				if (vieneDeTarjeta)
					this.iface.copiarDatosCliente(curTarjeta);
			}
		}
		if (cursor.modeAccess() == cursor.Insert)
			this.iface.datosDefectoCRM();
	} else {
		this.child("tbwPresupuesto").setTabEnabled("crm", false);
	}

	this.iface.inicializarControles();
}

/** \U
Los valores de los campos de este formulario se calculan en el script asociado al formulario maestro
\end */
function interna_calculateField(fN:String):String
{
	return formpresupuestoscli.iface.pub_commonCalculateField(fN, this.cursor());
}

function interna_validateForm():Boolean
{
	var cursor:FLSqlCursor = this.cursor();	

	if (!flfactppal.iface.pub_validarProvincia(cursor)) {
		return false;
	}

	var idPresupuesto = cursor.valueBuffer("idpresupuesto");
	var codCliente = this.child("fdbCodCliente").value();
	if (!flfacturac.iface.pub_validarIvaRecargoCliente(codCliente, idPresupuesto, "lineaspresupuestoscli", "idpresupuesto")) {
		return false;
	}

	return true;
}
//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
function oficial_inicializarControles()
{
		this.child("lblRecFinanciero").setText(this.iface.calculateField("lblRecFinanciero"));
		this.child("lblComision").setText(this.iface.calculateField("lblComision"));
		this.iface.verificarHabilitaciones();
}

function oficial_bufferChanged(fN:String)
{
	var cursor:FLSqlCursor = this.cursor();
	switch (fN) {
		case "recfinanciero":
		case "neto": {
			this.child("lblRecFinanciero").setText(this.iface.calculateField("lblRecFinanciero"));
			this.child("fdbTotaIrpf").setValue(this.iface.calculateField("totalirpf"));
		}
		/** \C
		El --total-- es el --neto-- menos el --totalirpf-- m�s el --totaliva-- m�s el --totalrecargo-- m�s el --recfinanciero--
		\end */
		case "totalrecargo":
		case "totalirpf":
		case "totaliva":{
			var total:String = this.iface.calculateField("total");
			this.child("fdbTotal").setValue(total);
			break;
		}
		/** \C
		El --totaleuros-- es el producto del --total-- por la --tasaconv--
		\end */
		case "total": {
			this.child("fdbTotalEuros").setValue(this.iface.calculateField("totaleuros"));
			this.child("lblComision").setText(this.iface.calculateField("lblComision"));
			break;
		}
		case "tasaconv": {
			this.child("fdbTotalEuros").setValue(this.iface.calculateField("totaleuros"));
			break;
		}
		case "porcomision":{
			this.child("lblComision").setText(this.iface.calculateField("lblComision"));
			break;
		}
		/** \C
		El valor de --coddir-- por defecto corresponde a la direcci�n del cliente marcada como direcci�n de facturaci�n
		\end */
		case "codcliente": {
			this.child("fdbCodDir").setValue("0");
			this.child("fdbCodDir").setValue(this.iface.calculateField("coddir"));
			break;
		}
		/** \C
		El --irpf-- es el asociado a la --codserie-- del albar�n
		\end */
		case "codserie": {
			this.cursor().setValueBuffer("irpf", this.iface.calculateField("irpf"));
			break;
		}
		/** \C
		El --totalirpf-- es el producto del --irpf-- por el --neto--
		\end */
		case "irpf": {
			this.child("fdbTotaIrpf").setValue(this.iface.calculateField("totalirpf"));
			break;
		}
		case "provincia": {
			if (!this.iface.bloqueoProvincia) {
				this.iface.bloqueoProvincia = true;
				flfactppal.iface.pub_obtenerProvincia(this);
				this.iface.bloqueoProvincia = false;
			}
			break;
		}
		case "idprovincia": {
			if (cursor.valueBuffer("idprovincia") == 0)
				cursor.setNull("idprovincia");
			break;
		}
		case "coddir": {
			this.child("fdbProvincia").setValue(this.iface.calculateField("provincia"));
			this.child("fdbCodPais").setValue(this.iface.calculateField("codpais"));
			break;
		}
		case "codagente": {
			this.iface.pbnAplicarComision.setDisabled(false);
			break;
		}
	}
}

/** \U
Calcula los campos que son resultado de una suma de las l�neas de pedido
\end */
function oficial_calcularTotales()
{
	this.child("fdbNeto").setValue(this.iface.calculateField("neto"));
	this.child("fdbTotalIva").setValue(this.iface.calculateField("totaliva"));
	this.child("fdbTotalRecargo").setValue(this.iface.calculateField("totalrecargo"));
	this.child("fdbTotaIrpf").setValue(this.iface.calculateField("totalirpf"));
	this.child("lblComision").setText(this.iface.calculateField("lblComision"));
	this.iface.verificarHabilitaciones();
}

/** \U
Verifica que los campos --codalmacen--, --coddivisa-- y ..tasaconv-- est�n habilitados en caso de que el pedido no tenga l�neas asociadas.
\end */
function oficial_verificarHabilitaciones()
{
	var util:FLUtil = new FLUtil();
	var idPresupuesto:Number = util.sqlSelect("lineaspresupuestoscli", "idpresupuesto", "idpresupuesto = " + this.cursor().valueBuffer("idpresupuesto"));
	if (!idPresupuesto) {
		this.child("fdbCodAlmacen").setDisabled(false);
		this.child("fdbCodDivisa").setDisabled(false);
		this.child("fdbTasaConv").setDisabled(false);
	} else {
		this.child("fdbCodAlmacen").setDisabled(true);
		this.child("fdbCodDivisa").setDisabled(true);
		this.child("fdbTasaConv").setDisabled(true);
	}
}

function oficial_mostrarTraza()
{
	flfacturac.iface.pub_mostrarTraza(this.cursor().valueBuffer("codigo"), "presupuestoscli");
}

/** \C Introduce los datos de un cliente o tarjeta en el caso de que el presupuesto se est� creando desde el formulario de edici�n de oportunidades de venta del m�dulo de CRM
\end */
function oficial_datosDefectoCRM()
{
	var cursor:FLSqlCursor = this.cursor();
	var curRel:FLSqlCursor = cursor.cursorRelation();

	if (!curRel)
		return;
	if (curRel.table() != "crm_oportunidadventa")
		return;

	var codCliente:String = curRel.valueBuffer("codcliente");
	if (codCliente && codCliente != "") {
		this.child("fdbCodCliente").setValue(codCliente);
		return;
	}

	var codTarjeta:String = curRel.valueBuffer("codtarjeta");
	if (codTarjeta && codTarjeta != "") {
		var qryTarjeta:FLSqlQuery = new FLSqlQuery;
		with (qryTarjeta) {
			setTablesList("crm_tarjetas");
			setSelect("nombre, codcliente, cifnif, coddir, direccion, ciudad, codpostal, provincia, codpais");
			setFrom("crm_tarjetas");
			setWhere("codtarjeta = '" + codTarjeta + "'");
			setForwardOnly(true);
		}
		if (!qryTarjeta.exec())
			return false;
		if (!qryTarjeta.first())
			return false;

		this.child("fdbCodCliente").setValue(qryTarjeta.value("codcliente"));
		this.child("fdbNombreCliente").setValue(qryTarjeta.value("nombre"));
		this.child("fdbCifNif").setValue(qryTarjeta.value("cifnif"));
		var codDir:Number = parseFloat(qryTarjeta.value("coddir"))
		if (codDir && codDir != 0)
			this.child("fdbCodDir").setValue(codDir);
		this.child("fdbDireccion").setValue(qryTarjeta.value("direccion"));
		this.child("fdbCiudad").setValue(qryTarjeta.value("ciudad"));
		this.child("fdbCodPostal").setValue(qryTarjeta.value("codpostal"));
		this.child("fdbProvincia").setValue(qryTarjeta.value("provincia"));
		this.child("fdbCodPais").setValue(qryTarjeta.value("codpais"));
	}
}

function oficial_copiarDatosCliente(curTarjeta:FLSqlCursor)
{
	this.child("fdbNombreCliente").setValue(curTarjeta.valueBuffer("nombre"));
	this.child("fdbCifNif").setValue(curTarjeta.valueBuffer("cifnif"));
	this.child("fdbCodDir").setValue(curTarjeta.valueBuffer("coddir"));
	this.child("fdbDireccion").setValue(curTarjeta.valueBuffer("direccion"));
	this.child("fdbCiudad").setValue(curTarjeta.valueBuffer("ciudad"));
	this.child("fdbProvincia").setValue(curTarjeta.valueBuffer("provincia"));
	this.child("fdbCodPostal").setValue(curTarjeta.valueBuffer("codpostal"));
	this.child("fdbCodPais").setValue(curTarjeta.valueBuffer("codpais"));
	this.child("fdbIdProvincia").setValue(curTarjeta.valueBuffer("idprovincia"));
}

function oficial_aplicarComision_clicked()
{
	var util:FLUtil;
	
	var idPresupuesto:Number = this.cursor().valueBuffer("idpresupuesto");
	if(!idPresupuesto)
		return;
	var codAgente:String = this.cursor().valueBuffer("codagente");
	if(!codAgente || codAgente == "")
		return;

	var res:Number = MessageBox.information(util.translate("scripts", "�Seguro que desea actualizar la comisi�n en todas las l�neas?"), MessageBox.Yes, MessageBox.No);
	if(res != MessageBox.Yes)
		return;

	var cursor:FLSqlCursor = new FLSqlCursor("empresa");
	cursor.transaction(false);

	try {
		if(!flfacturac.iface.pub_aplicarComisionLineas(codAgente,"lineaspresupuestoscli","idpresupuesto = " + idPresupuesto)) {
			cursor.rollback();
			return;
		}
		else {
			cursor.commit();
		}
	} catch (e) {
		MessageBox.critical(util.translate("scripts", "Hubo un error al aplicarse la comisi�n en las l�neas.\n%1").arg(e), MessageBox.Ok, MessageBox.NoButton);
		cursor.rollback();
		return false;
	}

	MessageBox.information(util.translate("scripts", "La comisi�n se actualiz� correctamente."), MessageBox.Ok, MessageBox.NoButton);

	this.iface.pbnAplicarComision.setDisabled(true);
	this.child("tdbLineasPresupuestosCli").refresh()
}
//// OFICIAL/////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition head */
//////////////////////////////////////////////////////////////////
//// DESARROLLO //////////////////////////////////////////////////

//// DESARROLLO //////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
