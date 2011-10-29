/***************************************************************************
                               qsaworkbench.qs
                            -------------------
   begin                : lun oct 29 2011
   email                : aullasistemas@gmail.com
***************************************************************************/
/***************************************************************************
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; version 2 of the License.               *
 ***************************************************************************/
/***************************************************************************
   Este  programa es software libre. Puede redistribuirlo y/o modificarlo
   bajo  los  t�rminos  de  la  Licencia  P�blica General de GNU   en  su
   versi�n 2, publicada  por  la  Free  Software Foundation.
 ***************************************************************************/

/** @file */

/** @class_declaration interna */
////////////////////////////////////////////////////////////////////////////
//// DECLARACION ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
class interna {
  var ctx: Object;
  function interna(context) {
    this.ctx = context;
  }
  function main() {
    this.ctx.interna_main();
  }
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {

  function oficial(context) {
    interna(context);
  }
}
//// OFICIAL /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
/** @class_declaration head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////
class head extends oficial {
  function head(context) {
    oficial(context);
  }
}
//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/** @class_declaration ifaceCtx */
/////////////////////////////////////////////////////////////////
//// INTERFACE  /////////////////////////////////////////////////
class ifaceCtx extends head {
  function ifaceCtx(context) {
    head(context);
  }
}

const iface = new ifaceCtx(this);
//// INTERFACE  /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/** @class_definition interna */
////////////////////////////////////////////////////////////////////////////
//// DEFINICION ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
function interna_main() {
  var comando = sys.installPrefix() + "/bin/linguist";
  var temporal = System.getenv("TMP");
  Process.execute([comando, temporal]);
}

//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////


//// OFICIAL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/** @class_definition head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

