/*
 * SearchResultsPanel.fx
 *
 * Created on 04/02/2010, 14:45:44
 */
package movieinfofx.view.panels;

import movieinfofx.ivaapi.model.IVAObject;
import javafx.scene.control.ListView;
import javafx.scene.*;
import org.jfxtras.scene.layout.*;
import org.jfxtras.scene.control.*;
import javafx.geometry.VPos;
import javafx.geometry.HPos;
import javafx.scene.layout.HBox;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.layout.VBox;
import javafx.scene.control.Label;
import javafx.scene.layout.Container;
import javafx.scene.paint.Color;

/**
This class contains a List and a Details panel to
view the selected result details
 */
public abstract class SearchResultsPanel extends CustomNode {

    protected var listView: ListView;
    protected var details: DetailsPanel;
    protected var objects: IVAObject[];
    var main: Container;
    public var width: Number = 600;
    public var height: Number = 500;
    public var innerPanelX: Integer = 20;
    public var innerPanelY: Integer = 20;
    public var panelStyle: String = "";
    public-read var selectedObject: IVAObject = bind details.object on replace {
                onSelect(selectedObject);
            };
    var outPanel: XScrollView;
    public var searchingStatus: String;
    public var onSelect: function( object : IVAObject);

    override function create(): Node {
        details.width = width - listView.width - 50;
        details.layoutInfo = XLayoutInfo { vgrow: XLayoutInfo.NEVER; hgrow: XLayoutInfo.ALWAYS; fill: XLayoutInfo.VERTICAL; vpos: VPos.TOP; hpos: HPos.LEFT }
        listView = ListView {
            width: 250; layoutInfo: LayoutInfo{minWidth: 300; width: 300;}
            items: bind for (object in objects)
                object.title           
        }
        main =
            VBox{
                spacing: 10;
                width: bind width; height: bind height
                translateX: bind innerPanelX; translateY: bind innerPanelY;
                content: [
                     Label{
                        textFill:Color.RED
                        text: bind searchingStatus
                     }
                     HBox {
                        spacing: 10;
                        content: [
                            XPane {
                                style: bind lazy panelStyle;
                                contentNode: listView; title: "Search Results"
                            },
                            details
                        ];
                    }
                ]
            }
        
        XScrollView { node: main }
    }       

}
