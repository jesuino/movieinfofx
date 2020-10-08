/*
 * InfoPair.fx
 *
 * Created on 06/02/2010, 19:45:35
 */
package movieinfofx.view.panels.searchPanels;

import javafx.scene.*;
import javafx.scene.control.TextBox;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.ext.swing.*;
import javafx.scene.control.Button;
import org.jfxtras.scene.control.XPane;
import org.jfxtras.scene.layout.XLayoutInfo;

/**
 * @author william
 */
public class SearchInfoPair extends SearchNode {
   
    public-init var searchName: String;      
    var searchNode: Node;
    var btnSearch: Button;    
    

    override protected function create(): Node {
        if (values == null){
            searchNode = TextBox {action: action disable: bind hold};
            (searchNode as TextBox).width = 100;;
            }
        else
            searchNode = SwingComboBox {
                disable: bind hold
                items: for (v in values)
                    SwingComboBoxItem {value: v text: v}
            }
        btnSearch = Button {
                disable: bind hold;
                text: bind if(not hold)"Search" else "Searching"
                action: action                
                layoutInfo: XLayoutInfo{ width: 100;}
         };
         searchNode.layoutInfo = XLayoutInfo{width: 150}
        return XPane {
                    style: panelStyle;
                    title: searchName;
                    contentNode: HBox {
                        spacing: 10;
                        content: [
                            Label {style: "font-weight: bold; font-size: 16pt"; text: info},
                            searchNode, btnSearch
                        ]
                    }
                }
    }

    public function getValue(): String {
        if (searchNode instanceof TextBox)
            (searchNode as TextBox).text
        else
            (searchNode as SwingComboBox).selectedIndex.toString()
    }
}
