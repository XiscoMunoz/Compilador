/*

AUTORES : 
            FRANCISCO JOSE MUÑOZ NAVARRO
            ALEJANDRO MUÑOZ NAVARRO

*/
package CodigoIntermedio;

import ArbolSintactico.Tipo;


public class Variable {

    String id;
    Tipo tipo;
    int procedimiento;
    boolean temporal;
    
    public Variable(String id, Tipo tipo, int procedimiento, boolean temporal) {
        this.id = id;
        this.tipo = tipo;
        this.procedimiento = procedimiento;
        this.temporal = temporal;
    }
    
  
    
    public String getID(){
        return id;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public int getProcedimiento() {
        return procedimiento;
    }

    public void setProcedimiento(int procedimiento) {
        this.procedimiento = procedimiento;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isTemporal() {
        return temporal;
    }

    public void setTemporal(boolean temporal) {
        this.temporal = temporal;
    }

  
    @Override
    public String toString(){
        return id + " " + tipo + " " + procedimiento;
    }
    
}
