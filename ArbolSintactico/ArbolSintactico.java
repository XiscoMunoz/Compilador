/*

AUTORES : 
            FRANCISCO JOSE MUÑOZ NAVARRO
            ALEJANDRO MUÑOZ NAVARRO

 */
package ArbolSintactico;

import CodigoIntermedio.CodigoTresDirecciones;
import CodigoIntermedio.Operador;

public class ArbolSintactico {

    public Init raiz;
    public static CodigoTresDirecciones ctd;

    public void setRaiz(Init raiz) {
        this.raiz = raiz;
    }

    /**
     * Metodo para generar el codigo de tres direcciones o codigo intermedio.
     *
     * @return El codigo intermedio.
     */
    public CodigoTresDirecciones GenerarCTD() {
        ctd = new CodigoTresDirecciones();
        raiz.codigoIntermedio();
        return ctd;
    }

    // Todas las operaciones binarias ordenados por orden de prioridad.
    public enum Operaciones {
        MULT, DIV, SUMA, RESTA, MAYORQUE, MENORQUE, MAYORIGU,
        MENORIGU, IGUALES, NIGUALES, OR, AND
    }

    /**
     * Nodo raiz del arbol, todos los nodos siguen una estrucctura similar.
     *
     */
    public static class Init {

        Definiciones decl; // Hijo declaraciones.
        Sentencias main; // Hijo programa principal.

        // Constructor.
        public Init(Definiciones d, Sentencias m) {
            this.decl = d;
            this.main = m;
        }

        /**
         * Metodo para generar el codigo intermedio.
         *
         * @return null.
         */
        public String codigoIntermedio() {
            if (decl != null) {
                ctd.startdeclaration();
                this.decl.codigoIntermedio();
                ctd.enddeclaracion();
            }
            this.main.codigoIntermedio();
            return null;
        }

    }

    /**
     * Nodo para el conjunto de Declaraciones del programa.
     */
    public static class Definiciones {

        public Definicion def;
        public Definiciones defs;

        public Definiciones(Definicion def, Definiciones defs) {
            this.def = def;
            this.defs = defs;
        }

        public String codigoIntermedio() {
            def.codigoIntermedio();
            if (defs != null) {
                defs.codigoIntermedio();
            }
            return null;
        }
    }

    /**
     * Nodo de una definicion del programa.
     *
     * En caso que los nodos tengan la posibilidad que una rama este vacia, este
     * contiene un indice indicando que rama se esta usando.
     */
    public static class Definicion {

        public int idx;
        public Dfuncion fun;
        public Declaracion dec;

        // Constructor en el caso que sea una funcion.
        public Definicion(Dfuncion f) {
            this.fun = f;
            this.idx = 0;
        }

        // Constructor en el caso que sea una declaracion.
        public Definicion(Declaracion f) {
            this.dec = f;
            this.idx = 1;
        }

        /**
         * La llamada al siguiente nodo se decide mediente el idx evitando asi
         * no llama a elementos no inicializados.
         *
         * @return null.
         */
        public String codigoIntermedio() {
            switch (idx) {
                case 0:
                    fun.codigoIntermedio();
                    break;
                case 1:
                    dec.codigoIntermedio();
                    break;
            }
            return null;
        }
    }

    /**
     * Nodo de una definicion de funcion.
     */
    public static class Dfuncion {

        public Id id;
        public Tipo ret;
        public Dparam dparam;
        public Sentencias sent;

        public Dfuncion(Id i, Tipo r, Dparam p, Sentencias s) {
            this.id = i;
            this.ret = r;
            this.dparam = p;
            this.sent = s;
        }

        public String codigoIntermedio() {

            // Nuevo procedimiento.
            String i = this.id.codigoIntermedio();
            ctd.newProcedimiento(i, ret);

            // Se añaden los parametros al procedimiento si hay.
            if (dparam != null) {
                ctd.newListaParametros();
                dparam.codigoIntermedio();
                ctd.newProcedimientoadd(ctd.closeListaParametros());
            }

            // Se añade el codigo la funcion al codigo de tres direcciones.
            ctd.generar(Operador.SKIP, null, null, i);
            ctd.generar(Operador.PMB, null, null, i);
            sent.codigoIntermedio(); // Bloque de sentencias. 
            ctd.generar(Operador.RTN, null, null, null);

            // Fin del procedimiento.
            ctd.closeProcedimiento();
            return null;
        }
    }

    /**
     * Nodo para la declaracion de un parametro para una funcion.
     */
    public static class Dparam {

        public Tipo tipo;
        public Id id;
        public Dparam dparam;

        public Dparam(Tipo t, Id i, Dparam d) {
            this.tipo = t;
            this.id = i;
            this.dparam = d;
        }

        public String codigoIntermedio() {
            ctd.addParametro(tipo, id.codigoIntermedio());
            if (dparam != null) {
                dparam.codigoIntermedio();
            }

            return null;
        }
    }

    /**
     * Nodo para el retorno de un valor por parte de la funcion.
     */
    public static class Return {

        public Expresion expr;

        public Return(Expresion e) {
            this.expr = e;
        }

        public String codigoIntermedio() {
            String v = expr.codigoIntermedio(null);
            ctd.generar(Operador.RTN, null, null, v);
            return null;
        }
    }

    /**
     * Nodo para el conjunto de sentencias.
     */
    public static class Sentencias {

        public Sentencia sentencia;
        public Sentencias sentencias;

        public Sentencias(Sentencia s, Sentencias ss) {
            this.sentencia = s;
            this.sentencias = ss;
        }

        public String codigoIntermedio() {
            sentencia.codigoIntermedio();
            if (sentencias != null) {
                sentencias.codigoIntermedio();
            }
            return null;
        }
    }

    /**
     * Nodo para una sentencia en contreto.
     */
    public static class Sentencia {

        public int idx;
        public Return ret;
        public Declaracion dec;
        public Out out;
        public IdSentencia ids;
        public While whi;
        public DoWhile doWhile;
        public If sif;

        public Sentencia(Return e) {
            this.ret = e;
            this.idx = 0;
        }

        public Sentencia(Declaracion e) {
            this.dec = e;
            this.idx = 1;
        }

        public Sentencia(Out e) {
            this.out = e;
            this.idx = 2;
        }

        public Sentencia(IdSentencia e) {
            this.ids = e;
            this.idx = 3;
        }

        public Sentencia(While e) {
            this.whi = e;
            this.idx = 4;
        }

        public Sentencia(DoWhile e) {
            this.doWhile = e;
            this.idx = 6;
        }

        public Sentencia(If e) {
            this.sif = e;
            this.idx = 5;
        }

        public String codigoIntermedio() {
            switch (idx) {
                case 0:
                    return ret.codigoIntermedio();
                case 1:
                    return dec.codigoIntermedio();
                case 2:
                    return out.codigoIntermedio();
                case 3:
                    return ids.codigoIntermedio();
                case 4:
                    return whi.codigoIntermedio();
                case 5:
                    return sif.codigoIntermedio();
                case 6:
                    return doWhile.codigoIntermedio();
            }
            return null;
        }
    }

    /**
     * Nodo para una declaracion del programa.
     */
    public static class Declaracion {

        public Tipo tipo;
        public Id id;
        public Expresion expr;
        public Numero n;

        public Declaracion(Tipo t, Id i, Expresion d) {
            this.tipo = t;
            this.id = i;
            this.expr = d;
        }

        public Declaracion(Tipo tipo, Numero n, Id id, Expresion expr) {
            this.tipo = tipo;
            this.n = n;
            this.id = id;
            this.expr = expr;
        }

        public String codigoIntermedio() {
            //String op2 = "";
            String nom = "";
            //if (n != null) {
            //op2 = n.toString();
            nom = ctd.newVariable(tipo, id.codigoIntermedio());
            //nom = ctd.newVariable2(tipo, id.codigoIntermedio(), op2);
            //} else {
            //  nom = ctd.newVariable(tipo, id.codigoIntermedio());
            // }

            if (expr != null) {
                String e = expr.codigoIntermedio(id.codigoIntermedio());
                if (n == null) {
                    ctd.generar(Operador.ASIG, e, null, nom);
                }

            }
            return null;
        }
    }

    /**
     * Nodo para la operacion de salida por pantalla.
     */
    public static class Out {

        public Expresion expr;

        public Out(Expresion e) {
            this.expr = e;
        }

        public String codigoIntermedio() {
            String dest = expr.codigoIntermedio(null);
            ctd.generar(Operador.OUT, dest, null, null);
            return null;
        }
    }

    /**
     * Nodo para la operacion de entrada por teclado.
     */
    public static class In {

        public In() {
        }

        public String codigoIntermedio() {
            String dest = ctd.newVariable(Tipo.INT, null);
            ctd.generar(Operador.IN, null, null, dest);
            return dest;
        }
    }

    /**
     * Nodo para el uso de una sentencia con ID.
     */
    public static class IdSentencia {

        public SentenciaId sid;
        public Id id;

        public IdSentencia(Id i, SentenciaId e) {
            this.sid = e;
            this.id = i;
        }

        public String codigoIntermedio() {
            String i = this.id.codigoIntermedio();
            String e = sid.codigoIntermedio(i);

            // Si es null, i es una funcion sino devuelve una variable temporal.
            if (e == null) {
                Tipo t = ctd.getReturnProcedimiento(i);
                if (t != null) {
                    String v = ctd.newVariable(t, null);
                    ctd.generar(Operador.CALL, v, null, i);
                    return v;
                } else {
                    ctd.generar(Operador.CALL, null, null, i);
                    return null;
                }
            } else {
                if (sid.getIdx() != 2) {
                    ctd.generar(Operador.ASIG, e, null, ctd.getVarName(i));
                }
                return null;
            }
        }
    }

    public static class TuplaPos {

        public Numero n;
        public Expresion asg;

        public TuplaPos(Numero n, Expresion asg) {
            this.n = n;
            this.asg = asg;
        }

        private String codigoIntermedio(String nombreArray) {

            String op1 = asg.codigoIntermedio("");
            String dest = "T$" + ctd.getVarName(nombreArray) + "$" + n.getElem();
            ctd.generar(Operador.ASIG, op1, null, ctd.getVarName(dest));
            return "";
        }

    }

    /**
     * Nodo para el uso de una sentencia con ID siendo este o bien los
     * parametros o la expresion a asignar al id.
     */
    public static class SentenciaId {

        public Param par;
        public Expresion expr;
        public int idx;
        public TuplaPos tp;

        public int getIdx() {
            return idx;
        }

        public SentenciaId(Param f) {
            this.par = f;
            idx = 0;
        }

        public SentenciaId(Expresion e) {
            this.expr = e;
            idx = 1;
        }

        public SentenciaId(TuplaPos tp) {
            this.tp = tp;
            this.idx = 2;
        }

        public String codigoIntermedio(String nombreArray) {
            switch (idx) {
                case 0:
                    if (par != null) {
                        return par.codigoIntermedio();
                    } else {
                        return null;
                    }
                case 1:
                    return expr.codigoIntermedio(null);

                default:

                    return tp.codigoIntermedio(nombreArray);
            }
        }
    }

    /**
     * Nodo que definie un bucle en el programa.
     */
    public static class While {

        public Expresion cond;
        public Sentencias sent;

        public While(Expresion e, Sentencias s) {
            this.cond = e;
            this.sent = s;
        }

        public String codigoIntermedio() {
            String e1 = ctd.newEtiqueta();
            ctd.generar(Operador.SKIP, null, null, e1);

            // Condicion a seguir en el bucle.
            String c = cond.codigoIntermedio(null);
            String e2 = ctd.newEtiqueta();
            String e3 = ctd.newEtiqueta();
            ctd.generar(Operador.IGUALES, c, Integer.toString(-1), e2);
            ctd.generar(Operador.GOTO, null, null, e3);
            ctd.generar(Operador.SKIP, null, null, e2);

            // Sentencias dentro del bucle.
            sent.codigoIntermedio();

            // Salto para comprobar la condicion.
            ctd.generar(Operador.GOTO, null, null, e1);
            ctd.generar(Operador.SKIP, null, null, e3);
            return null;
        }
    }

    /**
     * Nodo que definie un bucle en el programa.
     */
    public static class DoWhile {

        public Expresion cond;
        public Sentencias sent;

        public DoWhile(Expresion e, Sentencias s) {
            this.cond = e;
            this.sent = s;
        }

        public String codigoIntermedio() {

            String e1 = ctd.newEtiqueta();
            ctd.generar(Operador.SKIP, null, null, e1);
            sent.codigoIntermedio();
            // Condicion a seguir en el bucle.
            String c = cond.codigoIntermedio(null);
            String e2 = ctd.newEtiqueta();

            ctd.generar(Operador.IGUALES, c, Integer.toString(-1), e1);

            /*  ctd.generar(Operador.GOTO, null, null, e2);
            ctd.generar(Operador.SKIP, null, null, e2);*/
            //Comprobar con un subprograma o cun un bucle dentro de otro
            return null;
        }
    }

    /**
     * Nodo que define un salto con condicion del programa.
     */
    public static class If {

        public Expresion cond;
        public Sentencias sent;

        public If(Expresion e, Sentencias s) {
            this.cond = e;
            this.sent = s;
        }

        public String codigoIntermedio() {

            // Condicion a para hacer el el contenido del if.
            String c = cond.codigoIntermedio(null);
            String e1 = ctd.newEtiqueta();
            String e2 = ctd.newEtiqueta();
            ctd.generar(Operador.IGUALES, c, Integer.toString(-1), e1);
            ctd.generar(Operador.GOTO, null, null, e2);
            ctd.generar(Operador.SKIP, null, null, e1);

            // Sentencias dentro del if.
            sent.codigoIntermedio();
            ctd.generar(Operador.SKIP, null, null, e2);
            return null;
        }
    }

    /**
     * Nodo para la introduccion de un parametro en la llamada de una funcion.
     */
    public static class Param {

        public Expresion expr;
        public Param param;

        public Param(Expresion e, Param p) {
            this.expr = e;
            this.param = p;
        }

        public String codigoIntermedio() {
            String e = expr.codigoIntermedio(null);
            ctd.generar(Operador.PARAM, null, null, e);
            if (param != null) {
                param.codigoIntermedio();
            }
            return null;
        }
    }

    public static class TuplaExp {

        public TuplaExp te;
        public TuplaTipo tt;

        public TuplaExp(TuplaTipo p, TuplaExp te) {
            this.tt = p;
            this.te = te;
        }

        public void codigoIntermedio(String nombre, int i) {
            int aux = i + 1;
            if (te != null) {

                te.codigoIntermedio(nombre, aux);
            }
            // String op1 = v.codigoIntermedio();
            String indice = Integer.toString(i);
            String dest = "T$" + ctd.getVarName(nombre) + "$" + indice;
            if (tt.getP() == null) {
                if (tt.getN() == null) {
                    ctd.newVariable(Tipo.BOOLEAN, dest);
                } else {
                    ctd.newVariable(Tipo.INT, dest);
                }
                
            }else{
            ctd.newVariable(tt.getP(), dest);
            }

            if (tt.getN() != null) {
                String op1 = tt.getN().codigoIntermedio();
                ctd.generar(Operador.ASIG, op1, null, ctd.getVarName(dest));
            }else{
            if (tt.getB() != null) {
                String op1 = tt.getB().codigoIntermedio();
                ctd.generar(Operador.ASIG, op1, null, ctd.getVarName(dest));
            }
            }

        }
    }

    public static class TuplaTipo {

        public Numero n;
        public Boleano b;
        public Tipo p;

        public TuplaTipo(Numero n) {
            this.n = n;
        }

        public TuplaTipo(Boleano b) {
            this.b = b;
        }

        public TuplaTipo(Tipo p) {
            this.p = p;
        }

        public Numero getN() {
            return n;
        }

        public Boleano getB() {
            return b;
        }

        public Tipo getP() {
            return p;
        }

    }

    /**
     * Nodo para la ejecucion de una expresion.
     */
    public static class Expresion {

        public int idx;
        public Valor v;
        public Expresion e;
        public Operacion oper;
        public TuplaExp te;

        public TuplaExp getTe() {
            return te;
        }

        public Expresion(TuplaExp te) {
            this.te = te;
        }

        public Expresion(Valor v, Operacion oper) {
            this.v = v;
            this.oper = oper;
            this.idx = 0;
        }

        public Expresion(Expresion e, Operacion oper) {
            this.e = e;
            this.oper = oper;
            this.idx = 1;
        }

        public Operacion getOper() {
            return oper;
        }

        public void setOper(Operacion oper) {
            this.oper = oper;
        }

        public boolean isExpr() {
            return idx == 1;
        }

        public Expresion getExpr() {
            return e;
        }

        public String codigoIntermedio(String nombreTupla) {
            if (te == null) {
                String op1 = null;

                // Realiza el codigo intermedio del op1 este puede ser un valor o una expresion.
                switch (idx) {
                    case 0:
                        op1 = v.codigoIntermedio();
                        break;
                    case 1:
                        op1 = e.codigoIntermedio(null);
                        break;
                }

                // Si oper es null a acabado la expresion por lo que devuelve op1.
                if (oper != null) {
                    Operador op = ctd.traductorOperacion(oper.getOper());

                    // Realiza el codigo intermedio del op2.
                    String op2 = oper.codigoIntermedio();

                    // Si es una operacion boleana esta realiza una asignacion y devuelve el valor.
                    if (ctd.getTipoOperacion(op) == Tipo.BOOLEAN) {
                        String dest = ctd.newVariable(Tipo.BOOLEAN, null);
                        String e1 = ctd.newEtiqueta();
                        String e2 = ctd.newEtiqueta();
                        String e3 = ctd.newEtiqueta();
                        ctd.generar(op, op1, op2, e1);
                        ctd.generar(Operador.GOTO, null, null, e2);
                        ctd.generar(Operador.SKIP, null, null, e1);
                        ctd.generar(Operador.ASIG, Integer.toString(-1), null, dest);
                        ctd.generar(Operador.GOTO, null, null, e3);
                        ctd.generar(Operador.SKIP, null, null, e2);
                        ctd.generar(Operador.ASIG, Integer.toString(0), null, dest);
                        ctd.generar(Operador.SKIP, null, null, e3);
                        return dest;
                    } else {
                        String dest = ctd.newVariable(Tipo.INT, null);
                        ctd.generar(op, op1, op2, ctd.getVarName(dest));
                        return dest;
                    }
                }
                return op1;
            } else {
                te.codigoIntermedio(nombreTupla, 0);
                return "";
            }

        }
    }

    /**
     * Nodo que define la operacion y con que expresion.
     */
    public static class Operacion {

        public Operaciones oper;
        public Expresion expr;

        public Operacion(Operaciones o, Expresion e) {
            this.oper = o;
            this.expr = e;
        }

        public Operaciones getOper() {
            return oper;
        }

        public Expresion getExpr() {
            return expr;
        }

        public void setExpr(Expresion expr) {
            this.expr = expr;
        }

        public String codigoIntermedio() {
            return expr.codigoIntermedio(null);
        }
    }

    /**
     * Nodo que define un valor de la expresion.
     */
    public static class Valor {

        public int idx;
        public Numero num;
        public Id id;
        public Boleano bol;
        public In in;
        public IdSentencia fun;
        public String value;

        public Valor(Numero e) {
            this.num = e;
            this.idx = 0;
            this.value = String.valueOf(num.getElem());
        }

        public Valor(Id i) {
            this.id = i;
            this.idx = 1;
            this.value = i.getElem();
        }

        public Valor(Boleano b) {
            this.bol = b;
            this.idx = 2;
        }

        public Valor(In in) {
            this.in = in;
            this.idx = 3;
        }

        public Valor(IdSentencia f) {
            this.fun = f;
            this.idx = 4;
        }

        public Valor(Id i, Numero n) {
            this.id = i;
            this.num = n;
            this.idx = 5;
        }

        public String getValue() {
            return value;
        }

        public int getIdx() {
            return idx;
        }

        public String codigoIntermedio() {
            switch (idx) {
                case 0:
                    return num.codigoIntermedio();
                case 1:
                    return ctd.getVarName(id.codigoIntermedio());
                case 2:
                    return bol.codigoIntermedio();
                case 3:
                    return in.codigoIntermedio();
                case 4:
                    return fun.codigoIntermedio();
                case 5:
                    String nameId = ctd.getVarName(id.codigoIntermedio());
                    String nombre = "T$" + nameId + "$" + num.getElem();
                    String nombreVar = ctd.getVarName(nombre);
                    return nombreVar;

            }
            return null;
        }
    }

    /**
     * Nodo que define un Numero.
     */
    public static class Numero {

        public int elem;

        public int getElem() {
            return elem;
        }

        public Numero(String elem) {
            this.elem = Integer.parseInt(elem);
        }

        public String codigoIntermedio() {
            String v = ctd.newVariable(Tipo.INT, null);
            ctd.generar(Operador.ASIG, Integer.toString(elem), null, v);
            return v;
        }

        @Override
        public String toString() {
            return Integer.toString(elem);
        }

    }

    /**
     * Nodo que define un Boleano.
     */
    public static class Boleano {

        public boolean elem;

        public Boleano(String elem) {
            this.elem = Boolean.parseBoolean(elem);
        }

        public String codigoIntermedio() {
            String v = ctd.newVariable(Tipo.BOOLEAN, null);
            ctd.generar(Operador.ASIG, Boolean.toString(elem), null, v);
            return v;
        }
    }

    /**
     * Nodo que define un ID.
     */
    public static class Id {

        public String elem;

        public String getElem() {
            return elem;
        }

        public Id(String elem) {
            this.elem = elem;
        }

        public String codigoIntermedio() {
            return elem;
        }
    }
}
