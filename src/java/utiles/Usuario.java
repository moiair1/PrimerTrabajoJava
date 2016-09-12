/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



/**
 *
 * @author universidad
 */
public class Usuario implements Serializable{

    private Integer id;
    private String nombre;

    private Usuario( Integer id, String nombre ) {
        setId(id);
        setNombre(nombre);
    }

    public Integer getId(){
        return id;
    }

    private void setNombre(String usr) {
        nombre = usr;
    }
    public String getNombre() {
        return nombre; 
    }
    
    public static Usuario getUsuario(String user, String password){
        Usuario usr = null;
        Connection conn = null;
        try {
            InitialContext initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/clientes_db");
            conn = ds.getConnection();
            
            String sql = "SELECT usuario.id, usuario.nombre FROM usuario.usuario WHERE usuario.nombre LIKE ? AND usuario.contrasenia = SHA1( ? ) AND usuario.estado = 1";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user);
            pstmt.setString(2, password);
        
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                usr = new Usuario( rs.getInt("id"), rs.getString("nombre") );
            }
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if( conn != null && !conn.isClosed() ) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return usr;
    }

    private void setId(Integer id) {
        this.id = id;
    }
    

}