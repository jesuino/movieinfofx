/*
 * MainPanel.fx
 *
 * Created on 06/02/2010, 19:35:58
 */
package movieinfofx.view.panels;

import javafx.scene.*;
import org.jfxtras.scene.control.XPane;
import javafx.scene.layout.*;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import movieinfofx.ivaapi.model.IVAObject;
import movieinfofx.view.panels.searchPanels.SearchNode;
/**
 * @author william
 */
public abstract class MainPanel extends CustomNode {

    protected var searchResultsPanel: SearchResultsPanel;
    protected var searching: Boolean;
    protected var panelTitle: String;
    public var panelStyle: String = "";
    public var width: Number = 700;

    public var extensions:HBox[];

    public var selectedObject:IVAObject = bind searchResultsPanel.selectedObject;

    public-init var onSelect:function(object:IVAObject);

    init{
        searchResultsPanel.onSelect = onSelect;
    }

    override protected function create(): Node {                
        var searches: Flow = Flow {
                    width: width;
                    hgap: 5; vgap: 5;
                    vertical: false;
                    nodeHPos: HPos.LEFT;
                    nodeVPos: VPos.TOP;
                    content: getSearchPanels();
                }
        XPane {
            width: width;
            style: bind panelStyle;
            title: panelTitle;
            contentNode: VBox {
                spacing: 10;
                content: [
                    extensions,
                    searches,
                    searchResultsPanel
                ]
            }
        }
    }
    public abstract function getSearchPanels():SearchNode[];

}
