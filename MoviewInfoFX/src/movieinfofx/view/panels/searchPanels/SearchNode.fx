/*
 * SearchNode.fx
 *
 * Created on 10/02/2010, 21:04:29
 */
package movieinfofx.view.panels.searchPanels;

import javafx.scene.control.Button;
import javafx.scene.CustomNode;

/**
 * @author Administrador
 */
public abstract class SearchNode extends CustomNode{

    public var action: function();
    public-init var info: String;
    public-init var values: String[];
    public var hold: Boolean = false;
    public var panelStyle: String = "";
    protected  var button: Button = Button {
                disable: bind hold;
                text: bind if (not hold)
                    "Search" else
                    "Searching"
                action: action;
            }

}
