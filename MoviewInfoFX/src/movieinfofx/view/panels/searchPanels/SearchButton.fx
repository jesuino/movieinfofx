/*
 * SearchButton.fx
 *
 * Created on 10/02/2010, 20:55:58
 */
package movieinfofx.view.panels.searchPanels;
import javafx.scene.Node;
import org.jfxtras.scene.control.XPane;

/**
 * @author Administrador
 */
public class SearchButton extends SearchNode{    
    public var searchName: String;

    override protected function create(): Node {  
        XPane {
            title: searchName;
            style: bind panelStyle;
            contentNode: button;
        }
    }
}
