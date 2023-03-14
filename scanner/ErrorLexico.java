/*

AUTORES : 
            FRANCISCO JOSE MUÑOZ NAVARRO
            ALEJANDRO MUÑOZ NAVARRO

*/
package scanner;

public class ErrorLexico {
    private String token;
    private int linea;

    public ErrorLexico(String token, int linea) {
        this.token = token;
        this.linea = linea;
    }
    
    @Override
    public String toString(){
        return "\t - \"" + token + "\" encontrado en linea " + linea;
    }
}
