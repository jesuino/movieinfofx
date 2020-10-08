/*
 * Twitter.fx
 *
 * Created on 14/02/2010, 23:20:28
 */

package movieinfofx.otherServices.twitter;

import javafx.io.http.HttpHeader;

/**
 * @author Administrador
 */

public class Twitter {
    public var userName:String = null;
    public var password:String = null;


    var header:HttpHeader;

    public function updateStatus(){
        if(userName == null or password == null)
            return
        header = HttpHeader.basicAuth(userName, password);

    }
}
