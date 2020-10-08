/*
 * OnlyOnePanel.fx
 *
 * Created on 07/02/2010, 21:18:46
 */
package movieinfofx.view.components;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.VBox;
import javafx.scene.layout.Panel;
import javafx.scene.control.ToggleGroup;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.scene.layout.Flow;
import javafx.scene.control.ToggleButton;

/**
 * @author william
 */
public class OnlyOnePanel extends CustomNode {

    var buttons: ToggleButton[];
    var panels: Panel[];
    var grp: ToggleGroup = ToggleGroup { };
   var outPanel: Panel = Panel { content: bind panels };
    var buttonBox: Flow = Flow {
                hgap: 10; vgap: 10;
                vertical: false; width: bind outPanel.width;
                hpos: HPos.LEFT; vpos: VPos.CENTER;
                content: bind buttons;
            };  

    override protected function create(): Node {
        VBox {
            spacing: 10;
            content: [
                buttonBox,
                outPanel
            ]
        }
    }

    public function add(label: String, panel: Node) {
        var button: ToggleButton =
                ToggleButton {
                    style: "font-weight: bold; font-size: 20pt;";
                    width: 250;
                    height: 200;                
                    text: label
                    toggleGroup: grp
                }
        insert Panel { content: panel visible: bind button.selected } into panels;
        insert button into buttons; grp.selectedButton = buttons[0];
    }  
}
